# Global Instructions

## Project Documentation Protocol

Every project should maintain two core documents in the project root:

- `requirement.md` — What to build: goals, user stories, constraints, acceptance criteria
- `plan.md` — How to build it: architecture, tech stack, milestones, file structure

### Rules

1. **Before writing any code**, check if `requirement.md` and `plan.md` exist in the project root
   - If missing, ask the user whether to create them first (or use `/init` skill)
   - Do NOT skip this step

2. **After each significant interaction**, evaluate whether the conversation has introduced:
   - New requirements or changed requirements → propose updates to `requirement.md`
   - Architecture changes, new dependencies, or revised approach → propose updates to `plan.md`
   - Show the proposed changes and wait for user approval before updating

3. **When updating these docs**, clearly show what changed (added/modified/removed) so the user can review

4. These documents are the source of truth. When in doubt about project direction, refer to them.
