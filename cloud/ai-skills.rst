AI Skills
=========

The **AI Skills** page in the AIMMS Cloud Portal lists the AI skills
available on your AIMMS Cloud Platform account. From this page you can
view, filter and export skills, and create new ones.

The page is available to all users:

- **Users** see only the skills they created. They can still use shared
  skills, that is, skills that apply to their whole account, their
  environment or every account on the deployment, even though these
  skills are not listed on their AI Skills page.
- **Administrators** see the skills created by all users in the account.

Opening the AI Skills page
--------------------------

In the Portal sidebar, select **AI Skills**.

The Skills Table
----------------

Each row in the table is one skill. By default, the table shows the
**Name**, **Description**, **Source**, **Surface**, **App Name**,
**Modified By** and **Modified At** of each skill. Use **Manage columns**
to show more columns, such as **Body**, **Account**, **Environment**,
**User** and **App Version** (see `Customizing the Table`_).

Some columns have specific values:

- **Source** shows ``user`` for skills created by a user and
  ``platform`` for skills provided by AIMMS.
- **Mine** shows ``Yes`` for skills you created. This helps
  administrators, who see the skills of all users in the account, find
  their own skills.
- Empty **Environment**, **User**, **App Name** and **App Version**
  cells mean the skill is not limited to a specific environment, user,
  app or app version. For example, a skill with only an account filled
  in applies to everyone in that account.
  
Customizing the Table
---------------------

Click **Manage columns** in the top-right toolbar to show or hide
columns, tailoring the table to your needs. You can hide default columns
and add extra columns such as **Body**, **Mine**, **Account**,
**Environment**, **User** and **App Version**.

Exporting Skills
----------------

Click **Download** in the top-right toolbar to export the current skill
list for offline analysis or reporting.

Filtering Skills
----------------

Click **+ Add filter** at the top of the page to filter the skill list.
You can apply multiple filters at the same time across different
columns, for example by source, surface, scope or account. Click
**Apply filters** to update the list, or **Clear filters** to remove all
active filters.

Creating a Skill
----------------

Click **Create skill** in the top-left of the table toolbar to open the
create skill page. The page has a large **Body** editor on the left and
the skill details on the right. Fields marked with an asterisk (\*) are
required.

- **Body** \*: The content of the skill, that is, the instructions the AI
  assistant follows when it uses the skill. Click **Switch to preview**
  in the top-right corner of the editor to see the formatted content,
  and click it again to go back to editing.
- **Name** \*: The name of the skill.
- **Description**: A short description of what the skill does and when
  it should be used.
- **Surface**: Where the skill is used. Defaults to **portal**. The
  surface cannot be changed after the skill is created. Choose one of:

  - **AIMMS IDE**: The AI assistant in the AIMMS development environment.
    Shown as ``aimms_ide`` in the skills table.
  - **aimms_session**: The AI assistant in running AIMMS app sessions.
  - **Data Ready**: The AI assistant in Data Ready. Shown as
    ``data_ready`` in the skills table.
  - **portal**: SENSAI Chat in the AIMMS Cloud Portal.
- **Required feature**: The name of an account feature that must be
  enabled for the skill to be used. Leave empty if the skill should be
  available without a specific feature. See the warning below.
- **Scope**: Who the skill applies to. Defaults to **User - one
  person**. See `Choosing a Scope`_ below.
- **Account**: The account the skill belongs to. Defaults to your
  current account. Only users with a global role can select another
  account.
- **Environment**: The environment the skill applies to. If you leave
  this field empty, the skill applies to your own environment, that is,
  the environment of the user you are logged in as.
- **User**: The user the skill applies to. If you leave this field
  empty, the skill applies to the user you are logged in as. The field
  shows your user name as a placeholder, for example ``admin``.

.. warning::
   The **Required feature** name is matched exactly against the features
   enabled for the account. The name is not checked when you save the
   skill, so a misspelled or unknown feature name is accepted without an
   error. In that case the skill is never used. Make sure you enter the
   exact name of an existing feature.

Click **Create** in the top-right corner to save the skill, or click
**Back to skills** to return to the AI Skills page without saving. The
**Create** button becomes available once all required fields are filled
in.

Choosing a Scope
^^^^^^^^^^^^^^^^

The scope combines two choices:

- **Who the skill is for**: every account on the deployment (Global),
  everyone in one account, everyone in one environment, or one user.
- **Which app it is pinned to, if any**: no app, one app in every
  version, or one specific version of an app.

The scopes you can choose from depend on your role:

- **Users** can only choose the user scopes: **User - one person**,
  **User - one app, every version** and **User - one app, one version**.
- **Account administrators** can choose from all scopes except
  **Global**.

.. list-table::
   :header-rows: 1
   :widths: 40 60

   * - Scope
     - The skill applies to
   * - **Global - every account on this deployment**
     - All accounts on the AIMMS Cloud deployment. Only available to
       global administrators.
   * - **Account - everyone in one account**
     - All users in the selected account.
   * - **Account - one app, every version**
     - One app in the selected account, in all of its versions.
   * - **Account - one app, one version**
     - One specific version of an app in the selected account.
   * - **Environment - everyone in one environment**
     - All users in the selected environment.
   * - **Environment - one app, every version**
     - One app in the selected environment, in all of its versions.
   * - **Environment - one app, one version**
     - One specific version of an app in the selected environment.
   * - **User - one person**
     - One user only.
   * - **User - one app, every version**
     - One user, when working with one app, in all of its versions.
   * - **User - one app, one version**
     - One user, when working with one specific version of an app.

Use the **Account**, **Environment** and **User** fields to select the
account, environment or user that the scope refers to.

When you select a scope that is pinned to an app, the form asks for
extra details:

- **one app, every version**: enter the app name.
- **one app, one version**: enter the app name and the app version.

.. note::
   App-level scopes are not available for the **portal** and
   **Data Ready** surfaces.


Managing Individual Skills
--------------------------

Right-click a skill row to open the context menu with the following
options:

- **Open**: Opens the skill, where you can view its details and
  versions and edit it.
- **Delete**: Permanently removes the skill.

Viewing a Skill
^^^^^^^^^^^^^^^

Right-click a skill row and select **Open**. The skill opens in
read-only mode, with the **Body** on the left and the skill details on the right.
Click **Switch to preview** in the top-right corner of the body to see
the formatted content.

The details show:

- **Version**: The version of the skill you are viewing, followed by the
  user who saved it and their account, for example
  ``v2 - admin (trusha-task)``. The latest version is shown by default.
- **Name** and **Description**: The name and description of the skill.
- **Required feature**: The account feature the skill requires, if any.
- **Surface**: Where the skill is used.
- **Action**: What was done in this version: **Created**, **Updated**
  or **Rolled back**.
- **Changed**: The date and time of the change, and the user who made
  it.
- **Based on**: For a rolled-back version, the earlier version it was
  restored from, for example ``v2``.
- **Note**: An optional note about the change, for example
  ``Restored v2``.
- **Scope**: Where the skill applies, for example
  ``account: trusha-task``, ``environment: ROOT`` and ``user: admin``.

Click **Back to skills** to return to the AI Skills page.

Viewing and Restoring Earlier Versions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Every time a skill is saved, a new version is created. When you open a
skill, the latest version is shown. To see an earlier version, select it
from the **Version** list, for example ``v1 - admin (trusha-task)``. The
body and details change to show the skill as it was in that version.

When you view an earlier version, the **Edit** button in the top-right
corner is replaced by **Roll back to** followed by the version number,
for example **Roll back to v3**. Click it to restore that version.

Rolling back does not overwrite the history. It saves the content of the
earlier version as a new, latest version, and the **Edit** button is
shown again. In the new version:

- **Action** shows **Rolled back**.
- **Based on** shows the version you restored, for example ``v3``.
- **Note** shows which version was restored, for example
  ``Restored v3``.

Editing a Skill
^^^^^^^^^^^^^^^

Open the skill (right-click the row and select **Open**) and click
**Edit** in the top-right corner. You can change
the following fields:

- **Name** \*
- **Description**
- **Body** \*
- **Required feature**

The **Surface** and **Scope** of a skill cannot be changed:

- **Surface** is set once, when the skill is created. To move a skill to
  a different surface, create the skill again with the new surface and
  delete the original one.
- **Scope** is set once, when the skill is created. To change where a
  skill applies, create the skill again with the new scope and delete
  the original one.

While you are editing, the **Version** list is not available.

Click **Save** in the top-right corner to apply your changes. The
**Save** button becomes available once you have made a change. Saving
creates a new version of the skill; earlier versions stay available in
the **Version** list. Click **Cancel** to discard your changes.

Deleting a Skill
^^^^^^^^^^^^^^^^

Right-click a skill row and select **Delete**. You are asked to confirm
before the skill is permanently deleted.

Bulk Actions
------------

To delete multiple skills at once, select the rows you want and click
**Delete** in the toolbar, then confirm. The number of selected rows is shown at the
bottom left of the table.
