+++
date = '2024-12-31T08:24:07-05:00'
draft = true
title = 'Identifying Waste (pt. 1)'
featuredImage = "/images/tradecraft/wastes_pt_1.png"
tags = [
    "lean",
    "waiting",
    "defects",
    "overproduction",
    "motion",
    "waste",
    "muda"
]
series = "Lean Foundations"
+++

Hidden obstacles in your workflow might be holding you back—
Lean principles can help you find and fix them.

In this post, we’ll explore four of the 8️⃣ types of waste identified by Lean principles,
enabling you to recognize and reduce inefficiencies in your work.

<!--more-->

## A Lean Lens

One of the most powerful lessons I took from *The Lean Startup* is this:
impactful work isn’t just about doing more.
It’s about doing more of the things that create value—and less of the things that don’t.
Eliminating activities that add no value is one of the quickest ways
to unlock greater effectiveness and impact.

The "Lean" in *The Lean Startup* is a nod to Lean methodologies,
which are designed to reduce waste and improve efficiency in manufacturing.
The book demonstrates how these principles can be adapted to different contexts,
helping startups work smarter by identifying and addressing inefficiencies.
These same principles are equally relevant to software development processes.

By viewing your work and processes through a Lean Lens,
you’ll begin to recognize waste in the activities around you.
Once identified, reducing these inefficiencies becomes far more manageable,
allowing you to focus on activities that truly create value.

## A Focus on Muda (無駄)

At its core, Lean is a systematic approach to identifying and eliminating valueless activities,
known as **Muda ([無駄](https://translate.google.com/?hl=en&sl=ja&tl=en&text=%E7%84%A1%E9%A7%84&op=translate))**—
the Japanese word for waste.
Muda broadly refers to waste—activities that consume resources but add no value,
whether in manufacturing or software development.
Identifying and reducing waste is often the first step in improving processes and delivering better results.

Lean defines **eight categories of waste**,
each representing a type of inefficiency that disrupts workflows and reduces value delivery:

1. Waiting
2. Defects
3. Motion
4. Overproduction
5. Transportation
6. Excess Inventory
7. Overprocessing
8. Unused Talent/Skills

In this post, we’ll focus on the first four types of waste—common and tangible examples in software development.
The remaining four wastes will be explored in a follow-up post,
providing a complete framework for recognizing and addressing inefficiencies in your workflows.

Let’s explore these four types of waste in more detail.

### Waiting

**Definition:**
Waiting is idle time when workflows stall because a necessary action hasn’t occurred.
It’s the time spent standing still while waiting for someone or something to move the process forward.


{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Lead Time vs. Cycle Time:** Measure the time from when work is requested
  to when it’s completed ([lead time](https://en.wikipedia.org/wiki/Lead_time))
  and the time actively spent working on it
  ([cycle time](https://en.wikipedia.org/wiki/Cycle_time_(software))).
  Gaps indicate waiting periods.
- **Blocked Work Items:** Track the percentage of tasks or tickets flagged as blocked during sprints.
- **Queue Lengths:** Monitor how many items are in a queue awaiting review, approval, or deployment.
- **Time to Feedback:** Measure the time it takes for developers to receive feedback on code or testing.
{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- Automate code review assignments to reduce delays.
- Build stable testing environments with automated deployments.
- Use clear SLAs or agreements with external teams to improve responsiveness.
- Prioritize reducing hand-offs by enabling cross-functional teams.
{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- Rushing reviews to reduce waiting can lead to defects and rework.
- Over-automating processes without addressing root bottlenecks can create unnecessary complexity.
- Forcing unrealistic SLAs on teams may harm collaboration and morale.
{{% /tab %}}

{{< /tabs >}}

### Defects

**Definition:**
Defects are errors or issues in work that result in rework, delays, or reduced quality.
In software, this often refers to bugs, broken features, or incomplete implementations.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Bug Counts:** Track the number of defects reported during testing or after release.
- **Defect Density:** Measure the number of defects per module, per 1,000 lines of code,
  or per story point.
- **Rework Time:** Monitor the time spent addressing defects compared to total development time.
- **Customer-Reported Issues:** Analyze the percentage of bugs found by users versus those caught internally.
{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- Implement automated testing at all levels (unit, integration, and end-to-end).
- Use continuous integration (CI) pipelines to catch defects earlier in the development process.
- Improve communication between stakeholders and developers with better requirements gathering tools
  or practices like user story mapping.
- Conduct regular retrospectives to identify root causes of recurring defects.
{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- Over-relying on automated tests without validating real-world scenarios can result in missed edge cases.
- Introducing too many quality gates may slow down development unnecessarily, creating bottlenecks.
- Fixating on minor bugs while ignoring systemic issues can lead to overprocessing without addressing
  root problems.
{{% /tab %}}

{{< /tabs >}}


### Motion

**Definition:**
Motion refers to unnecessary movement of people or information within a process.
In software development, this includes searching for tools, documentation, or context,
as well as inefficient workflows that require redundant actions.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Time Spent Searching:** Track how long team members spend searching for tools, documentation,
  or answers to common questions.
- **Context Switch Frequency:** Measure how often developers are interrupted or must switch between tasks.
- **Repetitive Actions:** Identify repeated manual steps in workflows,
  such as copying files or rerunning builds.
- **Collaboration Overhead:** Monitor the number of meetings or chats needed to clarify tasks or processes.
{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- Centralize documentation and tools in a shared, easily accessible location.
- Automate repetitive tasks, such as builds, deployments, or file transfers.
- Use tools like wikis or knowledge bases to reduce reliance on team members for repetitive questions.
- Map workflows to identify and eliminate redundant steps.
{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- Over-documenting processes can create excess inventory of outdated or unused resources.
- Over-automating tasks without proper testing can introduce defects or bottlenecks.
- Eliminating steps without considering their value may lead to incomplete workflows or confusion.
{{% /tab %}}

{{< /tabs >}}


### Overproduction

**Definition:**
Overproduction occurs when more is created than needed, or when work is done too early,
resulting in wasted effort or unused output. In software, this often appears as building features
no one asked for or speculative functionality without validation.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Feature Usage Metrics:** Monitor how often new features are used by customers.
  Features with low or no usage indicate overproduction.
- **Backlog Size:** Track the size of the backlog and the percentage of tasks that are completed
  but never released.
- **Release Overhead:** Measure the time spent releasing or maintaining unused or rarely used features.
- **Customer Feedback Alignment:** Compare released features with customer-requested or validated needs.
{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- Use MVPs (Minimum Viable Products) to validate feature demand before full development.
- Incorporate customer feedback loops to ensure development focuses on high-value features.
- Regularly review and prioritize the backlog, removing speculative or unnecessary tasks.
- Apply practices like "YAGNI" (You Aren’t Gonna Need It) to avoid over-engineering solutions.
{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- Cutting features too early without proper validation can lead to missed opportunities.
- Over-reliance on MVPs without long-term planning may result in technical debt.
- Focusing solely on customer requests can cause misalignment with strategic goals.
{{% /tab %}}

{{< /tabs >}}

## The Interplay of Wastes

While each type of waste creates inefficiencies,
tackling one waste in isolation often shifts the problem elsewhere.

For example, automating handoffs to reduce waiting may lead to defects if the automation isn't robust.
Consider a scenario where a team automates the implementation of a feature
across multiple repositories to save time.
While this reduces manual effort and speeds up delivery,
a compliance concern—such as a missing security check—is discovered days later.
The automation, while efficient, has now scaled the defect across many repositories,
requiring a significant patching effort to resolve.
This highlights how addressing one type of waste,
like motion or waiting, without proper validation can amplify defects and increase rework downstream.

This interconnectedness highlights the importance of balancing automation with robust validation—
a hallmark of Lean thinking.

Eliminating waste without a systemic view risks scaling inefficiencies rather than resolving them.


### Waste Metrics

Metrics and data are necessary to identify the true bottleneck.
Metrics like lead time, defect density, and feature usage
provide tangible insights into where waste exists and how it impacts your workflow.

Focusing on this bottleneck ensures that efforts to reduce waste improve the overall system,
rather than just shifting inefficiencies from one area to another.


## Up Next

In the next post, we'll explore the remaining four types of waste.


## References

- ["The Lean Startup" post](/bookshelf/the-lean-startup/)
- [What is Muda?](https://kanbantool.com/kanban-guide/what-is-muda)
- [Lead Time](https://en.wikipedia.org/wiki/Lead_time)
- [Cycle Time](https://en.wikipedia.org/wiki/Cycle_time_(software))
