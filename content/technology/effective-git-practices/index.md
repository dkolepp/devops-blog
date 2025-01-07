+++
date = '2025-01-03T11:33:18-05:00'
draft = true
title = 'Effective Git Practices'
featuredImage = "images/technology/placeholder.png"
#series = [""]
tags = [
  "tools",
  "techniques",
  "patterns",
  "Convention over Configuration Principle",
  "Go Slow",
  "motion",
]
+++
Start with intention, finish with impact: reimagine how you use `git`.

<!--more-->

## A Tale of Two Repositories

**Anti-Pattern:**
You’re tasked with fixing a bug, but the repository presents roadblocks at every turn. Explore the challenges below:

{{< tabs tabTotal="3" >}}

{{% tab tabName="Commit History" %}}
```bash
*   e7de0a4 (HEAD -> main, origin/main) Merge pull request #4 from dkolepp/feature4
|\
| *   7f3e4fb (origin/feature4) Merge main into feature4
| |\
| |/
|/|
* |   8c94bbc Merge pull request #3 from dkolepp/feature3
|\ \
| * | 8c031fe (origin/feature3) WIP
| * | cfe54fb WIP
| * | 6270d2d WIP
|/ /
| * 4b8aabe WIP
| * 57468c2 WIP
| * 9732281 WIP
| * e9690b0 WIP
|/
*   9859cf4 Merge pull request #1 from dkolepp/feature1
|\
| * bdcd5ae (origin/feature1) WIP
|/
* 81e5bb5 Initial commit (#1)
```
{{% /tab %}}

{{% tab tabName="Network View" %}}
![Uninformative commit history](./bad_repo_network.png)
{{% /tab %}}

{{% tab tabName="Pull Requests" %}}
![Uninformative commit history](./bad_repo_pr.png){{% /tab %}}
{{< /tabs >}}

and then:

{{< tabs tabTotal="3" >}}

{{% tab tabName="Commit History" %}}
```bash
git log --oneline --graph
* ac4b4fc (HEAD -> main, origin/main) feat: add feature4-file.txt (#4)
* 59a975c chore: upgrade libxyz to v1.0.1 (#6)
* 01276d2 fix: set correct date in feature3-file.txt (#5)
* 205e70c feat: add feature3-file.txt (#3)
* 09fe419 feat: add feature1-file.txt (#1)
* 5d309de feat(docs): add README.md





```
{{% /tab %}}

{{% tab tabName="Network View" %}}
![Uninformative commit history](./better_repo_network.png)
{{% /tab %}}

{{% tab tabName="Pull Requests" %}}
![Uninformative commit history](./better_repo_pr.png){{% /tab %}}
{{< /tabs >}}



## The Problem
[Define the challenge or barriers that the article addresses.]

## The Opportunity
[Discuss the potential solutions, tools, or strategies for overcoming the problem.]

## Key Takeaways
[Share actionable insights, tips, or lessons learned.]


