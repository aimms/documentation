SENSAI
======

SENSAI is the AIMMS family of AI assistants. Each one works inside an
optimization application and answers from that application's own model — the data
it holds and the procedures it runs. The numbers in an answer are the numbers the
application itself produces, reached by asking rather than by clicking through a
screen.

This section documents **SENSAI Apps**, which adds an assistant to an AIMMS
application you build yourself. The people who use the application ask questions
about the plan in plain language, change input data, run the model, and have the
results explained back to them. You decide what the assistant can see and what it
may change, one identifier at a time; in a developer or editing session the
assistant makes those changes to the model itself — you describe what you want
and review what it did.

**SENSAI in AIMMS SC Navigator** is a separate product — the assistant built into
SC Navigator, for people who use that application. It is documented in the
`SC Navigator manual <https://scnavigator-manual.aimms.com/sc-navigator/how_to_use/sensai/index.html>`_.

.. note::

   SENSAI Apps is available as a Preview. AIMMS enables it per account, and it
   needs a supported AIMMS version. Contact support@aimms.com to arrange access.

.. toctree::
   :maxdepth: 1
   :hidden:

   apps/overview
   apps/getting-started
   apps/design-guide
   apps/annotations/index
   apps/testing
   apps/using-the-assistant

Where to start
--------------

- **You use an application that already has the assistant.**
  :doc:`apps/using-the-assistant` assumes nothing about how the application was
  built.
- **You are deciding whether this suits your application.** :doc:`apps/overview`
  covers how the assistant reaches your model, how you build with it, and what
  you control.
- **You are ready to build.** Follow :doc:`apps/getting-started`. You do not need
  to learn the annotations first — the assistant writes them.
  :doc:`apps/annotations/index` is there for the requirements it cannot work out
  on its own, and for checking its work.

.. spelling:word-list::

   SENSAI
