Exposing procedures and data
============================

Everything the assistant can do in your application comes from the procedures and
identifiers you expose, and from the descriptions attached to them.

The assistant writes these annotations for you in a developer or editing session.
You do not name identifiers to it. You describe what your users need to do and how they
want to interact — the questions they ask and the tasks they carry out, in their
own words — and from that the assistant works out which procedures and
identifiers are involved and writes the annotations on them. For example:
*"Planners keep asking which weeks we are short on capacity — find what is needed
to answer that and expose it."* :doc:`/sensai/apps/getting-started` walks through
this in a first session.

This page explains what each annotation means — for checking its work, and for
asking it for something specific by name.

Exposing a procedure
--------------------

An exposed procedure becomes a **tool** the assistant can call.

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded. Use it for questions about how the current plan performs. Reads data only; it changes nothing.";
    }

``bridge::Exposed: "true"`` is what makes an identifier visible. Without it the
assistant cannot see the procedure, cannot call it, and will not mention it.

Procedure arguments
-------------------

A procedure's arguments become the tool's parameters, and the assistant supplies
values for them from the conversation. Two things follow:

- **Argument names should carry meaning.** The assistant reads them.
- **The description should say what the arguments mean and what values are
  valid.** *"Pass the ISO week number as a string, for example 2026-W12"* tells
  the assistant what form the value takes.

.. code-block:: aimms

    Procedure SolveWeek {
        Arguments  : (isoWeek);
        bridge::Exposed: "true";
        bridge::Description: "Solves the production plan for one week. Pass isoWeek as an ISO week string such as 2026-W12. This changes the plan.";
    }

Exposing data
-------------

An exposed parameter or set becomes data the assistant can read. It can also
query it — filtering, grouping and aggregating — so a question about a slice of
the data can be answered without you writing a procedure for it.

.. code-block:: aimms

    Parameter Demand {
        IndexDomain : (p, w);
        bridge::Exposed: "true";
        bridge::Description: "Forecast demand per product per week, in units. Demand is a model input; a solve does not change it.";
    }

To expose an identifier for your own tools while keeping it out of the general
query, add ``bridge::Queryable: "false"``. The identifier stays reachable through
the procedures you exposed.

Allowing changes to data
------------------------

An exposed data identifier is readable and not writable. Asking for it to be
writable produces ``"readwrite"``:

.. code-block:: aimms

    Parameter Demand {
        IndexDomain : (p, w);
        bridge::Exposed: "true";
        bridge::Description: "Forecast demand per product per week, in units. Demand is a model input; a solve does not change it.";
        bridge::SafeMode: "readwrite";
    }

A procedure is usually the better thing to expose. One that applies a single
specific change can validate the input and refuse a change that makes no sense.
:doc:`/sensai/apps/design-guide` covers that choice.

Writing descriptions
--------------------

``bridge::Description`` affects answer quality more than any other annotation.
The assistant reads it to decide whether a procedure fits the question it was
asked, and on an agent it decides which agent handles a question.

A good description has three things:

- **What it does**, in the application's own vocabulary. It should use the words
  your users use and the names of your other identifiers.
- **When to use it.** This has the largest effect on which procedure the
  assistant chooses. *"Use it for questions about how the current plan
  performs"* separates a summary procedure from four similar ones.
- **What it changes**, if anything.

One or two sentences is right. Every exposed description is carried into every
conversation, so a long one leaves less room for everything else.

An exposed identifier with no description still works, and the assistant is then
guessing from the identifier name alone. The semantic check warns about it.

Titles
------

``bridge::Title`` sets the label a person sees for a tool or an item of data —
the name shown in the assistant's interface when it refers to that tool or data.
It may contain spaces. It affects display only: the assistant itself works from
the description and calls the procedure by its identifier name, so the title
never changes what the assistant does.

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded.";
        bridge::Title: "Compute summary statistics";
    }

Without a title, the identifier name is shown instead.

Marking read-only and read-write procedures
-------------------------------------------

The platform enforces ``bridge::SafeMode``.

AIMMS treats every procedure as changing the model. The ones that do not are
marked ``"readonly"``, and the ones that do are marked ``"readwrite"``.

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded.";
        bridge::SafeMode: "readonly";
        bridge::ReadOnlyHint: "true";
    }

Get the read-only markings settled first. The assistant can then use those
procedures freely to answer questions, and confirmation prompts are reserved for
actions that change the model. Before running anything that changes state, the
assistant tells the user what it is about to do and waits for them.

The assistant infers these markings from what the code does. Check them against
what you know: a procedure whose effects are indirect is the most likely to be
marked incorrectly.

Four further hints describe a procedure's behavior. They are advisory: the
approval policy uses them to decide how certain the assistant must be, and
whether to ask the user first.

.. list-table::
   :header-rows: 1
   :widths: 26 54 20

   * - Hint
     - ``"true"`` means
     - Set it on
   * - ``bridge::ReadOnlyHint``
     - Running it changes nothing.
     - every read-only procedure
   * - ``bridge::DestructiveHint``
     - It discards or overwrites existing state.
     - anything hard to reverse
   * - ``bridge::IdempotentHint``
     - Running it twice has the same effect as running it once.
     - safe-to-retry procedures
   * - ``bridge::OpenWorldHint``
     - It touches systems outside this session.
     - anything calling out

A read-only procedure should carry both ``bridge::SafeMode: "readonly"`` and
``bridge::ReadOnlyHint: "true"``. ``SafeMode`` governs what the platform permits;
the hint tells the assistant how freely to use the procedure. The semantic check
reports contradictions, such as ``ReadOnlyHint: "true"`` together with
``DestructiveHint: "true"``, or with ``SafeMode: "readwrite"``.

Categories
----------

``bridge::Category`` groups exposed identifiers, and an agent owns the
identifiers that share one of its categories.

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded.";
        bridge::Category: "reporting";
    }

An identifier can carry several categories as a comma-separated list, so one tool
can belong to several agents:

.. code-block:: aimms

    bridge::Category: "reporting,planning";

Categories do not inherit: one on a section or module does not reach the
identifiers inside. Categories set now are used by any agent added later. See
:doc:`agents`.

Tool names
----------

The assistant calls a tool by a name derived from the procedure's own identifier
name.

**Procedure names should mean something.** The assistant can tell what
``ComputeSummary`` does from its name. It can tell nothing from ``p_calc_02``.
Ask it to rename anything that reads like the latter.

**Use a plain identifier name.** It starts with a letter, contains only letters,
digits and underscores, and does not use one of the reserved prefixes.
:doc:`reference` has the full naming rules.

Exposing from a prefixed module
-------------------------------

.. warning::

   An exposed procedure or identifier in a ``Module`` with a ``Prefix:`` must sit
   in a section listed in that module's ``Public:`` attribute, or in the model
   root. Otherwise its name comes out as ``prefix::Name``, which is not a valid
   tool name. AIMMS drops the tool at runtime and reports nothing.

This is dropped, because the section is not public:

.. code-block:: aimms

    Module Planning {
        Prefix: pl;
        Section Internal {
            Procedure RunPlan {
                bridge::Exposed: "true";
            }
        }
    }

This works:

.. code-block:: aimms

    Module Planning {
        Prefix: pl;
        Public: { PublicTools }
        Section PublicTools {
            Procedure RunPlan {
                bridge::Exposed: "true";
            }
        }
    }

To add a second public section, use the set-union form:

.. code-block:: aimms

    Public: { Order_Taker + Scenario_Comparison }

``Public: A, B;`` is a syntax error. It breaks the module's whole public
interface, and it gives no obvious symptom.

Telling the assistant what the application is
---------------------------------------------

One string parameter, marked ``bridge::SystemPrompt: "true"``, carries the
application's context. Use one per application. The assistant reads it on every
conversation, so keep it to the essentials: what the application plans, the main
quantities, and the conventions used.

.. code-block:: aimms

    StringParameter spAppPrompt {
        bridge::SystemPrompt: "true";
        Definition          : "This app plans weekly production for ACME. Quantities are in units, time in ISO weeks.";
    }

This is a **marker identifier**, so it does not need ``bridge::Exposed``. Agents,
skills and flows are declared the same way — see :doc:`reference`.

A complete example
------------------

An application prompt, one readable parameter and one read-only tool, all in the
same capability area:

.. code-block:: aimms

    StringParameter spAppPrompt {
        bridge::SystemPrompt: "true";
        Definition          : "This app plans weekly production for ACME. Quantities are in units, time in ISO weeks.";
    }

    Parameter Demand {
        IndexDomain : (p, w);
        bridge::Exposed: "true";
        bridge::Description: "Forecast demand per product per week, in units. Demand is a model input; a solve does not change it.";
        bridge::Category: "reporting";
    }

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded. Use it for questions about how the current plan performs. Reads data only; it changes nothing.";
        bridge::Title: "Compute summary statistics";
        bridge::SafeMode: "readonly";
        bridge::ReadOnlyHint: "true";
        bridge::Category: "reporting";
    }

.. seealso::

   - :doc:`reference` — every annotation, with scopes and defaults.
   - :doc:`/sensai/apps/design-guide` — deciding what belongs in the exposed set.
   - :doc:`/sensai/apps/testing` — checking that what you exposed arrived.

.. spelling:word-list::

   SENSAI
