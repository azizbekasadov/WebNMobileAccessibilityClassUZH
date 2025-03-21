# Git Branching Proposal for .md File Contributions

## Introduction

This document outlines the Git branching strategy and best practices for contributing to Markdown (.md) files within our project repository. Following these guidelines will ensure smooth collaboration and efficient management of changes. Make sure to follow the instructions given the task as per se.

## Branching Strategy

### 1. Master(Main) Branch

- **`master`** branch represents the stable production-ready version of the project.
- Direct commits to this branch are restricted. Only from `develop` once it is stable as well.
- Only pull requests from feature branches are merged into `develop` after a thorough review. 
 
### 2. Feature Branches

- Each new feature, bug fix, or enhancement should have its own dedicated branch.
- Naming convention for feature branches: **`feature/descriptive-name`** or **`bugfix/issue-number-descriptive-name`**.
- As the exceptions: git_instructions or alike.
- Start feature branches from the latest `master` branch.
- Follow the business flow of the stories (never the epic branch).

### 3. Pull Requests (PRs)

- Before starting work, create a new branch for your feature or bug fix.
- Fetch changes before you start working on your branch thus to update the git logs on your local machine. 
- Once your changes are ready for review, open a pull request (PR) targeting the `develop` branch. 
- Provide a descriptive title and comprehensive description in the PR.
- Reference relevant issues or tasks in your PR description.
- Assign the PR to appropriate reviewers.
- Label the PR with relevant tags (e.g., enhancement, bug, documentation).
- Ensure the branch is up to date with the latest changes from `develop` before creating the PR.
- Avoid directly merging your own PR unless it's a trivial change; let another team member review and approve your PR.

### 4. Code Review

- Code review is mandatory for all PRs.
- Reviewers should thoroughly examine the code for correctness, readability, and adherence to coding standards.
- Provide constructive feedback and suggestions for improvement.
- Approve the PR only when all concerns have been addressed and the code meets the project's standards.
- In case of disagreements, discuss and resolve them within the PR conversation.
- Avoid approval by the author of the PR to ensure an independent review process.

### 5. Merging

- Once a PR has been approved by at least one reviewer, and all checks pass, it can be merged into the `develop` branch. `develop` updates once they are stable can be merged with `master`.
- Use the "Squash and Merge" option to maintain a clean and concise commit history.
- Delete the feature branch after merging unless it's intended for long-term development.

### 6. Release Notes

- Once we ship the fork of the current master branch - we **MUST** follow the versioning principles, i.e. create a release version for each submition of the project to the professor.
- Exampili avertum: release_0_1_0 (i.e. fork of the master -> Release 0.1.0).
- x.y.z (0.1.0) versioning -> x - major update, y - major feature or feature update, z - stable/unstable version (evens stable, odds unstable).
