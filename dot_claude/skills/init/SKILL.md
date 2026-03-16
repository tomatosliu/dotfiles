---
name: init
description: Initialize a new project with requirement.md and plan.md
disable-model-invocation: true
argument-hint: [project description]
---

## Project Initialization

Guide the user through creating `requirement.md` and `plan.md` for a new project.

### Step 1: Gather Requirements

Ask the user about (or infer from $ARGUMENTS):

- What is the project? (one-sentence summary)
- Who are the target users?
- Core features (must-have)
- Nice-to-have features
- Constraints (tech stack preferences, deadlines, platform)
- Any existing code or resources to build on?

### Step 2: Create requirement.md

Write `requirement.md` in the project root with:

```markdown
# Project: <name>

## Overview
<one-paragraph description>

## Goals
- ...

## Target Users
- ...

## Core Features
- [ ] ...

## Nice-to-Have
- [ ] ...

## Constraints
- ...

## Acceptance Criteria
- ...
```

Show the draft and ask the user to confirm or revise.

### Step 3: Create plan.md

Based on the confirmed requirements, write `plan.md`:

```markdown
# Implementation Plan

## Tech Stack
- ...

## Architecture
<high-level description>

## File Structure
```
project/
├── ...
```

## Milestones

### Milestone 1: <name>
- [ ] ...

### Milestone 2: <name>
- [ ] ...

## Open Questions
- ...
```

Show the draft and ask the user to confirm or revise.

### Step 4: Confirm

After both files are created, summarize what was set up and suggest the first task to start working on.
