# GitHub Copilot Agents — Complete Documentation
Source: docs.github.com/en/copilot
Generated: 2026-06-19T15:12:18.958Z
Total pages: 35

---

## TABLE OF CONTENTS

1. [Agents (overview)](https://docs.github.com/en/copilot/concepts/agents)
2. [Third-party coding agents](https://docs.github.com/en/copilot/concepts/agents/about-third-party-coding-agents)
3. [About cloud agent](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-cloud-agent)
4. [Agent management](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/agent-management)
5. [Custom agents (cloud)](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-custom-agents)
6. [About automations](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-automations)
7. [Access management](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/access-management)
8. [MCP and cloud agent](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/mcp-and-cloud-agent)
9. [Risks and mitigations](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations)
10. [About Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli)
11. [Comparing CLI features](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/comparing-cli-features)
12. [Cancel and roll back](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/cancel-and-roll-back)
13. [About remote control](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-remote-control)
14. [About custom agents (CLI)](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-custom-agents)
15. [About CLI plugins](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-cli-plugins)
16. [Autopilot](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/autopilot)
17. [Fleet](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/fleet)
18. [Research](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/research)
19. [Chronicle](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/chronicle)
20. [Rubber Duck](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/rubber-duck)
21. [LSP servers](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/lsp-servers)
22. [Context management](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/context-management)
23. [GitHub Copilot app](https://docs.github.com/en/copilot/concepts/agents/github-copilot-app)
24. [Code review](https://docs.github.com/en/copilot/concepts/agents/code-review)
25. [Agentic workflows](https://docs.github.com/en/copilot/concepts/agents/about-github-agentic-workflows)
26. [Copilot Memory](https://docs.github.com/en/copilot/concepts/agents/copilot-memory)
27. [Hooks](https://docs.github.com/en/copilot/concepts/agents/hooks)
28. [Enterprise plugin standards](https://docs.github.com/en/copilot/concepts/agents/about-enterprise-plugin-standards)
29. [Agent apps](https://docs.github.com/en/copilot/concepts/agents/agent-apps)
30. [OpenAI Codex](https://docs.github.com/en/copilot/concepts/agents/openai-codex)
31. [Anthropic Claude](https://docs.github.com/en/copilot/concepts/agents/anthropic-claude)
32. [Agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
33. [Enterprise management](https://docs.github.com/en/copilot/concepts/agents/enterprise-management)
34. [Cloud and local sandboxes](https://docs.github.com/en/copilot/concepts/about-cloud-and-local-sandboxes)
35. [Spark](https://docs.github.com/en/copilot/concepts/spark)


---



────────────────────────────────────────────────────────────────────────────────

# 1. Agents (overview)

> Source: https://docs.github.com/en/copilot/concepts/agents

Concepts for GitHub Copilot agentsLearn how GitHub Copilot can independently execute tasks across the software development lifecycle.Concepts for GitHub Copilot cloud agentLearn how Copilot cloud agent can carry out research, planning and coding tasks for you, working independently in the same workflow you use yourself.Concepts for GitHub Copilot CLILearn how you can use GitHub Copilot in your terminal.About the GitHub Copilot appThe GitHub Copilot app is a desktop application for agent-driven development that brings parallel workstreams, GitHub integration, and PR lifecycle management into one place.About GitHub Copilot code reviewCopilot reviews your pull requests, identifies issues, and suggests fixes you can apply in a couple of clicks.About GitHub Agentic WorkflowsAutomate repetitive repository work with natural language instructions executed by AI coding agents in GitHub Actions.About GitHub Copilot MemoryCopilot Memory helps Copilot become more effective over time by remembering facts about your repositories and your personal coding preferences.About hooks for GitHub CopilotExtend and customize GitHub Copilot agent behavior by executing custom shell commands at key points during agent execution.About enterprise-managed plugin standardsEnterprise administrators can centrally define plugin policies for users, ensuring consistent plugin availability.About third-party coding agentsYou can use third-party coding agents alongside Copilot cloud agent to work asynchronously on your development tasks on GitHub.About agent appsAgent apps let you use partner-built agents directly in your workflows on GitHub, powered by your Copilot subscription.OpenAI CodexUse the OpenAI Codex coding agent and Visual Studio Code extension powered by Copilot.Anthropic ClaudeUse the Anthropic Claude coding agent powered by Copilot.About agent skillsSkills allow Copilot to perform specialized tasks.Agent management for enterprisesMaintain your enterprise's security and compliance standards and supercharge your developers by managing agents with AI Controls.


────────────────────────────────────────────────────────────────────────────────

# 2. Third-party coding agents

> Source: https://docs.github.com/en/copilot/concepts/agents/about-third-party-coding-agents

About third-party coding agentsYou can use third-party coding agents alongside Copilot cloud agent to work asynchronously on your development tasks on GitHub.Who can use this feature?Available for all paid Copilot plans.Sign up for Copilot Copy as MarkdownIn this articleNote
 Third-party coding agents are currently in public preview.

Introduction
You can use third-party coding agents alongside Copilot cloud agent to work asynchronously on your development tasks. You can assign an existing issue or give a prompt to an agent, which will work on the required changes and create a pull request. When the agent finishes, it will request a review from you, and you can leave pull request comments to ask the agent to iterate.
Coding agents are subject to the same security protections, mitigations, and limitations as Copilot cloud agent. To learn more about how you can use coding agents, see About GitHub Copilot cloud agent.
Where you can use coding agents
You can kick off tasks with coding agents in the following locations:

The Agents tab: Select an agent under the prompt box in the Agents tab, then kick off a new task and watch the agent get to work on a pull request.
Issues: Assign the agent to an existing issue in a repository.
Pull requests: Mention @AGENT_NAME in a comment on an existing pull request to ask it to make changes.
On GitHub Mobile: From the Home view, click  to start a new agent session.
In Visual Studio Code: Start a new session in the chat view, or delegate an existing session to a different agent.

Making coding agents available
Before you can assign tasks to coding agents on GitHub, they must be enabled in your account policies.

For GitHub Copilot Pro, GitHub Copilot Pro+, and GitHub Copilot Max subscribers, see Managing GitHub Copilot policies as an individual subscriber.
For GitHub Copilot Business and GitHub Copilot Enterprise subscribers, see Managing policies and features for GitHub Copilot in your organization or Managing policies and features for GitHub Copilot in your enterprise.

These policies do not apply to local agents in Visual Studio Code. To configure agent settings in Visual Studio Code, see Types of agents in the Visual Studio Code documentation. To adjust enterprise agent settings in Visual Studio Code, see Enable or disable the use of agents in the Visual Studio Code documentation.
Supported coding agents
The following third-party agents are supported on GitHub:

Anthropic Claude
OpenAI Codex

AI models for third-party agents
When starting a task with a third-party agent, you can select the AI model used by the agent. You may find that different models perform better, or provide more useful responses, depending on the type of task. For help deciding which model to use, see AI model comparison.
You can also select Auto, which allows Copilot auto model selection to choose the best available model on your behalf. See About Copilot auto model selection.
The following models are available for each agent:
OpenAI Codex

Auto
GPT-5.3-Codex
GPT-5.4
GPT-5.4 nano

Anthropic Claude

Auto
Claude Opus 4.5
Claude Opus 4.6
Claude Opus 4.7
Claude Sonnet 4.5
Claude Sonnet 4.6

Security validation
When a third-party coding agent creates or modifies code, GitHub automatically scans the generated code for security issues and attempts to resolve them before the pull request is finalized. This reduces the likelihood of the agent introducing problems such as hardcoded secrets, insecure dependencies, and other vulnerabilities.
The following tools and processes scan for security issues:

CodeQL code scanning identifies code security issues.
Secret scanning detects sensitive information such as API keys, tokens, and other secrets.
Newly introduced dependencies are checked against the GitHub Advisory Database for malware advisories and CVSS-rated High or Critical vulnerabilities.

Security validation does not require a GitHub Advanced Security license.
Usage costs
Coding agents consume GitHub Actions minutes and AI credits. Each agent session consumes AI credits based on the model used and the number of tokens processed.
Within your included GitHub Actions minutes and AI credits, you can use agents without incurring additional costs. See Usage-based billing for organizations and enterprises.
Partner agents
When enabling partner agents in your user or organization Copilot cloud agent settings, a GitHub App will be installed for the corresponding agent.

Allow Claude coding agent will install anthropic code agent
Allow Codex coding agent will install openai code agent

Actions taken by these GitHub Apps will be visible in your audit log, but the GitHub Apps themselves will not be visible in your account's list of GitHub App installations.
Next steps

To start managing agents, see Managing agent sessions.
To learn how AI models are hosted and served, see Hosting of models for GitHub Copilot.


────────────────────────────────────────────────────────────────────────────────

# 3. About cloud agent

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-cloud-agent

About GitHub Copilot cloud agentCopilot can research a repository, create an implementation plan, and make code changes on a branch. You can review the diff, iterate, and create a pull request when you're ready.Who can use this feature?Copilot cloud agent is available for all paid Copilot plans.
The agent is available in all repositories stored on GitHub, except repositories owned by managed user accounts and where it has been explicitly disabled.Sign up for Copilot Copy as MarkdownIn this articleOverview of Copilot cloud agent
With Copilot cloud agent, GitHub Copilot can work independently in the background to complete tasks, just like a human developer.
Copilot cloud agent can:

Research a repository
Create implementation plans
Fix bugs
Implement incremental new features
Improve test coverage
Update documentation
Address technical debt
Resolve merge conflicts

When you delegate tasks to Copilot cloud agent, you can:

Use the agents panel or other agents entry points on GitHub.com to have Copilot research, plan, and make code changes on a branch, then iterate before creating a pull request. You can also specify in your prompt that you want a pull request created right away. See Research, plan, and iterate on code changes with Copilot cloud agent.
Ask Copilot to open a new pull request from other entry points, including GitHub Issues and Visual Studio Code. See Starting GitHub Copilot sessions.
Mention @copilot in a comment on an existing pull request to ask it to make changes. See Using Copilot cloud agent on GitHub.
Set up an automation to run Copilot automatically, on a schedule or in response to events such as an issue being opened. See About Copilot automations.
Assign security alerts to Copilot from security campaigns. See Fixing alerts in a security campaign.

Copilot cloud agent will evaluate the task it has been assigned based on the prompt you give it.
While working on a coding task, Copilot cloud agent has access to its own ephemeral development environment, powered by GitHub Actions, where it can explore your code, make changes, execute automated tests and linters and more.
Note
 Deep research, planning, and iterating on code changes before creating a pull request are only available with Copilot cloud agent on GitHub.com. Cloud agent integrations (such as Azure Boards, JIRA, Linear, Slack, or Teams) only support creating a pull request directly.

Benefits over traditional AI workflows
When used effectively, Copilot cloud agent offers productivity benefits over traditional AI assistants in IDEs:

With AI assistants in IDEs, coding happens locally. Individual developers pair in synchronous sessions with the AI assistant. Decisions made during the session are untracked and lost to time unless committed. Although the assistant helps write code, the developer still has a lot of manual steps to do: create the branch, write commit messages, push the changes, open the PR, write the PR description, get a review, iterate in the IDE, and repeat. These steps take time and effort that may be hard to justify for simple or routine issues.

With Copilot cloud agent, all coding and iterating happens on GitHub. You can ask Copilot to research a repository, create a plan, and make code changes on a branch—all before opening a pull request. You can create multiple custom agents that specialize in different types of tasks. Copilot automates branch creation, commit message writing, and pushing. Developers let the agents work in the background and then chooses to create a pull request when ready. Working on GitHub adds transparency, with every step happening in a commit and being viewable in logs, and opens up collaboration opportunities for the entire team.

Sharing context between Copilot Chat and Copilot cloud agent sessions
When you start a Copilot cloud agent session from Copilot Chat on GitHub, the session carries the context of your chat. You can continue chatting while the session runs, and ask follow-up questions about progress in the same conversation. For more information, see Managing agent sessions.
Copilot cloud agent versus agent mode
Copilot cloud agent is distinct from the "agent mode" feature available in your IDE. Copilot cloud agent works autonomously in a GitHub Actions-powered environment to complete development tasks assigned through GitHub issues or GitHub Copilot Chat prompts. It can research a repository, create a plan, make code changes on a branch, and optionally open a pull request. In contrast, agent mode in your IDE makes autonomous edits directly in your local development environment. For more information about agent mode, see Asking GitHub Copilot questions in your IDE.
Streamlining software development with Copilot cloud agent
Assigning tasks to Copilot cloud agent can enhance your software development workflow.
For example, you can assign Copilot cloud agent to straightforward issues on your backlog by selecting "Copilot" as the assignee. This allows you to spend less time on these issues and more time on more complex or interesting work, or work that requires a high degree of creative thinking. Copilot cloud agent can work on "nice to have" issues that improve the quality of your codebase or product, but often remain on the backlog while you focus on more urgent work.
Having Copilot cloud agent as an additional coding resource also allows you to start tasks that you might not have otherwise started due to lack of resources. For example, you might create issues to refactor code or add more logging, and then immediately assign these to Copilot.
You can also use Copilot cloud agent to research a repository and create a plan before any code is written, helping you understand how a codebase works or agree on an approach before committing to changes. See Research, plan, and iterate on code changes with Copilot cloud agent.
Copilot cloud agent can start a task, which you then pick up and continue working on yourself. By assigning the initial work to Copilot, you free up time that you would otherwise have spent doing repetitive tasks, such as setting up the scaffolding for a new project.
You can create specialized custom agents for different tasks. For example, you might create a custom agent specialized for frontend development that focuses on React components and styling, a documentation agent that excels at writing and updating technical documentation, or a testing agent that specializes in generating comprehensive unit tests. Each custom agent can be tailored with specific prompts and tools suited to its particular task.
Measuring pull request outcomes for Copilot cloud agent
Enterprise administrators and organization owners can use Copilot usage metrics to analyze pull request outcomes for pull requests created by Copilot cloud agent.
The Copilot usage metrics APIs include pull request lifecycle metrics such as:

The total number of pull requests created and merged
The number of pull requests created by Copilot cloud agent that have been merged
Median time to merge for merged pull requests, including pull requests created by Copilot cloud agent

These metrics can help you track adoption of Copilot cloud agent and monitor changes in pull request throughput and time to merge over time. See GitHub Copilot usage metrics.
Integrating Copilot cloud agent with third-party tools
You can also invoke Copilot cloud agent from external tools, allowing you to assign tasks to Copilot, provide context, and open pull requests without leaving your workflow. See About Copilot integrations
Making Copilot cloud agent available
Before you can assign tasks to Copilot cloud agent, it must be enabled. Copilot cloud agent is available for all paid Copilot plans.
If you are a GitHub Copilot Business or GitHub Copilot Enterprise subscriber, an administrator must enable the relevant policy before you can use the agent.
Repository owners can choose to opt out some or all repositories from Copilot cloud agent.
See Managing access to GitHub Copilot cloud agent.
AI models for Copilot cloud agent
Depending on how you start your Copilot cloud agent task, you may be able to select the model used by Copilot cloud agent. You may find that different models perform better, or provide more useful responses, depending on the type of tasks you give Copilot.
See Changing the AI model for GitHub Copilot cloud agent.
Enhancing Copilot cloud agent's knowledge of a repository
The more Copilot cloud agent knows about the code in your repository, the tools you use, and your coding standards and practices, the more effective it will become. There are two ways you can enhance Copilot cloud agent's knowledge of a repository.

Custom instructions
These are short, natural‑language statements that you write and store as one or more files in a repository. If you are the owner of an organization on GitHub you can also define custom instructions in the settings for your organization. See About customizing GitHub Copilot responses.

Copilot Memory (public preview)
If you have a Copilot Pro, Copilot Pro+, or Copilot Max plan, you can enable Copilot Memory. This allows Copilot to store useful details it has worked out for itself about a repository. Copilot cloud agent can then use this information when it is working in that repository. See About GitHub Copilot Memory.

Copilot cloud agent usage costs
Copilot cloud agent uses GitHub Actions minutes and AI credits. The AI credits consumed depend on the model used and the number of tokens processed during the session.
Within your included GitHub Actions minutes and AI credits, you can use Copilot cloud agent without incurring additional costs. See Usage-based billing for organizations and enterprises.
Copilot code review also consumes GitHub Actions minutes on private repositories. See GitHub Actions billing.
Customizing Copilot cloud agent
You can customize Copilot cloud agent in a number of ways:

Custom instructions: Custom instructions allow you to give Copilot additional context on your project and how to build, test and validate its changes. See Adding repository custom instructions for GitHub Copilot.
Model Context Protocol (MCP) servers: MCP servers allow you to give Copilot access to different data sources and tools. Repository MCP settings on GitHub apply to both Copilot cloud agent and Copilot code review. The GitHub MCP server and Playwright MCP server are enabled by default for both features. See Configure MCP servers for your repository.
Custom agents: Custom agents allow you to create different specialized versions of Copilot for different tasks. For example, you could customize Copilot to be an expert frontend engineer following your team's guidelines. See About custom agents.
Hooks: Hooks allow you to execute custom shell commands at key points during agent execution, enabling you to add validation, logging, security scanning, or workflow automation. See About hooks for GitHub Copilot.
Skills: Skills allow you to enhance the ability of Copilot to perform specialized tasks with instructions, scripts, and resources. See About agent skills.

Limitations of Copilot cloud agent
Copilot cloud agent has certain limitations in its software development workflow and compatibility with other features.
Limitations in Copilot cloud agent's software development workflow

Copilot can only make changes in the repository specified when you start a task. Copilot cannot make changes across multiple repositories in one run.
By default, Copilot can only access context in the repository specified when you start a task. The Copilot MCP server is configured by default to allow Copilot to access context (for example issues and historic pull requests) in the repository where it is working. You can, however, configure broader access through repository MCP settings. See Configure MCP servers for your repository.
Copilot can only work on one branch at a time and can open exactly one pull request to address each task it is assigned.
Each Copilot cloud agent session has a maximum execution time of 59 minutes. This is a hard limit that cannot be extended or bypassed. If a task exceeds this limit, the session will time out and stop. For complex tasks that may require more time, consider breaking the work into smaller, more focused tasks. You can configure a shorter timeout using the timeout-minutes setting in your copilot-setup-steps.yml file. See Configure the development environment.

Limitations in Copilot cloud agent's compatibility with other features

Copilot isn't able to comply with certain rules that may be configured for your repository. If you have configured a ruleset or branch protection rule that isn't compatible with Copilot cloud agent, access to the agent will be blocked. For example, a rule that only allows specific commit authors can prevent Copilot cloud agent from creating or updating pull requests. If the rule is configured using rulesets, you can add Copilot as a bypass actor to enable access. See Creating rulesets for a repository.
Copilot cloud agent doesn't account for content exclusions. Content exclusions allow administrators to configure Copilot to ignore certain files. When using Copilot cloud agent, Copilot will not ignore these files, and will be able to see and update them. See Excluding content from GitHub Copilot.
Copilot cloud agent only works with repositories hosted on GitHub. If your repository is stored using a different code hosting platform, Copilot won't be able to work on it.

Hands-on practice
Try the Expand your team with Copilot cloud agent Skills exercise for practical experience with Copilot cloud agent.
Further reading

GitHub Copilot cloud agent how-to articles
About custom agents
Application card: GitHub Copilot Agents


────────────────────────────────────────────────────────────────────────────────

# 4. Agent management

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/agent-management

About agent managementUse one centralized control page to jump between agent sessions, check progress, and stay in control without losing your place.Who can use this feature?Copilot cloud agent is available for all paid Copilot plans.
The agent is available in all repositories stored on GitHub, except repositories owned by managed user accounts and where it has been explicitly disabled.Sign up for Copilot Copy as MarkdownIn this articleAbout agents
AI agents are autonomous systems that can evaluate their environment, make decisions, and take actions to complete tasks. Agents can break down complex tasks into steps, use various tools and resources, plan their approach, and adapt based on human feedback until they accomplish their assigned objective.
Agents bring automation and assistance to every stage of the software development process on GitHub. You can run multiple agent sessions concurrently, allowing you to efficiently delegate work items.
Alongside Copilot, you can use Anthropic Claude and OpenAI Codex, giving you more flexibility and choice to find the right agent for a task. See About third-party coding agents.
GitHub partners can also offer their own agents as agent apps, which you install as GitHub Apps and trigger from issues, pull requests, and the Agents UI. See About agent apps.
Utilizing custom agents you can build out a team of task-specific agents with customized system prompts to handle simpler tasks like writing tests and refactoring, giving you bandwidth to prioritize problem-solving and collaboration. See About custom agents.
Model choice allows you to choose from a selection of AI models to use with your agents, each with its own particular strengths. See Supported AI models in GitHub Copilot.
To learn more about Copilot cloud agent, see About GitHub Copilot cloud agent.
Managing agents
When utilizing GitHub's agentic features, you can use the Agents tab within a repository that has Copilot cloud agent enabled to initiate, monitor, and manage agent sessions without leaving your workflow. You can also use the Agents page to view and start agent sessions. To learn how to enable Copilot cloud agent, see Managing access to GitHub Copilot cloud agent.
From the Agents tab, you can:

Kick off new agent tasks: Select an AI model of your choice, and optionally choose from third-party agents or custom agents best suited for the task. See Starting GitHub Copilot sessions.
Monitor live session logs: Once the agent starts working, you can click any agent session to open the session log and follow its progress and thought process in real time.
Track active sessions: You can view all active agent sessions that have been started in the repository.
Steer agents mid-session: If you realize you didn't scope a request correctly, or want the agent to use a specific tool or service, you can step in and provide steering input without stopping the run. Steering consumes AI credits per message. See Managing agent sessions.
Open a session in VS Code or GitHub Copilot CLI: When you want to start working on changes to an agent session in your local development environment, click  Open in VS Code or  Continue in GitHub Copilot CLI to bring the session to your local machine.
Note

Opening a session in VS Code requires the latest versions of VS Code, the GitHub Copilot extension, and the GitHub Pull Requests extension.

Review and merge agent code: Once the agent completes a session, you can jump to the pull request to review the changes, request further improvements, or approve and merge. See Review output from Copilot.
Set up automations: Run Copilot cloud agent automatically, on a schedule or in response to events such as an issue being opened. See About Copilot automations.
Query your past sessions: You can search and reference your past agent sessions using natural language from Copilot CLI or VS Code. See About GitHub Copilot CLI session data.

Next steps
To start managing agents, see Managing agent sessions.


────────────────────────────────────────────────────────────────────────────────

# 5. Custom agents (cloud)

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-custom-agents

About custom agentsCustom agents enhance Copilot with assistance tailored to your needs.Copy as MarkdownIn this articleAbout custom agents
Custom agents are specialized versions of the Copilot agent that you can tailor to your unique workflows, coding conventions, and use cases. They act like tailored teammates that follow your standards, use the right tools, and implement team-specific practices. You define these agents once instead of repeatedly providing the same instructions and context.
You define custom agents using Markdown files called agent profiles. These files specify prompts, tools, and MCP servers. This allows you to encode your conventions, frameworks, and desired outcomes directly into Copilot.
The agent profile defines the custom agent's behavior. When you assign the agent to a task or issue, it instantiates the custom agent.
Agent profile format
Agent profiles are Markdown files with YAML frontmatter. In their simplest form, they include:

Name (optional): A display name for the custom agent. If omitted, the agent's filename is used as its identifier and default display name.
Description: Explains the agent's purpose and capabilities.
Prompt: Custom instructions that define the agent's behavior and expertise.
Tools (optional): Specific tools the agent can access. By default, agents can access all available tools, including built-in tools, and MCP server tools.

Agent profiles can also include MCP server configurations using the mcp-servers property.
Example agent profile
This example is a basic agent profile with name, description, and prompt configured.
---
name: readme-creator
description: Agent specializing in creating and improving README files
---

You are a documentation specialist focused on README files. Your scope is limited to README files or other related documentation files only - do not modify or analyze code files.

Focus on the following instructions:
- Create and update README.md files with clear project descriptions
- Structure README sections logically: overview, installation, usage, contributing
- Write scannable content with proper headings and formatting
- Add appropriate badges, links, and navigation elements
- Use relative links (e.g., `docs/CONTRIBUTING.md`) instead of absolute URLs for files within the repository
- Make links descriptive and add alt text to images

Where you can configure custom agents
You can define agent profiles at different levels:

Repository level: Create .github/agents/CUSTOM-AGENT-NAME.md in your repository for project-specific agents.
Organization level: Create /agents/CUSTOM-AGENT-NAME.md in the organization's .github or .github-private repository for broader availability within the organization.
Enterprise level: Create /agents/CUSTOM-AGENT-NAME.md in the .github-private repository of an organization that an enterprise owner has designated in enterprise settings for availability across all repositories in the enterprise.

For more information, see Preparing to use custom agents in your organization and Preparing to use custom agents in your enterprise.
Where you can use custom agents
Note

Custom agents are in public preview for JetBrains IDEs, Eclipse, and Xcode, and subject to change.

Once you create custom agents, they become available to:

Copilot cloud agent on GitHub.com: The agents tab and panel, issue assignment, and pull requests
Copilot cloud agent in IDEs: Visual Studio Code, JetBrains IDEs, Eclipse, and Xcode
GitHub Copilot CLI

You can use agent profiles directly in Visual Studio Code, JetBrains IDEs, Eclipse, and Xcode. Some properties may function differently or be ignored between environments.
For more information on using custom agents in Visual Studio Code, see Custom agents in VS Code.
Next steps
To create your own custom agents, see:

Creating custom agents for Copilot cloud agent
Creating and using custom agents for GitHub Copilot CLI
Copilot customization cheat sheet


────────────────────────────────────────────────────────────────────────────────

# 6. About automations

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-automations

About Copilot automationsAutomations let you run Copilot cloud agent automatically, on a schedule or in response to events in a repository.Who can use this feature?Automations are available with the GitHub Copilot Pro, GitHub Copilot Pro+, GitHub Copilot Max, GitHub Copilot Business, and GitHub Copilot Enterprise plans. Automations are available in private and internal repositories only. They are not available where they have been disabled by a repository administrator, in repositories owned by managed user accounts, or where Copilot cloud agent is not enabled.Sign up for Copilot Copy as MarkdownIn this articleOverview
With automations, you can set up Copilot cloud agent to run automatically, either on a schedule or in response to an event in a repository. Automations can take action within the repository where they are configured, such as opening a pull request or labeling an issue.
With a manually started Copilot cloud agent session, you give Copilot a task each time you want work done. With automations, you define a task once, and Copilot runs it automatically whenever the automation's trigger fires.
For example, you can use automations to:

Triage incoming issues: automatically label new issues as a bug, an enhancement, or other, based on their content.
Fix failing tests nightly: each night, check for failing tests on the main branch, attempt a fix, and open a draft pull request.
Prepare weekly release notes: draft release notes and open a pull request on a schedule.

When you create an automation, you define:

A name to identify the automation.
A prompt describing the task you want Copilot to perform.
One or more triggers that determine when the automation runs.
The model Copilot uses.
The tools Copilot can use, which control what actions it can take in your repository.

For instructions on creating and managing automations, see Creating automations with Copilot cloud agent.
Availability and permissions
For automations to be available in a repository, all of the following must be true:

The repository must be private or internal. Automations are not available in public repositories.
Copilot cloud agent must be enabled for the repository. If you have Copilot Business or Copilot Enterprise, an administrator must enable the Copilot cloud agent policy. See Managing access to GitHub Copilot cloud agent.
The organization must allow both Copilot cloud agent and automations in the repository (both are enabled by default). See Adding GitHub Copilot cloud agent to your organization.

Automations are available with the GitHub Copilot Pro, GitHub Copilot Pro+, GitHub Copilot Max, GitHub Copilot Business, and GitHub Copilot Enterprise plans.
Any user with write access to a repository can create automations in that repository.
You can create and manage automations from:

The Agents tab in a repository on GitHub, in the Automations pane.
The Automations tab in the GitHub Copilot app.

Triggers
An automation runs when one of its triggers fires. The following triggers are available:

On a schedule: the automation runs at a recurring interval—hourly, daily, or weekly.
When an issue is created: the automation runs each time an issue is opened in the repository.
When a pull request is opened: the automation runs each time a pull request is opened in the repository.
When a pull request is synchronized: the automation runs each time new commits are pushed to a pull request in the repository.

You can optionally configure filters for event-based triggers:

For when an issue is created, add a search query filter.
For when a pull request is opened and when a pull request is synchronized, add a search query filter and a filter for files changed in the pull request.

To reduce the risk of prompt injection, automations ignore events triggered by users who don't have write access to the repository by default. This helps prevent untrusted users—for example, an external contributor opening an issue—from causing Copilot to take action. You can opt in to allowing these events if you need to. For more information, see Security and safety.
Tools and actions
The tools you select when you create an automation determine what Copilot can do when the automation runs.
For example, you might allow Copilot to push changes, update issue labels, or create a pull request.
Selecting tools is the main way you control the scope of an automation. Grant only the tools that the task needs, so that Copilot can't take actions you didn't intend.
You can manually select the tools you want to enable, or you can use the Suggest tools button to have Copilot suggest tools based on your prompt.
An automation can only take action in the single repository it is scoped to.
Configuration inherited from the repository
Automations use the Copilot cloud agent configuration for the repository they are scoped to, including:

Custom instructions. See Adding repository custom instructions for GitHub Copilot.
Agent skills. See Adding agent skills for GitHub Copilot.
Firewall rules. See Customizing or disabling the firewall for GitHub Copilot cloud agent.
Secrets and variables. See Configure secrets and variables for Copilot cloud agent.

Automations are stored separately from your repository's contents. They are not committed to Git, so they are not versioned alongside your code or managed through pull requests.
Visibility
An automation is private to the user who created it. Other people, including repository administrators, can't see your automations.
However, the Copilot cloud agent sessions that an automation starts are visible to other people with access to the repository, just like any other Copilot cloud agent session. Anyone who can see these sessions can see the prompt, the session logs, and any pull requests or other changes Copilot creates.
Because sessions and their logs are visible to others, you should not include secrets or other sensitive information directly in an automation's prompt. To give Copilot access to sensitive values, use repository secrets instead. See Configure secrets and variables for Copilot cloud agent.
Billing
Each time an automation runs, it starts a Copilot cloud agent session that uses GitHub Actions minutes and GitHub AI Credits. This usage is billed to the user who created the automation. For more information, see GitHub Copilot licenses.
Security and safety
Automations run Copilot without a person initiating each task, so they carry some additional risks. GitHub provides built-in protections to help mitigate these risks.

Attribution. Pull requests opened and code pushed by an automation are attributed to the user who created the automation. As with pull requests that user creates themselves, they can't approve those pull requests, which preserves the expected review controls.
Least-privilege tools. You choose exactly which tools an automation can use, so you can limit it to only the actions the task requires.
Untrusted input. By default, automations ignore events triggered by users without write access to the repository, to reduce the risk of prompt injection from untrusted users.
Workflow runs. As with all Copilot cloud agent work, GitHub Actions workflows don't run on a pull request until a user with write access approves them. This mitigates the risk of a pull request opened by an automation triggering workflows automatically.

For more information about how GitHub mitigates the risks of Copilot cloud agent, see Risks and mitigations for GitHub Copilot cloud agent.
Further reading

Creating automations with Copilot cloud agent
About GitHub Copilot cloud agent


────────────────────────────────────────────────────────────────────────────────

# 7. Access management

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/access-management

Managing access to GitHub Copilot cloud agentFind out about Copilot cloud agent policies available for GitHub Copilot Enterprise and GitHub Copilot Business, and about disabling the agent for specific repositories.Who can use this feature?Copilot cloud agent is available for all paid Copilot plans.
The agent is available in all repositories stored on GitHub, except repositories owned by managed user accounts and where it has been explicitly disabled.Sign up for Copilot Copy as MarkdownIn this articleNote

For an introduction to Copilot cloud agent, see About GitHub Copilot cloud agent.

Overview
Copilot cloud agent is an AI-powered software development agent that can work autonomously on issues or developer requests. It raises draft pull requests to propose a fix and iterates on the changes in response to feedback.
If you are a GitHub Copilot Enterprise or GitHub Copilot Business subscriber, Copilot cloud agent is disabled by default and must be enabled by an administrator before it is available for use.
If you are a Copilot Pro, Copilot Pro+, or Copilot Max subscriber, Copilot cloud agent is enabled by default.
Once enabled, you can use Copilot cloud agent in any repository, provided that an administrator hasn't opted the repository out.
Copilot cloud agent policies for Copilot Business and Copilot Enterprise
For GitHub Copilot Business and GitHub Copilot Enterprise subscribers, the ability to use Copilot cloud agent is controlled by policy settings defined at the organization level. See Adding GitHub Copilot cloud agent to your organization.
If the organization is owned by an enterprise, enablement may be controlled at the enterprise level. See Enabling GitHub Copilot cloud agent in your enterprise.
Opting repositories out of Copilot cloud agent
By default, users with Copilot cloud agent enabled can use it in all repositories.
Enterprise administrators and organization owners (for organization-owned repositories) and users (for user-owned repositories) can opt out repositories and prevent Copilot cloud agent from being used in those repositories.
For information on disabling Copilot cloud agent in some or all repositories owned by an organization, see Adding GitHub Copilot cloud agent to your organization.
For information on disabling Copilot cloud agent in all repositories owned by an enterprise, see Blocking agentic features in your enterprise.
For information on disabling Copilot cloud agent in repositories owned by your personal user account, see Managing GitHub Copilot policies as an individual subscriber.
Managing access to Automations
Automations let users run Copilot cloud agent automatically, on a schedule or in response to events. See About Copilot automations.
For automations to be available in a repository, all of the following must be true:

The repository must be private or internal. Automations are not available in public repositories.
Copilot cloud agent must be enabled for the repository. If you have Copilot Business or Copilot Enterprise, an administrator must enable the Copilot cloud agent policy. See Managing access to GitHub Copilot cloud agent.
The organization must allow both Copilot cloud agent and automations in the repository (both are enabled by default). See Adding GitHub Copilot cloud agent to your organization.

Automations are available with the GitHub Copilot Pro, GitHub Copilot Pro+, GitHub Copilot Max, GitHub Copilot Business, and GitHub Copilot Enterprise plans.
In addition to the Copilot cloud agent policy, organizations can control whether automations are allowed in a repository. Automations are enabled by default in repositories where Copilot cloud agent is enabled. For more information, see Adding GitHub Copilot cloud agent to your organization.
Further reading

GitHub Copilot cloud agent
Configure the development environment
Customizing or disabling the firewall for GitHub Copilot cloud agent
Configure MCP servers for your repository
Piloting GitHub Copilot cloud agent in your organization


────────────────────────────────────────────────────────────────────────────────

# 8. MCP and cloud agent

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/mcp-and-cloud-agent

Model Context Protocol (MCP) and GitHub Copilot cloud agentFind out about using the Model Context Protocol (MCP) with Copilot cloud agent.Copy as MarkdownIn this articleOverview
The Model Context Protocol (MCP) is an open standard that defines how applications share context with large language models (LLMs). MCP provides a standardized way to connect AI models to different data sources and tools, enabling them to work together more effectively.
You can use MCP to extend the capabilities of Copilot cloud agent by connecting it to other tools and services.
The agent can use tools provided by local and remote MCP servers. Some MCP servers are configured by default to provide the best experience for getting started.
For more information on MCP, see the official MCP documentation. For information on some of the currently available MCP servers, see the MCP servers repository.
When configuring MCP servers for use by Copilot cloud agent and Copilot code review, keep in mind:

Copilot cloud agent and Copilot code review only support MCP tools. They do not currently support resources or prompts provided by the MCP server.
Copilot cloud agent and Copilot code review do not currently support remote MCP servers that leverage OAuth for authentication and authorization.

Default MCP servers
The following MCP servers are configured automatically for Copilot cloud agent:

GitHub: The GitHub MCP server gives Copilot access to GitHub data like issues and pull requests. To learn more, see Using the GitHub MCP Server in your IDE.

By default, the GitHub MCP server connects to GitHub using a specially scoped token that only has read-only access to the current repository. You can customize it to use a different token with broader access. For more details, see Configure MCP servers for your repository.

Playwright: The Playwright MCP server gives Copilot access to web pages, including the ability to read, interact and take screenshots.

By default, the Playwright MCP server is only able to access web resources hosted within Copilot's own environment, accessible on localhost or 127.0.0.1.

Setting up MCP servers in a repository
Repository administrators can configure MCP servers for use within that repository. This is done via a JSON-formatted configuration in repository settings on GitHub.
Note

Repository MCP configuration on GitHub applies to both Copilot cloud agent and Copilot code review. MCP servers configured in repository MCP settings are available to both agents.

Once MCP servers are configured for use within a repository, the tools specified in the configuration will be available to Copilot cloud agent during each assigned task.
Copilot will use available tools autonomously, and will not ask for approval before use.
For details of how to set up MCP servers in a repository, see Configure MCP servers for your repository.
MCP servers for custom agents
You can also configure MCP servers for custom agents.
MCP servers configured in custom agents are available only to that specific agent and follow the same processing order as other MCP configurations, with custom agent MCP settings processed after default servers but before repository-level configurations.
For more information on configuring MCP servers for custom agents, see Custom agents configuration.
Best practices

Enabling third-party MCP servers for use may impact the performance of the agent and the quality of the outputs. Review the third-party MCP server thoroughly and ensure that it meets your organization’s requirements.

By default, Copilot cloud agent does not have access to write MCP server tools. However, some MCP servers do contain such tools. Be sure to review the tools available in the MCP server you want to use. Update the tools field in the MCP configuration with only the necessary tooling.

Carefully review the configured MCP servers prior to saving the configuration to ensure the correct servers are configured for use.


────────────────────────────────────────────────────────────────────────────────

# 9. Risks and mitigations

> Source: https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations

Risks and mitigations for GitHub Copilot cloud agentHow do Copilot cloud agent's built-in security protections mitigate known risks?Copy as MarkdownIn this articleCopilot cloud agent is an autonomous agent that has access to your code and can push changes to your repository. This entails certain risks.
Where possible, GitHub has applied appropriate mitigations. This gives Copilot cloud agent a strong base of built-in security protections that you can supplement by following best practice guidance.
Unvalidated code can introduce vulnerabilities
By default, Copilot cloud agent checks code it generates for security issues and gets a second opinion on its code with Copilot code review. It attempts to resolve issues identified prior to completing the pull request. This improves code quality and reduces the likelihood of the code generated by Copilot cloud agent introducing problems such as hardcoded secrets, insecure dependencies, and other vulnerabilities. Copilot cloud agent's security validation does not require a GitHub Secret Protection, GitHub Code Security, or GitHub Advanced Security license.

CodeQL is used to identify code security issues.
Newly introduced dependencies are checked against the GitHub Advisory Database for malware advisories, and for any CVSS-rated High or Critical vulnerabilities.
Secret scanning is used to detect sensitive information such as API keys, tokens, and other secrets.
Details about the analysis performed and the actions taken by Copilot cloud agent can be reviewed in the session log. See Managing agent sessions.

Optionally, you can disable one or more of the code quality and security validation tools used by Copilot cloud agent. See Configuring settings for GitHub Copilot cloud agent.
Copilot cloud agent can push code changes to your repository
To mitigate this risk, GitHub:

Limits who can trigger the agent. Only users with write access to the repository can trigger Copilot cloud agent to work. Comments from users without write access are never presented to the agent.
Limits the branch the agent can push to. Copilot cloud agent only has the ability to push to a single branch. When the agent is triggered by mentioning @copilot on an existing pull request, Copilot has write access to the pull request's branch. In other cases, a new copilot/ branch is created for Copilot, and the agent can only push to that branch. The agent is also subject to any branch protections and required checks for the working repository.
Limits the agent's credentials. Copilot cloud agent can only perform simple push operations. It cannot directly run git push or other Git commands.
Requires human review before merging. Draft pull requests created by Copilot cloud agent must be reviewed and merged by a human. Copilot cloud agent cannot mark its pull requests as "Ready for review" and cannot approve or merge a pull request.
Restricts GitHub Actions workflow runs. By default, workflows are not triggered until Copilot cloud agent's code is reviewed and a user with write access to the repository clicks the Approve and run workflows button. Optionally, you can configure Copilot to allow workflows to run automatically. See Review output from Copilot.
Prevents the user who asked Copilot cloud agent to create a pull request from approving it. This maintains the expected controls in the "Required approvals" rule and branch protection. See Available rules for rulesets.

Copilot cloud agent has access to sensitive information
Copilot cloud agent has access to code and other sensitive information, and could leak it, either accidentally or due to malicious user input.
To mitigate this risk, GitHub restricts Copilot cloud agent's access to the internet. See Customizing or disabling the firewall for GitHub Copilot cloud agent.
AI prompts can be vulnerable to injection
Users can include hidden messages in issues assigned to Copilot cloud agent or comments left for Copilot cloud agent as a form of prompt injection.
To mitigate this risk, GitHub filters hidden characters before passing user input to Copilot cloud agent: For example, text entered as an HTML comment in an issue or pull request comment is not passed to Copilot cloud agent.
Administrators can lose sight of agents' work
To mitigate this risk, Copilot cloud agent is designed to be auditable and traceable.

Copilot cloud agent's commits are authored by Copilot, with the developer who assigned the issue or requested the change to the pull request marked as the co-author. This makes it easier to identify code generated by Copilot cloud agent and who started the task.
Copilot cloud agent's commits are signed, so they appear as "Verified" on GitHub. This provides confidence that the commits were made by Copilot cloud agent and have not been altered.
Session logs and audit log events are available to administrators.
The commit message for each agent-authored commit includes a link to the agent session logs, for code review and auditing. See Managing agent sessions.

Automations run without a person initiating each task
Automations run Copilot cloud agent automatically, on a schedule or in response to events, without a person initiating each task. See About Copilot automations. This introduces some additional risks, which GitHub mitigates as follows.

Work is attributed to the person who created the automation. Pull requests opened and code pushed by an automation are attributed to the user who created the automation. As when that user creates a pull request themselves, they can't approve it, which preserves the expected "Required approvals" controls.
You control which tools an automation can use. When an automation is triggered by an event, input from untrusted users could become part of the prompt. To limit the impact of prompt injection, you choose exactly which tools an automation can use, so it can only take the actions the task requires.
Events from untrusted users are ignored by default. Automations ignore events triggered by users without write access to the repository by default, with a setting to opt in.
Workflows still require human approval. An issue or pull request opened by an automation could trigger another automation. As with all Copilot cloud agent work, GitHub Actions workflows don't run on a pull request until a user with write access approves them, which prevents workflows from running automatically as part of such a chain.


────────────────────────────────────────────────────────────────────────────────

# 10. About Copilot CLI

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli

About GitHub Copilot CLIFind out about using Copilot from the command line.Who can use this feature?GitHub Copilot CLI is available with all Copilot plans. If you receive Copilot from an organization, the Copilot CLI policy must be enabled in the organization's settings.Copy as MarkdownIn this articleIntroduction
The command-line interface (CLI) for GitHub Copilot allows you to use Copilot directly from your terminal. You can use it to answer questions, write and debug code, and interact with GitHub.com. For example, you can ask Copilot to make some changes to a project and create a pull request.
GitHub Copilot CLI gives you quick access to a powerful AI agent, without having to leave your terminal. It can help you complete tasks more quickly by working on your behalf, and you can work iteratively with GitHub Copilot CLI to build the code you need.
Supported operating systems

Linux
macOS
Windows from within Powershell and Windows Subsystem for Linux (WSL)

For installation instructions, see Installing GitHub Copilot CLI.
Modes of use
GitHub Copilot CLI has two user interfaces: interactive and programmatic.
Interactive interface
To start an interactive session, enter copilot. Within an interactive session, you can have a conversation with Copilot. You can prompt Copilot to perform one or more tasks, and you can give it feedback and steer the direction of the work.

The interactive interface has two modes. In addition to the default ask/execute mode there is also a plan mode in which Copilot will build a structured implementation plan for a task you want to complete.
Press Shift+Tab to cycle between modes. In plan mode, Copilot analyzes your request, asks clarifying questions to understand scope and requirements, and builds a plan before writing any code. This helps you catch misunderstandings before any code is written, and stay in control of complex, multi-step tasks.
Programmatic interface
You can also pass the CLI a single prompt directly on the command line. The CLI completes the task and then exits.
To use the CLI programmatically, include the -p or --prompt command-line option in your command. To allow Copilot to modify and execute files you should also use one of the approval options described later in this article—see Allowing tools to be used without manual approval ). For example:
copilot -p "Show me this week's commits and summarize them" --allow-tool='shell(git)'

Alternatively, you can use a script to output command-line options and pipe this to copilot. For example:
./script-outputting-options.sh | copilot

Caution

If you use an automatic approval option such as --allow-all-tools, Copilot has the same access as you do to files on your computer, and can run any shell commands that you can run, without getting your prior approval. See Security considerations, later in this article.

Running in a sandbox with cloud and local sandboxes for GitHub Copilot
Note

Cloud and local sandboxes for GitHub Copilot is in public preview and subject to change.

Cloud and local sandboxes for GitHub Copilot provides isolated execution environments for Copilot CLI, both locally and in the cloud. For more information, see About cloud and local sandboxes for GitHub Copilot.
Local sandboxing
You can enable local sandboxing inside a Copilot CLI session to restrict Copilot's access to your filesystem, network, and system capabilities. To enable it, run /sandbox enable inside a session.
Cloud sandboxing
You can start a Copilot CLI session inside an isolated, cloud-hosted environment with cloud sandboxes. This is useful when you want to run code without affecting your local machine, keep a session's state between uses, continue a session from a different machine, or run multiple tasks in parallel. Cloud sandbox policies inherit from Copilot cloud agent policies, so existing security controls like firewall rules extend to cloud sandboxes without additional setup.
To start a cloud-backed session, run:
copilot --cloud

Use cases for GitHub Copilot CLI
The following sections provide examples of tasks you can complete with GitHub Copilot CLI.
Local tasks

From within a project directory you can ask Copilot to make a change to the code in the project. For example:
Change the background-color of H1 headings to dark blue
Copilot finds the CSS file where H1 headings are defined and changes the color value.

Ask Copilot to tell you about changes to a file:
Show me the last 5 changes made to the CHANGELOG.md file. Who changed the file, when, and give a brief summary of the changes they made

Use Copilot to help you improve the code, or documentation, in your project.

Suggest improvements to content.js

Rewrite the readme in this project to make it more accessible to newcomers

Use Copilot to help you perform Git operations.

Commit the changes to this repo

Revert the last commit, leaving the changes unstaged

Ask Copilot to create an application from scratch—for example, as a proof of concept.
Use the create-next-app kit and tailwind CSS to create a next.js app. The app should be a dashboard built with data from the GitHub API. It should track this project's build success rate, average build duration, number of failed builds, and automated test pass rate. After creating the app, give me easy to follow instructions on how to build, run, and view the app in my browser.

Ask Copilot to explain why a change it made is not working as expected, or tell Copilot to fix a problem with the last change it made. For example:
You said: "The application is now running on http://localhost:3002 and is fully functional!" but when I browse to that URL I get "This site can't be reached"

Tasks involving GitHub.com

Fetch and display details about your work from GitHub.com.

List my open PRs
This lists your open pull requests from any repository on GitHub. For more specific results, include the repository name in your prompt:

List all open issues assigned to me in OWNER/REPO

Ask Copilot to work on an issue:
I've been assigned this issue: https://github.com/octo-org/octo-repo/issues/1234. Start working on this for me in a suitably named branch.

Ask Copilot to make file changes and raise a pull request on GitHub.com.

In the root of this repo, add a Node script called user-info.js that outputs information about the user who ran the script. Create a pull request to add this file to the repo on GitHub.

Create a PR that updates the README at https://github.com/octo-org/octo-repo, changing the subheading "How to run" to "Example usage"

Copilot creates a pull request on GitHub.com, on your behalf. You are marked as the pull request author.

Ask Copilot to create an issue for you on GitHub.com.
Raise an improvement issue in octo-org/octo-repo. In src/someapp/somefile.py the `file = open('data.txt', 'r')` block opens a file but never closes it.

Ask Copilot to check the code changes in a pull request.
Check the changes made in PR https://github.com/octo-org/octo-repo/pull/57575. Report any serious errors you find in these changes.
Copilot responds in the CLI with a summary of any problems it finds.

Manage pull requests from GitHub Copilot CLI.

Merge all of the open PRs that I've created in octo-org/octo-repo

Close PR #11 on octo-org/octo-repo

Find specific types of issues.
Use the GitHub MCP server to find good first issues for a new team member to work on from octo-org/octo-repo
Note

If you know that a specific MCP server can achieve a particular task, then specifying it in your prompt can help Copilot to deliver the results you want.

Find specific GitHub Actions workflows.
List any Actions workflows in this repo that add comments to PRs

Create a GitHub Actions workflow.
Branch off from main and create a GitHub Actions workflow that will run on pull requests, or can be run manually. The workflow should run eslint to check for problems in the changes made in the PR. If warnings or errors are found these should be shown as messages in the diff view of the PR. I want to prevent code with errors from being merged into main so, if any errors are found, the workflow should cause the PR check to fail. Push the new branch and create a pull request.

Steering the conversation
You can interact with Copilot while it's thinking to steer the conversation:

Enqueue additional messages: Send follow-up messages to steer the conversation in a different direction, or queue additional instructions for Copilot to process after it finishes its current response. This makes conversations feel more natural and keeps you in control.
Inline feedback on rejection: When you reject a tool permission request, you can give Copilot inline feedback about the rejection so it can adapt its approach without stopping entirely. This makes the conversation flow more naturally when you want to guide Copilot away from certain actions.

Automatic context management
GitHub Copilot CLI automatically manages your conversation context:

Auto-compaction: When your conversation approaches 95% of the token limit, Copilot automatically compresses your history in the background without interrupting your workflow. This enables virtually infinite sessions.
Manual control: Use /compact to manually compress context anytime. Press Escape to cancel if you change your mind.
Visualize usage: The /context command shows a detailed token usage breakdown so you can understand how your context window is being used.

Customizing GitHub Copilot CLI
You can customize GitHub Copilot CLI in a number of ways:

Custom instructions: Custom instructions allow you to give Copilot additional context on your project and how to build, test and validate its changes. All custom instruction files now combine instead of using priority-based fallbacks. For more information, see Adding custom instructions for GitHub Copilot CLI.
Model Context Protocol (MCP) servers: MCP servers allow you to give Copilot access to different data sources and tools. For more information, see Using GitHub Copilot CLI.
Custom agents: Custom agents allow you to create different specialized versions of Copilot for different tasks. For example, you could customize Copilot to be an expert frontend engineer following your team's guidelines. GitHub Copilot CLI includes specialized custom agents that it automatically delegates common tasks to. For more information, see Using GitHub Copilot CLI.
Hooks: Hooks allow you to execute custom shell commands at key points during agent execution, enabling you to add validation, logging, security scanning, or workflow automation. See About hooks for GitHub Copilot.
Skills: Skills allow you to enhance the ability of Copilot to perform specialized tasks with instructions, scripts, and resources. For more information, see About agent skills.
Copilot Memory: Copilot Memory allows Copilot to build a persistent understanding of your repository by storing "memories", which are pieces of information about coding conventions, patterns, and preferences that Copilot deduces as it works. This reduces the need to repeatedly explain context in your prompts and makes future sessions more productive. For more information, see About GitHub Copilot Memory.

Security considerations
When you use Copilot CLI, Copilot can perform tasks on your behalf, such as executing or modifying files, or running shell commands.
You should therefore always keep security considerations in mind when using Copilot CLI, just as you would when working directly with files yourself, or running commands directly in your terminal. You should always review suggested commands carefully when Copilot CLI requests your approval.
Trusted directories
Trusted directories control where Copilot CLI can read, modify, and execute files.
You should only launch Copilot CLI from directories that you trust. You should not use Copilot CLI in directories that may contain executable files you can't be sure you trust. Similarly, if you launch the CLI from a directory that contains sensitive or confidential data, or files that you don't want to be changed, you could inadvertently expose those files to risk. Typically, you should not launch Copilot CLI from your home directory.
Scoping of permissions is heuristic and GitHub does not guarantee that all files outside trusted directories will be protected. See Risk mitigation.
When you start a GitHub Copilot CLI session, you'll be asked to confirm that you trust the files in, and below, the directory from which you launched the CLI. See Configuring GitHub Copilot CLI.
Allowed tools
The first time that Copilot needs to use a tool that could be used to modify or execute a file—for example, touch, chmod, node, or sed—it will ask you whether you want to allow it to use that tool.
Typically, you can choose from three options:
1. Yes
2. Yes, and approve TOOL for the rest of the running session
3. No, and tell Copilot what to do differently (Esc)

Option 1 allows Copilot to run this particular command, this time only. The next time it needs to use this tool, it will ask you again.
Option 2 allows Copilot to use this tool again, without asking you for permission, for the duration of the currently running session. It will ask for your approval again in new sessions, or if you resume the current session in the future. If you choose this option, you are allowing Copilot to use this tool in any way it thinks is appropriate. For example, if Copilot asks you to allow it to run the command rm ./this-file.txt, and you choose option 2, then Copilot can run any rm command (for example, rm -rf ./*) during the current run of this session, without asking for your approval.
Option 3 cancels the proposed command and allows you to tell Copilot to try a different approach.
Allowing tools to be used without manual approval
There are three command-line options that you can use, in either interactive or programmatic sessions, to determine tools that Copilot can use without asking for your approval:

--allow-all-tools
Allows Copilot to use any tool without asking for your approval.
For example, you can use this option with a programmatic invocation of the CLI to allow Copilot to run any command. For example:
copilot -p "Revert the last commit" --allow-all-tools

--deny-tool
Prevents Copilot from using a specific tool.
This option takes precedence over the --allow-all-tools and --allow-tool options.

--allow-tool
Allows Copilot to use a specific tool without asking for your approval.

Using the approval options
The --deny-tool and --allow-tool options require one of the following arguments:

'shell(COMMAND)'
For example, copilot --deny-tool='shell(rm)' prevents Copilot from using any rm command.
For git and gh commands, you can specify a particular first-level subcommand to allow or deny. For example:
copilot --deny-tool='shell(git push)'

The tool specification is optional. For example, copilot --allow-tool='shell' allows Copilot to use any shell command without individual approval.

'write'
This argument allows or denies tools—other than shell commands—permission to modify files.
For example, copilot --allow-tool='write' allows Copilot to edit files without your individual approval.

'MCP_SERVER_NAME'
This argument allows or denies tools from the specified MCP server, where MCP_SERVER_NAME is the name of an MCP server that you have configured. Tools from the server are specified in parentheses, using the tool name that is registered with the MCP server. Using the server name without specifying a tool allows or denies all tools from that server.
For example, copilot --deny-tool='My-MCP-Server(tool_name)' prevents Copilot from using the tool called tool_name from the MCP server called My-MCP-Server.
You can find an MCP server's name by entering /mcp in the CLI's interactive interface, then selecting the server from the list that's displayed.

Combining approval options
You can use a combination of approval options to determine exactly which tools Copilot can use without asking for your approval.
For example, to prevent Copilot from using the rm and git push commands, but automatically allow all other tools, use:
copilot --allow-all-tools --deny-tool='shell(rm)' --deny-tool='shell(git push)'

To prevent Copilot from using the tool tool_name from the MCP server named My-MCP-Server, but allow all other tools from that server to be used without individual approval, use:
copilot --allow-tool='My-MCP-Server' --deny-tool='My-MCP-Server(tool_name)'

Security implications of automatic tool approval
It's important to be aware of the security implications of using the approval command-line options. These options allow Copilot to execute commands needed to complete your request, without giving you the opportunity to review and approve those commands before they are run. While this streamlines workflows, and allows headless operation of the CLI, it increases the risk of unintended actions being taken that might result in data loss or corruption, or other security issues.
You can control which tools Copilot CLI can use by responding to approval prompts when Copilot attempts to use a tool, by specifying permissions with command-line flags, or (in an interactive session) by using slash commands (such as /allow-all and /yolo. See Configuring GitHub Copilot CLI.
Risk mitigation
You can mitigate the risks associated with using the automatic approval options by running Copilot CLI in a sandboxed environment. Cloud and local sandboxes for GitHub Copilot provides a first-party solution for this, with local sandboxing to restrict access on your machine and cloud sandboxing for fully isolated execution. For more information, see About cloud and local sandboxes for GitHub Copilot.
Alternatively, you can run Copilot CLI in a virtual machine, container, or dedicated system with tightly controlled permissions and network access.
Known MCP server policy limitations
Copilot CLI can't currently support the following organization-level MCP server policies:

MCP servers in Copilot, which controls whether MCP servers can be used at all by Copilot.
MCP Registry URL, which controls which MCP registry Copilot will allow MCP servers to be used from.

For more information about these policies, see MCP server usage in your company.
Model usage
You can change the model used by GitHub Copilot CLI by using the /model slash command or the --model command-line option. Enter this command, then select a model from the list.
Each time you interact with Copilot in Copilot CLI's interactive interface, or use Copilot CLI programmatically, AI credits are consumed based on the number of tokens processed. The amount consumed per interaction varies depending on the model used. See Models and pricing for GitHub Copilot.
Models with extended capabilities
The latest models support a 1 million token context window, so you can work across larger codebases, longer documents, and complex multi-file projects without losing context. After you select a supported model, you will be prompted to choose between the default context size or an extended (1 million token) context.
In addition, these models also support configurable reasoning levels, which control the depth of the model's reasoning process before it generates a response.
Choosing a larger context window or higher reasoning will impact AI credits consumption; more tokens will be consumed, so more credits will be used. For this reason, we recommend that you use the regular context window and regular reasoning by default, selecting the larger context window and higher reasoning for more complex tasks only.
For a list of models that support these capabilities, see Models with extended capabilities.
Using your own model provider
You can configure Copilot CLI to use your own model provider instead of GitHub-hosted models. This lets you connect to an OpenAI-compatible endpoint, Azure OpenAI, or Anthropic, including locally running models such as Ollama. You configure your model provider using environment variables.

Environment variableDescriptionCOPILOT_PROVIDER_BASE_URLThe base URL of your model provider's API endpoint.COPILOT_PROVIDER_TYPEThe provider type: openai (default), azure, or anthropic. The openai type works with any OpenAI-compatible endpoint, including Ollama and vLLM.COPILOT_PROVIDER_API_KEYYour API key for authenticating with the provider. Not required for providers that don't use authentication, such as a local Ollama instance.COPILOT_MODELThe model to use (required when using a custom provider). You can also set this with the --model command-line option.
Models used with Copilot CLI must support tool calling (function calling) and streaming. If the model does not support these capabilities, Copilot CLI will return an error. For best results, the model should have a context window of at least 128k tokens.
For details on how to configure your model provider, run copilot help providers in your terminal.
Use Copilot CLI via ACP
ACP (the Agent Client Protocol) is an open standard for interacting with AI agents. It allows you to use Copilot CLI as an agent in any third-party tools, IDEs, or automation systems that support this protocol.
For more information, see Copilot CLI ACP server.
Feedback
If you have any feedback about GitHub Copilot CLI, please let us know by using the /feedback slash command in an interactive session and choosing one of the options. You can complete a private feedback survey, submit a bug report, or suggest a new feature.
Further reading

Installing GitHub Copilot CLI
Using GitHub Copilot CLI
Application card: GitHub Copilot Agents


────────────────────────────────────────────────────────────────────────────────

# 11. Comparing CLI features

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/comparing-cli-features

Comparing GitHub Copilot CLI customization featuresFind out about the various ways you can customize Copilot: what they do, and when to use them.Who can use this feature?GitHub Copilot CLI is available with all Copilot plans. If you receive Copilot from an organization, the Copilot CLI policy must be enabled in the organization's settings.Copy as MarkdownIn this articleIntroduction
Copilot CLI is a terminal-based AI agent that can answer questions, plan work, and complete tasks on your behalf. It’s designed to be highly extensible, and there are various ways in which you can customize its behavior and extend its capabilities.
This article explains the difference between:

Custom instructions
These tell Copilot how to behave in general. For example, to ensure any code that Copilot writes conforms to your coding standards. Find out more.

Skills
These tell Copilot how to handle a specific kind of task. For example, to use a particular tool when working on a specific type of task. Find out more.

Tools
These provide abilities. For example, for finding and modifying files, or for interacting with parts of GitHub. Find out more.

MCP servers
These add collections of tools that allow Copilot to interact with external services. Find out more.

Hooks
These let you run your own logic at specific lifecycle moments. For example, you can run a specific script every time a CLI session starts or ends. Find out more.

Subagents
These are delegated agent processes, tied to the main agent and used to perform specific tasks separately from the main agent process. They have their own context window, which can be populated without affecting the main agent's context. Find out more.

Custom agents
These are definitions of specialized abilities, designed to perform specific tasks. The main CLI agent can delegate a task to a subagent, using a custom agent profile, to apply specialist knowledge and a particular approach to the task. For example, a custom agent might perform the role of a React reviewer, a docs writer, a security auditor, or a test generator. Find out more.

Plugins
These are packages that can deliver preconfigured customizations such as skills, hooks, custom agents, and MCP servers. Find out more.

Custom instructions
What are custom instructions?
Custom instructions are persistent guidance that the Copilot CLI loads from instruction files at the start of a session.
Copilot will find and load instruction files from a number of default locations in the repository, such as AGENTS.md and .github/copilot-instructions.md, or from your home directory at $HOME/.copilot/copilot-instructions.md.
You can use the --no-custom-instructions flag to avoid loading these instructions.
What problem do custom instructions solve?
Custom instructions help you:

Keep Copilot aligned with your coding conventions and preferences.
Apply team or organization standards consistently.
Avoid having to include repetitive reminders to Copilot in every prompt.

When should you use custom instructions?
Use custom instructions for:

Style and quality rules
Example: "Prefer small PRs, write tests, and avoid changing public APIs without discussion."

Repository conventions
Example: "Use pnpm, keep changelog entries in CHANGELOG.md, run pnpm test before committing."

Communication preferences
Example: “Explain tradeoffs briefly, then provide the recommended choice.”

When shouldn't you use custom instructions?
Avoid or keep them minimal when:

You only want the behavior in one workflow (use a skill instead).
Your instructions are so large/specific they distract Copilot from the immediate task (prefer a skill or a custom agent).

Find out more about custom instructions
See Adding custom instructions for GitHub Copilot CLI.
Skills
What is a skill?
A skill is, minimally, a Markdown file containing instructions that Copilot can use to perform tasks in a specific context. The name and skill description allow Copilot to determine whether it should use the skill for a given task. If it decides to use the skill, it will load the instructions and follow them to complete the task.
Skills can optionally reference other files, stored within the skill directory. These can include scripts that Copilot can run when the skill is used.
What problem does a skill solve?
Skills help you:

Standardize how Copilot performs tasks in a specific context (for example, when performing a code review).
Provide "just-in-time" instructions without permanently changing Copilot's behavior.
Avoid overloading Copilot's context window with instructions that are not relevant to the current task.

How do you access skills?
You can manually invoke a skill by using a slash command. For example, /Markdown-Checker check README.md. Use /skills list to list the available skills.
Copilot CLI automatically invokes skills when it detects one that is relevant to the current task.
When should you use a skill?
Use a skill when you want:

A repeatable set of instructions or functionality to be available for a type of task.
Example: a documentation skill that checks that user-facing documentation is updated when frontend code is changed.

A consistent output format.
Example: a "release note draft" skill that ensures Copilot uses a template to create a release note.

A workflow you sometimes need, but not always.
Example: a “deep refactor” skill you only enable during migrations.

When shouldn't you use a skill?
Avoid skills when:

The guidance should apply to everything you do (use custom instructions instead).
You need new capabilities (you may need an MCP server to add tools, or a custom agent for specialization).

Find out more about agent skills
See About agent skills.
Tools
What is a tool?
A tool is an ability that Copilot uses to get something done—like searching files, viewing file contents, editing, running a task, or invoking a skill. Some tools are built in, and others can be added through MCP servers.
What problem do tools solve?
Tools let the CLI:

Gather accurate context (using read/search tools).
Make changes safely (using edit tools).
Execute commands and validate outcomes (potentially using subagents).

When should you use tools?
You typically don't call tools directly—Copilot decides to use tools as needed. You can allow or deny use of tools, either for a specific task, for the current session, or for all of your Copilot CLI sessions.
You’ll see Copilot using tools when you:

Ask Copilot to search the repository for something, update a file, or run tests.
Invoke a skill—which triggers the skill tool.
Ask Copilot to perform a task that requires it to use a tool supplied by an MCP server.
Task Copilot to complete a complex task and it decides to delegate to a subagent—which triggers the task tool.

Find out more about allowing or denying tools
See About GitHub Copilot CLI.
MCP servers
What is an MCP server?
An MCP server is a service that allows AI applications, such as Copilot CLI, to connect to external data sources and tools.
Adding an MCP server to Copilot CLI provides additional capabilities, by allowing you to use tools supplied by that MCP server. For example, you could add an MCP server that provides tools for interacting with an online calendar application, or a support ticketing system.
What problem do MCP servers solve?
MCP servers help when the built-in tools aren’t enough. They can:

Connect Copilot CLI to external systems.
Add purpose-built tools (for example, for working with APIs, databases, or image generation).
Standardize safe access patterns for non-repository resources.

When should you use an MCP server?
Use an MCP server when you need:

Integration with external data or systems.
Example: How many support tickets have been opened this month for Product X?

Domain-specific actions that you want the CLI to perform on your behalf.
Example: Message the bug-watch channel: Only 2 support tickets raised this month for Product X.

When shouldn't you use an MCP server?
Avoid adding MCP servers when:

Built-in tools already cover your needs.

Find out more about MCP servers
See About Model Context Protocol (MCP).
Hooks
What is a hook?
Hooks allow you to specify that, at a given point in a session lifecycle, Copilot CLI will execute a shell command you have defined.

HookWhen it runspreToolUse / postToolUseBefore/after a tool runs.userPromptSubmittedWhen a user submits a prompt.sessionStart / sessionEndAt the start/end of a session.errorOccurredWhen an error occurs.agentStopWhen the main agent stops without an error.subagentStopWhen a subagent completes.
What problem do hooks solve?
Hooks help when you want programmable control or observability around Copilot CLI behavior, such as:

Enforcing guardrails—block or warn before certain tools run.
Adding logging/telemetry
Customizing retry/abort behavior on recoverable errors
Adding "policy" checks—for example, to prevent edits to protected paths.
Intercepting the moment a subagent finishes—before results return to the parent agent.

Hooks are useful when you need more control than skills or custom instructions can provide. While skills and instructions guide Copilot's behavior through prompts, hooks ensure that operations you have defined will be performed at specific moments—for example, to block a tool from running, or to log activity when a session ends.
When should you usehooks?
Use hooks when you want:

Tool guardrails

Example: before bash runs, require that the specific command matches an allowlist.
Example: before edit runs, block changes under infra/ unless a ticket ID is present.

Session lifecycle automation

Example: when the agent stops, archive the transcript of the session to a storage location.

Error handling policy

Example: on rate limit errors, automatically choose "retry" with a capped retry count.

Subagent workflow control

Example: when a subagent finishes, validate its output before passing results back to the main agent.

When shouldn't you use hooks?
Avoid hooks when:

You just need consistent prompting or workflow instructions (use skills).
You want persistent preferences and standards (use custom instructions).
You need new external capabilities (use MCP servers and tools).
Maintaining configuration that can affect every session may be problematic for you.

Find out more about hooks
See:

Using hooks with GitHub Copilot CLI
GitHub Copilot hooks reference

Subagents
What is a subagent?
A subagent is the execution of a separate AI agent that the main agent of a Copilot CLI session spins up to do a specific piece of work.
Copilot CLI uses a subagent when the main agent decides that delegating a chunk of work to a separate agent is the best way to complete the user’s request.
What problem do subagents solve?
Subagents help Copilot:

Keep the context window of the main agent in a CLI session focused, by offloading a chunk of work to a separate agent.
Parallelize work, where necessary, by running certain tasks in the background.
Run a custom agent separately from the main agent, performing specialist work with a different approach to the work carried out by the main agent.

When are subagents used?
Copilot is likely to use a subagent for:

Codebase exploration
For example, listing all endpoints in an API.

Command execution for complex tasks
For example, running a test suite, or building a large project and analyzing the results.

Reviewing changes
For example, reviewing staged changes and identifying potential security issues.

Complex multi-step work
For example, implementing a feature with several changes.

For using custom agents
If you’ve defined a custom agent and it’s eligible for inference (infer is not set to false), Copilot may choose to delegate work to that custom agent by spinning up a subagent with the custom agent's configuration.

Custom agents
What is a custom agent?
Custom agents provide Copilot with specialist knowledge about a particular subject, and define a particular approach that Copilot should use when working in that area. You can think of a custom agent as a "persona" that Copilot can adopt when working on certain tasks.
Copilot CLI has several built-in custom agents. For example, the explore, task, research, code-review, rubber-duck, and general-purpose agents. You can also define your own custom agents, to meet your specific needs.
You define a custom agent in a Markdown file with YAML frontmatter. The file contains:

A description of the agent's role and expertise
A list of allowed tools (or all tools)
Optional MCP server connections
An optional infer setting—when enabled, Copilot will automatically delegate to this agent when it detects a task that matches the agent's specialty.

What problem do custom agents solve?
Custom agents help when you need:

Specialist knowledge to be applied consistently in a particular context.
Different tool permissions for different work, as defined in the custom agent configuration.
To allow the main agent's context window to stay focused on the main task, with the custom agent's own context window being used for the specialist work it performs.

When should you use a custom agent?
Use a custom agent when you want:

A specialized reviewer or helper
Example: Create a "react-reviewer" custom agent that focuses on work involving React patterns.

Safer permissions
Example: A custom agent that can only view/grep/glob (read-only) for auditing.

Optional auto-delegation
Example: Set infer: true in the custom agent configuration so that Copilot can automatically use this custom agent when appropriate.

When shouldn't you use a custom agent?
Avoid custom agents when:

You only need guidance text (a skill can be a lighter-weight solution).
You don't need specialization and the default agent performs tasks well.

Find out more about custom agents
See Custom agents configuration.
Plugins
What is a plugin?
A plugin is an installable package that can deliver a bundle of functionality to Copilot. A plugin can include any combination of the other customization features. For example, skills, custom agents, hooks, and MCP server configurations.
Copilot includes plugin management commands (install, update, list, uninstall) and supports installing from a marketplace or directly from a GitHub repository.
What problem do plugins solve?
Plugins help you:

Easily add a bundle of functionality to Copilot without having to manually configure each piece.
Package and distribute a custom configuration—potentially a combination of skills, custom agents, hooks, and MCP servers—to your team, or to the public.
Alter available functionality without having to manually copy files into directories.

When should you use a plugin?
Use a plugin when:

You want a team-wide bundle
Example: A company-wide engineering plugin that includes:

Skills for incident response.
A custom agent for code review.
An MCP server for internal services.

You want easy installation and updates
Example: Install a plugin initially, then update it regularly using /plugin update PLUGIN-NAME.

When shouldn't you use a plugin?
Avoid plugins when:

You're experimenting locally and don't need distribution (use local skills, custom instructions, or custom agents).
You only need a small one-off workflow. A single skill file may be simpler.

Putting it together: choosing the right option

RequirementBest optionI want Copilot to always follow our repository conventions.Custom instructionsI want a repeatable workflow I can invoke on demand.SkillsI want Copilot to answer questions and carry out work in my repository.Copilot requests permission to use the appropriate toolsI want guardrails, policy, or automation around tool use and session events.HooksI need Copilot to be able to use tools provided by an external service.MCP serversWhen working on particular tasks, I want Copilot to operate as a specialist with a constrained toolset.Custom agentI want Copilot to carry out a complex task on my behalf.Copilot automatically uses subagents when appropriate.I want to add a package of functionality to Copilot CLI without configuring it manually myself.Plugin
Further reading

GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 12. Cancel and roll back

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/cancel-and-roll-back

Canceling a GitHub Copilot CLI operation and rolling back changesFind out about the different ways to cancel an active Copilot operation, and how to roll back changes made during a session if the result isn't what you expected.Copy as MarkdownIn this articleIntroduction
When you work in an interactive Copilot CLI session, you can press Esc or Ctrl+C to control what Copilot is doing. Both keypresses can cancel operations, but they work slightly differently:

Ctrl+C immediately stops the current operation.
A single Esc keypress gives you more gradual control—letting you dismiss dialogs, clear queued prompts, or cancel an operation in stages.

If Copilot has already made changes and you want to undo them, you can roll back your workspace to a previous point in the session. Copilot CLI takes a snapshot of your workspace state each time you enter a prompt, and this allows you to rewind to an earlier state by pressing Esc twice when Copilot is idle and the input area is empty.
What pressing Esc does in different situations
Pressing Esc once performs different actions depending on the current state of the session:

Current stateWhat pressing Esc doesCopilot is active with no queued prompts.Cancels the running operation.Copilot is active and there are queued prompts.Clears the queued prompts without stopping the current operation.A dialog, overlay, or picker is open.Closes the dialog, overlay, or picker.Copilot is idle.Shows a brief reminder that pressing Esc again quickly will open the rewind picker. See Rolling back changes.
When to use Esc instead of Ctrl+C
The main difference between these two ways of canceling an operation is that Esc is designed for gradual, targeted intervention, while Ctrl+C is a hard stop.
Use Esc when you want to interact with Copilot without necessarily ending the current operation. For example, if a permission dialog appears and you want to deny that specific request, pressing Esc dismisses the dialog and Copilot continues working—it just won't use the tool you denied. Similarly, if you've queued follow-up prompts and want to cancel them without interrupting the work already in progress, Esc clears the queue while the current operation keeps running. Pressing Esc only cancels the operation outright if there are no dialogs open and no queued prompts to clear first.
Use Ctrl+C when you want to stop everything at once. It immediately cancels the active operation and clears any queued prompts in a single keypress. Any file write that is already in progress will complete—files are not left corrupted mid-write—but any remaining planned changes are abandoned. Pressing Ctrl+C a second time within two seconds, when the input area is empty, exits the session entirely.
As a rule of thumb, use Esc when you want to intervene selectively, and Ctrl+C when you want to stop and start over.
Rolling back changes
While Copilot is inactive and there is no text in the input area, you can press Esc twice to display a list of points in your current session that you can roll back to. Each point corresponds to a snapshot of your workspace that was taken immediately before Copilot started working on the prompt shown in the list.
For full details of how to use the double Esc keypress to roll back changes made during a session, see Rolling back changes made during a GitHub Copilot CLI session.
Warning

Rewinding restores your entire workspace to the state it was in at the selected snapshot. This reverts all changes made after that point—not only changes made by Copilot, but also any manual edits, and changes resulting from shell commands. Any new files created in the workspace after the snapshot was taken are deleted, irrespective of their Git status.

What happens when you roll back
When you select a snapshot from the rewind picker, the following actions occur:

Git state is restored. The repository is checked out to the Git commit and branch recorded in the snapshot.
Untracked files are cleaned. Files that did not exist at the time of the snapshot are removed.
Modified files are restored. Files that were changed after the snapshot are reverted to their backed-up state, including permissions and staging state.
Session history is truncated. The conversation is rewound to the point where the selected snapshot was taken. All messages and tool calls that occurred after that point are removed from the session.
Snapshots are removed. The selected snapshot and all snapshots after it are permanently deleted. Only snapshots from earlier conversation steps remain available for future rewinds.
Rollback confirmed. After the rollback, Copilot displays a message indicating how many files were restored.
Your prompt is restored. The prompt associated with the selected snapshot is placed in the input area.

Changes that can't be rolled back
Rewind is unavailable in the following situations:

Files over 10 MB. Individual files larger than 10 MB are skipped during snapshot creation. Changes to these files are not restored during a rollback.
More than 500 changed files. If more than 500 files were changed during a single step of a CLI conversation, a snapshot is not created for that step. You will not be able to roll back changes made in that step. Earlier snapshots are unaffected.

Further reading

GitHub Copilot CLI command reference


────────────────────────────────────────────────────────────────────────────────

# 13. About remote control

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-remote-control

About remote control of GitHub Copilot CLI sessionsRemote control lets you monitor and steer a Copilot CLI session from GitHub.com or GitHub Mobile, even after you've stepped away from your machine.Copy as MarkdownIn this articleThis article explains the concepts around remote control of Copilot CLI sessions. For instructions on how to enable remote control, see Steering a GitHub Copilot CLI session from another device.
When remote control helps
By default, GitHub Copilot CLI sessions are only steerable from your local machine. However, you can enable remote control of the session. Remote control is useful when you want to view progress or respond to prompts and permission requests, without having to remain at the machine where the session is running. For example:

You step away from your workstation: Keep interacting with Copilot from your phone or another device, without returning to the machine where the session is running.
A long-running task needs your input: Approve permission requests and answer questions as they come up, so the task isn't blocked while you're away.
You want a quick status check: Glance at session progress from GitHub Mobile while you work on something else.

Prerequisites
Remote control requires:

Policy enablement: If your Copilot seat comes from an organization, an enterprise or organization owner must set the "Store local sessions in the Cloud" policy to "View and control" (unconfigured by default). See Administering remote control later in this article.
The machine must be online: The CLI session must be actively running in a terminal on a machine with an internet connection. If the machine goes to sleep or loses its connection, remote control is unavailable until the machine is back online. See Reconnection later in this article.
An interactive session: Remote access is only available for interactive sessions. It is not available when you use the CLI programmatically with the --prompt command-line option, for example when you use the CLI in a script.

Accessing a session remotely
When you enable remote control for a Copilot CLI session, you can go to GitHub.com or GitHub Mobile and find the session in the list of your recent agent sessions. The remote interface is updated in real time, allowing you to monitor ongoing output from the session and respond to prompts and permission requests as they come in.
Both the local terminal and the remote interface are active at the same time. You can enter commands in either interface. Copilot CLI uses the first response it receives to any prompt or permission request.
Your session continues to run on your local machine. The remote interface provides a way to interact with the session, but the CLI itself (and all the tools, shell commands, and file operations it runs) remains on the machine where you started the session.
What you can do remotely
When connected to a session remotely from GitHub.com or GitHub Mobile, you can:

Respond to permission requests: Approve or deny tool, file path, and URL permission requests.
Respond to questions: Answer when Copilot asks you to supply more information or make a decision.
Approve or reject plans: Respond to plan approval prompts when Copilot is in plan mode.
Submit new prompts: Enter questions or instructions, just as you would in the terminal.
Switch modes: Change the session mode—for example, between interactive and plan mode.
End the current operation: Cancel the agent's current work.

Note

Slash commands—such as /allow-all—are not currently available from the remote interface.

Reconnection
If the connection between your local machine and GitHub is temporarily lost—for example, due to a network interruption—you can continue using the session remotely as soon as the connection is restored.
You can use the /keep-alive slash command to prevent your machine from going to sleep. See Preventing your machine from going to sleep.
When you use copilot --continue or copilot --resume to resume a CLI session for which remote control was enabled, remote control is automatically re-enabled.
Security and privacy
Remote control is only available to the person signed in to GitHub with the same account that started the CLI session. No one else can view or interact with your sessions remotely.
When remote control is enabled:

Session events (conversation messages, tool execution events, and permission requests) are sent from your local machine to GitHub.
Remote commands are polled by Copilot CLI from GitHub and injected into your local session.
The CLI continues to run locally. All shell commands, file operations, and tool executions happen on your machine. Remote control does not grant direct access to your machine beyond what the CLI agent can do within the session.

Administering remote control
Enterprise and organization owners control whether users can enable remote control using the "Store local sessions in the Cloud" policy.

Organization-level policy (unconfigured by default): Organization owners can set this policy to "View from cloud" (syncing only) or "View and control" (syncing plus remote control). If the policy is disabled or unconfigured, neither session syncing nor remote control is available for the organization's users.
Enterprise-level policy: Enterprise owners can enforce a setting across all organizations, or select "Let organizations decide" to let each organization choose its own level. If the enterprise enforces "View and control," all organizations under it receive that setting.

For remote control to be available, the applicable policy (enterprise-enforced or organization-level) must be set to "View and control."
For more information, see Managing policies and features for GitHub Copilot in your organization and Administering Copilot CLI for your enterprise.


────────────────────────────────────────────────────────────────────────────────

# 14. About custom agents (CLI)

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-custom-agents

About custom agentsCustom agents enhance Copilot with assistance tailored to your needs.Copy as MarkdownIn this articleAbout custom agents
Custom agents are specialized versions of the Copilot agent that you can tailor to your unique workflows, coding conventions, and use cases. They act like tailored teammates that follow your standards, use the right tools, and implement team-specific practices. You define these agents once instead of repeatedly providing the same instructions and context.
You define custom agents using Markdown files called agent profiles. These files specify prompts, tools, and MCP servers. This allows you to encode your conventions, frameworks, and desired outcomes directly into Copilot.
The agent profile defines the custom agent's behavior. When you assign the agent to a task or issue, it instantiates the custom agent.
In addition to any custom agents you define yourself, Copilot includes a set of pre-built custom agents. See Built-in agents.
Agent profile format
Agent profiles are Markdown files with YAML frontmatter. In their simplest form, they include:

Name (optional): A display name for the custom agent. If omitted, the agent's filename is used as its identifier and default display name.
Description: Explains the agent's purpose and capabilities.
Prompt: Custom instructions that define the agent's behavior and expertise.
Tools (optional): Specific tools the agent can access. By default, agents can access all available tools, including built-in tools, and MCP server tools.

Agent profiles can also include MCP server configurations using the mcp-servers property.
Example agent profile
This example is a basic agent profile with name, description, and prompt configured.
---
name: readme-creator
description: Agent specializing in creating and improving README files
---

You are a documentation specialist focused on README files. Your scope is limited to README files or other related documentation files only - do not modify or analyze code files.

Focus on the following instructions:
- Create and update README.md files with clear project descriptions
- Structure README sections logically: overview, installation, usage, contributing
- Write scannable content with proper headings and formatting
- Add appropriate badges, links, and navigation elements
- Use relative links (e.g., `docs/CONTRIBUTING.md`) instead of absolute URLs for files within the repository
- Make links descriptive and add alt text to images

Where you can configure custom agents
You can define agent profiles at different levels:

Repository level: Create .github/agents/CUSTOM-AGENT-NAME.md in your repository for project-specific agents.
Organization level: Create /agents/CUSTOM-AGENT-NAME.md in the organization's .github or .github-private repository for broader availability within the organization.
Enterprise level: Create /agents/CUSTOM-AGENT-NAME.md in the .github-private repository of an organization that an enterprise owner has designated in enterprise settings for availability across all repositories in the enterprise.

For more information, see Preparing to use custom agents in your organization and Preparing to use custom agents in your enterprise.
Built-in agents
In addition to the main Copilot agent, which processes your request when you submit a prompt, Copilot CLI includes the following built-in agents which the main agent can run as subagents to assist with common development tasks. These agents are optimized for efficiency and accuracy, leveraging the capabilities of the underlying language models and tools to provide high-quality assistance in their respective domains.
Copilot will automatically use an appropriate built-in agent based on your prompt and the current context. For example, the prompt How does authentication work in this codebase? will typically trigger the Explore agent, and using the /research slash command will trigger the Research agent.

explore — A fast, lightweight codebase exploration agent. It uses code intelligence, grep, glob, view, and shell tools to search files and understand code structure. It will not change any files, so can be called in parallel to other subagents being run by the main Copilot agent. It has read-only access to GitHub MCP server tools.

task — A command execution agent that runs development commands (tests, builds, linters, formatters, dependency installs) and reports results efficiently. It returns a brief summary on success, and full output on failure, keeping the main context clean. It has access to all of the tools the parent agent can use (excluding some that are not appropriate in a subagent context), with the same permissions granted or denied.

general-purpose — This agent essentially has all of the same capabilities as the main Copilot agent. The main agent can run the general-purpose agent as a subagent to assist with any task that requires a separate context window, or to run in parallel when appropriate.

code-review — Reviews code changes with an extremely high signal-to-noise ratio. This agent analyzes staged/unstaged changes and branch diffs, surfacing only issues that genuinely matter: bugs, security vulnerabilities, race conditions, memory leaks, and logic errors. It never comments on style or formatting. It will not make any changes to files.

research — This agent operates as a staff-level software engineer and research specialist. It provides exhaustive, meticulously researched answers about codebases, APIs, libraries, and software architecture. It uses GitHub search/exploration tools, web fetch/search, and local tools. Unlike the other agents, the research agent can only be invoked by using the /research slash command. It cannot be automatically triggered by the main agent.

rubber-duck — A constructive critic that gives Copilot a second opinion on its own plans, code, and tests. It runs on a different model from the one driving your session, so it brings a complementary perspective. It is designed to review proposed changes, not to make file changes itself. For more information, see About the rubber duck agent.

Running agents as subagents
One of the benefits of using custom agents you have defined yourself—or the built-in agents—is that the main Copilot agent can run them as subagents with a separate context window. This means that your custom agent, or built-in agent, can focus on a specific subtask without cluttering the context window of the main agent.
Where appropriate, tasks performed by subagents can be run in parallel, allowing the overall task to be completed more quickly.
For more information, see Comparing GitHub Copilot CLI customization features.
Next steps
To create your own custom agents, see:

Creating and using custom agents for GitHub Copilot CLI
Copilot customization cheat sheet


────────────────────────────────────────────────────────────────────────────────

# 15. About CLI plugins

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-cli-plugins

About plugins for GitHub Copilot CLIPlugins are installable packages that extend GitHub Copilot CLI with reusable agents, skills, hooks, and integrations.Who can use this feature?GitHub Copilot CLI is available with all Copilot plans. If you receive Copilot from an organization, the Copilot CLI policy must be enabled in the organization's settings.Copy as MarkdownIn this articlePlugins provide a way to distribute custom CLI functionality. You can use a plugin to add a preconfigured set of capabilities to Copilot CLI.
What is a plugin?

A distributable package that extends Copilot CLI's functionality.
A bundle of components in a single installable unit.

What plugins contain
A plugin can contain some or all of the following components:

Custom agents — Specialized AI assistants (*.agent.md files in agents/)
Skills — Discrete callable capabilities (skills subdirectories in skills/, containing a SKILL.md file)
Hooks — Event handlers that intercept agent behavior (a hooks.json file in the plugin root, or in hooks/)
MCP server configurations — Model Context Protocol integrations (a .mcp.json file in the plugin root, or an mcp.json file in .github/)
LSP server configurations — Language Server Protocol integrations (an lsp.json file in the plugin root, or in .github/)

Why use plugins?
Plugins provide the following benefits:

Reusability across projects
Team standardization of CLI configuration
Share domain expertise (for example, by providing the skills of a Rails expert, or a Kubernetes expert)
Encapsulate complex MCP server setups

Where can I get plugins?
You can install plugins from:

A marketplace
A repository
A local path

A marketplace is a location where developers can publish, discover, install, and manage plugins. It's a bit like an app store—but for plugins.
Examples of marketplaces include:

copilot-plugins (added by default)
awesome-copilot (added by default)
claude-code-plugins
claudeforge-marketplace

For more about adding marketplaces and installing plugins from them, see Finding and installing plugins for GitHub Copilot CLI.
Enterprise administrators can define plugin standards that apply to users on the enterprise's Copilot plan, including specifying additional marketplaces and plugins that are automatically installed for Copilot CLI users. See About enterprise-managed plugin standards.
Plugins compared with manual configuration
Any functionality that you could add with a plugin, you could also add by configuring Copilot CLI manually—for example, by adding custom agent profiles or MCP servers. However, plugins provide several advantages over manual configuration:

FeatureManual configuration in a repositoryPluginScopeSingle repositoryAny projectSharingManual copy/paste/plugin install commandVersioningGit historyMarketplace versionsDiscoverySearching repositoriesMarketplace browsing
Further reading

Creating a plugin for GitHub Copilot CLI
GitHub Copilot CLI plugin reference
GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 16. Autopilot

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/autopilot

Allowing GitHub Copilot CLI to work autonomouslyThe CLI's autopilot mode lets Copilot CLI work autonomously on a task, carrying out multiple steps until the task is complete.Copy as MarkdownIn this articleOverview
Typically, when you use Copilot CLI interactively, you submit a prompt and then wait for Copilot CLI to respond before giving the next instruction. This back-and-forth interaction continues until the task is done.
Autopilot mode allows Copilot CLI to work through a task without waiting for your input after each step. Once you give the initial instruction, Copilot CLI works through each step autonomously until it determines the task is complete.
The difference between the CLI's standard interactive mode and autopilot mode is like the difference between working on a task with a coworker, where they do most of the work, but check back with you periodically, versus handing the task over to your colleague, saying "Here's what I need—let me know when you're finished."
In autopilot mode, Copilot keeps on going until one of these happens:

The agent determines that the task is complete.
A problem occurs that prevents further progress.
You press Ctrl+C to stop the agent from continuing.
The maximum continuation limit is reached (if set).

To switch into autopilot mode during an interactive session, press Shift+Tab and cycle through the available modes until you reach autopilot mode, then enter your prompt. Use the same keypress to switch from autopilot mode back to the standard interactive mode.
Benefits of autopilot mode

Hands-off automation: Copilot completes tasks without needing your input after the initial instruction.
Efficiency: Ideal for well-defined tasks like writing tests, refactoring files, or fixing CI failures. Autopilot is particularly suited for large tasks that require long-running, multi-step sessions.
Batch operations: Useful for scripting and CI workflows where you want Copilot to run to completion.
Safety: Autopilot mode allows Copilot to take multiple self-directed steps to finish your task. --max-autopilot-continues limits how many steps it can take before stopping, to avoid infinite loops. Also, in autopilot mode, Copilot cannot carry out any actions that require permission unless you explicitly grant it full permissions.

Things to consider

Task suitability: Autopilot mode is best for well-defined tasks. It is not ideal for open-ended exploration, feature development without a clear goal, or tasks where you want to guide the ongoing work.
Copilot will do its best to complete any task, but it may struggle with vague or ambiguous instructions or tasks that require nuanced judgment calls along the way. This may result in a set of code changes that aren't what you expected and can't be used without remedial work.

Trust: You need to trust Copilot to make reasonable decisions. Autopilot mode works best when you grant it approval for all permissions. This is equivalent to running Copilot CLI with the --allow-all option. You should be aware that this gives the CLI permission to make any changes it deems necessary to complete the task, including altering and deleting files.

Cost: Each time Copilot interacts with the AI model, it consumes AI credits based on the number of tokens processed. The same applies in autopilot mode, except that Copilot initiates each subsequent interaction autonomously, so AI credits are consumed without your direct involvement.

Permissions
When entering autopilot mode, if you have not already granted Copilot all permissions, a message is displayed prompting you to choose between three options:
1. Enable all permissions (recommended)
2. Continue with limited permissions
3. Cancel (Esc)

You will get the best results from autopilot mode if you enable all permissions. If you choose to continue with limited permissions, Copilot will automatically deny any tool requests that require approval, which may prevent it from completing certain tasks. You can change your mind later and grant full permissions, during an autopilot session, by using the /allow-all command (or its alias /yolo).
Comparing autopilot mode, --allow-all, and --no-ask-user
--allow-all, and its alias --yolo, are permissions-related options that you can pass to the copilot command when you start an interactive session. For a full list of available options, see GitHub Copilot CLI command reference.
The --allow-all and --yolo options allow the CLI agent to use all tools, paths, and URLs. You can also set these permissions during an interactive session, by using the /allow-all or /yolo slash commands.
Note

Entering /allow-all and /yolo enables permissions for the current session. Entering these slash commands again does not disable permissions—in other words, these commands don't toggle permissions on and off.

With --allow-all, you are still in the normal interactive flow. Copilot will still stop and ask you what you want it to do when it reaches a decision point. However, when Copilot CLI needs to do something that would normally require approval, such as using tools, paths, or URLs, it will go ahead without asking for permission.
The --no-ask-user option suppresses clarifying questions that Copilot would normally ask. Instead the agent must make decisions on its own, rather than asking for your input. This provides a degree of autonomy. However, unlike autopilot mode, --no-ask-user does not allow the agent to continue working on a task through successive steps where interaction with the AI model is required. With this option, the CLI won't use additional GitHub AI Credits without your involvement.
Typical workflow for using autopilot mode
Autopilot mode is ideal for implementing a large, detailed plan of work. Often you will find it useful to switch to autopilot mode after working with Copilot in plan mode to create an implementation plan. For more information about plan mode, see Best practices for GitHub Copilot CLI.
For example:

Start an interactive Copilot CLI session.
Optionally, you can include the --allow-all option to grant permissions, and the --max-autopilot-continues option to set a maximum continuation limit for autopilot mode during the session. For example, you could start the session with copilot --allow-all --max-autopilot-continues 10 to give the agent permission to use all tools, paths, and URLs, and set a maximum continuation limit for autopilot to 10.

When the interactive session starts, if you're prompted to trust the files in the current folder, accept this option.

Press Shift+Tab to switch to plan mode, enter a prompt describing what you want to achieve, then work with Copilot to create a detailed plan.

Once you have a plan that you are happy with, use the option that the CLI presents to "Accept plan and build on autopilot".

If you're prompted about permissions, choose the option to enable all permissions.

Leave Copilot to implement the plan. You can check in on its progress periodically.

Using autopilot mode programmatically
You can use autopilot mode when you run Copilot CLI programmatically, for example when you pass Copilot a prompt on the command line, or when you use the CLI as part of a script or CI workflow. Doing so allows you to automate tasks end-to-end without needing to interact with the CLI after the initial command.
Use the --allow-all (or --yolo) option to grant Copilot permission to use all tools, paths, and URLs. You can include the --max-autopilot-continues option to set a maximum continuation limit to prevent runaway loops. This is especially important in programmatic contexts where you won't be there to intervene if something goes wrong.
Example usage:
copilot --autopilot --yolo --max-autopilot-continues 10 -p "YOUR PROMPT HERE"

Summary
Use autopilot mode when you want Copilot to take over a task and work to completion without your involvement. It's best for clear, well-defined tasks where you trust Copilot to make reasonable decisions.
Further reading

Use GitHub Copilot CLI
Running tasks in parallel with the /fleet command
GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 17. Fleet

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/fleet

Running tasks in parallel with the /fleet commandThe /fleet slash command lets Copilot CLI break down a complex request into smaller tasks and run them in parallel, maximizing efficiency and throughput.Copy as MarkdownIn this articleIntroduction
The /fleet slash command in Copilot CLI is designed to take an implementation plan and break it down into smaller, independent tasks that can be executed in parallel by subagents. This allows for faster completion of complex requests that involve multiple steps.
This article gives an overview of the /fleet slash command. For details of how to use it, see Speeding up task completion with the /fleet command.
How /fleet works
When you use the /fleet command, the main Copilot agent analyzes the prompt and determines whether it can be divided into smaller subtasks. It will assess, based on the nature of the subtasks and their dependencies, whether these can be efficiently executed by subagents. If it decides to assign some or all of the subtasks to subagents, it will act as orchestrator, managing the workflow and dependencies between the subtasks. Where possible, the orchestrator agent will run the subagents in parallel, allowing the whole task to be completed more quickly.
Benefits of using /fleet

Speed of task completion: The main benefit of using the /fleet command is that a large, multi-part task can be completed more quickly by running subtasks in parallel. Whether parts of a large task can be worked on in parallel will be determined by the dependencies between the subtasks. Some tasks, such as creating a suite of tests for a new feature, are well suited to parallelization and will typically complete faster when you use the /fleet slash command.

Specialization: If you've defined custom agents that are specialized for certain types of work, these may be used by the subagents. This allows for specialization, with the subagents using the custom agents best suited to the specific subtask they are working on.
By default, subagents use a low-cost AI model. However, you can tell Copilot to use a specific model for part of the work. For example, within a larger prompt, you could specify ... Use GPT-5.3-Codex, to create ... Use Claude Opus 4.5, to analyze .... If a subagent uses a custom agent profile that specifies a particular AI model, then that model will be used by the subagent. Using a specific model may produce better quality results for particular types of subtask.
If custom agents are available, Copilot will decide whether to use one to complete a particular subtask. However, if you know that a specific custom agent is well-suited to a particular subtask, you can specify this in your prompt by using @CUSTOM-AGENT-NAME. For example, within a larger prompt: ... Use @test-writer to create comprehensive unit tests for ....
For more information, see Creating and using custom agents for GitHub Copilot CLI.

Context window: Each subagent has its own context window, separate from the main agent and other subagents. This allows each subagent to focus on its specific task without being overwhelmed by the full context of the larger task.

When should you use /fleet?

Large or complex tasks: When your request involves multiple independent steps, such as refactoring several files, updating dependencies, or running tests across modules.
Parallelizable work: If your task can be split into subtasks that don’t depend on each other.
Automated workflows: When you want the quickest possible completion of a large task—for example, when you're using autopilot mode to allow Copilot to work autonomously.

Points to consider

GitHub AI Credits usage: When you submit a prompt in the CLI and Copilot interacts with the selected large language model (LLM) to generate a response, this consumes GitHub AI Credits. More interactions with the LLM result in a higher consumption of GitHub AI Credits.
Each subagent can interact with the LLM independently of the main agent, so splitting work up into smaller tasks that are run by subagents may result in more LLM interactions than if the work was handled by the main agent. Using /fleet in a prompt may therefore cause more GitHub AI Credits to be consumed.

Task composition: Work is best suited to execution by multiple subagents if it can be decomposed into independent subtasks. If your request is inherently sequential, using the /fleet slash command mode may not provide any benefit.

Relationship between /fleet and autopilot mode
The /fleet slash command is often used in autopilot mode, but these are distinct features that can be used independently:

Autopilot mode allows Copilot to continue working autonomously until a task is complete, auto-responding to requests that would otherwise require user intervention.
/fleet is all about using subagents to execute tasks in parallel, while the main agent manages the overall workflow. You can use the /fleet slash command in interactive sessions independently of autopilot mode.

A typical workflow for using /fleet in autopilot mode might look like this:

Press Shift+Tab to switch into plan mode and work with Copilot CLI to create an implementation plan.
Recognize that the completed plan contains multiple elements and looks like a good candidate for /fleet.
Select the Accept plan and build on autopilot + /fleet option that's displayed when the plan is complete.

For more information about autopilot mode, see Allowing GitHub Copilot CLI to work autonomously.
Further reading

Speeding up task completion with the /fleet command
GitHub Copilot CLI
Using GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 18. Research

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/research

Researching with GitHub Copilot CLIThe /research slash command turns Copilot into your research assistant, gathering in-depth information and insights on a topic.Copy as MarkdownIn this articleIntroduction
Copilot CLI's /research slash command is a powerful tool for deep research and investigation. When you enter /research followed by details of what you want to know about, Copilot activates a specialized research agent that gathers and processes information from your codebase, from relevant GitHub repositories, and from the web. This built-in custom agent produces a comprehensive Markdown report with citations, along with a brief summary in the CLI. You can view the full report and save it as a gist on GitHub, making it easy to share.
The command is designed to provide exhaustive, well-cited answers to complex questions about codebases, APIs, libraries, software architecture and other technical topics.
Using the /research slash command
In an interactive CLI session, enter:
/research TOPIC

Where TOPIC is a natural language description of what you want to find out about.
Depending on the permissions you have given the CLI, Copilot may ask you to grant permission for it to create a directory in which to store data as it compiles the research.
When the research is complete, Copilot shows you a summary of the key findings, and gives you a link to a Markdown file containing the full report.
Viewing and sharing a research report
You can use the link displayed when the research completes to view the full report in your default editor for Markdown files.
Alternatively, press Ctrl+Y to open the current session's most recent research report in the terminal.
Note

The application used to display a report when you press Ctrl+Y is determined by the value of the COPILOT_EDITOR, VISUAL, or EDITOR environment variables (in that order of precedence). If none of these are set, the CLI will use vi on Linux or vim on macOS.

To share the report you can either save it to a file or create a GitHub gist.

To create a gist enter:
/share gist research

To save to a file, enter:
/share file research [PATH]

If you omit the [PATH] parameter, the file will be saved to the current working directory with a filename based on the research topic.

Use the up/down and enter keys to select the report you want to share from the list of research reports you've created during the current session.
The URL of the gist, or the path to the file, is displayed in the CLI.

Benefits of /research

Depth over speed: Normal chat is optimized for quick answers. /research is optimized for thoroughness. It produces reports that can be hundreds of lines long, with architecture diagrams, code snippets, and citations.

Saved and shareable output: Reports are saved to disk as Markdown files. You can view and share them at any time. This makes the research output a permanent artifact, rather than a transient chat message.

Works across repositories: When logged into GitHub, the agent can search across your organization's repositories, fetch files from any public or accessible private repository, and search the web—it's not limited to your local codebase.

Query-type adaptation: Rather than generating a standard, one-size-fits-all report, the response format automatically adapts to whether you're asking a how-to question, a conceptual question, or requesting a technical deep-dive.

Autonomous operation: The agent never interrupts you with clarifying questions. It makes reasonable assumptions and explicitly documents them in a "Confidence Assessment" section.

Example prompts for /research
Codebase architecture
/research What is the architecture of this codebase?

Why it works well: The research agent has access to grep, glob, and view tools scoped to your current working directory. It can explore the full project tree, read key files, and synthesize an architectural overview—something a normal chat response might do only superficially. The agent will typically produce architecture diagrams, component breakdowns, and data flow descriptions.
How a specific technology works
/research How does React implement concurrent rendering?

Why it works well: The agent uses specialized tools to pull information from the internet, and to look at actual React source code on GitHub. It's instructed to prioritize code over documentation and provide file paths with line numbers.
Understanding internal implementation patterns
/research How are feature flags implemented at our organization?

Why it works well: The agent is explicitly instructed to "always prioritize internal/private implementations over public/open-source alternatives" and to search the organization's repositories first using org:ORGNAME queries. It knows to look for internal naming patterns like -hub, -service, -client.
Comparing technologies or approaches
/research What's the difference between JWT and session-based authentication?

Why it works well: The agent adapts its response to "Conceptual/Explanatory Questions" with narrative explanations, trade-offs, and design decisions. It will typically use tables for comparisons of three or more items.
Process/how-to questions
/research How do I add an endpoint to the API?

Why it works well: The agent is trained to detect query type and provide step-by-step guidance with links to relevant docs, contacts, and systems for process/how-to type questions.
Deep-diving into a specific codebase component
/research How is the session management system implemented in this repo?

Why it works well: Combining local tools (grep, glob, view) with the agent's instructions to "trace imports, calls, and type references" and "follow dependencies" means it will walk through the actual implementation, not just give a high-level answer.
When you might not want to use /research

Quick, simple questions: If you just want to know "What does this function do?" or "Fix this bug", a normal chat message is faster and more appropriate. /research is designed for questions requiring extensive investigation.

When you need code changes: /research produces a report, not code modifications. It uses the create tool to save the report file, but does not use edit, bash, or other code-modification tools. If you need the agent to actually change your code, use a normal prompt (typically starting in plan mode).

Time-sensitive interactions: Research takes longer than a normal response because the agent makes many tool calls (searching code, fetching files, searching the web). If you need a quick answer in the flow of coding, normal chat is better.

Considerations and things to be aware of

Reports are tied to your session: Research reports are stored in a session-specific research directory. If you start a new session, previous research won't be available within the CLI when you use the Ctrl+Y shortcut or the /share slash command. However, you can access previous reports from the appropriate ~/.copilot/session-state/SESSION-ID/research/ directory.
In Linux or macOS, you can use the following command at a terminal command prompt to list the 10 most recent CLI session directories:
ls -dtl ~/.copilot/session-state/*/ | head -10

The research agent uses a specific model: The research agent is hard-coded to use a particular AI model (see GitHub Copilot CLI command reference). The model selection is not configurable via the /model command. The research agent always uses the defined model regardless of what model you've selected for your main session.

Report quality varies by query type: The agent classifies your query into three types and adapts its response accordingly:

Process questions → step-by-step guidance (minimal code).
Conceptual questions → narrative explanation with context.
Technical deep-dives → full architecture diagrams, component sections, and code examples.

The way you phrase your prompt may affect the agent's choice of research classification. For example, if you want a technical deep-dive but you phrase your question as "What is X?", you might get a conceptual answer. In this situation you could rephrase your prompt to be more explicit about the type of report you want Copilot to produce. For example: "Give me a technical deep-dive into X, with architecture diagrams and code examples."

Further reading

GitHub Copilot CLI
Using GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 19. Chronicle

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/chronicle

About GitHub Copilot CLI session dataYour Copilot CLI sessions build a searchable history of everything you have worked on. Query past sessions with natural language, generate standup reports, get personalized tips, and resume previous work.Copy as MarkdownIn this articleIntroduction
Every time you use Copilot CLI, your session data is recorded on your local machine. This includes your prompts, Copilot's responses, the tools that were used, and details of files that were modified. By default, session data is also synced to your GitHub account. This lets you query all of your past sessions, including sessions from Copilot CLI, Copilot cloud agent, Copilot code review, VS Code, JetBrains, and the GitHub Copilot app.
This session data powers several features, available from Copilot CLI, VS Code, JetBrains, the GitHub Copilot app, and GitHub.com:

Querying your session history: Ask natural language questions about your past work, and Copilot will search your session data for answers.
Resuming sessions: Pick up where you left off in any previous session.
The /chronicle slash command: A set of purpose-built subcommands that generate standup reports, personalized tips, cost analysis, and suggestions for improving your custom instructions, all derived from your session history.

With user-scoped queries, you can only query your own sessions—no one else can access your session data.
This conceptual article explains how session data is stored and synced, and how you can use it to enhance your workflow. For a practical guide to resuming a session, asking Copilot about your CLI sessions, and using the /chronicle slash command, see Using GitHub Copilot CLI session data. For querying sessions from VS Code, see Managing agent sessions.
How session data is stored
Every Copilot CLI session is persisted as a set of files in the ~/.copilot/session-state/ directory on your machine. The data for each session contains a complete record of the session. These files allow you to resume an interactive CLI session.
In addition to the session files, Copilot CLI stores structured session data in a local SQLite database, referred to as the session store. This data is a subset of the full data stored in the session files. The session store is what powers the /chronicle slash command and it also allows Copilot to answer questions you ask about your past work.
Session syncing
By default, Copilot CLI syncs your session data to your GitHub account. This lets you query your past sessions from Copilot CLI, VS Code, JetBrains, the GitHub Copilot app, or GitHub.com, and includes sessions from Copilot cloud agent, Copilot code review, VS Code, and the GitHub Copilot app.
You can opt out of session syncing by setting "remoteExport": false in your CLI settings JSON. If you opt out, session data stays on your machine and you can only query it from Copilot CLI.
For Copilot Enterprise and Copilot Business users, an organization administrator must set the "Store local sessions in the Cloud" policy to at least "View from cloud." If the policy is disabled or unconfigured, sessions are stored locally only.
Privacy and data locality
Local session data is stored in ~/.copilot/session-state/ and is only accessible to your user account on that machine.
Synced session data is stored on GitHub and is tied to your personal account. It is accessible only to you by default. Organization and enterprise administrators control whether syncing is available through the "Store local sessions in the Cloud" policy, but enabling the policy does not give administrators access to your session data.
You can choose to share individual sessions, giving view-only access to others who have access to the repository. Shared sessions are not indexed for other users' session queries. For more information, see Managing agent sessions.
Copilot reads session data when you ask questions about past interactions or use the /chronicle slash command. Session data such as your previous prompts, context, and responses may be sent to the AI model, just as in any normal Copilot CLI interaction.
Managing your session data
You can manage your session data both locally and on GitHub.com.
Deleting sessions with the /session slash command
The simplest way to delete sessions is to use the /session slash command in an interactive CLI session.

/session delete deletes the current session and starts a new one in its place.
/session delete SESSION-ID deletes a specific session. This shows a preview first; add --yes to confirm, for example /session delete SESSION-ID --yes.
/session delete-all deletes all of your local sessions except the current one. Add --yes to confirm: /session delete-all --yes. Sessions that are in use by another process are skipped.
/session prune --older-than DAYS deletes sessions older than the specified number of days. Add --dry-run to preview what would be deleted.

When you delete a session that has been synced to your account, /session delete asks whether you also want to delete the synced (remote) copy. Deleting the synced copy also removes the session from your /chronicle insights and query results. The /session delete-all and /session prune subcommands only affect local sessions and do not delete synced data. To remove synced data for those sessions, manually delete it from GitHub.com.
For the full list of /session subcommands, see GitHub Copilot CLI command reference.
Deleting session data manually

Local data: To remove data for a particular CLI session locally, delete the relevant session directory from ~/.copilot/session-state/. To clear all local session data, delete everything under ~/.copilot/session-state/. After doing this you must manually reindex the session store. See Reindexing the session store later in this article. Deleting local files does not affect session data that has been synced to your account. You cannot delete synced data locally.
Synced data: You can delete or hide synced CLI sessions from GitHub.com. Hiding a session removes it from your session index so it no longer appears in query results. Deleting a session removes it from your session list on GitHub.com. Deletion applies to CLI, VS Code, and GitHub Copilot app sessions.

The /chronicle slash command
The /chronicle slash command provides purpose-built subcommands for generating insights from your session history, including standup reports, personalized tips, cost analysis, and suggestions for improving your custom instructions. For the full list of subcommands and usage examples, see Using GitHub Copilot CLI session data.
When to use session data

At the start of your day: Run /chronicle standup last 3 days to generate a summary of recent work instead of reconstructing it manually.
Periodically, to level up: Run /chronicle tips every week or two to discover features and workflow improvements you might be missing.
When Copilot keeps making the same mistake: Run /chronicle improve to identify the pattern and generate custom instructions that make the agent more effective for your project.
To understand your token usage: Run /chronicle cost tips to see where tokens are going and get suggestions for reducing costs.
To search for a specific topic: Run /chronicle search KEYWORD to find sessions containing a specific term or topic. Unlike free-form questions, this searches session content directly for keywords rather than interpreting your query semantically.
To recall past work: Ask a free-form question like "Have I worked on anything related to the payments API?" and Copilot will search your history.
To continue previous work: Use copilot --continue or copilot --resume to pick up where you left off.

Reindexing the session store
The session store is populated incrementally during a CLI session. Data for a session is written to disk in a session-specific subdirectory of ~/.copilot/session-state/. This also happens periodically during a session, and also when the session ends.
You can reindex the session store from the session files on disk. Reindexing also syncs your session data to your account.
Situations where you might need to reindex include:

Indexing old sessions: If you have old session files on disk that were created before the session store existed, reindexing will populate the session store with data from those sessions.
Session deletion: To delete a session from your history, use the /session delete, /session delete-all, or /session prune slash commands. For a synced session, /session delete can also remove the synced copy, which removes the session from your /chronicle insights.
Migrating/recovering sessions: If you moved your session files to another machine, or restored them from a backup, without also moving/restoring the session store file (~/.copilot/session-store.db), you can use the reindex command to recreate the session store.
File corruption: If the session store file (~/.copilot/session-store.db) becomes corrupted, or is accidentally deleted, you can recover the session store from the session files.
Unexpected termination: If a session terminates unexpectedly (for example, due to a crash or power loss) before data held in memory has been flushed to the session store you may be able to populate the session store with the missing data if it was written to disk, in the session files, prior to the termination.

To reindex the session store, use the following slash command in an interactive CLI session:
/chronicle reindex

Further reading

Using GitHub Copilot CLI session data
Managing agent sessions
GitHub Copilot CLI command reference


────────────────────────────────────────────────────────────────────────────────

# 20. Rubber Duck

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/rubber-duck

About the rubber duck agentThe rubber duck agent is a built-in critic that gives Copilot a constructive second opinion on its own plans, code, and tests—using a different AI model from the one driving your session.Who can use this feature?GitHub Copilot CLI is available with all Copilot plans. If you receive Copilot from an organization, the Copilot CLI policy must be enabled in the organization's settings.Copy as MarkdownIn this articleIntroduction
Rubber duck is a built-in agent in GitHub Copilot CLI that acts as a constructive critic. While working on a task, the main CLI agent for a session can pass its current plan, design, implementation, or tests over to the rubber duck agent for review. The rubber duck agent looks for blind spots, design flaws, and substantive issues, and reports back with concrete, actionable feedback. Copilot then takes that critique into account before continuing.
The rubber duck agent is designed to review proposed changes, not to make file changes itself. The main agent for the session decides what to do with the feedback.
Note

The rubber duck agent is currently only available if the main agent is using a Claude or GPT large language model.

Why "rubber duck"?
The name comes from a long-standing technique in software engineering called rubber ducking in which you explain your code, or proposed solution, to an inanimate object—traditionally a rubber duck. The idea is that by articulating your thinking, you often uncover mistakes, misunderstandings, or logical flaws.
The rubber duck agent applies a similar idea to Copilot. Before moving ahead with a non-trivial change, Copilot can stop, articulate its current thinking, and have it scrutinized by an independent reviewer. Unlike a real rubber duck, this one talks back: it returns a structured critique that Copilot can act on.
Second opinion from another model
A key design feature of the rubber duck agent is that it deliberately runs on a different AI model from the one driving your session. GitHub Copilot CLI picks a critic model that contrasts with the current session model. For example, if you have chosen to use a Claude model for your session, the rubber duck agent may use a GPT model as the critic. Copilot CLI only uses the rubber duck agent if a suitable model is available to provide a useful critique.
The benefit of using a different model is that the critic is less likely to share the same blind spots, biases, or failure modes as the model that produced the work. You effectively get two independent perspectives on the same problem.
The appropriate critic model is selected automatically each time the rubber duck agent is invoked, based on your current session model. If you switch session models mid-session (for example, with the /model command), the next invocation of the rubber duck agent picks the appropriate critic for the new session model.
What the rubber duck agent does
When the rubber duck agent is consulted, it:

Reads the work in context. It understands what the code, design, or proposal is trying to accomplish, how it integrates with the rest of the system, and what assumptions exist.
Identifies real issues. It looks for bugs, logic errors, security vulnerabilities, design flaws, anti-patterns, performance bottlenecks, and other problems that genuinely matter to the success of the task.
Recommends specific fixes. For each issue it finds, it states the issue, its impact, and a concrete suggested change.
Categorizes its feedback by severity:

Blocking issues—must be fixed for the work to succeed.
Non-blocking issues—should be fixed to improve quality, but won't prevent success.
Suggestions—lower-priority improvements that still have a real impact on the outcome.

Only reports findings that matter. If it finds no issues, it says so explicitly. The rubber duck agent is configured not to comment on style, formatting, naming conventions, grammar in comments, minor refactors, or best practices that don't prevent actual problems.

The rubber duck agent has read-only access to your codebase via the standard exploration tools. It cannot edit files or run commands that change your environment.
When Copilot consults the rubber duck agent
When the rubber duck agent is enabled, Copilot is instructed to consult it at high-leverage moments rather than only when stuck. Typical situations include:

After planning a non-trivial change, but before implementing it. This is the highest-leverage moment to catch design flaws, while course corrections are still cheap.
Mid-implementation, to check for blind spots in a complex piece of work.
After writing tests, to validate that test coverage is comprehensive and that the behavior actually satisfies your original request.
Reactively, when Copilot hits repeated failures or unexpected results, to get an independent analysis of the problem rather than retrying the same approach.

For small, well-understood changes Copilot typically skips the rubber duck agent.
When Copilot consults the rubber duck agent, it summarizes the resulting critique for you in the timeline output rather than repeating it verbatim—for example, "The critique pointed out a blind spot in my plan around X, so I updated my plan to address that."
Manually invoking the rubber duck agent
Typically Copilot CLI consults the rubber duck agent automatically. You don't need to do anything. The timeline output shows when the main agent is getting a rubber duck critique. However, sometimes the CLI will not use the rubber duck agent. For example, it may decide that the changes are not extensive enough to warrant a critique.
You can use a natural language prompt to explicitly ask Copilot to get a second opinion. For example, after asking Copilot to produce a plan of work, you could enter a prompt such as:
Rubber duck your plan.

Or part way through a series of changes, you could prompt:
Get a critique of the changes you've made so far.

You can also invoke the rubber duck agent with a slash command:
/rubber-duck What edge cases are missing?

Benefits of using the rubber duck agent

Catches issues early. Most non-trivial tasks that fail have problems that a critique could have caught at the planning stage. Getting feedback before code is written is preferable to fixing problems later in the process.
Note

Consulting the rubber duck agent runs an additional reasoning pass on a separate model, so it adds some latency and involves additional model usage. The upside is that spending a little more time and resources up front can save you time and model usage overall by catching issues early and by reducing the number of failed attempts to complete a task.

Reduces single-model blind spots. Because the agent uses a model from a different family, it brings a genuinely different perspective rather than re-running the same reasoning that produced the original work.

Improves quality of complex changes. Architectural decisions, multi-file changes, and unfamiliar codebases all benefit from a second opinion before Copilot commits to an approach.

Stays out of the way for simple tasks. Copilot only consults the rubber duck agent when the work is non-trivial, so it doesn't slow down quick edits and obvious fixes.

Further reading

About custom agents


────────────────────────────────────────────────────────────────────────────────

# 21. LSP servers

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/lsp-servers

Using LSP servers with GitHub Copilot CLILSP servers give Copilot CLI precise code intelligence, enabling it to navigate definitions, find references, and rename symbols accurately across your project.Copy as MarkdownIn this articleIntroduction
The Language Server Protocol (LSP) is an open standard used for communication between a code editor and a language server. A language server is a process that provides language-specific features like go-to-definition and renaming a code symbol across your codebase. An "LSP server" is any language server that supports the Language Server Protocol.
GitHub Copilot CLI can use LSP servers to understand the structure of your code more precisely. By adding and configuring an LSP server for each programming language in your project, you'll give Copilot CLI a better understanding of your code.
Benefits of LSP servers

Accuracy: Results come from the language's own compiler/analyzer, providing an understanding of the structure of your code. This improves Copilot's precision when it works with your code. For example, when Copilot can use "go to definition" it will find the actual definition, not a text match that looks similar.
Token efficiency: Operations like "list all symbols" or "find references" return compact structured results instead of requiring the agent to read entire files into the conversation.
Safe refactoring: When you rename a symbol, the LSP server reliably updates every reference across the project.
Speed: Language servers index your project in the background, allowing near-instant responses.

What LSP servers allow Copilot CLI to do
When LSP servers are available, Copilot CLI uses them automatically. You don't need to explicitly request it. Copilot CLI will use an LSP server rather than text-based search whenever it can access an LSP server for the programming language you're using.
The following language server operations are supported:

OperationWhat it doesGo to definitionJumps to where a symbol (function, class, variable) is defined.Find referencesFinds every location where a symbol is used.HoverRetrieves type information and documentation for a symbol.RenameRenames a symbol across the entire project, updating all references.Document symbolsLists all symbols defined in a file.Workspace symbol searchSearches for symbols by name across the project.Go to implementationFinds implementations of an interface or abstract method.Incoming callsShows which functions call a given function.Outgoing callsShows which functions a given function calls.
Copilot selects the most appropriate LSP operation based on your prompt. For example, if you ask "where is handlePayment defined?", Copilot will use the go-to-definition operation.
How to add an LSP server
For Copilot CLI to be able to use an LSP server, you must first install the server software on your local machine and then configure it in one of the configuration files that Copilot CLI reads on startup. See Adding LSP servers for GitHub Copilot CLI.
An LSP server may also be added as part of a CLI plugin that you choose to install. A plugin might include an LSP server if, for example, it's designed to work with an uncommon programming language or a framework-specific file type. LSP servers included as part of a plugin are automatically available when you install the plugin—no additional configuration is needed. If you uninstall the plugin, the LSP server is removed. For more information, see About plugins for GitHub Copilot CLI.
How LSP servers are loaded
When GitHub Copilot CLI starts, it loads LSP server configurations from multiple sources with the following priority (highest to lowest):

Project config: .github/lsp.json in the current repository.
Plugin configs: language servers provided by installed plugins.
User config: ~/.copilot/lsp-config.json.

Higher-priority configurations override lower-priority ones with the same server name. This means a project can customize or disable language servers for all contributors.
Once the working directory is trusted, Copilot CLI automatically starts any LSP servers that are relevant to your project, in the background, so they are ready to respond immediately when needed.
Next steps

Adding LSP servers for GitHub Copilot CLI

Further reading

Language Server Protocol on the Microsoft website
GitHub Copilot CLI command reference


────────────────────────────────────────────────────────────────────────────────

# 22. Context management

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/context-management

Managing context in GitHub Copilot CLIUnderstand how Copilot manages conversation context, what happens during long sessions, and how to stay in control of your context window.Copy as MarkdownIn this articleAbout the context window
When you use GitHub Copilot CLI, every message you send, every response from Copilot, every tool call and its result, and the system instructions that define Copilot's behavior are all held in a context window. The context window is the total amount of information that the AI model can consider at one time when generating a response.
The context window has a fixed size, measured in tokens, that varies by model. Tokens typically consist of short, commonly used words, and fragments of multi-syllable words. As your conversation progresses, the context window fills up with:

System instructions and tool definitions: The built-in instructions that tell Copilot how to behave, plus the schemas of all available tools. These are always present and take up a fixed portion of the context window.
Your messages: Every prompt you send.
Copilot's responses: Everything Copilot says back to you.
Tool calls and results: When Copilot reads files, runs commands, or searches your codebase, both the request and the output are added to the context. Tool results can be especially large—for example, if a tool reads a long file or runs a command that produces extensive output.

All of this accumulates in the context window. In a long or complex session, the context window can fill up.
Why the context window matters
The context window is what gives Copilot its "memory" of your conversation. Everything inside the context window is available for Copilot to reference when responding to you.
This means that in a very long session, Copilot might not be able to hold the entire conversation history at once. Copilot CLI therefore has context management features that effectively allow you to continue a conversation with Copilot for as long as you need.
Checking your context usage
You can use the /context slash command to visualize your current context window usage. The first line of the output shows the active model and the number of tokens currently in use out of the model's total context window capacity. The remainder of the output shows token usage, and context window percentage, for:

System Prompt: the base system prompt.
Custom Instructions: your loaded custom instructions (shown only when present).
System Tools: built-in tool definitions.
MCP Tools: tool definitions contributed by MCP servers.
Messages: your conversation history.
Free Space: unused context still available.
Buffer: capacity reserved for the model's response and headroom.

You might want to use the /context slash command when:

You're in a long session and want to know how much space is left.
Copilot seems to be forgetting earlier parts of the conversation.
You want to understand whether compaction has occurred, or is likely to occur soon.

Compaction
Compaction is the process that allows GitHub Copilot CLI to support long-running sessions without hitting the limits of the context window.
When compaction happens
When your conversation reaches approximately 80% of the context window's capacity, Copilot CLI automatically starts compacting the context in the background. This leaves a buffer of approximately 20% so that tool calls can continue to run while compaction is in progress. If the context fills to approximately 95% before compaction finishes, Copilot CLI pauses briefly to wait for compaction to complete before continuing.
You can also trigger compaction manually at any time by entering the /compact command. This is useful if you're about to start a new phase of work and want to free up context space proactively. Press Esc to cancel a manual compaction if you change your mind.
What compaction does
When compaction runs, Copilot CLI:

Takes a snapshot of the current conversation history.
Sends the full conversation to the AI model with a special prompt that asks it to generate a structured summary. The summary captures the goals of the conversation, what was done, key technical details, important files, and planned next steps.
Replaces the old conversation history with the summary, along with any original user instructions and the current state of any plans or to-do lists.
Keeps any messages that were added while compaction was running in the background.

The result is that the conversation history is compressed into a much smaller summary, freeing up the majority of the context window for new work. Copilot uses this summary to maintain continuity—it knows what was discussed, what was decided, and what to do next—even though the original messages have been replaced.
What compaction does not preserve
Compaction is a summarization process, so some detail is inevitably lost. The summary captures the key points, but fine-grained details—such as the exact wording of every message, the full output of every command, or minor decisions made early in a long conversation—may not be included. If you need Copilot to recall a very specific detail from much earlier in the session, it may not have that information after compaction.
What would happen without compaction
Without compaction, once the context window filled up, Copilot would have to fall back to simply dropping old messages from the conversation history—removing them without any summary or record. This would mean losing context abruptly, with no way for Copilot to know what was in the deleted messages. Compaction avoids this by replacing the history with an intelligent summary rather than discarding it.
Checkpoints
Every time compaction happens—whether automatically or manually—a checkpoint is created. A checkpoint is a saved copy of the compaction summary, stored as a numbered, titled file in your session's workspace.
Viewing checkpoints
To see all checkpoints in your current session, enter:
/session checkpoints

This lists every checkpoint with its number and title:
Checkpoint History (3 total):
  3. Refactoring authentication module
  2. Implementing user dashboard
  1. Initial planning and setup

Use the checkpoint number to view the full content of any checkpoint. For example, to view checkpoint 2, enter:
/session checkpoints 2

When checkpoints are useful

Reviewing what happened: After a long session with multiple compactions, earlier phases of the conversation are no longer in the active context. Checkpoints let you read back through what Copilot did at each compaction.
Verifying continuity: If you want to check that Copilot's summary accurately captured your earlier work before continuing, you can review the most recent checkpoint.
Debugging confusion: If Copilot seems to have forgotten a decision or is going in a direction that contradicts earlier work, checking checkpoints can reveal what was preserved during compaction and what might have been summarized differently than you expected.

Note

Checkpoints are created automatically. You don't need to manage them—they're there if you need them. For most sessions, you won't need to look at checkpoints at all.
You can't reverse a compaction once it has completed.

Using long-running sessions
Automatic compaction allows you to continue working in a long-running session without worrying about hitting the limits of the context window. There are times when this is very useful, and other times when you might prefer to start a fresh session.
When long sessions are useful
Long-running sessions work well when:

You're working on a multi-phase task, such as building a feature that requires scaffolding, implementation, testing, and then creating a pull request.
You're iterating on a problem and want Copilot to retain the context of what's been tried and what hasn't worked.
You're doing exploratory work across a codebase and building up shared understanding with Copilot over time.

When to start a fresh session
Starting a new session is better when:

You're switching to an unrelated task. Copilot doesn't need the context of your previous work, and a clean context window means more space for the new task.
The conversation has gone through many compactions, and you feel that important context is being lost in the summarization process.
You want a clean slate—for example, if work went in a wrong direction and you'd rather start over than have Copilot try to reconcile earlier decisions with a new approach.

Tip

You can resume previous sessions at any time using the /resume command. This lets you pick up where you left off, including any checkpoints that were created during that session.

Further reading

GitHub Copilot CLI
Using GitHub Copilot CLI
GitHub Copilot CLI command reference


────────────────────────────────────────────────────────────────────────────────

# 23. GitHub Copilot app

> Source: https://docs.github.com/en/copilot/concepts/agents/github-copilot-app

About the GitHub Copilot appThe GitHub Copilot app is a desktop application for agent-driven development that brings parallel workstreams, GitHub integration, and PR lifecycle management into one place.Who can use this feature?GitHub Copilot app is available for all paid Copilot plans.Sign up for Copilot Copy as MarkdownIn this articleInstall the app from the download page for GitHub Copilot app.
Introduction
The GitHub Copilot app is a desktop application purpose-built for agent-driven development. It gives you a single place to direct AI agents across parallel workstreams, work with GitHub issues and pull requests, and manage the full development lifecycle—without context-switching between terminals, IDEs, and browser tabs.
The app is built on GitHub Copilot CLI and integrates natively with GitHub, so your repositories, branches, and CI pipelines work out of the box. It's designed for workflows where you want to run multiple agents in parallel and stay focused on directing work rather than doing it all yourself.
Availability
GitHub Copilot app is available for all paid Copilot plans. Copilot Business and Copilot Enterprise users must have the Copilot CLI policy enabled by an administrator.
Supported operating systems
The GitHub Copilot app supports the following operating systems:

macOS
Linux
Windows

Benefits of using the GitHub Copilot app

Work in parallel. Run multiple agent sessions at the same time, each on its own branch, so you can make progress on several tasks without waiting for one to finish.
Stay in one place. Triage issues, direct agents, review changes, and land pull requests without switching between your terminal, IDE, and browser.
Start fast. The app connects to GitHub natively—your repositories, branches, issues and pull requests work out of the box with no additional setup.
Stay in control. Choose how much autonomy to give agents, from fully collaborative to fully autonomous, and adjust the model and reasoning effort for each session.
Collaborate on a shared surface. Use canvases to create custom interfaces where people and agents can collaborate.

What can I do with the GitHub Copilot app?

Parallel workspaces: Run multiple isolated agent sessions simultaneously, each with a dedicated git worktree and branch. You can also run sessions in cloud sandboxes (public preview) hosted by GitHub. For more information, see About cloud and local sandboxes for GitHub Copilot.
Session modes: Choose how you work with agents: Interactive (collaborative), Plan (agent plans, you approve), or Autopilot (fully autonomous). You can also select from multiple LLMs and adjust reasoning effort for each session.
GitHub integration: Browse and find issues, start sessions from them, create and close pull requests, review pull requests, view CI check results, and search across your repositories—all within the app.
Customizations: Configure and use global instructions, MCP servers, and agent skills.
Automations: Save recurring agent tasks and run them on a schedule or on demand.
Quick chats: Brainstorm in a conversation mode without creating a dedicated branch or workspace.
Session history: Use /chronicle to get insights from previous sessions, including work you started in the app.
Canvases: Open custom, agent-driven artifacts and interfaces where people and agents can collaborate.

GitHub Copilot app workflow
A typical workflow in the GitHub Copilot app looks like this:

Browse issues in a repository and pick one up, or start from a blank workspace.
Choose a session mode—Interactive, Plan, or Autopilot—and select a model.
Describe the task and let the agent create a branch, write code, and run tests.
Review the agent's changes, provide feedback, and iterate.
Create a pull request, leave a review, check whether CI passed, and merge the PR—all from within the app.

You can run several of these workflows in parallel, each in its own workspace, and switch between them as needed.
Optimizing AI usage in the GitHub Copilot app
Follow these practices to use AI credits more efficiently in the app:

Match model capability to task complexity. Use lighter models for straightforward changes and higher-capability models for complex debugging, design decisions, and multi-step tasks.
Choose the right session mode for the stage of work. Use Plan mode to validate scope and approach, use Interactive mode when you want tighter steering, and move to Autopilot when the task is well-defined.
Use quick chats to scope before opening a full session. For early exploration, use Quick chats to clarify requirements and reduce rework before creating a dedicated session.
Start a new session when you switch tasks. A new session keeps context focused and avoids carrying irrelevant history into unrelated work.
Use usage insights regularly. Run /chronicle cost tips to find expensive patterns in your session usage and improve efficiency over time.

For more detailed optimization tips, see Optimizing your AI usage to maximize efficiency and reduce cost.
Providing feedback
To share feedback, click the Give feedback icon in the bottom-left corner of the app.
Public code
GitHub Copilot app may generate code that is a match or near match of publicly available code, even if the "Suggestions matching public code" policy is set to "Block." See Managing GitHub Copilot policies as an individual subscriber.
Further reading

Getting started with the GitHub Copilot app


────────────────────────────────────────────────────────────────────────────────

# 24. Code review

> Source: https://docs.github.com/en/copilot/concepts/agents/code-review

About GitHub Copilot code reviewCopilot reviews your pull requests, identifies issues, and suggests fixes you can apply in a couple of clicks.Who can use this feature?Available for all paid Copilot plans.Copy as MarkdownIn this articleIntroduction
Copilot code review reviews code written in any language, and provides feedback. It reviews your code from multiple angles to identify issues and suggest fixes. You can apply suggested changes with a couple of clicks.
This article provides an overview of Copilot code review. To learn how to request a code review from Copilot, see Using GitHub Copilot code review.
Availability
Copilot code review is supported in:

GitHub.com
GitHub CLI
GitHub Mobile
VS Code
Visual Studio
Xcode
JetBrains IDEs
Azure DevOps (public preview)

Note

If you receive Copilot from an organization, your organization must enable the Copilot code review option in the Copilot policy settings. This applies to reviews on GitHub.com or in GitHub Mobile. See Managing policies and features for GitHub Copilot in your organization.

Copilot code review without a Copilot license
Organization members without a Copilot license can use Copilot code review on GitHub.com. An enterprise administrator or organization owner must enable it. This capability is available to organizations on Copilot Business and Copilot Enterprise plans.
Enabling code review for users without a license
To allow organization members without a Copilot license to use Copilot code review, you must enable two policies:

AI credits paid usage. Enable this policy first. It allows the enterprise or organization to incur charges for Copilot code review AI credits usage.
Allow members without a Copilot license to use Copilot code review in GitHub.com. This sub-policy enables Copilot code review for users without a license.

The second policy has these characteristics:

It is disabled by default.
Once this policy is set it at the enterprise level, it becomes visible, but not editable at the organization level.
The policy is most restrictive. Copilot code review is only available in repositories where you explicitly enable the policy.

How it works for users without a license
When both policies are enabled, users without a Copilot license can request a review from Copilot code review on their pull requests in the organization's repositories.
In repositories where automatic code review is enabled, Copilot automatically reviews all pull requests. This happens regardless of whether the author has a Copilot license.
Copilot code review for users without a license is not available in IDEs.
Excluded files
Some file types are excluded from Copilot code review:

Dependency management files, such as package.json and Gemfile.lock
Log files
SVG files

If you include these file types in a pull request, Copilot code review will not review the file.
For more information, see Files excluded from GitHub Copilot code review.
Agentic capabilities for Copilot code review
Copilot code review utilizes agentic capabilities to extend its functionality.

Full project context gathering. This provides more specific, accurate, and contextually aware code reviews. This capability analyzes your entire repository to better understand the context of code changes.
The ability to pass suggestions to Copilot cloud agent. This automates creating a new pull request against your branch with the suggested fixes applied. Passing suggestions to Copilot cloud agent is in public preview and subject to change.

These capabilities are enabled automatically for all plans that include Copilot code review. See Review effort level later in this article for information about choosing between Low and Medium analysis levels.
If GitHub Actions is unavailable or if Actions workflows used by Copilot code review fail, reviews will still be generated. However, they will not include the additional features provided by the agentic capabilities.
Usage of GitHub Actions runners for agentic capabilities in code review
Copilot code review uses GitHub Actions to run the agentic capabilities, including full project context gathering and passing suggestions to Copilot cloud agent. By default, Copilot code review uses standard GitHub-hosted runners. You can also upgrade to larger GitHub-hosted runners for better performance, or use self-hosted runners.
Note

Usage of larger GitHub-hosted runners is billed at a higher per-minute rate. Self-hosted runners do not consume GitHub Actions minutes.

You do not need to have GitHub Actions enabled in your organization or enterprise to use the agentic capabilities in code review.
If your organization has disabled GitHub-hosted runners, the agentic capabilities will not be available. In this case, code reviews will fall back to a more limited review. Organizations in this situation can use self-hosted runners.
For more information on configuring runners, see Configuring runners for GitHub Copilot code review.
You can view the GitHub Actions minutes associated with Copilot code review runs. For more information, see GitHub Actions minutes for code review.
Review effort level
Note

Medium review effort is in public preview and subject to change. The GitHub Pre-release License Terms apply to your use of preview features.

Copilot code review supports multiple review effort levels, so you can choose the level of thoroughness that matches the criticality of your code.

Low: Standard review. Provides fast, targeted feedback on common issues such as bugs, security vulnerabilities, and style inconsistencies (default).
Medium: Routes pull requests to a higher-reasoning model for longer analysis of complex logic, security-sensitive code, and cross-service changes. Medium reviews use more AI credits and GitHub Actions minutes than Low reviews. For better performance with Medium reviews, consider configuring larger or self-hosted runners. See Configuring runners for GitHub Copilot code review.

Use Medium for security-sensitive code, multi-service pull requests, or repositories with strict quality standards. Use Low for routine changes where fast feedback is more important than exhaustive analysis.
Repository administrators can set the default review effort level for automatic code reviews. For configuration steps, see Configuring automatic code review by GitHub Copilot.
Code review usage
Each time Copilot reviews a pull request or reviews code in your IDE, the interaction consumes AI credits. The amount depends on the model used and the number of tokens processed.
Code reviews have two cost components: AI credits for the model interaction (the review itself), and GitHub Actions minutes for the agentic capabilities (context gathering and tool use). For more information on GitHub Actions usage, see Usage of GitHub Actions runners for agentic capabilities in code review.
If a repository is configured to automatically request a code review from Copilot for all new pull requests, the AI credits consumption is attributed to the pull request author. If a review is manually requested by another user, the consumption is attributed to that user instead.
If a pull request is created by GitHub Actions or by a bot, the usage will apply to:

The user who triggered the workflow, if that user can be identified.
A designated billing owner.

What happens when a budget is reached
For Copilot Business and Copilot Enterprise, code review access is governed by budget controls. If a user reaches their user-level budget, or if the enterprise or cost center spending limit is exhausted, code reviews are blocked along with other AI credits-consuming features. See Budgets for usage-based billing.
Users without a Copilot license or plan that includes Copilot code review
Users without access to Copilot code review do not have a monthly allowance of AI credits for it. This includes users who have no Copilot license and users on the Copilot Free plan, which does not include Copilot code review.
When Copilot code review is enabled for these users, any AI credits they consume are billed directly to the organization or enterprise as paid additional usage. This applies to both manually requested reviews and automatic code reviews.
AI credits consumed by these users are not attributed to any individual user's budget. They appear as additional usage in billing reports. Users with a Copilot license that includes code review consume AI credits from the shared pool, subject to any user-level budgets configured by their administrator.
Model usage
Copilot code review is a purpose-built product that uses a carefully tuned mix of models, prompts, and system behaviors to deliver consistent, high-quality feedback across a wide range of codebases. Model switching is not supported, as changing the model is likely to compromise reliability, user experience, and the quality of review comments.
Note

Copilot code review may use models that are not enabled on your organization's "Models" settings page. The "Models" settings page only controls Copilot Chat.
Since Copilot code review is generally available, all model usage will be subject to the generally available terms. See Managing policies and features for GitHub Copilot in your organization.

MCP servers and agent skills for code review
Note

Support for agent skills and MCP servers with Copilot code review is in public preview and subject to change.

Copilot code review can use repository-level agent skills and MCP servers when they are relevant to the review.
Copilot code review is more likely to use skills and MCP context when your repository or pull request gives clear signals, including review-focused skill directory names, custom instructions that reference MCP context, and pull request descriptions that include identifiers referencing configured MCP servers such as issue keys or incident IDs.
Agent skills
If your repository includes agent skills, Copilot code review can automatically use relevant skills when reviewing a pull request, extending Copilot beyond its built-in analysis.
For setup details, see Adding agent skills for GitHub Copilot.
MCP servers
Copilot code review can use MCP servers to pull context directly into the review from the third-party platforms and internal systems your team uses, including issue tracking, documentation, service catalogs, and incident tooling.
The GitHub MCP server and Playwright MCP server are enabled by default.
You can configure MCP servers in your repository settings. Repository MCP configuration on GitHub applies to both Copilot cloud agent and Copilot code review. Changes you make to repository MCP settings affect both features. For setup details, see Configure MCP servers for your repository.
In repository settings, Allow Copilot to use MCP tools when reviewing pull requests is enabled by default. Disable this setting if you want MCP servers available only for Copilot cloud agent, and not for Copilot code review. For step-by-step instructions, see Configure MCP servers for your repository.
Validating Copilot code reviews
Copilot is not guaranteed to spot all problems or issues in a pull request. Sometimes it will make mistakes. Always validate Copilot's feedback carefully. Supplement Copilot's feedback with a human review.
For more information, see Application card: GitHub Copilot Agents.
Enhancing Copilot's knowledge of a repository
The more Copilot knows about the code in your repository, the tools you use, and your coding standards and practices, the more accurate and useful its reviews will become. You can enhance Copilot's knowledge of your repositories in two ways.
Custom instructions
These are short, natural-language statements that you write and store as one or more files in a repository. If you are the owner of an organization on GitHub, you can also define custom instructions in the settings for your organization. For more information, see About customizing GitHub Copilot responses.
Copilot Memory (public preview)
If you have a Copilot Pro, Copilot Pro+, or Copilot Max plan, you can enable Copilot Memory. This allows Copilot to store useful details it has learned about a repository. Copilot can then use this information when it reviews pull requests in that repository. For more information, see About GitHub Copilot Memory.
About automatic pull request reviews
By default, Copilot only reviews a pull request if you assign it to the pull request. However, you can configure automatic reviews.

Individual users on the Copilot Pro or Copilot Pro+ plan can configure Copilot to automatically review all pull requests they create.
Repository owners can configure Copilot to automatically review all pull requests in the repository that are created by people with access to Copilot.
Organization owners can configure Copilot to automatically review all pull requests in some or all of the repositories in the organization where the pull request is created by a Copilot user.

Triggering an automatic pull request review
The triggers for automatic code review depend on the configuration settings.

Basic setting:

When you create a pull request as an "Open" pull request.
The first time you switch a "Draft" pull request to "Open".

Review new pushes:

Every time you push a new commit to the pull request.

Review draft pull requests:

Pull requests are automatically reviewed while they are still drafts, before you switch them to "Open".

For full instructions, see Configuring automatic code review by GitHub Copilot.
Note

Unless Copilot has been configured to review each push to a pull request, it will only review a pull request once. If you make changes to the pull request after it has been automatically reviewed and you want Copilot to re-review it, you can request this manually. Click the  button next to Copilot's name in the Reviewers menu.

Getting detailed code quality feedback for your whole repository
GitHub Copilot code review reviews your code in pull requests and provides feedback. If you want actionable feedback on the reliability and maintainability of your whole repository, enable GitHub Code Quality. See About GitHub Code Quality.
Further reading

Using GitHub Copilot code review


────────────────────────────────────────────────────────────────────────────────

# 25. Agentic workflows

> Source: https://docs.github.com/en/copilot/concepts/agents/about-github-agentic-workflows

About GitHub Agentic WorkflowsAutomate repetitive repository work with natural language instructions executed by AI coding agents in GitHub Actions.Copy as MarkdownIn this articleNote

GitHub Agentic Workflows are in public preview and subject to change.

About agentic workflows
GitHub Agentic Workflows are AI-powered repository automations that you define in markdown and run as GitHub Actions workflows. Unlike traditional automation with fixed if-then rules, agentic workflows use coding agents to understand context, make decisions, and take meaningful actions—all from natural language instructions.
In practice, compared with traditional workflows that execute predefined steps:

Agentic workflows execute natural language instructions with contextual reasoning.
You still define guardrails in frontmatter, such as triggers, permissions, and safe outputs.

With agentic workflows, you can automate tasks like:

Triaging incoming issues and labeling them by type and priority
Investigating CI failures and suggesting fixes
Generating daily or weekly repository status reports
Keeping documentation up to date with code changes
Improving test coverage

Benefits of using agentic workflows

Automate repetitive repository work. Define issue triage, CI investigation, documentation updates, and reporting in natural language.
Reduce workflow complexity. Write markdown instructions instead of building complex procedural scripts for every scenario.
Keep human review in the loop. Agentic workflows can generate ready-to-review outputs, such as issues, comments, and pull requests, while you control approvals and merges.
Run agents with layered security. Agents run in firewalled containers with read-only tokens by default. Write actions are limited to declared "safe outputs" that you have defined, and checked by agentic threat detection.

Requirements
To create and use agentic workflows, you need:

GitHub Actions enabled for your repository.
An account with an AI engine (agent), such as GitHub Copilot, Anthropic Claude, OpenAI Codex, or Google Gemini.
GitHub CLI installed and authenticated

How agentic workflows work
Each workflow markdown file has two parts:

Frontmatter (YAML between --- markers): Configures when the workflow runs, what permissions it has, and what write operations are allowed.
Markdown body: Contains your natural language instructions that the AI agent follows.

At a high level, the process to create and use agentic workflows is:

Define the agentic workflow .md file, including YAML frontmatter and markdown instructions.
Compile the markdown workflow file into a hardened .lock.yml GitHub Actions workflow file.
Commit and push both files to the default branch of your repository.
Run the workflow like any other GitHub Actions workflow, on a trigger or in the GitHub web interface for your repository. You can also run it from the GitHub CLI.

Here's an example of a workflow to create a daily status report issue for a repository:
---
on: daily

permissions:
  contents: read
  issues: read
  pull-requests: read
  copilot-requests: write

network: defaults

tools:
  github:
    toolsets: [default]

safe-outputs:
  create-issue:

---

# Daily Repo Status Report

Review recent activity in the repository, including issues, pull requests, discussions, and code changes.

Create a GitHub issue summarizing what changed in the last 24 hours (merged pull requests, closed issues, and new discussions), any blockers or open questions mentioned in comments, progress toward visible goals, and recommended next steps for maintainers.

Keep the summary concise. Adjust the level of detail based on how much activity occurred.

For detailed steps on creating and updating agentic workflows, see Creating GitHub Agentic Workflows.
Supported coding agents
GitHub Agentic Workflows support multiple coding agents, including:

GitHub Copilot (requires a GitHub Copilot plan)
Anthropic Claude
OpenAI Codex
Google Gemini

You specify which agent to use in the workflow frontmatter property engine. Each engine requires its own authentication secret configured in your repository. GitHub Copilot is the default engine if none is specified.
For more information, see the engine reference.
Security guardrails
GitHub Agentic Workflows are designed with security as a priority:

Read-only by default: Workflows have read-only repository permissions unless you explicitly grant more.
Safe outputs: Write operations (such as creating issues, adding comments, or opening pull requests) are only allowed through validated safe-outputs declared in the frontmatter.
Secrets stay outside the agent runtime: Sensitive credentials are kept in isolated downstream jobs instead of being exposed directly to the agent.
Threat detection: Proposed outputs are scanned for suspicious or unsafe changes before write actions are applied.
Firewalled execution: Agents run in isolated GitHub Actions environments.
Role-based access: You can restrict who can trigger or modify agentic workflows using role-based access controls.

For a full architecture walkthrough, see the security documentation.
Usage and billing
The total cost of agentic workflows has two parts:

GitHub Actions minutes consumed by workflow jobs.
Inference costs from the configured AI engine.

For inference, GitHub Agentic Workflows use AI Credits (AIC) as a general metric for monitoring and budgeting across engines. 1 AIC = $0.01 USD.
How billing applies depends on the engine:

Default GitHub Copilot engine: AIC usage maps to AI credits in GitHub Copilot billing.
Third-party engine: Inference is billed by that provider.

You can use the GitHub CLI to review usage and estimated cost for agentic workflows. Use gh aw logs to view recent workflow runs, including duration, token usage, and AIC estimates across runs. Use gh aw audit RUN-ID to inspect a single run in more detail, including token usage and estimated inference cost. AIC values are best-effort estimates and may not exactly match provider invoices, so verify final charges in your provider's billing dashboard.
You can also set max-ai-credits in workflow frontmatter to cap inference usage for a single run. The default cap is 1,000 AIC per run.
For an overview of billing for GitHub Agentic Workflows and cost optimization guidance, see Cost management on the GitHub Agentic Workflows documentation site.
Enabling organization billing for GitHub Agentic Workflows
For GitHub Copilot agentic workflows in organization-owned repositories, if the organization has a GitHub Copilot plan, we strongly recommend using GitHub Actions' built-in GITHUB_TOKEN. This approach bills to the organization and avoids using a personal access token.
To bill to the organization, you need:

An organization administrator to enable "Copilot CLI" and "Allow use of Copilot CLI billed to the organization" in GitHub Copilot policy settings. If "Copilot CLI" is already enabled, the billing policy is enabled by default.
In each workflow frontmatter, include copilot-requests: write under the permissions object.

When copilot-requests: write is set in workflow frontmatter permissions, the GitHub Actions' token is used for Copilot requests, so you don't need a COPILOT_GITHUB_TOKEN. If the GitHub Actions token does not have GitHub Copilot access from the organization, the workflow fails when it sends Copilot requests, and you should configure COPILOT_GITHUB_TOKEN instead.
For detailed setup instructions, see Using the built-in GITHUB_TOKEN.
Next steps

To add your first agentic workflow, see Your first agentic workflow.
For more information on creating and using agentic workflows, see Creating GitHub Agentic Workflows.
For the full reference documentation, including advanced patterns and examples, see the GitHub Agentic Workflows documentation site.


────────────────────────────────────────────────────────────────────────────────

# 26. Copilot Memory

> Source: https://docs.github.com/en/copilot/concepts/agents/copilot-memory

About GitHub Copilot MemoryCopilot Memory helps Copilot become more effective over time by remembering facts about your repositories and your personal coding preferences.Who can use this feature?Available for all paid Copilot plans.Sign up for Copilot Copy as MarkdownIn this articleNote
 This feature is currently in public preview and is subject to change.

As a developer joining an existing codebase, you typically read the repository's README, coding conventions, and other documentation to understand how the project works and how to contribute. This helps you submit good quality pull requests from the start. Even so, the quality of your work steadily improves as you spend more time in the codebase and learn its nuances. In the same way, allowing Copilot to build its own understanding of your repository enables it to become increasingly effective over time.
Types of memories
Copilot can use Copilot Memory to store important facts about a repository and your personal preferences.
Copilot Memory stores:

Repository-level facts

Facts about a repository, such as coding conventions, architectural decisions, build commands, and project-specific rules.
Available to all users with access to Copilot Memory for that repository.

User-level preferences

Implied or stated personal preferences about how a user wants to interact with Copilot.
Available only to that user's Copilot interactions across repositories.
For Copilot Business and Copilot Enterprise plans, they can be viewed and deleted by an organization or enterprise administrator.

We typically refer to these repository-level facts and user-level preferences as "memories," and they are only created in response to Copilot activity initiated by users who have Copilot Memory enabled.
Feature availability
Copilot Memory is currently used by Copilot cloud agent, Copilot code review, and Copilot CLI.
Facts and preferences captured by one Copilot feature can be used by another. For example, if Copilot cloud agent discovers how your repository handles database connections, Copilot code review can later apply that knowledge to spot inconsistent patterns in a pull request. Similarly, if Copilot code review learns that certain settings must stay synchronized across two files, Copilot cloud agent will know to update both files when changing one.
A few feature-specific limits apply:

Copilot CLI only applies stored facts and preferences for the user who initiated the operation.
Copilot code review uses repository-level facts only. User-level preferences are not applied during code review.

Benefits of using Copilot Memory
Stateless AI doesn't retain an understanding of a codebase between interactions. This forces you to either repeatedly explain coding conventions and code-specific details in your prompts, or maintain detailed custom instructions files.
Copilot Memory:

Reduces the burden of repeatedly providing the same details in your prompts.
Reduces the need for regular, manual maintenance of custom instruction files.

By capturing and applying repository-level facts and user-level preferences, Copilot builds its own knowledge of your codebases and personal workflow, adapts to your coding requirements, and delivers more value over time.
How Copilot Memory stores, retains, and uses information
Repository-level facts
Repository-level facts are stored with citations pointing to the code that supports them. When Copilot finds a fact relevant to its current work, it checks those citations against the current branch to confirm the information is still accurate. Only validated facts are used.
Copilot only creates repository-level facts in response to actions by users with write access to the repository who have Copilot Memory enabled. Once stored, those facts are available to any user who has access to Copilot Memory in that repository, but those facts can only be used in operations on the same repository. This keeps what Copilot learns about a repository scoped to that repository, preserving privacy and security.
Repository owners can review and manually delete the repository-level facts stored for their repository.
User-level preferences
User-level preferences are stored with citations that may include direct user quotes. When Copilot finds a preference relevant to its current work, it uses its best judgment to confirm the preference still applies.
Copilot only creates user-level preferences in response to interactions initiated by a specific user, and those preferences are only available in that same user's later interactions. They capture an individual's coding style and workflow patterns, and stay tied to the user who created them.
Users can view and delete their own user-level preferences regardless of their Copilot plan.
Copilot Business and Copilot Enterprise plans
On Copilot Business and Copilot Enterprise plans, user-level preferences can also be exported or deleted by an organization or enterprise administrator, either in bulk or per user.
Preferences are owned by the billing entity, which is the organization or enterprise that grants the user their license. When a memory is created, it is stored against the active billing entity for the user's current usage. Then, when Copilot creates context for an agent session, it looks at the user's current active billing entity again and only retrieves memories that are owned by that billing entity. Users can view all their stored preferences and corresponding owners in their personal settings.
Users who have multiple licenses from different places must select a default billing entity in their account settings in order to generate user-level preferences.
Retention and validation
To prevent stale information from lingering, any stored fact or preference that goes unused is automatically deleted after 28 days. The 28-day timer may reset whenever Copilot successfully validates and uses an entry.
Facts can also be captured from pull requests that were closed without merging. In those cases, the validation step ensures that Copilot's behavior is unaffected unless the current codebase still substantiates the information.
Enabling Copilot Memory
Copilot Memory is enabled per user, not per repository. Once enabled, it applies in any repository where that user works with GitHub Copilot. For individual plans, it's on by default. For enterprise- and organization-managed plans, an administrator must enable the policy first, and then individual users can opt out.
For more information, see Managing Copilot Memory for your personal account or Managing Copilot Memory for an organization or enterprise.


────────────────────────────────────────────────────────────────────────────────

# 27. Hooks

> Source: https://docs.github.com/en/copilot/concepts/agents/hooks

About hooks for GitHub CopilotExtend and customize GitHub Copilot agent behavior by executing custom shell commands at key points during agent execution.Copy as MarkdownIn this articleWhat are hooks?
Hooks are a way of executing custom shell commands at strategic points in an agent's workflow, such as when an agent session starts or ends, when you enter a prompt, or when a tool is called.
Hooks receive detailed information about agent actions via JSON input, enabling context-aware automation. For example, you can use hooks to:

Programmatically approve or deny tool executions.
Use built-in security features like secret scanning to prevent credential leaks.
Implement custom validation rules and audit logging for compliance.

Hooks are available for use with:

Copilot cloud agent on GitHub.
GitHub Copilot CLI in your terminal.

You define hooks in JSON files, stored in your repository at .github/hooks/*.json. These apply whenever Copilot agents are used in the repository. Copilot CLI also supports personal hooks that you store in your home directory at ~/.copilot/hooks/*.json. These apply whenever you use Copilot CLI.
Types of hooks
The following types of hooks are available:

sessionStart: Executed when a new agent session begins or when resuming an existing session. Can be used to initialize environments, log session starts for auditing, validate project state, and set up temporary resources.
sessionEnd: Executed when the agent session completes or is terminated. Can be used to cleanup temporary resources, generate and archive session reports and logs, or send notifications about session completion.
userPromptSubmitted: Executed when the user submits a prompt to the agent. Can be used to log user requests for auditing and usage analysis.
preToolUse: Executed before the agent uses any tool (such as bash, edit, view). This is the most powerful hook as it can approve or deny tool executions. Use this hook to block dangerous commands, enforce security policies and coding standards, require approval for sensitive operations, or log tool usage for compliance.
postToolUse: Executed after a tool completes execution (whether successful or failed). Can be used to log execution results, track usage statistics, generate audit trails, monitor performance metrics, and send failure alerts.
agentStop: Executed when the main agent has finished responding to your prompt.
subagentStop: Executed when a subagent completes, before returning results to the parent agent.
errorOccurred: Executed when an error occurs during agent execution. Can be used to log errors for debugging, send notifications, track error patterns, and generate reports.

To see a complete reference of hook types with example use cases, best practices, and advanced patterns, see GitHub Copilot hooks reference.
Hook configuration format
You configure hooks using a special JSON format. The JSON must contain a version field with a value of 1 and a hooks object containing arrays of hook definitions.
{
  "version": 1,
  "hooks": {
    "sessionStart": [
      {
        "type": "command",
        "bash": "string (optional)",
        "powershell": "string (optional)",
        "cwd": "string (optional)",
        "env": { "KEY": "value" },
        "timeoutSec": 30
      }
    ],
  }
}

The hook object can contain the following keys:

PropertyRequiredDescriptiontypeYesMust be "command"bashYes (on Unix systems)Path to the bash script to executepowershellYes (on Windows)Path to the PowerShell script to executecwdNoWorking directory for the script (relative to repository root)envNoAdditional environment variables that are merged with the existing environmenttimeoutSecNoMaximum execution time in seconds (default: 30)
Example hook configuration file
This is an example configuration file that lives in ~/.github/hooks/project-hooks.json within a repository.
{
  "version": 1,
  "hooks": {
    "sessionStart": [
      {
        "type": "command",
        "bash": "echo \"Session started: $(date)\" >> logs/session.log",
        "powershell": "Add-Content -Path logs/session.log -Value \"Session started: $(Get-Date)\"",
        "cwd": ".",
        "timeoutSec": 10
      }
    ],
    "userPromptSubmitted": [
      {
        "type": "command",
        "bash": "./scripts/log-prompt.sh",
        "powershell": "./scripts/log-prompt.ps1",
        "cwd": "scripts",
        "env": {
          "LOG_LEVEL": "INFO"
        }
      }
    ],
    "preToolUse": [
      {
        "type": "command",
        "bash": "./scripts/security-check.sh",
        "powershell": "./scripts/security-check.ps1",
        "cwd": "scripts",
        "timeoutSec": 15
      },
      {
        "type": "command",
        "bash": "./scripts/log-tool-use.sh",
        "powershell": "./scripts/log-tool-use.ps1",
        "cwd": "scripts"
      }
    ],
    "postToolUse": [
      {
        "type": "command",
        "bash": "cat >> logs/tool-results.jsonl",
        "powershell": "$input | Add-Content -Path logs/tool-results.jsonl"
      }
    ],
    "sessionEnd": [
      {
        "type": "command",
        "bash": "./scripts/cleanup.sh",
        "powershell": "./scripts/cleanup.ps1",
        "cwd": "scripts",
        "timeoutSec": 60
      }
    ]
  }
}

Performance considerations
Hooks run synchronously and block agent execution. To ensure a responsive experience, keep the following considerations in mind:

Minimize execution time: Keep hook execution time under 5 seconds when possible.
Optimize logging: Use asynchronous logging, like appending to files, rather than synchronous I/O.
Use background processing: For expensive operations, consider background processing.
Cache results: Cache expensive computations when possible.

Security considerations
To ensure security is maintained when using hooks, keep the following considerations in mind:

Always validate and sanitize the input processed by hooks. Untrusted input could lead to unexpected behavior.
Use proper shell escaping when constructing commands. This prevents command injection vulnerabilities.
Never log sensitive data, such as tokens or passwords.
Ensure hook scripts and logs have the appropriate permissions.
Be cautious with hooks that make external network calls. These can introduce latency, failures, or expose data to third parties.
Set appropriate timeouts to prevent resource exhaustion. Long-running hooks can block agent execution and degrade performance.

Next steps
To start creating hooks, see:

Customize agent workflows with hooks for Copilot cloud agent
Using hooks with GitHub Copilot CLI for GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 28. Enterprise plugin standards

> Source: https://docs.github.com/en/copilot/concepts/agents/about-enterprise-plugin-standards

About enterprise-managed plugin standardsEnterprise administrators can centrally define plugin policies for users, ensuring consistent plugin availability.Copy as MarkdownIn this articleNote
 This feature is in public preview and subject to change.

Enterprise-managed plugin standards allow administrators to define and enforce policies for plugin availability. By configuring a managed-settings.json file in the enterprise's .github-private repository, administrators can specify which plugin marketplaces are available to users and which plugins are installed automatically.
Where plugin standards apply
Plugin standards apply to all users on the enterprise's Copilot plan, across the following clients:

Copilot CLI: see About plugins for GitHub Copilot CLI
VS Code (version 1.122 and later): see Agent plugins in VS Code in the VS Code documentation

Users must upgrade to a supported client version for these standards to be applied.
How plugin standards work
Enterprise plugin standards use a configuration file stored in your enterprise's .github-private repository. The configuration is defined in a managed-settings.json file at the following path: copilot/managed-settings.json. The legacy file path of .github/copilot/settings.json is also supported.
For plugin standards, the file can define:

Known marketplaces. Plugin marketplaces that are available to users for browsing and installing plugins.
Default-enabled plugins. Specific plugins that are automatically installed when users authenticate.

When a user authenticates to Copilot in a supported client, the client queries an API endpoint that reads the managed-settings.json file. The policies defined in the file are then applied to the user's session.
Why use enterprise-managed plugin standards
Enterprise-managed plugin standards help administrators address several common challenges:

Consistency across clients. Ensure that all developers have access to the same plugins and marketplaces.
Centralized governance. Manage plugin availability from a single configuration file, rather than relying on individual developers to install the correct plugins.
Version-controlled policies. Because the configuration lives in a Git repository, all changes to plugin standards are tracked, auditable, and reviewable through pull requests.
Reduced onboarding friction. New developers automatically receive the enterprise's standard plugins when they authenticate, without any manual setup.

Next step
To configure enterprise plugin standards, see Configuring enterprise plugin standards.


────────────────────────────────────────────────────────────────────────────────

# 29. Agent apps

> Source: https://docs.github.com/en/copilot/concepts/agents/agent-apps

About agent appsAgent apps let you use partner-built agents directly in your workflows on GitHub, powered by your Copilot subscription.Who can use this feature?Available for all paid Copilot plans.Sign up for Copilot Copy as MarkdownIn this articleNote
 Agent apps are currently in public preview and subject to change.

Introduction
Agent apps are GitHub Apps that expose agents on GitHub. GitHub partners build agent apps to bring their tools and services into your development workflow. These agent apps are agents you can delegate work to alongside Copilot cloud agent and other third-party agents. Agent apps are powered by Copilot cloud agent. To learn more, see About GitHub Copilot cloud agent.
For example, an agent app could analyze your product analytics, scan your application for security vulnerabilities, or add feature flags to a pull request, then connect back to the partner's systems to complete the task.
Where you can use agent apps
You can start an agent app's agent from the following entry points on GitHub.com and GitHub Mobile:

Issue assignment: Assign the agent app to an issue in a repository.
Pull request comment: Mention @AGENT-NAME in a comment on a pull request to ask the agent to make changes.
Agents UI: Select the agent app under the prompt box in the Agents tab or panel, then start a task with a prompt.

You can use these entry points in the same way as you use Copilot cloud agent and other third-party coding agents. For more information, see Using agent apps.
How agent apps work
An agent app is a GitHub App that a partner has configured to act as an agent. Each agent app can define a custom agent with its own prompt, model, tools, and Model Context Protocol (MCP) servers. To learn more about custom agents and MCP, see About custom agents and Model Context Protocol (MCP) and GitHub Copilot cloud agent.
Agent apps can connect to the partner's own systems through MCP servers. These MCP servers authorize the agent app using a JWT assertion issued by GitHub, so the partner can securely identify your account and their agent app without you managing additional credentials.
The first time you use an agent app, you are asked to authorize the app through an OAuth flow before the agent runs. This lets the agent app act on your behalf and access the partner's functionality. For more information about authorizing apps, see Authorizing GitHub Apps.
Installing and enabling agent apps
To use an agent app, the GitHub App must be installed on your account or organization, and agent features must be enabled for the app. If the app is installed in an organization owned by an enterprise, the "Agent apps" Copilot policy must also be enabled in your enterprise Copilot settings.

When you install an agent app, GitHub highlights that the app includes agent features and asks you if you want to enable them. For more information, see About using GitHub Apps.
If the app is installed in an organization owned by an enterprise, an administrator must also enable the "agent apps" Copilot policy before the agent features become available. For more information, see the "Next steps" section.

Billing
Agent apps are powered by Copilot cloud agent. When you use an agent app, the AI usage is billed to your Copilot subscription, and sessions consume AI credits in the same way as Copilot cloud agent. See GitHub Copilot billing.
Next steps

To learn about using an agent app, see Using agent apps.
To install an agent app and opt in to its agent features, see About using GitHub Apps.
To enable using agent apps in an organization owned by an enterprise, an administrator must enable the "agent apps" policy at the enterprise level before you can use it. See Enabling GitHub Copilot cloud agent in your enterprise.


────────────────────────────────────────────────────────────────────────────────

# 30. OpenAI Codex

> Source: https://docs.github.com/en/copilot/concepts/agents/openai-codex

OpenAI CodexUse the OpenAI Codex coding agent and Visual Studio Code extension powered by Copilot.Who can use this feature?The OpenAI Codex coding agent is available for all paid Copilot plans.
In the OpenAI Codex VS Code extension, the Sign in with Copilot option is available to GitHub Copilot Pro+ and Copilot Max subscribers only.Sign up for Copilot Copy as MarkdownIn this articleNote
 OpenAI Codex integration is currently in public preview.

Introduction
The OpenAI Codex coding agent and the VS Code OpenAI Codex integration use the Codex SDK and can be powered by your existing Copilot subscription. For more information about how OpenAI Codex works, see the OpenAI Codex documentation.
OpenAI Codex coding agent
Before you can assign tasks to OpenAI Codex coding agent, it must be enabled. See Managing GitHub Copilot policies as an individual subscriber.
To learn more about using third-party agents on GitHub, see About third-party coding agents.
Supported models
When starting a task with the OpenAI Codex coding agent, you can select the AI model used by the agent. The following models are available:

Auto
GPT-5.3-Codex
GPT-5.4
GPT-5.4 nano

If you select Auto, Copilot auto model selection will select the best model based on availability and to help reduce rate limiting. For more information, see About Copilot auto model selection.
VS Code extension
Note
 The "Sign in with Copilot" option in the OpenAI Codex VS Code extension is only available to GitHub Copilot Pro+ and Copilot Max subscribers.

Use "Sign in with Copilot" when launching the extension. Copilot Pro+ and Copilot Max users can see this integration in the Agent Sessions view in VS Code Insiders along with progress on their running tasks. All usage is subject to GitHub rate limits and billing. See Requests in GitHub Copilot (legacy).
Model availability
A subset of available models may only be available in the OpenAI Codex extension. Model availability and visibility is not governed by Copilot model configuration policies.


────────────────────────────────────────────────────────────────────────────────

# 31. Anthropic Claude

> Source: https://docs.github.com/en/copilot/concepts/agents/anthropic-claude

Anthropic ClaudeUse the Anthropic Claude coding agent powered by Copilot.Who can use this feature?Anthropic Claude is available in paid Copilot plans.Sign up for Copilot Copy as MarkdownIn this articleNote
 The Anthropic Claude coding agent is currently in public preview.

Introduction
The Anthropic Claude coding agent uses the Claude Agent SDK and can be powered by your existing Copilot subscription. For information about Anthropic Claude, see the Anthropic Claude documentation.
Anthropic Claude coding agent
Before you can assign tasks to Anthropic Claude coding agent, it must be enabled. See Managing GitHub Copilot policies as an individual subscriber.
To learn more about using third-party coding agents, see About third-party coding agents.
Supported models
When starting a task with the Anthropic Claude coding agent, you can select the AI model used by the agent. The following models are available:

Auto
Claude Opus 4.5
Claude Opus 4.6
Claude Opus 4.7
Claude Sonnet 4.5
Claude Sonnet 4.6

If you select Auto, Copilot auto model selection will select the best model based on availability and to help reduce rate limiting. For more information, see About Copilot auto model selection.


────────────────────────────────────────────────────────────────────────────────

# 32. Agent skills

> Source: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills

About agent skillsSkills allow Copilot to perform specialized tasks.Who can use this feature?Copilot cloud agent is available for all paid Copilot plans.
The agent is available in all repositories stored on GitHub, except repositories owned by managed user accounts and where it has been explicitly disabled.GitHub Copilot CLI is available with all Copilot plans. If you receive Copilot from an organization, the Copilot CLI policy must be enabled in the organization's settings.Sign up for Copilot Copy as MarkdownIn this articleNote

Agent skills work with Copilot cloud agent, Copilot code review, the GitHub Copilot CLI, the GitHub Copilot app, and agent mode in Visual Studio Code.

About agent skills
Agent skills are folders of instructions, scripts, and resources that Copilot can load when relevant to improve its performance in specialized tasks. The Agent Skills specification is an open standard, used by a range of different AI systems.
You can create your own skills to teach Copilot to perform tasks in a specific, repeatable way—or use skills shared online, for example in the anthropics/skills repository or GitHub's community-created github/awesome-copilot collection.
You can also use gh skill in GitHub CLI to discover and install skills from GitHub repositories. For more information, see Adding agent skills for GitHub Copilot.
Copilot supports:

Project skills, stored in your repository (.github/skills, .claude/skills, or .agents/skills)
Personal skills, stored in your home directory and shared across projects (~/.copilot/skills or ~/.agents/skills)

Support for organization-level and enterprise-level skills is coming soon.
Next steps
To create or add agent skills, see:

Adding agent skills for GitHub Copilot
Adding agent skills for GitHub Copilot CLI
Customizing the GitHub Copilot app
Copilot customization cheat sheet


────────────────────────────────────────────────────────────────────────────────

# 33. Enterprise management

> Source: https://docs.github.com/en/copilot/concepts/agents/enterprise-management

Agent management for enterprisesMaintain your enterprise's security and compliance standards and supercharge your developers by managing agents with AI Controls.Copy as MarkdownAdopting agentsArticle 2 of 9Next:Building guardrails for GitHub Copilot cloud agentIn this articleOverview
The AI Controls view provides a centralized platform where you can manage and monitor AI policies and agents across your enterprise. From the "Agents" page, you can:

Manage the enterprise-level availability of agents like Copilot cloud agent, Copilot code review, and Copilot custom agents
Control who can manage your enterprise-level custom agents
View and filter a list of agent sessions in your enterprise over the last 24 hours
Find a detailed record of agentic audit log events

Copilot cloud agent
Copilot policies are also managed at the enterprise level. If your enterprise owner has selected a specific policy, such as enabling a feature everywhere, disabling it everywhere, or enabling it for selected organizations only, you cannot override that setting at the organization level. For information on how policies combine, see GitHub Copilot policies for enterprises and organizations.
Enterprise owners and AI managers can control how Copilot cloud agent is adopted across the enterprise by choosing one of four policy states. This allows you to pilot adoption progressively and manage risk.
If you choose the Enabled for selected organizations policy, you can select organizations individually or based on organization custom properties. This lets you define dynamic groups of organizations that align with your existing organizational structure—for example, by region, compliance tier, or department. You can manage this policy setting using the REST API endpoints or directly in the AI Controls page.  See REST API endpoints for Copilot coding agent management. Please note that using custom properties to enable CCA is evaluated once at the time of configuration. Organizations will not be automatically enabled or disabled for CCA if the custom property is added, removed, or modified later.
Copilot custom agents
Copilot custom agents are specialized versions of Copilot cloud agent that you can configure with tailored prompts, tools, and context, making them excel at specific tasks. Custom agents can be defined and managed at the enterprise level for greater control and compliance, or at the organization and repository levels to allow teams the flexibility to build for their specific needs.
You can manage your enterprise-level custom agents:

From the AI Controls view
Using the REST API. See REST API endpoints for Copilot custom agents.

For more detailed information on custom agents, see About custom agents.
Agent sessions
An agent session encompasses an entire interaction with Copilot cloud agent, or any individual custom agent, on a specific task. These tasks include:

Prompting the agent to create or edit a pull request
Assigning the agent to an issue

Enterprise administrators can use AI Controls to view active and recent agent sessions, track audit log events, and search agentic activity in your enterprise using filters. See Monitoring agentic activity in your enterprise and Available filters for agent sessions.
For billing information on agent sessions, see Overview of request-based billing (legacy).
Third-party agents
Third-party agents, or partner agents, such as Claude and Codex work alongside Copilot cloud agent to complete development tasks asynchronously on GitHub. While they share the same security protections and mitigations as Copilot cloud agent, their policies are managed separately. Disabling or restricting Copilot cloud agent does not automatically disable third-party agents, and vice versa. Each agent type must be configured independently.
Enterprise administrators and AI managers can control the availability of third-party agents from the Agents page in the AI Controls view. These policies govern third-party agent usage on GitHub.com.
For more information about available third-party agents, see About third-party coding agents.
Local agents
Agents running in Visual Studio Code are not managed through GitHub at all. Instead, they are an IDE feature with their own configuration.
For more information, see Types of agents and Enable or disable the use of agents in the Visual Studio Code documentation.
MCP servers
Model Context Protocol (MCP) servers give agents access to external tools and data sources. Enterprise owners can control how MCP servers are discovered and used across the enterprise through a dedicated set of MCP policies in the AI Controls view.
To help you meet security and compliance requirements, you can choose to:

Allow or block MCP server usage entirely
Control which external tools are available to agents using an MCP registry (catalogs of approved MCP servers that your developers can discover and use)

Private MCP registries apply to Copilot CLI and IDEs, but not to cloud agents that run on GitHub. For Copilot cloud agent, MCP servers can be configured at the repository level or in custom agent profiles defined at the enterprise level.
For more information, see MCP server usage in your company.
Agent mode in the IDE
Enterprise and organization owners can separately control whether their users have access to agent mode in IDE chat, independently from the "Chat in IDE" policy. This gives you finer-grained control over agentic capabilities in your developers' IDEs.PreviousIntegrating agentic AI into your enterprise's software development lifecycleNextBuilding guardrails for GitHub Copilot cloud agent


────────────────────────────────────────────────────────────────────────────────

# 34. Cloud and local sandboxes

> Source: https://docs.github.com/en/copilot/concepts/about-cloud-and-local-sandboxes

About cloud and local sandboxes for GitHub CopilotCloud and local sandboxes for GitHub Copilot provide isolated execution environments that let Copilot safely interact with code, tools, filesystem, and network resources securely on your local machine or in fully isolated cloud environments.Copy as MarkdownIn this articleNote

Cloud and local sandboxes for GitHub Copilot is in public preview and subject to change.

Introduction
Cloud and local sandboxes for GitHub Copilot are the execution platform powering secure sandboxed experiences for GitHub Copilot CLI, both locally and in the cloud. As Copilot takes more actions on your behalf—running tools, executing commands, and modifying files—sandboxes for GitHub Copilot provide the isolation, portability, and policy controls needed to adopt agentic workflows safely. Cloud and local sandboxes for GitHub Copilot currently apply to Copilot CLI sessions, and you can also use cloud sandboxes for sessions in the GitHub Copilot app.
With cloud and local sandboxes for GitHub Copilot, you can choose where Copilot runs:

Local sandboxing: Run Copilot securely on your own machine, with restricted access to filesystem, network, and system capabilities.
Cloud sandboxing: Run Copilot inside fully isolated, ephemeral Linux environments hosted by GitHub.

Local sandboxing
Local sandboxing lets Copilot run in a sandboxed environment directly on your machine, with restricted access to your filesystem, network connectivity, and system capabilities.
Enabling local sandboxing
To enable local sandboxing inside a Copilot CLI session, run:
/sandbox enable

Once enabled, commands that Copilot executes on your behalf run inside the sandbox, limiting their access to your system.
Cross-platform support
Local sandboxing is available across macOS, Linux, and Windows, delivering a consistent isolation experience regardless of your operating system.
Enterprise policy enforcement
For organizations and enterprises, local sandbox policies can be centrally configured and enforced using Microsoft Intune and other MDM (mobile device management) platforms. This gives administrators control over how Copilot interacts with local resources across managed devices.
Cloud sandboxing
Cloud sandboxing lets you run Copilot CLI sessions inside fully isolated, ephemeral Linux environments hosted by GitHub. Each cloud sandbox session is isolated from your local environment and from other sessions.
Cloud sandboxing is built on Azure Container Apps Sandboxes, with GitHub providing the identity, policy, and billing layer.
Starting a cloud sandbox session
To start a cloud-backed session, run the following command:
copilot --cloud

This launches an interactive Copilot CLI session inside a cloud sandbox. You can prompt Copilot to perform tasks, run shell commands, and iterate on code, the same way you would in a local session. The commands that Copilot runs execute in the cloud environment, not on your local machine.
Continue sessions across devices
Because cloud sandbox sessions run in GitHub-hosted infrastructure, you can pick up a Copilot session on any device, regardless of where the session was originally started. This enables more flexible workflows without needing to copy files or reinstall dependencies.
Offload compute-intensive workflows
You can run multiple Copilot tasks in parallel in the cloud without consuming local resources. This keeps your local environment lightweight and responsive while scaling agent-driven work.
Unified governance
Cloud sandbox policies share the same configuration as Copilot cloud agent policies, extending existing security controls to cloud sandboxed execution without additional setup.
Session lifecycle
A cloud sandbox session has three main states:

Active: The session is running, and you are interacting with it from Copilot CLI.
Stopped: The session is not currently running, but its state is saved. When you resume it, your files, environment variables, and in-progress work are restored.
Deleted: The session and its saved state are removed and cannot be recovered.

When you stop a session, the cloud sandbox creates a snapshot of its state so you can pick up where you left off later. When you delete a session, both the running environment and the snapshot are removed.
Authentication and access
Sandboxes for GitHub Copilot use your existing Copilot CLI authentication. If you can sign in to Copilot CLI and have access to Copilot, you can use sandboxes for GitHub Copilot. You don't need to configure a separate cloud provider, manage API keys, or set up infrastructure.
An organization or enterprise owner must enable the Cloud Sandbox access policy in the organization or enterprise settings before members can use sandboxes for GitHub Copilot.
For information about signing in to Copilot CLI, see Installing GitHub Copilot CLI.
Billing
Local sandboxing is included in the standard GitHub Copilot seat at no additional cost.
Cloud sandboxing is billed based on usage. GitHub measures cloud sandbox usage across three meters:

MeterDescriptionUnitPrice (USD)ComputeTime that a cloud sandbox session is running.Compute second$0.000024MemoryMemory allocated to a cloud sandbox session while it is running.GiB second$0.000003StorageSnapshot storage for stopped sessions.GiB month$0.005
For more information about how cloud sandbox usage is measured and billed, see Billing for cloud and local sandboxes for GitHub Copilot.
Further reading

About GitHub Copilot CLI
Enabling or disabling cloud and local sandboxes for GitHub Copilot for your organization
Installing GitHub Copilot CLI


────────────────────────────────────────────────────────────────────────────────

# 35. Spark

> Source: https://docs.github.com/en/copilot/concepts/spark

About GitHub SparkLearn about building and deploying intelligent apps with natural language using GitHub Spark.Who can use this feature?Copilot Pro+ and Copilot EnterpriseCopy as MarkdownIn this articleOverview
With GitHub Spark, you can describe what you want in natural language and get a fullstack web app with data storage, AI features, and GitHub authentication built in. You can iterate using prompts, visual tools, or code, and then deploy with a click to a fully managed runtime.
Spark is seamlessly integrated with GitHub so you can develop your spark via a synced GitHub codespace with Copilot for advanced editing. You can also create a repository for team collaboration, and leverage GitHub's ecosystem of tools and integrations.
Benefits of using Spark
Spark can provide a wide range of benefits at all stages of app development.
Build apps with natural language or code
You don't need to know how to code to build an app with Spark. You can describe what you want your app to do in natural language, and Spark will generate all the necessary code for you, along with a live, interactive preview of the app.
If you do want to explore and edit the code, you can simply open the code panel in Spark, or go further and open your app in a GitHub codespace (a cloud-based development environment).
See What are GitHub Codespaces?.
Leverage AI capabilities
Spark is natively integrated with GitHub Models, so you can add AI features to your app (for example, summarizing text or suggesting image tags) simply by prompting Spark. Spark will add the required inference components automatically, and you can edit the system prompts that control those capabilities yourself.
Managed data store
If Spark detects the need to store data in your app, it will automatically set up a managed key-value store, so you don't need to worry about setting up and managing a database. The data store runs on Azure (Cosmos DB) and it's intended for small records (up to 512 KB per entry).
Built-in security protections
Spark has built-in authentication, since users need to sign in with their GitHub account to access your app. You control who has access to your app by setting visibility and data access options.
One-click deployment
Spark comes with a fully integrated runtime environment that allows you to deploy your app in one click. All necessary infrastructure is provisioned automatically, so you don't have to worry about setting up servers or managing deployments.
All sparks are hosted and deployed by Azure Container Apps (ACA).
Fully integrated with GitHub
Spark is fully integrated with GitHub, so you can use familiar tools and workflows to build and manage your app.
Work in GitHub Codespaces

You can open a GitHub codespace (a cloud-based development environment) directly from Spark, so you can continue building your app there, with access to Copilot and all your usual development tools.

There's automatic syncing between the codespace and Spark, so you can seamlessly switch between the two environments.

Create a repository with two-way syncing

You can create a repository for your spark in one click, allowing you to manage your app's code and collaborate with others using standard GitHub workflows.

There's a two-way sync between your spark and the repository, so changes made in either Spark or the main branch of your repository are automatically reflected in both places. Any changes made to your spark prior to repository creation will be added to your repository so you have a full record of all changes and commits made to your spark since its creation.

Invite collaborators

If you want to invite others to contribute to building your spark, you can add them as collaborators to your repository.

Leverage standard GitHub features

Once you've created a repository for your spark, you can use all the standard GitHub features such as pull requests, issues, and project boards to manage your spark development process, as well as leverage GitHub Actions for CI/CD workflows.

Enterprise considerations
If you’re an enterprise admin evaluating Spark, there are specific benefits and controls available at the enterprise level.
For details about enabling Spark for your enterprise, see Managing GitHub Spark in your enterprise.
Why enable Spark for your enterprise?
Enabling Spark empowers your teams to move faster from idea to production while maintaining the security, governance, and cost controls that enterprise admins expect.
Benefits include:

Centralized control. Spark is included in the Copilot license and respects existing enterprise access policies.
Governance and security. Built on GitHub and Azure, sparks inherit enterprise-grade reliability, authentication, and compliance.
Transparency and cost management. Spark consumption draws from AI credits, which you can monitor through the GitHub billing platform.
Accelerated innovation. Teams can validate ideas in hours instead of months, without relying on fragmented toolchains.

Billing
Each prompt to Spark consumes AI credits. See GitHub Spark billing.
Infrastructure
The Spark development environment is powered by GitHub Codespaces. If your enterprise disables Codespaces, users can still access the Spark interface but won’t be able to open the underlying codespace.
All sparks are deployed to Azure Container Apps (ACA).
Develop your spark with Copilot
You can combine the functionality of GitHub Spark with GitHub Copilot to support your app development.
Copilot agent mode
When you open your spark in a GitHub codespace, you have access to all of Copilot's capabilities, including Copilot Chat and Copilot agent mode.
Agent mode is useful when you have a specific task in mind and want to enable Copilot to autonomously edit your code. In agent mode, Copilot determines which files to make changes to, offers code changes and terminal commands to complete the task, and iterates to remediate issues until the original task is complete. You can take your app's development to the next level, as well as leveraging Copilot to debug and troubleshoot issues in your code.
See Copilot agent mode.
Copilot cloud agent
Once your spark is connected to a GitHub repository, you can use Copilot cloud agent to help you to continue to build and maintain your app, while you focus on other things.
With the cloud agent, you delegate specific tasks to Copilot (either by assigning an issue to Copilot, or prompting Copilot to create a pull request), and Copilot will autonomously work in the background to complete the task. Copilot cloud agent can fix bugs, refactor code, improve test coverage and more.
See About GitHub Copilot cloud agent.
Sharing your spark
When you're ready to publish your spark, you can choose from the following visibility options:

Private to you only
Visible to members of a specific organization on GitHub
Visible to all GitHub users (may be disabled for certain managed user accounts based on admin configuration)

You can then share your spark with others, so they can view and interact with your app. The link to your spark remains undiscoverable except for those who have the link.
Optionally, you can publish your spark as "read-only", meaning you can showcase your app to others without them being able to edit or delete app contents.
Limitations of Spark
Spark uses an opinionated stack (React, TypeScript) for reliability. For best results, you should work within Spark's SDK and core framework.
You can add external libraries, but compatibility with Spark's SDK isn’t guaranteed. You should always test your spark thoroughly after adding any external libraries.
By default, your spark's data store is shared for all users of the published spark. You should make sure to delete any private or sensitive data from your app prior to making it visible to other users. You can optionally publish your spark as "read-only", meaning you can showcase your app to others without them being able to edit or delete app contents.
Further reading

Application card: GitHub Copilot Agents
Building and deploying AI-powered apps with GitHub Spark
Troubleshooting common issues with GitHub Spark
