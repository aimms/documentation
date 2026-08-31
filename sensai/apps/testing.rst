Testing and troubleshooting
===========================

Testing has three parts: have the assistant check its own work, put your users'
questions to it yourself, and read what the validation checks report. The last
section lists the problems that come up most and what causes them.

Let the assistant test itself first
-----------------------------------

For a first pass, have the assistant put your users' questions to itself and
report on its own answers:

    *Switch to end user mode. Ask yourself five questions a planner would ask
    about this application, answer them, and then tell me which answers were weak
    and what would fix them.*

The reply lists thin descriptions, tools it reports as missing, and questions it
could not answer. Work through it:

    *Fix the first three. Show me each change before you make it.*

Repeat this after each round of changes.

It does not catch everything. The assistant does not know which of several
similar procedures planners mean, or that "week" means the fiscal week in your
business. Those show up when you test it yourself, and both appear in
**Common problems** below.

Testing it yourself
-------------------

**Recompile.** Annotations take effect when the model compiles in a developer or
editing session. An end-user session does not run the checks.

**Switch to the business-user view.** Tell the assistant to *switch to end user
mode* — the wording is flexible. This is the view your users get, and in a
developer session the assistant has capabilities your users will not have.

**Ask the questions your users will ask.** Write two or three down before you
start, in their words, and use the same ones each time you change something. Ask
*"Which weeks are we short on capacity?"* rather than *"Does ComputeSummary
work?"*

**Ask a follow-up.** A second question shows whether you exposed enough.

To return, tell the assistant to *go back to developer mode*.

Where validation problems appear
--------------------------------

Two layers of validation run, and they report in different places.

**The engine check** runs at compile and reports in the **IDE message window**.
It catches an invalid value — ``bridge::SafeMode`` accepts only ``"readonly"`` or
``"readwrite"`` — and an annotation placed on an identifier kind it does not
apply to.

**The semantic check** runs in a developer or editing session after each
recompile, and catches what the compiler cannot see. To read its findings, ask
the assistant in a developer session to **describe its diagnostics**. It replies
with a list of the errors and warnings below, naming the identifier in each case,
and it can fix most of them if you ask it to.

.. note::

   The IDE message window does not yet show the semantic findings. Asking the
   assistant is how you see them today. They are also written to the plugin log
   in the AIMMS logging folder.

What the semantic check reports
-------------------------------

**Errors** — these stop something from working:

- A marker identifier (``SystemPrompt``, ``AgentName``, ``Skill``, ``Flow``) that
  also carries ``bridge::Exposed``.
- A duplicate or blank agent name.
- An empty agent, skill or flow body.
- A ``bridge::SkillTarget`` pointing at an agent or flow that does not exist.
- A ``bridge::OutputSchema`` that is not valid JSON.
- ``bridge::AgentName`` on something other than a scalar string parameter.
- A tool name using a reserved prefix.

**Warnings** — these work, and will produce poor results:

- An exposed identifier with no ``bridge::Description``.
- An agent with no category, or whose categories match no exposed identifier.
- ``bridge::Title`` or ``bridge::Category`` on an identifier that is not exposed,
  where they have no effect.
- Contradictory hints, such as ``ReadOnlyHint: "true"`` with
  ``DestructiveHint: "true"``.

Common problems
---------------

.. list-table::
   :header-rows: 1
   :widths: 38 62

   * - Symptom
     - Cause
   * - The assistant does not know a procedure exists
     - No ``bridge::Exposed: "true"``, or the model has not been recompiled.
   * - Nothing works at all, on a model that compiles
     - SENSAI Apps is not enabled for the account, or you are in an end-user
       session.
   * - A procedure is exposed and still invisible
     - It is inside a ``Module`` with a ``Prefix:`` and its section is not listed
       in the module's ``Public:`` attribute. AIMMS drops the tool at runtime and
       reports nothing. See :doc:`/sensai/apps/annotations/exposing`.
   * - A whole module's exposed tools disappeared at once
     - ``Public: A, B;`` is a syntax error. Use ``Public: { A + B }``.
   * - The assistant picks the wrong procedure
     - The descriptions do not distinguish them. Ask for descriptions that say
       *when* to use each one, not only what it does.
   * - It answers confidently about the wrong thing
     - A word means something different in your business than in the model —
       "week", "site", "cost". Put the definition in the app context.
   * - Questions reach the wrong agent
     - The agent descriptions overlap, or one describes the whole application.
       Fix the agent's ``bridge::Description``.
   * - An agent has no tools
     - Its ``bridge::Category`` matches no exposed identifier, or a category was
       set on a section and expected to reach the identifiers inside. Categories
       do not inherit.
   * - A skill never applies
     - Its ``bridge::SkillTarget`` names an agent or flow that does not exist, or
       its description lists the steps rather than saying when to use it.
   * - Nothing works after a model change
     - The model does not compile. The assistant cannot help with a model that
       does not build.

Decide what a good result looks like before you test. For a question, that is the
answer a domain expert would give. For an action, it is the state the model should
be in afterwards. :doc:`/sensai/apps/design-guide` covers rolling out to real users.

.. seealso::

   - :doc:`/sensai/apps/design-guide` — what to expose, and what to leave out.
   - :doc:`/sensai/apps/annotations/exposing` — the annotations behind most of the
     problems above.
   - :doc:`/sensai/apps/annotations/reference` — scopes and values.

.. spelling:word-list::

   SENSAI
   recompile
