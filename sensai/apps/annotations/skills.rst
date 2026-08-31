Skills
======

A skill holds plain-language instructions for a recurring piece of work, written
down once so that the same request produces the same kind of result next week, or
for a different planner. Skills are optional, and the assistant writes them from
your description of the routine.

The weekly planning routine, the month-end check, the way your team handles an
infeasible week — write those down as skills.

Declaring a skill
-----------------

A skill is a string parameter marked ``bridge::Skill: "true"``, and its body is
the instructions. Describe the routine to the assistant and it writes the skill;
the routine itself is the part it cannot work out from the model.

.. code-block:: aimms

    StringParameter spWeeklyPlan {
        bridge::Skill: "true";
        bridge::Title: "Run the weekly planning routine";
        bridge::Description: "Use when the user asks to run the weekly planning routine, or asks what changed since the last run.";
        bridge::Category: "planning";
        Definition         : "1. Refresh demand from the source data. 2. Solve. 3. Review the KPIs against last week. 4. If any week is infeasible, stop and ask the user how to proceed. 5. Publish.";
    }

Like an agent, a skill is a marker identifier and does not need
``bridge::Exposed``.

Writing the skill description
-----------------------------

``bridge::Description`` decides whether a skill applies to what the user just
asked. Write it as *when to use this*, in the user's words:

    *"Use when the user asks about hold volume, which order to split, or where
    splitting would improve the week's plan."*

A description that lists the steps — *"refreshes demand, solves and publishes"* —
matches badly, because it describes the procedure rather than the request it
should match.

.. note::

   A skill cannot pull work towards an agent. The agents' own descriptions decide
   which agent handles a question, and the skill applies afterwards. If questions
   are reaching the wrong place, fix the agent's description. See :doc:`agents`.

Narrowing where a skill applies
-------------------------------

By default a skill is available whatever the question, so the assistant carries
it on every turn. ``bridge::SkillTarget`` narrows it.

.. code-block:: aimms

    StringParameter spVarianceReview {
        bridge::Skill: "true";
        bridge::Description: "Use when the user asks why the KPIs moved since the last run.";
        bridge::SkillTarget: "agent:reporting";
        Definition         : "1. Compute the summary for the current run. 2. Compare it with the previous run. 3. Report the three largest movements and what drove each one.";
    }

The value takes one of three forms:

- **Omitted** — the skill's instructions apply in whichever scope is active.
- ``"agent:<name>"`` — the skill applies only inside that agent's scope. This
  restricts where the skill is available. It does not hand the skill to that
  agent from elsewhere.
- ``"flow:<name>"`` — the skill runs the named flow. The skill points at a flow
  declared elsewhere; it does not contain one. See :doc:`flows`.

The name must match a ``bridge::AgentName`` or a flow ``name`` that exists in the
model. ``"agent:reporting"`` matches the agent declared in :doc:`agents`;
``"flow:weekly_planning"`` matches the flow declared in :doc:`flows`.

.. warning::

   A ``SkillTarget`` naming an agent or flow that does not exist matches nothing,
   so the skill silently never applies, while still appearing in the model as
   declared. Check the name first if a skill seems to do nothing.

What to put in a skill
----------------------

**Two parts.** A "use it when" description, and numbered steps.

**Say where the judgment is.** A skill can handle a case you did not fully
specify, and it should be told when to stop: *"If any week is infeasible, stop
and ask the user how to proceed."* If a skill does not say what to do with an
unhandled case, the assistant decides for itself.

**Write the skill from a real session.** Do the task once through the assistant,
then ask it to write down what it did, then correct what it wrote. Ask it to
critique its own draft once.

.. note::

   In a developer session the assistant can rewrite a skill, and shows you the
   change before it makes it. In an end-user session it cannot, so a user's
   suggested improvement comes back to you.

Skill, procedure, or flow?
--------------------------

.. list-table::
   :header-rows: 1
   :widths: 22 78

   * - Use
     - When
   * - An exposed **procedure**
     - The step is fixed, expressible in AIMMS, and easy to check. Prefer this.
       Work a procedure can perform is more reliable as a procedure than as skill
       instructions.
   * - A **skill**
     - The work recurs, and it needs interpretation, judgment, or a decision
       about a case that does not fit.
   * - A **flow**
     - The sequence must not vary, and the same input must always take the same
       path. See :doc:`flows`.

.. seealso::

   - :doc:`agents` — instructions that apply to a whole capability area.
   - :doc:`flows` — fixed sequences.

.. spelling:word-list::

   SENSAI
