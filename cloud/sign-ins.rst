Sign-ins
========

The **Sign-ins** page in the AIMMS Cloud Portal lists the active sign-ins
in your account. Use it to see who is signed in, from where and with
which browser or tool, and to end a sign-in or sign out a user when needed, for example
when a device is lost or an account may be compromised.

.. note::
   This page is available to account administrators only.

Opening the Sign-ins Page
-------------------------

In the Portal sidebar, select **Security** > **Sign-ins**.

The Sign-ins Table
------------------

By default, the page shows sign-ins from the last 7 days. Each row in
the table is one sign-in and shows the following information:

- **Kind**: How the user signed in, for example *Browser*.
- **Account**: The account the sign-in belongs to.
- **Environment**: The environment of the user.
- **User**: The user who signed in. Your own sign-in is marked
  **Current session**.
- **Client**: The application used to sign in, if any.
- **IP address**: The address the sign-in came from.
- **User agent**: The browser or tool used to sign in.
- **Issued at (GMT)**: When the sign-in started.
- **Expires at (GMT)**: When the sign-in expires and the user has to
  sign in again.

Filtering Sign-ins
------------------

Click **+ Add filter** at the top of the page to filter the sign-in
list, for example by user or IP address. Click **Apply filters** to
update the list, or **Clear filters** to remove all active filters.

To change the time range, edit the **Issued at** filter.

Customizing the Table
---------------------

Click **Manage columns** in the top-right toolbar to show or hide
columns, tailoring the table to your needs.

Revoking a Sign-in
------------------

Select a sign-in in the table and click **Revoke** in the toolbar, or
right-click the row and select **Revoke**.

The selected sign-in ends, and the user has to sign in again on that
browser or device. Other sign-ins of the same user stay active.

Signing Out a User
------------------

Select the user's sign-in in the table and click **Sign out user** in
the toolbar, or right-click the row and select **Sign out user**.

The user is signed out of the Portal and has to sign in again to
continue.
