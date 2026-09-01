Annotating your model
=====================

.. note::

   You do not need to know the annotation syntax to use SENSAI Apps. In a
   developer or editing session the assistant knows it, reads your model, and
   writes the annotations. Describe what you want in the terms you would use with a
   colleague — *"planners keep asking which weeks we are short on capacity,
   expose what is needed to answer that"* — and it works out which identifiers
   are involved and what to write on each.

   These pages cover the requirements the assistant cannot work out from the
   model, and what each annotation means when you are checking what it wrote.

What the assistant works out, and what comes from you
-----------------------------------------------------

The assistant reads the model. It knows what each procedure does, what each
identifier holds, how they relate, and which annotation to write to expose them.
It does not need to be told any of that. Its reading of the model should still
be checked — see :doc:`/sensai/apps/testing`.

What it cannot get from the model is anything that lives in your business:

- **Your vocabulary.** The words your users use for things, where they differ
  from the identifier names. *"We call it hold volume, not buffer stock."*
- **Which of several similar things users mean.** A model with four summary
  procedures gives the assistant no way to tell which one planners ask for.
- **Whether a procedure with indirect effects changes the model.** The assistant
  infers this from the code, and a procedure whose effect is several calls away
  is the one most likely to be marked incorrectly.
- **How the work should be grouped.** Which capability areas your application has,
  and therefore which agents to create.
- **What should stay hidden.** An identifier that is technically useful and
  commercially or operationally sensitive.
- **Routines your team follows.** The weekly planning run, the month-end check,
  the way your team handles an infeasible week.

State any of these as a requirement and the assistant applies it across the work:
*"anything that touches a published plan is read-only unless I say otherwise"* is
a single instruction, not something to repeat per procedure.

The annotation syntax
---------------------

An annotation is an ordinary AIMMS attribute in the ``bridge::`` namespace,
written inside an identifier declaration:

.. code-block:: aimms

    bridge::Key: "value";

:doc:`reference` has the exact syntax rules and every annotation. Read it when
you are checking the assistant's work, or when you want to ask for something
specific by name.

Three levels of annotation
--------------------------

Work top to bottom and stop when the result is good enough. Levels 1 and 2 are
sufficient for most applications.

**Level 1 — make the model AI-enabled.** Expose a few procedures with
descriptions, and add one string parameter saying what the application is. The
assistant can then call those procedures. See :doc:`/sensai/apps/getting-started`.

**Level 2 — make the model AI-ready.** Expose the data users ask about, mark what
is safe to run, give tools readable titles, and group them into categories.
Answer quality depends mostly on this level. See :doc:`exposing`.

**Level 3 — tune it.** Split the work across focused agents, write down recurring
routines as skills, and fix genuinely invariant sequences as flows. See
:doc:`agents`, :doc:`skills` and :doc:`flows`.

Rules that apply to every annotation
------------------------------------

**Nothing is exposed by default.** You opt in per identifier. Exposing the whole
model makes answers worse — see :doc:`/sensai/apps/design-guide`.

**Annotations do not inherit.** An annotation on a section, module or parent node
does not reach the identifiers inside it.

**Every value is a string**, including ``"true"`` and numbers.

Where errors are reported
-------------------------

AIMMS validates each annotation when the model compiles and reports problems in
the IDE message window. A second, semantic check runs in a developer or editing
session after each recompile, and catches what the compiler cannot see, such as a
missing description or a skill pointing at something that does not exist.
:doc:`/sensai/apps/testing` covers how to read both.

.. toctree::

   exposing
   agents
   skills
   flows
   reference

.. spelling:word-list::

   SENSAI
