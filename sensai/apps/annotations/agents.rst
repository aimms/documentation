Agents
======

An agent is a focused assistant with its own instructions and its own set of
tools, such as a reporting agent or a data-entry agent. The assistant creates
them — this page is for deciding when you need one and for checking its work.

Agents are optional, and an application with a handful of exposed procedures does
not need one. Add an agent when one set of instructions has to cover two kinds of
work that need different instructions. Reporting work calls for terse answers
with the number first. Data-entry work calls for the assistant to guide the user
through a form.

Declaring an agent
------------------

An agent is declared on a string parameter, and the parameter's text is the
agent's instructions. Ask the assistant to create one — *"split this into a
reporting agent and a data-entry agent"* — and check what it wrote against the
guidance below.

.. code-block:: aimms

    StringParameter spReportingAgent {
        bridge::AgentName: "reporting";
        bridge::Description: "Answers questions about how the current plan performs: costs, revenue, service levels and KPI comparisons between runs.";
        bridge::Category: "reporting";
        Definition       : "You are the reporting assistant. Prefer the summary tools over reading raw data. Give the number first, then one sentence of context. If a request would change the plan, say so and ask before acting.";
    }

Four rules:

- ``bridge::AgentName`` goes on a **string parameter**, never on a procedure.
- The name must be **unique** in the model.
- The parameter's body is the agent's instructions.
- An agent declaration is a marker identifier, so it does not need
  ``bridge::Exposed``, and adding it is an error.

How tools reach an agent
------------------------

An agent owns the exposed tools and data identifiers that share one of its
categories. You do not list an agent's tools. ``bridge::Category`` joins them, in
both directions.

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded.";
        bridge::Category: "reporting";      // joins spReportingAgent
    }

Because an identifier can carry several categories, one tool can belong to
several agents. An agent whose categories match nothing has no tools, which the
semantic check reports as a warning.

An agent reaches your exposed data through the procedures it owns. To give it the
general query as well, add the system category ``data-access``:

.. code-block:: aimms

    bridge::Category: "reporting,data-access";

Writing the agent description
-----------------------------

When an application has several agents, the assistant picks one from the agents'
``bridge::Description`` values. This is where the routing is decided.

**Name a domain and the operations in it.** *"Answers questions about how the
current plan performs: costs, revenue, service levels and KPI comparisons between
runs"* gives the assistant something to discriminate on.

**Do not describe the whole application.** *"Helps users with the production
planning app"* applies equally to every agent in the application, so it routes
nothing.
Application-wide personality or house style belongs in the application's
``bridge::SystemPrompt``, which applies on every route.

Writing the agent instructions
------------------------------

The parameter's body is the agent's instructions. Keep them short. Useful things
to put there:

- **Which tools to prefer.** *"Prefer the summary tools over reading raw data."*
- **How to present an answer.** *"Give the number first, then one sentence of
  context."*
- **When to stop and ask.** *"If a request would change the plan, say so and ask
  before acting."*
- **Vocabulary for this area** that is not already in the application prompt.

Two things do not belong there:

- Anything about the whole application. Put it in ``bridge::SystemPrompt``.
- Instructions for one specific recurring task. Write a skill — see
  :doc:`skills`.

.. note::

   The user always sees one assistant. Agents organize its instructions and tools
   behind that.

.. seealso::

   - :doc:`exposing` — categories and the exposed identifiers agents draw from.
   - :doc:`skills` — instructions for one recurring task.

.. spelling:word-list::

   SENSAI
