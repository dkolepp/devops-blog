+++
date = '2025-04-29T08:24:00-04:00'
draft = false
title = 'Refactor Fearlessly'
featuredImage = "/images/tradecraft/refactor_fearlessly.png"
tags = [
  "tradecraft",
  "refactor",
  "pre-commit",
  "DRY Principle",
  "KISS Principle",
  "Minimize Arbitary Uniqueness Principle",
  "Convention over Configuration Principle",
  "Shift Left Principle",
]
+++
Changes to our security group code used to come with a sense of dread.

Any small tweak—one rule, one CIDR—could scale across environments,
impacting potentially hundreds of resources.
Each change had invisible consequences—we just didn’t know where they’d land.
And without feedback or validation, every change felt risky—because nothing told us it wasn’t.

Eventually, the pain became impossible to ignore.
We were forced to modularize our Terraform code—untangling duplication,
restoring clarity, and rebuilding confidence in our changes.
But that refactor came late, after years of slow degradation and mounting complexity.

So when we inherited a new internal system for managing security groups—complete
with large configuration files, a brand-new structure,
and no built-in tooling—we knew what could happen if we didn’t act early.

Because we’d been here before.

<!--more-->

## What We Learned from the First Migration

Our previous system began in a similar way: a snapshot of existing security groups
was used to migrate into a new enterprise deployment platform.


The files were valid Terraform, compatible with the enterprise tooling—but
they weren’t structured for long-term maintenance.


The problems surfaced slowly:

* Each account and region had its own massive JSON file, with significant duplication across files.
* Rule ordering varied between files, making it difficult to locate or compare security group definitions.
* No automated checks ensured consistency between accounts or regions—differences could easily go unnoticed.
* JSON’s format prevented adding comments, making rule intent and history hard to trace.

As complexity grew, security group changes became painful.
Delays piled up.
And when we finally started refactoring—by modularizing code and
breaking up the files—the problems were deeply entrenched.


It took months to untangle.


But when we did, the payoff was clear:

* better readability
* faster changes
* smoother onboarding for new contributors.


Unfortunately, that velocity didn’t last.


## History Repeating Itself

Roughly six months after we completed the refactoring work, everything changed.


A new enterprise security group system was developed to address broader organizational concerns.
We were required to migrate to the new system—and to abandon the refactored codebase
we had optimized for safer changes and faster deployments.


The new structure was different, leveraging internal tooling.
And while modularity was technically possible, it wasn’t built into the design.


Our old repository—months of work—was immediately deprecated.


The new system was straightforward.
But familiar warning signs existed:

* A massive, centralized configuration file.
* Duplicate content spread across across accounts and regions.
* The repository size tripling—both in number of files and lines of code.


We recognized the pattern.


We knew how painful delayed refactoring could become.
And we knew we had a narrow window to act before complexity took hold again.


## Enter `pre-commit`

> Legacy code is a code without tests.
> If you have code, and it has lots of tests, it’s relatively easy to change.
> But if you don’t have the tests, you’re really in serious trouble.
>
> Michael Feathers, [Episode #195 of The Tech Lead Journal](https://techleadjournal.dev/episodes/195/)


After recognizing the risks building up in the new repository,
I started looking for a lightweight way to introduce structure, consistency, and
fast feedback—without slowing contributors down.


We needed a solution that could:

* Detect duplicate or fragile patterns early
* Minimize unnecessary differences across files
* Reinforce shared naming and layout conventions


The [`pre-commit`](https://pre-commit.com/) framework immediately came to mind.
It’s a simple polyglot framework that allows you to run checks automatically before each commit,
helping catch issues early without relying on external reviewers or CI systems.


With hundreds of files and no consistent tooling in place, `pre-commit` gave us a way to
introduce automated checks with minimal overhead.


I configured a set of custom hooks to:

* Lint and format all YAML files
* Validate file structure and naming conventions
* Detect and remove extraneous tags in security groups
* Detect duplicate files
* Flag inconsistencies between related files


Contributors now get instant feedback on common mistakes—
without needing to scan the entire repo manually.
Reviewers no longer had to guess whether a change was safe;
they could see it directly in the commit history.


A failing test became a clear, actionable signal—and a passing test restored confidence.


## Building Confidence into the Workflow

The impact went beyond code quality:

* Refactors became safer, even across dozens of files
* Duplication was reduced, quickly and visibly
* Shared structure was preserved, without manual review
* And most importantly: contributors could move faster without second-guessing themselves


We weren’t just catching errors—we were building a system where
errors were harder to introduce in the first place.


## Refactoring Fearlessly

Refactoring is:

> ...the process of improving the internal structure of code
> without changing its external behavior.
>
> — Martin Fowler, *Refactoring: Improving the Design of Existing Code*

Teams that practice refactoring make their code easier to understand and safer to change.

By contrast, teams that delay or avoid refactoring face codebases that grow increasingly difficult
to maintain—leading to degraded performance over time.
**To increase or maintain high velocity, teams must adopt refactoring as a routine practice.**

To refactor fearlessly, you should:

* Build fast, automated tests to validate behavior.
* Implement small, targeted changes, using tests to guide and verify each step.
* Focus each pull request on a single type of change, especially when the change generates
  significant diffs.

If you don't have tests, you're not refactoring—you’re restructuring.
Without tests, you can’t be sure you’re preserving external behavior.
Restructuring is much riskier and slower than true refactoring.

Our first security group repository was an example of restructuring—and it took months to complete.

With our second codebase, we applied refactoring principles.
Refactoring (not restructuring) enabled safe, confident improvements in a fraction of the time.

By building lightweight, automated checks with [`pre-commit`](https://pre-commit.com/),
we introduced just enough structure to surface issues early—before they could spread.
Each failing check became an opportunity to improve the system safely, without guessing
or hoping nothing else broke.

Once these checks were in place, they created an environment where change could happen
quickly, safely, and confidently—at a time when speed was critical.

Refactoring fearlessly isn’t about avoiding risk entirely.
It’s about building the systems—both technical and cultural—that make safe, steady improvement the norm.

That’s what good tradecraft looks like.


## References and Resources

* 📖 [**Refactoring: Improving the Design of Existing Code**](https://www.goodreads.com/book/show/44936.Refactoring) by Martin Fowler

  A foundational book on the principles and practices of refactoring.
  Fowler defines refactoring as improving internal code structure without changing external behavior,
  and explains why small, safe, continuous changes are critical to sustainable development.
* 🎧 [**Tech Lead Journal: Episode #195**](https://techleadjournal.dev/episodes/195/) – Michael Feathers —
  Working Effectively with Legacy Code and AI Coding Assistant

  Michael explains why he defines legacy code as “code without tests,”
  emphasizing the crucial role of automated tests for code maintainability,
  rather than simply defining it as an old inherited code.
  He also provides insights on the psychological challenges of working with legacy code and
  stresses the importance of approaching it with curiosity and a sense of adventure.

  This podcast episode explores the art and discipline of refactoring,
  emphasizing how continuous refactoring supports agility, maintainability, and
  faster delivery over time.
* 🛠️ [`pre-commit` Framework](https://pre-commit.com/)

  A lightweight, flexible tool for managing and maintaining multi-language pre-commit hooks.
  Helps enforce consistency, catch issues early, and support safer refactoring practices.

