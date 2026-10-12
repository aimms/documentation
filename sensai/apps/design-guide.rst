Designing the exposed set
=========================

The assistant writes the annotations and works out which identifiers they belong
on. You decide what belongs in the exposed set and whether what it wrote is
correct. :doc:`/sensai/apps/annotations/index` lists what it cannot work out from the
model and has to be told.

Start from the questions users ask
----------------------------------

Do not ask the assistant to go through the model and expose what looks important.
That produces a large exposed set and worse answers.

Write down five questions planners ask about the application. Give it those, one
at a time, and let it work out what each one needs. Some will need a procedure
that does not exist; ask for it and review what the assistant writes. Others can
be answered from data the model already holds.

Expose fewer identifiers
------------------------

Expose fewer identifiers and make sure each description is right.

The assistant carries every exposed description into every conversation, so forty
procedures leave less room for the ones that matter and make its choice harder.
Three procedures with clear descriptions answer better than forty with weak ones.

When it proposes exposing something, ask which question that identifier answers.
If there is no clear answer, leave it out of the exposed set.

Reviewing descriptions
----------------------

Descriptions account for most of the quality difference between two
applications. Review them closely.

:doc:`/sensai/apps/annotations/exposing` sets out what a good description contains.
Two of those things are ones the assistant cannot get right on its own, and they
are what to look for when you read its drafts:

- **The words your users use.** If the business says "hold volume", the
  description should say hold volume, whatever the identifier is called.
- **Which of two similar procedures planners mean.** The assistant knows what
  each one does. It does not know which one the question is about.

Correct those, and leave the mechanics alone.

Ask it to review its own descriptions as well:

    *Read the descriptions on everything you exposed and tell me which ones would
    be hard to choose between.*

Start read-only, then allow writes narrowly
-------------------------------------------

Reading is low risk and answers most questions. Start there, and add writes once
the questions work.

When you do allow writes, allow them narrowly. Ask for a procedure that applies
one specific, checkable change and expose that, instead of exposing the
identifier for writing. The procedure can validate the input, keep related
identifiers consistent, and refuse a change that makes no sense. It also gives
better results, because the assistant calls one thing rather than assembling a
change itself.

Check every safety marking the assistant sets. It infers them from the code, and
:doc:`/sensai/apps/annotations/exposing` explains where that inference is least
reliable.

One assistant or several
------------------------

Do not start with agents. A single well-described set of tools is sufficient for
most applications.

Add an agent when the instructions pull in two directions — reporting work
calling for terse answers, data-entry work calling for the assistant to guide the
user through a form. Two agents with overlapping descriptions are worse than one
agent, because questions then land unpredictably.

Procedure, skill, or flow
-------------------------

Prefer a procedure, then a skill, then a flow. :doc:`/sensai/apps/annotations/skills`
has the full comparison.

A procedure is checkable, fast, and behaves the same every time; the assistant
writes it and you review it. Use a skill when the work recurs and needs
judgment, and say in the skill where the judgment is. Use a flow when the order
must not vary. A flow takes more effort to write and maintain, so use one only
where the fixed order is required.

Build it with your users
------------------------

**Ship a small exposed set early.** The questions users ask determine what to
expose next.

**Let the assistant test itself between rounds.** See :doc:`/sensai/apps/testing`.

**Write skills from real sessions.** Do the task once through the assistant, ask
it to write down what it did, then correct that. See
:doc:`/sensai/apps/annotations/skills`.

**Plan for a second round.** The first version shows what users ask. Use that to
build the second.

Keep the model compiling
------------------------

The assistant cannot help with a model that crashes or fails to compile. Model
stability is a prerequisite, independent of the annotations.

Before you expose more, check that the procedures already exposed behave
correctly when run repeatedly and in any order.

.. seealso::

   - :doc:`/sensai/apps/annotations/index` — what you have to tell the assistant.
   - :doc:`/sensai/apps/annotations/exposing` — what each annotation means.
   - :doc:`/sensai/apps/testing` — checking the result.

.. spelling:word-list::

   SENSAI
