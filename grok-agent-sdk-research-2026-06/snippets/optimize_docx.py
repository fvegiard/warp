#!/usr/bin/env python3
"""
DOCX Image Optimizer for LLM / Cloud Readability

Goal:
- Make the .docx much smaller
- Keep ALL text fully extractable
- Keep images embedded exactly like in a browser DOM (real files in word/media/)
- So that LLM vision models (Claude, GPT-4o, Grok, Gemini, etc.) can still "see" the images when they parse the document

Strategy:
- Resize large images down (max long edge)
- Convert PNG → JPEG when there is no meaningful transparency (huge win)
- Reasonable JPEG quality (visually lossless for most LLM use cases)
- Never touch images that are already small
- Preserve document structure 100%

Usage:
    python optimize_docx.py "input.docx" "output.docx" --max-edge 1600 --jpeg-quality 82

Recommended presets:
    --max-edge 1600 --jpeg-quality 82     # Good balance (recommended)
    --max-edge 1200 --jpeg-quality 78     # More aggressive for email / very large docs
    --max-edge 2000 --jpeg-quality 88     # Conservative (print-ish quality)
"""

import argparse
import io
import os
import shutil
import sys
import zipfile
from pathlib import Path

from docx import Document
from docx.opc.constants import RELATIONSHIP_TYPE as RT
from PIL import Image

# File extensions we consider images inside the docx
IMAGE_EXTS = {".png", ".jpg", ".jpeg", ".gif", ".bmp", ".tiff", ".tif", ".emf", ".wmf"}


def has_transparency(img: Image.Image) -> bool:
    """Return True if the image has meaningful alpha/transparency."""
    if img.mode in ("RGBA", "LA") or (img.mode == "P" and "transparency" in img.info):
        # Check if alpha channel is actually used
        if img.mode == "RGBA":
            alpha = img.getchannel("A")
            # If all alpha == 255, no real transparency
            extrema = alpha.getextrema()
            return extrema[0] < 250  # allow a little tolerance
        elif img.mode == "P":
            return True
        elif img.mode == "LA":
            return True
    return False


def should_convert_to_jpeg(img: Image.Image, original_ext: str) -> bool:
    """Decide whether converting PNG to JPEG makes sense."""
    if original_ext.lower() in {".jpg", ".jpeg"}:
        return False  # already jpeg
    if img.mode == "P":
        # Paletted images (icons, simple graphics) — keep as PNG or convert carefully
        return False
    if has_transparency(img):
        return False
    # For photos/screenshots with no transparency → JPEG is much smaller
    return True


def resize_if_needed(img: Image.Image, max_edge: int) -> Image.Image:
    """Resize only if the image exceeds max_edge on its longest side."""
    w, h = img.size
    if max(w, h) <= max_edge:
        return img

    if w >= h:
        new_w = max_edge
        new_h = int(h * (max_edge / w))
    else:
        new_h = max_edge
        new_w = int(w * (max_edge / h))

    # Use high-quality downsampling
    return img.resize((new_w, new_h), Image.Resampling.LANCZOS)


def optimize_image_data(data: bytes, filename: str, max_edge: int, jpeg_quality: int) -> tuple[bytes, str]:
    """
    Optimize a single image.
    Returns (new_bytes, new_filename_with_correct_ext)
    """
    original_ext = Path(filename).suffix.lower()
    new_name = filename

    try:
        img = Image.open(io.BytesIO(data))
        original_size = len(data)
        original_mode = img.mode

        # Convert to RGB if needed for JPEG
        if should_convert_to_jpeg(img, original_ext):
            if img.mode in ("RGBA", "LA", "P"):
                # Composite on white background
                background = Image.new("RGB", img.size, (255, 255, 255))
                if img.mode == "P":
                    img = img.convert("RGBA")
                if img.mode in ("RGBA", "LA"):
                    background.paste(img, mask=img.split()[-1] if img.mode == "RGBA" else None)
                else:
                    background.paste(img)
                img = background
            else:
                img = img.convert("RGB")

            img = resize_if_needed(img, max_edge)

            out = io.BytesIO()
            img.save(out, format="JPEG", quality=jpeg_quality, optimize=True)
            new_data = out.getvalue()
            new_name = str(Path(filename).with_suffix(".jpg"))
            print(f"  {filename} → JPEG {img.size[0]}x{img.size[1]}  "
                  f"({original_size/1024:.0f}KB → {len(new_data)/1024:.0f}KB)")
            return new_data, new_name

        # PNG or other formats that we keep
        img = resize_if_needed(img, max_edge)

        # Re-encode PNG with optimization
        if original_ext == ".png":
            out = io.BytesIO()
            img.save(out, format="PNG", optimize=True)
            new_data = out.getvalue()
            if len(new_data) < original_size * 0.95:  # only keep if meaningfully smaller
                print(f"  {filename} → re-PNG {img.size[0]}x{img.size[1]}  "
                      f"({original_size/1024:.0f}KB → {len(new_data)/1024:.0f}KB)")
                return new_data, new_name

        # For everything else (or if PNG didn't shrink), just return original if no resize happened
        if img.size == Image.open(io.BytesIO(data)).size:
            return data, filename

        # Re-encode in original format after resize
        fmt = img.format or "PNG"
        out = io.BytesIO()
        img.save(out, format=fmt)
        new_data = out.getvalue()
        print(f"  {filename} → resized {img.size[0]}x{img.size[1]}  "
              f"({original_size/1024:.0f}KB → {len(new_data)/1024:.0f}KB)")
        return new_data, new_name

    except Exception as e:
        print(f"  WARNING: Could not optimize {filename}: {e}")
        return data, filename


def optimize_docx(input_path: str, output_path: str, max_edge: int = 1600, jpeg_quality: int = 82):
    """Main function: optimize all images inside a .docx while keeping full structure."""
    input_path = Path(input_path).resolve()
    output_path = Path(output_path).resolve()

    if not input_path.exists():
        print(f"ERROR: Input file not found: {input_path}")
        sys.exit(1)

    print(f"Opening {input_path.name} ({input_path.stat().st_size / 1024 / 1024:.1f} MB)")
    print(f"Settings: max_edge={max_edge}px, jpeg_quality={jpeg_quality}")

    # Work in a temp directory
    work_dir = output_path.parent / (output_path.stem + "_work")
    if work_dir.exists():
        shutil.rmtree(work_dir)
    work_dir.mkdir(parents=True)

    try:
        # Extract the entire docx (it's just a zip)
        with zipfile.ZipFile(input_path, "r") as z:
            z.extractall(work_dir)

        media_dir = work_dir / "word" / "media"
        if not media_dir.exists():
            print("No media folder found — nothing to optimize.")
            # Just copy original
            shutil.copy2(input_path, output_path)
            return

        # Find all image relationships so we know which files are actually used
        rels_dir = work_dir / "word" / "_rels"
        image_rels = {}  # target -> relationship info

        for rels_file in rels_dir.glob("*.rels"):
            try:
                from lxml import etree
                tree = etree.parse(rels_file)
                for rel in tree.findall(".//{http://schemas.openxmlformats.org/package/2006/relationships}Relationship"):
                    if rel.get("Type", "").endswith("/image"):
                        target = rel.get("Target", "")
                        if target.startswith("media/"):
                            image_rels[target] = rels_file
            except Exception:
                pass  # lxml optional; we can still process files directly

        # Process every file in word/media/
        optimized_count = 0
        total_saved = 0

        for img_file in sorted(media_dir.iterdir()):
            if img_file.suffix.lower() not in IMAGE_EXTS:
                continue

            original_data = img_file.read_bytes()
            new_data, new_name = optimize_image_data(
                original_data, img_file.name, max_edge, jpeg_quality
            )

            if new_name != img_file.name:
                # We changed the extension (PNG → JPG)
                new_path = img_file.with_name(new_name)
                new_path.write_bytes(new_data)
                img_file.unlink()

                # Update all relationships that pointed to the old name
                old_target = f"media/{img_file.name}"
                new_target = f"media/{new_name}"
                for rels_file in rels_dir.glob("*.rels"):
                    try:
                        content = rels_file.read_text(encoding="utf-8")
                        if old_target in content:
                            content = content.replace(old_target, new_target)
                            rels_file.write_text(content, encoding="utf-8")
                            print(f"  Updated relationship: {old_target} → {new_target}")
                    except Exception:
                        pass
            else:
                img_file.write_bytes(new_data)

            saved = len(original_data) - len(new_data)
            if saved > 0:
                total_saved += saved
                optimized_count += 1

        print(f"\nOptimized {optimized_count} images, saved ~{total_saved / 1024 / 1024:.1f} MB")

        # Re-pack the docx with maximum compression
        print("Rebuilding document...")
        with zipfile.ZipFile(output_path, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
            for root, dirs, files in os.walk(work_dir):
                for f in files:
                    full = Path(root) / f
                    arcname = full.relative_to(work_dir)
                    z.write(full, arcname)

        final_size = output_path.stat().st_size
        orig_size = input_path.stat().st_size
        print(f"\nDone!")
        print(f"Original: {orig_size / 1024 / 1024:.1f} MB")
        print(f"Optimized: {final_size / 1024 / 1024:.1f} MB")
        print(f"Saved: {(orig_size - final_size) / 1024 / 1024:.1f} MB "
              f"({100 * (1 - final_size / orig_size):.1f}%)")
        print(f"\nOutput: {output_path}")
        print("Images remain embedded (word/media/*) so LLM clouds can still read text + see images.")

    finally:
        shutil.rmtree(work_dir, ignore_errors=True)


def main():
    parser = argparse.ArgumentParser(description="Optimize .docx images for size while keeping LLM readability")
    parser.add_argument("input", help="Input .docx file")
    parser.add_argument("output", help="Output .docx file")
    parser.add_argument("--max-edge", type=int, default=1600,
                        help="Maximum pixels on the longest edge (default: 1600)")
    parser.add_argument("--jpeg-quality", type=int, default=82,
                        help="JPEG quality 1-95 (default: 82). 78-85 is usually perfect for LLM vision.")
    args = parser.parse_args()

    optimize_docx(args.input, args.output, args.max_edge, args.jpeg_quality)


if __name__ == "__main__":
    main()
