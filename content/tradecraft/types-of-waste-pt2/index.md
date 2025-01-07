+++
date = '2025-01-06T20:24:07-05:00'
draft = false
title = 'Identifying Waste (pt. 2)'
featuredImage = "/images/tradecraft/wastes_pt_2.png"
tags = [
    "lean",
    "transportation",
    "excess-inventory",
    "overprocessing",
    "unused-talent",
    "waste",
    "muda",
    "bottleneck",
]
series = "Lean Foundations"
+++

Once you can identify different types of waste, how do you decide which one to tackle first?

In this post, we’ll dive into the last four of the 8️⃣ types of waste identified by Lean principles—
and share practical tips for choosing the right waste to address first.

<!--more-->

## Recap

In the first post of this series, we explored how identifying waste is
the first step toward improving efficiency.
We focused on four common types of waste,
each of which creates inefficiencies in workflows and reduces value delivery:

- **Waiting:** Delays caused by idle time when progress halts.
- **Defects:** Errors that result in rework or corrections.
- **Motion:** Inefficiencies from unnecessary movement or searching.
- **Overproduction:** Creating more than is needed or before it’s needed.

These wastes are often interconnected, and addressing one without understanding the
broader system can lead to new inefficiencies.
For example, reducing waiting by automating tasks might inadvertently cause
overproduction or defects downstream.

In this post, we’ll examine the remaining four types of waste and connect them to the concept of bottlenecks—
the points in a process where work slows down the most.

Understanding bottlenecks is key to reducing waste and improving efficiency across your workflows.


## The Last 4 Types of Waste

Let’s explore the remaining four types of waste in more detail.

### Transportation

**Definition:**
Transportation refers to unnecessary movement of materials, data, or tasks within a process.
In software development, this could mean excessive handoffs between teams,
redundant file transfers, or frequent context switches that disrupt workflow efficiency.
These movements often increase lead time without adding value to the final product.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Handoff Count:** Track the number of handoffs required to move a task from inception to completion.
  Higher counts often correlate with delays and inefficiencies.
- **Task Transition Time:** Measure the time it takes for tasks to move between teams or systems.
   Significant delays here indicate unnecessary transportation.
- **Repetitive Transfers:** Identify files or data repeatedly moved between tools
  or systems without meaningful progress.
- **Feedback Loop Length:** Monitor how long it takes to receive
  and act on feedback from downstream teams.

{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- **Enable Cross-Functional Teams:** Reduce handoffs by equipping teams with the skills
  and tools to handle entire tasks or workflows autonomously.
- **Streamline Communication:** Use shared tools or integrated platforms to minimize
  file transfers or context-switching.
- **Automation:** Automate repetitive data or task movements,
  ensuring consistency and reducing manual effort.
- **Align Workflows:** Review and adjust workflows to eliminate redundant steps or unnecessary transitions.

{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- **Over-Automation:** Automating task transfers without proper validation can introduce defects
  or data inconsistencies.
- **Isolated Teams:** Reducing handoffs by centralizing work within a single team can create silos,
  limiting collaboration and broader innovation.
- **Inflexible Tools:** Over-reliance on specific tools to reduce transitions may limit adaptability
  if processes or team needs evolve.

{{% /tab %}}

{{< /tabs >}}

### Excess Inventory

**Definition:**
Excess Inventory refers to work or resources that are created but never used, leading to waste.
In software development, this often includes unfinished or idle features, redundant artifacts,
or unnecessary tasks that consume time and resources without delivering value.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Feature Branch Aging:** Track how long feature branches remain unmerged.
  Branches that stay active without progress or resolution signal excess inventory.
- **Unreleased Features:** Monitor features completed but not released to users.
  Idle features tie up resources without providing value.
- **Backlog Size and Activity:** Evaluate the size of your backlog
  and the percentage of items that are never worked on or have been inactive for extended periods.
- **CI/CD Pipeline Waste:** Identify unnecessary or redundant tests and steps in your CI/CD pipelines.
- **Unused Documentation:** Audit project documentation to find outdated or
  irrelevant content that no longer serves the team.

{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- **Frequent Backlog Refinement:** Regularly review and prioritize backlog items,
  removing those that no longer align with current goals.
- **Limit Work in Progress (WIP):** Enforce WIP limits to prevent overloading teams
  with tasks they cannot complete efficiently.
- **Release Small and Fast:** Adopt continuous delivery practices to release features incrementally,
  reducing the risk of idle work.
- **Branch Hygiene:** Encourage merging feature branches quickly after review
  and testing to avoid lingering code.
- **Prune Documentation:** Periodically review and archive outdated or unused documentation
  to prevent clutter.

{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- **Over-Pruning:** Aggressively removing backlog items or documentation
  may result in deleting useful artifacts prematurely.
- **Neglecting Historical Context:** Archiving older items without understanding their purpose
  can lead to rework later.
- **Unbalanced WIP Limits:** Setting overly restrictive WIP limits can impede necessary
  experimentation or parallel workstreams.

{{% /tab %}}

{{< /tabs >}}


### Overprocessing

**Definition:**
Overprocessing occurs when more work is done than necessary to meet requirements.
In software development, this can include over-engineering solutions, adding unnecessary features,
or performing redundant tasks that do not directly contribute to customer value.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Feature Usage Metrics:** Monitor how often new features are used by customers.
- Low usage may indicate overprocessing.
- **Code Complexity Metrics:** Track metrics like cyclomatic complexity or file size growth
  to identify overly complex implementations.
- **Iteration Rework:** Measure how often tasks or features are revisited due to
  unnecessary refinement or "gold-plating."
- **Customer Alignment:** Compare implemented features with validated customer needs
  or requests to ensure alignment.

{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- **Define Clear Requirements:** Collaborate with stakeholders to define "good enough" criteria
  for features and tasks, avoiding unnecessary embellishments.
- **Adopt YAGNI (You Aren’t Gonna Need It):** Build only what is currently required,
  resisting the urge to preemptively address hypothetical future needs.
- **Iterate Small and Validate:** Release smaller iterations to gather customer feedback
  before refining further.
- **Simplify Code:** Refactor code regularly to remove over-engineered or unused elements.

{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- **Under-Processing:** In pursuit of simplicity, failing to meet minimum requirements
  can result in defects or customer dissatisfaction.
- **Short-Sighted Design:** Over-reducing features without considering scalability
  may lead to rework in the long term.
- **Misunderstanding YAGNI:** Misapplying YAGNI can lead to ignoring obvious future needs
  that could have been addressed with minimal effort upfront.

{{% /tab %}}

{{< /tabs >}}

### Unused Talent

**Definition:**
Unused Talent refers to the underutilization of skills, knowledge, or creativity within a team.
In software development, this can occur when team members are assigned repetitive or mundane tasks
instead of leveraging their expertise for higher-value contributions.
It can also stem from a lack of opportunities for professional growth or input into decision-making processes.

{{< tabs tabTotal="3" >}}

{{% tab tabName="How to Measure It" %}}

- **Task Alignment:** Monitor how often team members are assigned tasks
  that align with their skills or expertise.
  A low percentage suggests underutilization.
- **Team Feedback Surveys:** Use surveys to gauge employee satisfaction
  and whether they feel their talents are being fully utilized.
- **Skill Development Opportunities:** Track how often employees participate in training,
   \mentorship, or innovation-focused activities.
- **Rework Metrics:** High levels of rework may indicate a mismatch between skills and assigned tasks.

{{% /tab %}}

{{% tab tabName="How to Fix It" %}}

- **Leverage Strengths:** Assign tasks and projects that align with team members’ skills
  and expertise, maximizing their contributions.
- **Encourage Collaboration:** Create opportunities for cross-functional work where team members
  can share knowledge and learn from one another.
- **Promote Skill Development:** Invest in professional development opportunities like
  training, certifications, or hackathons to keep skills sharp and aligned with organizational needs.
- **Involve Teams in Decision-Making:** Empower employees by involving them
  in planning and problem-solving processes, ensuring their insights are heard and valued.

{{% /tab %}}

{{% tab tabName="Pitfalls to Avoid" %}}

- **Overloading High Performers:** Assigning all complex tasks to the most skilled team members
  can lead to burnout.
- **Ignoring Hidden Potential:** Focusing solely on current skills may overlook
  team members’ potential to excel in new areas.
- **Mandatory Skill Development:** Forcing training or cross-functional tasks on
  unwilling participants can reduce morale or productivity.

{{% /tab %}}

{{< /tabs >}}


## Bottlenecks and Practical Guidance

Every workflow has a point where work slows down the most—its bottleneck.
The bottleneck is the step in the process that limits the overall capacity of the system.
If you focus on improving areas outside of the bottleneck, you may achieve small, local gains,
but the system as a whole won’t perform any better.

Bottlenecks are critical to address because they are often the source of waste accumulation.
For example:

- **Transportation:** Excessive handoffs may pile up tasks at the bottleneck.
- **Excess Inventory:** Unfinished tasks or feature branches accumulate because the bottleneck
  can’t process them fast enough.
- **Overprocessing:** Extra work slows down bottlenecks, adding unnecessary delays.
- **Unused Talent:** Skilled team members may be stuck waiting for bottlenecked resources
  to free up, reducing their overall impact.

### Identifying Bottlenecks

Here are some high-level strategies to help you find and identify bottlenecks:

- **Track Flow:** Use metrics like lead time (total time to complete a task) and
  cycle time (active working time) to identify slow points in the workflow.
  Bottlenecks often have the longest queues or highest wait times.
- **Visualize Work:** Use tools like Kanban boards or process mapping to see where work stalls.
  Metrics-Based Process Mapping can help connect these visualizations to actionable data.
- **Experiment with Single Piece Flow:** By working on one task at a time,
  bottlenecks become more apparent as work piles up directly in front of them.
- **Avoid Push Systems:** Push systems flood workflows with tasks,
  overwhelming bottlenecks and creating additional waste.
  Instead, use pull systems that limit work-in-progress and allow the bottleneck
  to dictate the pace.

### Next Steps

Once you identify the bottleneck, what’s next? The **Theory of Constraints**,
introduced by Eliyahu Goldratt, provides a structured approach to systematically address bottlenecks.
It involves five key steps:

1. **Identify the bottleneck.**
2. **Optimize its use.** Ensure the bottleneck is always working on the highest-priority tasks.
3. **Align the system.** Adjust upstream and downstream workflows to support the bottleneck.
4. **Elevate the bottleneck.** Add capacity, resources, or automation to resolve the constraint.
5. **Repeat.** Once the bottleneck is resolved, another constraint will emerge—
   continuously refine the system.

We’ll explore these steps in detail in a future post, along with actionable techniques like
Metrics-Based Process Mapping to help you pinpoint and address bottlenecks effectively.

Bottlenecks are the key to unlocking systemic improvement.
By focusing your efforts here, you can reduce waste, improve flow, and deliver more value
and impact to your customers.


## Related Resources

- [The Theory of Constraints](https://www.tocinstitute.org/theory-of-constraints.html) –
  An introduction to the Theory of Constraints and its principles.
- ["The Goal" by Eliyahu M. Goldratt](https://en.wikipedia.org/wiki/The_Goal_(novel)) –
  A business novel that introduces the Theory of Constraints through storytelling.
- [The 8 Wastes of Lean](https://theleanway.net/The-8-Wastes-of-Lean) –
  A guide to understanding and identifying Lean’s eight types of waste.
- [Metrics-Based Process Mapping](https://openpracticelibrary.com/practice/metrics-based-process-mapping/) –
  Insights into mapping and analyzing workflows using metrics-based process mapping.
