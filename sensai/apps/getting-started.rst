Getting started
===============

This page walks through a first session with the assistant. By the end it will
know what your application is for, be able to read one of your parameters, and be
able to run one of your procedures.

You direct the work and the assistant writes the annotations. You do not need to
know the annotation syntax to follow this page — the code shown here is what the
assistant produces, included so that you can recognize and check it.

Before you start
----------------

You need:

- **SENSAI Apps enabled on the cloud account you sign in to**, on an AIMMS
  version that supports it. AIMMS arranges both. If it is not enabled on that
  account, **SENSAI chat** does not appear in the **Tools** menu (see below).
- **A model that compiles**, open in a developer or editing session. The
  assistant works on the model with you in such a session, and the annotation
  checks only run there.
- **Two questions a planner asks you**, written down. One that needs an answer —
  *"which weeks are we short on capacity?"* — and one that needs something done —
  *"recalculate the summary after I change the forecast."* The rest of this page
  uses these two questions.

Sign in and open the assistant
------------------------------

You work with the assistant in the AIMMS IDE, in a SENSAI chat that docks beside
your project. Opening it takes a one-time cloud sign-in per AIMMS session:

#. **Open Tools › Cloud login.** In the IDE, open the **Tools** menu and choose
   **Cloud login**. A red dot means you are not signed in yet.
#. **Enter your cloud account.** Type the address of the cloud account that has
   SENSAI Apps enabled and press **Sign in**. If you are not signed in to that
   account yet, you will be prompted to do so. Signing in to a different account
   works, but **SENSAI chat** will not be offered in step 5.
#. **Approve the device in your browser.** Your browser opens the cloud portal.
   Check the request and press **Approve**.
#. **Close the browser tab.** Once the page says the device is authorized, close
   the tab and return to the IDE.
#. **Open Tools › SENSAI chat.** The dot turns green and the **Tools** menu now
   offers **SENSAI chat**. Open it.
#. **Good to go.** The assistant docks beside your project.

.. note::

   Every new AIMMS session needs the cloud login again, so start from step 1 each
   time you reopen your project.

Step 1 — Ask it to look at the model
------------------------------------

Have it read the model before you tell it anything:

    *Investigate this model and tell me what the application is for, in a short
    paragraph. Say what it plans and what the main quantities are.*

Read what comes back and correct it before continuing. Everything later in the
session builds on this description.

When it is right:

    *Add that as the app context.*

The assistant writes a string parameter something like this:

.. code-block:: aimms

    StringParameter spAppPrompt {
        bridge::SystemPrompt: "true";
        Definition          : "This app plans weekly production for ACME. Quantities are in units, time in ISO weeks.";
    }

Ask it to recompile, then ask *"what is this app for?"* You should get your own
description back.

If you get nothing back, work through these in order: the model compiled without
errors; you are in a developer or editing session; SENSAI Apps is enabled for
your account.

Step 2 — Ask for what your first question needs
-----------------------------------------------

Give it the question. You do not need to name identifiers.

    *Planners keep asking which weeks we are short on capacity. Find what is
    needed to answer that and expose it. Tell me what you chose and why.*

The assistant looks through the model, picks the procedures and identifiers it
needs, and writes the annotations. It comes back with something like this, and
with its reasoning:

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded. Use it for questions about how the current plan performs. Reads data only; it changes nothing.";
    }

Check two things:

- **Did it pick the right procedure?** Where a model holds several similar
  procedures, the assistant cannot tell which one planners mean. Confirm the
  choice.
- **Is the description right?** The assistant reads this description to decide
  when to use the procedure. If it describes the wrong situation, say so and ask
  for a better one.

If answering the question needs a procedure that does not exist, say so and ask
for it. The assistant writes the procedure and exposes it. Review the procedure
before accepting it.

.. note::

   The assistant calls a procedure by its own identifier name, and a name such
   as ``p_calc_02`` carries no meaning. Ask it to rename any procedure whose name
   does not describe what it does. It updates the references, and shows you the
   change before it makes it.

Step 3 — Ask for what your second question needs
------------------------------------------------

Repeat with the action:

    *Now do the same for "recalculate the summary after I change the forecast".*

This one needs the forecast readable, and it needs a way to change it. If no
suitable procedure exists, the assistant writes one:

.. code-block:: aimms

    Parameter Demand {
        IndexDomain : (p, w);
        bridge::Exposed: "true";
        bridge::Description: "Forecast demand per product per week, in units. Demand is a model input; a solve does not change it.";
    }

    Procedure UpdateForecast {
        Arguments  : (product, isoWeek, newValue);
        bridge::Exposed: "true";
        bridge::Description: "Sets the demand forecast for one product in one week. Pass isoWeek as an ISO week string such as 2026-W12. This changes the plan.";
    }

A procedure that applies one specific change is a better thing to expose than
the identifier itself, because it can validate the input and refuse a change
that makes no sense. :doc:`/sensai/apps/design-guide` covers that choice.

Step 4 — Check the safety markings
----------------------------------

AIMMS treats every procedure as changing the model unless it is marked otherwise,
and the marking decides when a user is asked to confirm. Ask the assistant to go
through what it exposed:

    *Go through everything you exposed and tell me which ones change the model and
    which do not. Mark them.*

Check the answer against what you know about each procedure. An incorrect
marking means a procedure that changes the model can run without asking the user
to confirm.

.. code-block:: aimms

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded. Use it for questions about how the current plan performs. Reads data only; it changes nothing.";
        bridge::Title: "Compute summary statistics";
        bridge::SafeMode: "readonly";
        bridge::ReadOnlyHint: "true";
    }

    Procedure UpdateForecast {
        Arguments  : (product, isoWeek, newValue);
        bridge::Exposed: "true";
        bridge::Description: "Sets the demand forecast for one product in one week. Pass isoWeek as an ISO week string such as 2026-W12. This changes the plan.";
        bridge::Title: "Update the demand forecast";
        bridge::SafeMode: "readwrite";
    }

``bridge::Title`` is the label a person sees. :doc:`/sensai/apps/annotations/exposing`
explains each of these annotations.

Step 5 — Ask it to test its own work
------------------------------------

    *Switch to end user mode. Ask yourself five questions a planner would ask
    about this application, answer them, and then tell me which answers were weak
    and what would fix them.*

You get a list of thin descriptions, missing tools and questions it could not
answer. Work through the list with it:

    *Fix the first three. Show me each change before you make it.*

Step 6 — Try it yourself as a user would
----------------------------------------

Tell it to **switch to end user mode**, then ask your own two questions from the
top of this page in your own words. Watch for a confirmation prompt on anything
that changes state.

To return, tell it to **go back to developer mode**. If something did not work,
ask it to describe its diagnostics. :doc:`/sensai/apps/testing` explains what those
findings mean and lists common causes.

What you end up with
--------------------

.. code-block:: aimms

    StringParameter spAppPrompt {
        bridge::SystemPrompt: "true";
        Definition          : "This app plans weekly production for ACME. Quantities are in units, time in ISO weeks.";
    }

    Parameter Demand {
        IndexDomain : (p, w);
        bridge::Exposed: "true";
        bridge::Description: "Forecast demand per product per week, in units. Demand is a model input; a solve does not change it.";
    }

    Procedure ComputeSummary {
        bridge::Exposed: "true";
        bridge::Description: "Computes cost, revenue and service-level KPIs for the scenario currently loaded. Use it for questions about how the current plan performs. Reads data only; it changes nothing.";
        bridge::Title: "Compute summary statistics";
        bridge::SafeMode: "readonly";
        bridge::ReadOnlyHint: "true";
    }

    Procedure UpdateForecast {
        Arguments  : (product, isoWeek, newValue);
        bridge::Exposed: "true";
        bridge::Description: "Sets the demand forecast for one product in one week. Pass isoWeek as an ISO week string such as 2026-W12. This changes the plan.";
        bridge::Title: "Update the demand forecast";
        bridge::SafeMode: "readwrite";
    }

Where to go next
----------------

Repeat steps 2 to 6 with the next questions your planners ask. Later rounds need
less setup, because the assistant already has the application context.

Agents, skills and flows are optional. Add them once users ask questions the
current exposed set does not cover.

.. seealso::

   - :doc:`/sensai/apps/design-guide` — deciding what to expose.
   - :doc:`/sensai/apps/annotations/exposing` — what each annotation means.
   - :doc:`/sensai/apps/annotations/skills` — writing down a recurring routine.

.. spelling:word-list::

   SENSAI
