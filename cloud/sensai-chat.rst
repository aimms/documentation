SENSAI on AIMMS Cloud
=====================

SENSAI is the AI assistant of the AIMMS Cloud Platform. It is available
in three places:

- **The AIMMS Cloud Portal**, to answer your questions and guide you
  step by step through what you want to do in the Portal.
- **The AIMMS IDE**, to help you develop your model.
- **WebUI apps**, to help app users work with their plans and data.

In each place, SENSAI opens in a chat panel. This page describes how to
open SENSAI, what your account needs, and the features of the chat
panel. For more about what SENSAI can do, see the `SENSAI documentation
<https://documentation.aimms.com/sensai>`_.

.. note::
   SENSAI is only available when you are connected to AIMMS Cloud, and
   only for accounts whose Cloud Platform contract includes the
   matching feature (see `Requirements`_).

Where SENSAI Is Available
-------------------------

In the Portal
^^^^^^^^^^^^^

Click the **SENSAI** icon in the Portal. The chat panel opens on the
right-hand side of the screen.

In the Portal, SENSAI can tell you how to do things, but cannot do them
for you. For example, if you ask for the log of a session, SENSAI
explains where to find and download it in the Portal, but does not
retrieve the log itself. See :doc:`portal-sensai` for details.

In the AIMMS IDE
^^^^^^^^^^^^^^^^

1. Open **Tools** > **Cloud login** and sign in to your AIMMS Cloud
   account.
2. Open **Tools** > **SENSAI chat**. The chat docks beside your project.

You have to sign in again each time you start a new AIMMS session. See
`Getting started
<https://documentation.aimms.com/sensai/apps/getting-started.html#sign-in-and-open-the-assistant>`_
in the SENSAI documentation for the full steps.

In WebUI Apps
^^^^^^^^^^^^^

The app developer enables SENSAI per app with the **Enable SENSAI Chat**
setting, available from WebUI 26.12.1. The setting is off by default.
When it is on, a **SENSAI** button appears on the application header
bar, and clicking it opens the chat panel on the right side of the app.
See `Enable SENSAI Chat
<https://documentation.aimms.com/webui/app-misc-settings.html#enable-sensai-chat>`_
in the WebUI documentation.

For app users, see `Using the assistant
<https://documentation.aimms.com/sensai/apps/using-the-assistant.html>`_
in the SENSAI documentation.

Requirements
------------

Your account's Cloud Platform contract must include the feature for the
place where you want to use SENSAI:

- **Portal AI Assistant**: SENSAI in the Portal.
- **IDE AI Assistant**: SENSAI in the AIMMS IDE.
- **SENSAI Apps**: SENSAI in WebUI apps.

Your contract may also set quotas, such as a maximum number of requests.
To check which features and quotas apply to your account, open the
:doc:`Usage <newportal-usage>` page in the Portal.

Things to Keep in Mind
----------------------

- **AI responses may contain errors**: always verify outputs before
  acting on them, particularly for critical or high-stakes decisions.
- **SENSAI is a support tool, not an expert substitute**: it does not
  replace the advice of qualified professionals or official AIMMS
  documentation.
- **Use of SENSAI is subject to the AIMMS terms and conditions**, shown
  when you first open the chat panel.

Using the Chat Panel
--------------------

The chat panel works the same way in the Portal, the AIMMS IDE and WebUI
apps.

Starting a Conversation
^^^^^^^^^^^^^^^^^^^^^^^

The first time you open the chat panel, the terms and conditions for
using SENSAI are shown. Type your question in the message box at the
bottom of the chat panel to start.

Use the icons at the top of the chat panel to start a new conversation
or view your chat history.

Answers and Suggested Replies
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After an answer, SENSAI may suggest a reply, shown in grey text in the
message box, for example *How can you help me with optimization
planning?*. To use the suggestion, click **Use**, then press **Enter**
or click the send button (the blue arrow) to send it. To ask something
else, just start typing.

SENSAI matches the length of its answer to your question: short
questions get short answers, and complex questions get more detail.

While SENSAI is working on an answer, the chat panel shows *Thinking…*
and the send button changes into a red stop button. Click it to stop
the answer. SENSAI then shows the message *Stopped at your request. Any
changes made before stopping have not been undone.*

.. important::
   Stopping does not undo changes SENSAI already made. Check your data
   if you stop SENSAI while it is changing it.

Keyboard Shortcuts
^^^^^^^^^^^^^^^^^^

- Press the **Up arrow** key in an empty message box to browse through
  the questions you asked earlier in the conversation. Edit a question
  if needed, and press **Enter** to send it again.
- Type ``/`` to open your skills (see `Skills`_).
- Press **Esc** on a question or approval card to choose its way-out
  option, such as **Skip**, **Cancel** or **Decline**.

Questions and Choices
^^^^^^^^^^^^^^^^^^^^^

Sometimes SENSAI needs more information, or your confirmation, before it
continues. Instead of a text reply, it then shows a question card in the
conversation. A card can ask you to:

- Choose one option.
- Choose several options, for example *at least 1 and at most 2*.
- Click one of a few buttons, for example to continue or stop.
- Confirm an action.

While a card is waiting for your answer, the message box is locked. Your
answer is checked before it is sent: for example, the card shows
*Choose at least 1* if you have not selected anything, and a message in
red if you select more options than allowed. To answer without
choosing, click **Skip** or **Cancel**.

After you answer, the card shows *Sending…* and then your choice, for
example *Continue · just now*. SENSAI uses your answer in its reply, and
the message box is unlocked again.

If you scroll away from a waiting card, the message *An answer is needed
to continue.* appears. Click **Show it** to go back to the card. If you
reload the page, the waiting card is shown again so you can still
answer it. If you stop the answer while a card is waiting, the card
shows *No longer available*.

Approving Changes
^^^^^^^^^^^^^^^^^

When SENSAI wants to change data, for example set a value or increase a
set of prices by 10%, it first shows an approval card in the
conversation. The card describes the change. The message box is locked
until you decide:

- Click **Approve** to make the change. SENSAI confirms what it changed.
- Click **Decline** to cancel it. The data stays unchanged.

Changes take effect immediately after you approve them.

Rating Answers
^^^^^^^^^^^^^^

Below each answer, click the thumbs-up icon if the answer was helpful,
or the thumbs-down icon if it was not. A comment box then opens with the
question *What could be better? (optional)*. Type your feedback, up to
2000 characters, and click **Send**, or click **Cancel** to skip the
comment. To add a comment later, click **Add a comment** next to the
rating. Your rating is used to improve SENSAI.

Layout
^^^^^^

- **Dark mode**: The chat panel supports dark mode.
- **Resizing**: You can resize the chat panel by dragging its left
  edge. It opens at a width of 400 pixels, which is also its minimum
  width, and can be widened up to half of the window. In WebUI apps,
  resizing is available from WebUI 26.13.1.

Skills
------

A skill is a set of instructions SENSAI follows for a specific job. To
use a skill, type ``/`` in the message box. The list shows the skills
available to you, with their name, description and where they come
from: **you** for skills you created, or **platform** for skills
provided by AIMMS. Keep typing to narrow the list, and select a skill
to use it in your message.

Any user on the AIMMS Cloud Platform can create their own skills on the
:doc:`ai-skills` page in the Portal. Administrators can also share
skills with everyone in their account or environment.

In WebUI apps, the list also includes skills that the app's maintainer
has set up for that app, for example routines your team uses often.
These are pinned to the app through their scope (see :doc:`ai-skills`).

Memory
------

SENSAI remembers your preferences, such as how to address you or which
data to check before making a suggestion. You can review, edit and
restore earlier versions of these memories on the :doc:`ai-memories`
page in the Portal.

To have SENSAI remember something, tell it in the chat, for example
*Please remember that I'm building optimization and planning apps*. You
can also start with *From now on…*, and SENSAI asks what you would like
it to remember. SENSAI confirms what it saved, for example *I'll
remember: you're building optimization and planning apps.*

The memory is then used in your later conversations, and appears on the
:doc:`ai-memories` page.

Usage and Quotas
----------------

Your account's contract can set quotas on SENSAI, such as a maximum
number of requests per period. The :doc:`Usage <newportal-usage>` page
in the Portal shows each quota, your current usage against it, when the
limits reset, and its **Exceed action**: what happens when the quota is
used up.

When a quota is used up, one of the following happens, depending on its
exceed action:

- **Hard stop**: SENSAI does not accept new requests until the quota
  resets or is increased. A red warning icon appears next to **SENSAI**
  at the top of the chat panel, with the message *You have used your AI
  quota. New requests will not run until the quota resets or is
  increased.* Click **View usage** to open the Usage page. If you send a
  message anyway, SENSAI replies that you have reached your plan's limit,
  for example *You've reached your plan's limit for SENSAI Apps*.
- **Overage**: SENSAI keeps answering, and the extra requests are billed
  as overage. While your account is in overage billing, a yellow icon
  appears next to **SENSAI** at the top of the chat panel. Hover over
  the icon to see the message **In overage billing**.

.. TODO: usage over time with CSV export.
