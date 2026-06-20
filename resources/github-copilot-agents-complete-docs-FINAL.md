undefined


================================================================================
## 35. Cloud and local sandboxes
**Source:** https://docs.github.com/en/copilot/concepts/about-cloud-and-local-sandboxes
================================================================================

About cloud and local sandboxes for GitHub Copilot

Cloud and local sandboxes for GitHub Copilot provide isolated execution environments that let Copilot safely interact with code, tools, filesystem, and network resources securely on your local machine or in fully isolated cloud environments.

NOTE: Currently in public preview.

Introduction:
Cloud and local sandboxes are the execution platform powering secure sandboxed experiences for GitHub Copilot CLI, both locally and in the cloud.

Two modes:
- LOCAL SANDBOXING: Run Copilot securely on your own machine, with restricted access to filesystem, network, and system capabilities. Enable with: /sandbox enable. Available across macOS, Linux, and Windows.
- CLOUD SANDBOXING: Run Copilot inside fully isolated, ephemeral Linux environments hosted by GitHub. Start with: copilot --cloud. Built on Azure Container Apps Sandboxes.

Cloud sandbox session states: Active, Stopped (state saved/snapshottable), Deleted (unrecoverable).

Authentication: Uses existing Copilot CLI auth — no separate API keys needed.

Billing:
- Local sandboxing: FREE (included in Copilot seat)
- Cloud sandboxing billed on usage:
  * Compute: $0.000024 / compute second
  * Memory: $0.000003 / GiB second  
  * Storage: $0.005 / GiB month (snapshot storage for stopped sessions)
