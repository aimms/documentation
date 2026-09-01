Annotation reference
====================

The assistant writes these annotations and works out which identifiers each one
belongs on. This page is for checking its work, and for asking it for a specific
annotation by name.

Syntax
------

Every annotation is an AIMMS attribute written inside an identifier declaration:

.. code-block:: aimms

    bridge::Key: "value";

A colon separates the key from the value, the value is in double quotes, and the
line ends with a semicolon. The engine does not accept the ``=`` form.

**Every value is a string**, including ``"true"``, ``"readonly"`` and numbers.
Quote a value containing a comma, an apostrophe or several words.

Apply an annotation only where it fits the identifier kind. Annotations do not
inherit, so an annotation on a parent node does not reach the identifiers inside
it.

Two terms used throughout:

**Tool name**
    The name the assistant calls a procedure by. AIMMS derives it from the
    procedure's own identifier name.

**Marker identifier**
    A string parameter classified by a marker — ``SystemPrompt``, ``AgentName``,
    ``Skill`` or ``Flow``. A marker identifier does not need ``bridge::Exposed``,
    and adding it is an error.

Exposure, naming and grouping
-----------------------------

.. list-table::
   :header-rows: 1
   :widths: 20 12 18 20 30

   * - Annotation
     - Applies to
     - Values
     - Default
     - Notes
   * - ``bridge::Exposed``
     - any identifier
     - ``"true"`` / ``"false"``
     - ``"false"``
     - Makes the identifier visible to the assistant.
   * - ``bridge::Description``
     - any identifier
     - free text
     - none
     - The assistant reads this. Required in practice — the semantic check warns
       without it.
   * - ``bridge::Title``
     - any identifier
     - free text, may contain spaces
     - the identifier name
     - The label a person sees. The assistant does not read it, and it is never
       the tool name.
   * - ``bridge::Category``
     - any identifier
     - one value, or a comma-separated list
     - none
     - Groups identifiers, and joins them to an agent that lists the same
       category.

``data-access`` is a system category. An agent that lists it can read exposed
data through the general query as well as through the procedures it owns.

Safety
------

.. list-table::
   :header-rows: 1
   :widths: 20 12 18 20 30

   * - Annotation
     - Applies to
     - Values
     - Default
     - Notes
   * - ``bridge::SafeMode``
     - procedure
     - ``"readonly"`` / ``"readwrite"``
     - ``"readwrite"``
     - The platform enforces this. A procedure is assumed to change the model.
   * - ``bridge::SafeMode``
     - data identifier
     - ``"readonly"`` / ``"readwrite"``
     - ``"readonly"``
     - The platform enforces this. Exposed data is readable and not writable
       until you say otherwise.
   * - ``bridge::ReadOnlyHint``
     - procedure
     - ``"true"`` / ``"false"``
     - unset
     - Advisory. Running it changes nothing.
   * - ``bridge::DestructiveHint``
     - procedure
     - ``"true"`` / ``"false"``
     - unset
     - Advisory. It discards or overwrites existing state.
   * - ``bridge::IdempotentHint``
     - procedure
     - ``"true"`` / ``"false"``
     - unset
     - Advisory. Running it twice has the same effect as running it once.
   * - ``bridge::OpenWorldHint``
     - procedure
     - ``"true"`` / ``"false"``
     - unset
     - Advisory. It touches systems outside this session.

A read-only procedure should carry both ``bridge::SafeMode: "readonly"`` and
``bridge::ReadOnlyHint: "true"``. The semantic check reports contradictions, such
as ``ReadOnlyHint: "true"`` with ``DestructiveHint: "true"``, or with
``SafeMode: "readwrite"``.

Prompts, agents, skills and flows
---------------------------------

Each of these is declared on a string parameter whose body carries the content.
All are marker identifiers.

.. list-table::
   :header-rows: 1
   :widths: 20 14 46 20

   * - Annotation
     - Applies to
     - Meaning
     - Default
   * - ``bridge::SystemPrompt``
     - string parameter
     - Marks the application's context. Use one per application; the body is the
       text.
     - unset
   * - ``bridge::AgentName``
     - string parameter
     - Declares an agent. The value is the agent's name and must be unique in the
       model; the body is the agent's instructions.
     - none
   * - ``bridge::Skill``
     - string parameter
     - Marks a skill. The body is the instructions.
     - unset
   * - ``bridge::SkillTarget``
     - string parameter, with ``Skill``
     - ``"agent:<name>"`` restricts the skill to that agent's scope.
       ``"flow:<name>"`` runs that flow.
     - the skill applies in whichever scope is active
   * - ``bridge::Flow``
     - string parameter
     - Marks a flow. The body is the JSON declaration.
     - unset

Query and output control
------------------------

.. list-table::
   :header-rows: 1
   :widths: 20 14 46 20

   * - Annotation
     - Applies to
     - Meaning
     - Default
   * - ``bridge::Queryable``
     - any identifier
     - Set ``"false"`` to keep an exposed identifier out of the general data
       query while leaving it reachable through your own tools. It has no effect
       on an identifier that is not exposed.
     - ``"true"`` when exposed
   * - ``bridge::OutputSchema``
     - procedure
     - A JSON Schema document, as a string, replacing the tool's derived output
       shape. Advanced. AIMMS ignores a malformed value.
     - derived from the procedure

Naming rules
------------

- A tool name starts with a letter and contains only letters, digits and
  underscores. AIMMS shortens names over 64 characters rather than dropping them.
- A tool name must not start with ``ide_``, ``aims_``, ``aimms_``, ``platform_``
  or ``flow_``.
- An exposed identifier inside a ``Module`` with a ``Prefix:`` must sit in a
  section listed in that module's ``Public:`` attribute, or in the model root.
  See :doc:`exposing`.

.. note::

   The ``bridge::`` namespace contains further keys that are accepted without
   having any effect yet, and IDE autocomplete offers them. Use only the
   annotations on this page.

.. seealso::

   - :doc:`exposing` — how these are used in practice.
   - :doc:`/sensai/apps/testing` — what the validation checks report.

.. spelling:word-list::

   SENSAI
   autocomplete
