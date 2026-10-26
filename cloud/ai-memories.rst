AI Memories
===========

The **AI Memories** page in the AIMMS Cloud Portal lists the memories
the AI assistant uses. A memory is an instruction or fact that the AI
assistant keeps in mind in every conversation it applies to, for example
how to address you or which data to check before making a suggestion.
From this page you can view, create, edit and delete memories.

The page is available to all users:

- **Users** see only their own memories.
- **Account administrators** see the memories of all users in the
  account.

Opening the AI Memories Page
----------------------------

In the Portal sidebar, select **AI** > **AI Memories**.

The Memories Table
------------------

Each row in the table is one memory. By default, the table shows the
following columns:

- **Instruction**: The content of the memory, that is, what the AI
  assistant remembers.
- **Level**: Who the memory applies to. The level is set automatically
  from the scope you choose when you create the memory (see
  `Choosing a Scope`_), for example **Account** or **User**.
- **Applies to**: The user, environment and account the memory applies
  to, for example ``User admin (account my-account, environment ROOT)``.
- **Modified**: The date and time of the last change.
- **Modified by**: The user who made the last change, and their account.
- **Version**: The version number of the memory. Every saved change
  creates a new version.

Customizing the Table
---------------------

Click **Manage columns** in the top-right toolbar to show or hide
columns, tailoring the table to your needs.

Filtering Memories
------------------

Click **+ Add filter** at the top of the page to filter the memory list.
You can apply multiple filters at the same time across different
columns. Click **Apply filters** to update the list, or
**Clear filters** to remove all active filters.

Creating a Memory from the Chat
-------------------------------

You can also ask SENSAI to remember something while you chat with it,
for example *Please remember that I'm building optimization and
planning apps*, or start with *From now on…*. SENSAI confirms what it
saved, and the memory appears on the AI Memories page. See
:doc:`sensai-chat` for details.

Creating a Memory
-----------------

Click **New memory** in the top-left of the table toolbar to open the
create memory page. The page has a large **Instruction** editor on the
left and the memory details on the right. Fields marked with an asterisk
(\*) are required.

- **Instruction** \*: What the AI assistant should remember, for example
  ``Always reply in English`` or an instruction to check certain data before
  making a suggestion.
- **Scope**: Who the memory applies to. Defaults to **User - one
  person**. See `Choosing a Scope`_ below.
- **Account**: The account the memory belongs to. Defaults to your
  current account.
- **Environment** \*: The environment the memory applies to. Defaults to
  your own environment.
- **User** \*: The user the memory applies to. Defaults to the user you
  are logged in as.
- **Surface**: Where the AI assistant uses the memory. Defaults to
  **Every surface**. To limit the memory to one surface, choose one of:

  - **AIMMS IDE**: The AI assistant in the AIMMS development environment.
  - **aimms_session**: The AI assistant in running AIMMS app sessions.
  - **Data Ready**: The AI assistant in Data Ready.
  - **portal**: SENSAI in the AIMMS Cloud Portal (see :doc:`portal-sensai`).
- **Note**: An optional note about the memory, for example why it was
  added.

Click **Create** in the top-right corner to save the memory, or click
**Back to memories** to return to the AI Memories page without saving.
The **Create** button becomes available once all required fields are
filled in.

Choosing a Scope
^^^^^^^^^^^^^^^^

The scope combines two choices:

- **Who the memory is for**: every account on the deployment (Global),
  everyone in one account, everyone in one environment, or one user.
- **Which app it is pinned to, if any**: no app, one app in every
  version, or one specific version of an app.

The scopes you can choose from depend on your role:

- **Users** can only choose the user scopes: **User - one person**,
  **User - one app, every version** and **User - one app, one version**.
- **Account administrators** can choose from all scopes except
  **Global**, which is only available to global administrators.

The scope you choose determines the **Level** shown in the memories
table. You can also filter the table by level.

.. list-table::
   :header-rows: 1
   :widths: 30 30 40

   * - Who the memory is for
     - App
     - Level
   * - Every account on the deployment
     - No app
     - **Global**
   * - Everyone in one account
     - No app
     - **Account**
   * -
     - One app, every version
     - **Account app**
   * -
     - One app, one version
     - **Account app version**
   * - Everyone in one environment
     - No app
     - **Environment**
   * -
     - One app, every version
     - **Environment app**
   * -
     - One app, one version
     - **Environment app version**
   * - One user
     - No app
     - **User**
   * -
     - One app, every version
     - **User app**
   * -
     - One app, one version
     - **User app version**

When you select a scope that is pinned to an app, enter the app name,
and for a specific version also the app version.

.. note::
   App-level scopes are not available for the **portal** and
   **Data Ready** surfaces.

Managing Individual Memories
----------------------------

Right-click a memory row to open the context menu with the following
options:

- **Open**: Opens the memory, where you can view its details and edit
  it.
- **Delete**: Permanently removes the memory.

You can also select a row and click **Open** or **Delete** in the
toolbar.

Viewing a Memory
^^^^^^^^^^^^^^^^

Right-click a memory row and select **Open**. The memory opens in
read-only mode, with the **Instruction** on the left and the memory
details on the right:

- **Version**: The version of the memory you are viewing, followed by
  the user who saved it and their account, for example
  ``v1 - admin (my-account)``. The latest version is shown by default.
- **Action**: What was done in this version, for example **Created**.
- **Changed**: The date and time of the change, and the user who made
  it, for example ``15/10/2026, 14:27:15 - admin (my-account)``.
- **Note**: The optional note added when the memory was saved.
- **Applies to**: The user, account and environment the memory applies
  to, for example ``User admin (account my-account, environment ROOT)``.

Click **Back to memories** to return to the AI Memories page.

Viewing and Restoring Earlier Versions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Every time a memory is saved, a new version is created. To see an
earlier version, select it from the **Version** list. The instruction
and details change to show the memory as it was in that version.

When you view an earlier version, the **Edit** and **Delete** buttons in
the top-right corner are replaced by **Restore** followed by the version
number, for example **Restore v1**. Click it to restore that version.

Restoring does not overwrite the history. It saves the content of the
earlier version as a new, latest version, and the **Edit** and
**Delete** buttons are shown again.

Editing a Memory
^^^^^^^^^^^^^^^^

Open the memory and click **Edit** in the top-right corner. You can
change the following fields:

- **Instruction** \*
- **Note**: Optionally, describe the change you made.

The scope of a memory, shown under **Applies to**, cannot be changed. To
change who a memory applies to, create the memory again with the new
scope and delete the original one. While you are editing, the
**Version** list is not available.

Click **Save** in the top-right corner to apply your changes. The
**Save** button becomes available once you have made a change. Saving
creates a new version of the memory; earlier versions stay available in
the **Version** list. Click **Cancel** to discard your changes.

Deleting a Memory
^^^^^^^^^^^^^^^^^

Right-click a memory row and select **Delete**, or select the row and
click **Delete** in the toolbar. You can also click **Delete** in the
top-right corner of an opened memory. The memory is permanently deleted.
