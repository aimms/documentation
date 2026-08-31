How SENSAI Apps works
=====================

This page covers what the assistant can do, where its answers come from, how you
build with it, and what you control. Read it before you decide how much of your
application to open up.

.. note::

   In these pages, **the model** means your AIMMS optimization model.
   **The assistant** means SENSAI Apps.

What a user can do
------------------

In an application with SENSAI Apps enabled, a user can:

- **Ask questions about the plan.** *"Which weeks are we short on capacity?"*
  *"What changed since the last run?"*
- **Change input data by asking.** *"Raise the forecast for product B in week 12
  by ten percent."* The assistant changes the identifier, within the limits you
  set.
- **Run the model.** *"Recalculate the summary."* The assistant calls the
  procedures you exposed and reports what came back.
- **Have results explained.** *"Why is that order late?"* The assistant works
  from the model's own quantities and the descriptions you wrote.
- **Follow a routine you wrote down.** A *skill* holds plain-language
  instructions for recurring work, such as the weekly planning routine.
- **Run a fixed sequence.** A *flow* is a multi-step routine that runs the same
  way every time.

Where the answers come from
---------------------------

Ask what the plan costs and the assistant reads the number from the model, or
runs a procedure to produce it. It does not estimate. Every quantity in an
answer came out of your model, and it is the same quantity the application's own
screens read.

The assistant still chooses which procedure to call and which slice of data to
read, and it writes the sentence around the number. Those choices can be wrong,
and they improve as your descriptions improve. :doc:`design-guide` covers how to
make them better.

What you can create
-------------------

The assistant sees nothing in your model until you expose it. You opt in one
identifier at a time, using annotations in the ``bridge::`` namespace. Only the
first three rows below are needed to get value.

.. list-table::
   :header-rows: 1
   :widths: 20 55 25

   * - Thing
     - What it is
     - Needed?
   * - App context
     - One string parameter holding a short description of what the application
       is for. It improves every answer.
     - Strongly recommended
   * - Tools
     - An exposed procedure the assistant can call. You mark whether running it
       changes the model.
     - Yes
   * - Readable data
     - An exposed parameter or set the assistant can read, and query — filtering,
       grouping and aggregating to answer a question.
     - Yes
   * - Agents
     - A focused assistant with its own instructions and its own set of tools,
       such as a reporting agent. Use one when a single set of instructions has
       to cover two kinds of work.
     - Optional
   * - Skills
     - Plain-language instructions for recurring work, written once. The
       assistant interprets them.
     - Optional
   * - Flows
     - A fixed sequence of steps, declared in JSON, for work whose order must
       not vary.
     - Optional

Building it with the assistant
------------------------------

You do not write the annotations by hand, and you do not need to know the
annotation syntax. In a developer session the assistant knows it, reads the
model, and makes the change. You say what you want in the terms you would use
with a colleague, and you review the result.

There is no need to explain how to annotate. What the assistant cannot get from
the model is anything that lives in your business — your vocabulary, which of
several similar procedures users mean, the routines your team follows. State
those as requirements and it applies them.
:doc:`/sensai/apps/annotations/index` lists them in full.

A working session looks like this:

- **Ask it to look first.** *"Investigate this model and tell me what the
  application does."* You get a summary you can correct before anything is
  written.
- **Say what you want in your own terms.** *"Planners keep asking which weeks are
  short on capacity. Expose whatever is needed to answer that."* The assistant
  finds the relevant procedures and identifiers, writes the annotations, and
  tells you what it chose. Naming identifiers is not necessary.
- **Ask for what is missing.** If answering a question needs a procedure that
  does not exist, ask for it. The assistant writes the procedure and exposes it,
  and you review it before accepting it.
- **Review what it did.** It shows you the change before it makes it, and you can
  ask why it chose one identifier over another.
- **Ask it to test its own work.** *"Ask yourself five questions a planner would
  ask, answer them as an end user would see it, and tell me what is missing or
  wrong."* This surfaces thin descriptions and missing tools.
- **Ask it to improve what it found.** Give it the results of its own test and
  ask it to fix what it flagged.

You decide what belongs in the exposed set and whether a description is right.
:doc:`getting-started` walks through a first session, and :doc:`design-guide`
covers those decisions.

What you control
----------------

**What the assistant can see.** An identifier the assistant cannot see cannot be
read, mentioned or changed. Exposure is per identifier and off by default, so the
only decision is what to expose.

**What it may change.** Every exposed identifier and procedure carries a safety
marking. AIMMS treats a procedure as changing the model unless you mark it
``bridge::SafeMode: "readonly"``. Data identifiers are readable until you mark
them ``"readwrite"``. The platform enforces both settings, and uses them to
decide when to ask the user to confirm before something happens.

**What the assistant knows about each thing.** The assistant reads your
``bridge::Description`` to decide whether a procedure fits the question it was
asked. Description quality affects answer quality more than anything else.
Review the descriptions even when the assistant drafted them.

Developer sessions and end-user sessions
----------------------------------------

A **developer or editing session** is one where you may change the model. This is
where the assistant works on the model with you, and where the annotation checks
run. Annotations take effect when the model compiles in such a session.

An **end-user session** is what your users get. The assistant works with the
application there and does not change the model.

Inside a developer session you can also ask the assistant to **switch to end
user mode**, which gives you the view your users get, and to **go back to
developer mode** to return. The mode changes what the assistant will do for you.
It does not change which session you are in.

How your data is handled
------------------------

Answering a question means sending the relevant part of your model's data, along
with the descriptions you wrote, to the AI service that produces the answer.
Conversation content travels over an encrypted connection and is encrypted at
rest.

By default a conversation and its action records are deleted after 30 days
without activity. AIMMS can set a different retention period for your account.

The assistant runs in the signed-in user's session and works within that user's
permissions in the application. What it read, changed and ran is recorded, and
the record can be exported.

What to expect
--------------

- **A working model is a hard prerequisite.** The assistant cannot help with a
  model that does not compile, or that crashes on a run. Fix those first.
- **Answer quality follows from the exposed set.** The decisions about what to
  expose and how to describe it shape every answer. :doc:`design-guide` covers
  those decisions.
- **Expect to revise the exposed set.** Expose a small set, put it in front of
  users, and use what they ask to decide what to add.

.. note::

   These pages cover SENSAI Apps, which adds an assistant to an application you
   build yourself. Other products in the :doc:`SENSAI family </sensai/index>`
   have their own documentation.

.. seealso::

   - :doc:`/sensai/apps/getting-started` — a first session with the assistant.
   - :doc:`/sensai/apps/design-guide` — deciding what to expose.
   - :doc:`/sensai/apps/annotations/index` — what you have to tell it, and what each
     annotation means.
   - :doc:`/sensai/apps/using-the-assistant` — the page to give your users.

.. spelling:word-list::

   SENSAI
