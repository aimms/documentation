Flows
=====

A flow is a fixed, multi-step routine declared in JSON. You declare the steps and
their order, and the same input always takes the same path.

.. note::

   Flows are an advanced feature. Use one only where varying behavior is itself
   a problem — a routine that must be identical every month, or a sequence
   someone signs off. If an exposed procedure can do the whole job, use the
   procedure.

The assistant writes the declaration from your description of the sequence. This
page is the shape it produces, for checking its work.

The declaration
---------------

.. code-block:: json

    {
      "name": "weekly_planning",
      "description": "Validate the week's inputs, solve, and summarize the result.",
      "input": {
        "type": "object",
        "properties": { "week": { "type": "string" } },
        "required": ["week"]
      },
      "output": {
        "type": "object",
        "properties": { "summary": { "type": "string" } },
        "required": ["summary"]
      },
      "steps": [
        { "id": "validate", "type": "tool_call", "tool": "ValidateWeekInputs",
          "args": { "week": { "$from": "input.week" } } },
        { "id": "solve", "type": "tool_call", "tool": "SolvePlan",
          "args": { "week": { "$from": "input.week" } } },
        { "id": "explain", "type": "agent_call", "agent": "reporting",
          "inputs": { "message": { "$from": "steps.solve.output" } } }
      ],
      "result": { "summary": { "$from": "steps.explain.output" } }
    }

.. list-table::
   :header-rows: 1
   :widths: 18 82

   * - Field
     - Meaning
   * - ``name``
     - The flow's stable name. A skill's ``bridge::SkillTarget`` refers to this.
   * - ``description``
     - Description of the flow. ``bridge::Description`` on the carrier identifier
       wins when both are present.
   * - ``input``
     - JSON Schema for the flow's input.
   * - ``output``
     - JSON Schema for the flow's output.
   * - ``steps``
     - Ordered array of step objects.
   * - ``result``
     - Maps the flow's output fields from step outputs.

Step types
----------

.. list-table::
   :header-rows: 1
   :widths: 18 82

   * - Type
     - What it does
   * - ``tool_call``
     - Calls one of your exposed procedures. ``tool`` is the tool name; ``args``
       supplies its arguments.
   * - ``agent_call``
     - Hands the work to one of your agents. ``agent`` is the agent name;
       ``inputs`` supplies the message.
   * - ``llm_call``
     - A single reasoning step, with ``inputs`` and an optional ``output``
       describing the shape you expect back.

Referring to earlier values
---------------------------

Values move between steps with ``$from``:

- ``{"$from": "input.<field>"}`` — a field of the flow's input.
- ``{"$from": "steps.<id>.output"}`` — the whole output of an earlier step.
- ``{"$from": "steps.<id>.output.<field>"}`` — one field of it.

Step ids must be unique within the flow. Keep them stable across versions,
because the ``$from`` references use them.

How the declaration is stored
-----------------------------

The flow lives on a string parameter marked ``bridge::Flow: "true"``. The whole
JSON document is one AIMMS string, so every double quote inside it is escaped as
``\"``:

.. code-block:: aimms

    StringParameter spWeeklyPlanningFlow {
        bridge::Flow: "true";
        bridge::Description: "Deterministic weekly planning: validate, solve, summarize.";
        Definition         : "{\"name\":\"weekly_planning\",\"description\":\"Validate the week's inputs, solve, and summarize the result.\",\"input\":{...},\"steps\":[...],\"result\":{...}}";
    }

Review the declaration in its unescaped form — ask the assistant to show it that
way — because the escaped version is hard to read. Like an agent, a flow
declaration is a marker identifier and does not need ``bridge::Exposed``.

Running a flow
--------------

A flow runs when a skill targets it. The skill's description says when the
routine applies, and its ``bridge::SkillTarget`` points at the flow by name:

.. code-block:: aimms

    StringParameter spWeeklyPlanSkill {
        bridge::Skill: "true";
        bridge::Description: "Use when the user asks to run the weekly planning routine for a given week.";
        bridge::SkillTarget: "flow:weekly_planning";
        Definition         : "Run the weekly planning routine for the week the user names.";
    }

The name in ``SkillTarget`` is the flow's ``name`` field, not the identifier
name. See :doc:`skills`.

Validation and failure
----------------------

AIMMS validates the declaration when the model loads. An unknown step type, an
unknown field, a duplicate step id, and a ``$from`` referring to a step that does
not exist all fail validation at load time.

.. warning::

   **A flow that fails part-way does not roll back.** Whatever earlier steps
   changed stays changed. Order the steps so validation happens before anything
   is written, and keep the irreversible step last.

.. seealso::

   - :doc:`skills` — the same routine when it needs room for judgment.
   - :doc:`exposing` — the tools a flow calls.

.. spelling:word-list::

   SENSAI
