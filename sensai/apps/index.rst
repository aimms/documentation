SENSAI Apps
===========

SENSAI Apps is the product in the :doc:`SENSAI family </sensai/index>` for
applications you build yourself. It puts an AI assistant inside an AIMMS
application: the people who use the application ask questions about the plan in
plain language, change input data, run the model, and have the results explained
back to them. Every answer comes from the application's own optimization model —
the data it holds and the procedures it runs.

You decide what the assistant can see and what it may change, one identifier at a
time. In a developer session the assistant makes those changes to the model
itself — you describe what you want and review what it did. A user is no longer
limited to the questions someone has already built into a screen, and your work
moves from building those screens to deciding what the assistant may reach.

.. note::

   SENSAI Apps is available as a Preview. AIMMS enables it per account, and it
   needs a supported AIMMS version. Contact support@aimms.com to arrange access.

Where to start
--------------

- **You use an application that already has the assistant.**
  :doc:`using-the-assistant` assumes nothing about how the application was built.
- **You are deciding whether this suits your application.** :doc:`overview`
  covers how the assistant reaches your model, how you build with it, and what
  you control.
- **You are ready to build.** Follow :doc:`getting-started`. You do not need to
  learn the annotations first — the assistant writes them.
  :doc:`annotations/index` is there for the requirements it cannot work out on
  its own, and for checking its work.

.. toctree::
   :maxdepth: 2

   overview
   getting-started
   design-guide
   annotations/index
   testing
   using-the-assistant

.. spelling:word-list::

   SENSAI
