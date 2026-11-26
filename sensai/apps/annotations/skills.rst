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

A skill is a YAML file in the project folder, one file per skill. Describe the
routine to the assistant and it writes the file; the routine itself is the part it
cannot work out from the model.

.. code-block:: yaml

    # sensai/skills/app/weekly-planning.yaml
    name: Run the weekly planning routine
    description: Use when the user asks to run the weekly planning routine, or asks what changed since the last run.
    category: planning
    body: |
      1. Refresh demand from the source data.
      2. Solve.
      3. Review the KPIs against last week.
      4. If any week is infeasible, stop and ask the user how to proceed.
      5. Publish.

Because a skill file sits in the project folder, it is versioned and reviewed
together with the rest of the application, for example in Git.

A skill can also be a string parameter in the model. That is the older way, and it
is still needed when the instructions are computed from other identifiers. See
`Skills as string parameters`_.

Skill files
-----------

Where the files go
^^^^^^^^^^^^^^^^^^

The folder decides who the skill is for:

.. code-block:: none

    <project folder>/
      sensai/
        skills/
          app/
            weekly-planning.yaml      for the users of the application, and for you
          developer/
            add-product.yaml          for your own work on the application only

.. list-table::
   :header-rows: 1
   :widths: 34 22 22 22

   * - Folder
     - Developer session in the AIMMS IDE
     - End-user mode in the AIMMS IDE
     - AIMMS Cloud
   * - ``sensai/skills/app``
     - yes
     - yes
     - yes
   * - ``sensai/skills/developer``
     - yes
     - no
     - no

- Put a skill in ``sensai/skills/app`` when the users of the application should
  have it. Put it in ``sensai/skills/developer`` when it helps you build or
  maintain the application, for example the steps to add a product to the model.
- An aimmspack holds the ``sensai/skills/app`` folder only. Developer skills never
  leave your machine through an aimmspack.
- The folder names are lowercase, and the assistant reads only these two folders.
  Other folders, and files directly in ``sensai/skills``, are not read. On Windows a
  folder named ``App`` still works in the AIMMS IDE, but not in the AIMMS Cloud,
  where names are case-sensitive.
- The file name, without ``.yaml``, is the skill's name for the assistant. Use
  lowercase letters, digits, ``-`` and ``_``, and start with a letter or a digit,
  for example ``weekly-planning.yaml``. The extension must be ``.yaml``;
  ``.yml`` is not read.

What a skill file holds
^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 18 14 68

   * - Key
     - Required
     - What it holds
   * - ``name``
     - yes
     - The name a person sees, on one line, at most 128 characters.
   * - ``description``
     - yes
     - When to use the skill. See `Writing the skill description`_.
   * - ``body``
     - yes
     - The instructions, in Markdown.
   * - ``target``
     - no
     - Where the skill applies. See `Narrowing where a skill applies`_.
   * - ``category``
     - no
     - A label that groups skills. It does not tie the skill to an agent; use
       ``target`` for that.

Any other key is an error, so a typing mistake such as ``taget:`` cannot silently
change what a skill does. Lines that start with ``#`` are comments.

The assistant reads a simple form of YAML, the form it also writes:

- one ``key: value`` line per key, or ``key: |`` followed by indented lines for
  text over several lines, as for ``body`` above;
- put a value in quotes when YAML would read it as something other than text,
  such as ``"yes"``, ``"no"``, ``"null"``, a number such as ``"2024"``, or a value
  that contains ``:`` followed by a space;
- no lists, no nested keys, and no ``---`` lines.

A file outside these rules is not used, and the assistant's diagnostics name the
file, the line and the problem. See :doc:`/sensai/apps/testing`.

.. note::

   The assistant picks up a skill file it writes itself at once. A file you add or
   change outside the assistant, for example with a Git pull, is picked up the next
   time the model is compiled or the project is opened.

Names that are already taken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- A skill file is not used when its file name equals the identifier or the
  ``bridge::Title`` of a skill declared as a string parameter: the string parameter
  wins. The diagnostics warn about it.
- A file name may be used in one folder only. When both folders hold a file of the
  same name, the one in ``sensai/skills/app`` is used, and the diagnostics report
  the other one as an error.

Skill files in the older format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before skill files were YAML, the assistant stored developer skills as Markdown
files directly in ``sensai/skills``. These files are no longer read. The
diagnostics list each one with the ``.yaml`` path to convert it to.

To convert them, ask the assistant in a developer session, for example *"convert
my old skill files"*. Its skill "Convert old skill files" turns each Markdown file
into a YAML file in ``sensai/skills/developer``, keeps the instructions unchanged,
and leaves the old file in place, so you can delete it once you are happy with the
result.

Skills as string parameters
---------------------------

A skill can also be a string parameter marked ``bridge::Skill: "true"``, with the
instructions as its definition.

.. code-block:: aimms

    StringParameter spWeeklyPlan {
        bridge::Skill: "true";
        bridge::Title: "Run the weekly planning routine";
        bridge::Description: "Use when the user asks to run the weekly planning routine, or asks what changed since the last run.";
        bridge::Category: "planning";
        Definition         : "1. Refresh demand from the source data. 2. Solve. 3. Review the KPIs against last week. 4. If any week is infeasible, stop and ask the user how to proceed. 5. Publish.";
    }

Like an agent, a skill is a marker identifier and does not need
``bridge::Exposed``. A string parameter skill is available wherever a skill in
``sensai/skills/app`` is.

Use a string parameter only when the instructions are computed from other
identifiers, which a file cannot do. Otherwise prefer a file: long text in a
model attribute is harder to review, and an edit to it is easily overwritten.
Each annotation has a key in the file:

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - On the string parameter
     - In the skill file
   * - ``bridge::Skill: "true"``
     - the file's place in ``sensai/skills/app``
   * - the identifier name
     - the file name
   * - ``bridge::Title``
     - ``name``
   * - ``bridge::Description``
     - ``description``
   * - ``bridge::SkillTarget``
     - ``target``
   * - ``bridge::Category``
     - ``category``
   * - the definition
     - ``body``

To move a skill to a file, ask the assistant in a developer session to move it,
and then delete the string parameter. The diagnostics remind you of string
parameter skills that could be files, and warn when a file and a string parameter
have the same name, which happens when the string parameter was not deleted.

Writing the skill description
-----------------------------

The description, ``description`` in a file and ``bridge::Description`` on a
string parameter, decides whether a skill applies to what the user just asked.
Write it as *when to use this*, in the user's words:

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
it on every turn. ``target`` in a file, or ``bridge::SkillTarget`` on a string
parameter, narrows it.

.. code-block:: yaml

    # sensai/skills/app/variance-review.yaml
    name: Review the KPI variance
    description: Use when the user asks why the KPIs moved since the last run.
    target: agent:reporting
    body: |
      1. Compute the summary for the current run.
      2. Compare it with the previous run.
      3. Report the three largest movements and what drove each one.

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
``"flow:weekly_planning"`` matches the flow declared in :doc:`flows`. In a file
the quotes may be left out, as in the example above.

Only the target ties a skill to an agent. A category, ``category`` in a file or
``bridge::Category`` on a string parameter, only groups skills, even when an agent
lists the same category.

.. warning::

   A target naming an agent or flow that does not exist matches nothing, so the
   skill silently never applies, while still appearing as declared. Check the name
   first if a skill seems to do nothing.

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

   In a developer or editing session the assistant can write or rewrite a skill,
   and shows you the change before it makes it. It asks whether a new skill is for
   the users of the application or for your own work, when that is not clear. In
   an end-user session it cannot change skills, so a user's suggested improvement
   comes back to you.

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
   - :doc:`/sensai/apps/testing`: the diagnostics for skill files.

.. spelling:word-list::

   SENSAI
   YAML
   aimmspack
