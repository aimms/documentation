Security Events
===============

The **Events** page in the AIMMS Cloud Portal lists security-related
activity in your account, such as sign-ins, sign-outs, session creation
and tokens issued to clients. Use it to review who accessed your account,
when, and from where.

.. note::
   This page is available to account administrators only.

Opening the Events Page
-----------------------

In the Portal sidebar, select **Security** > **Events**.

Page Overview
-------------

The Events page is divided into two tabs:

- **Data**: The table of security events.
- **Stats**: Aggregated statistics on the security events.

The Data Tab
------------

The Data tab lists events with the newest first. By default, it shows
events from the last 7 days.

Each row in the table is one event and shows the following information:

- **ID**: The unique identifier of the event.
- **Occurred at**: The date and time of the event.
- **Event type**: What happened, for example *PRO login success*,
  *Session issued*, *Logout* or *Client token issued*.
- **Category**: The group the event belongs to, for example *Issuance*.
- **Account**: The account in which the event occurred.
- **Environment**: The environment of the user involved, if any.
- **User**: The user involved, if any.
- **Client**: The application or service involved, for example a runtime
  service requesting a token. This is empty for browser sign-ins.
- **IP address**: The address the request came from.

The table displays events in pages. Use the arrows at the bottom of the
table to move between pages.

Filtering Events
----------------

Click **+ Add filter** at the top of the page to filter the event list.
You can apply multiple filters at the same time across different columns,
for example by event type, user or IP address. Click **Apply filters**
to update the list, or **Clear filters** to remove all active filters.

To change the time range, edit the **Occurred at** filter.

Customizing the Table
---------------------

Click **Manage columns** in the top-right toolbar to show or hide
columns, tailoring the table to your needs.

Exporting Events
----------------

Click **Download** in the top-right toolbar to export the current event
list for offline analysis or reporting.

Viewing Event Details
---------------------

To see all information about an event, select its row and click
**Details** in the toolbar, or right-click the row and select
**Show details**. The details of the event open on a separate page.
Click **Back** to return to the event list.

The Stats Tab
-------------

The Stats tab shows aggregated figures for the events that match your
current filters. Use it to spot unusual activity, for example a high
number of failed sign-ins for one event type.

By default, the statistics are broken down by **Event type**, with one
row per event type and the following columns:

- **Events**: The number of events recorded.
- **Attempts**: The number of attempts behind those events. This can be
  higher than the number of events, for example when repeated failed
  attempts are recorded together.
- **Users**: The number of different users involved.
- **IP addresses**: The number of different IP addresses the requests
  came from.
- **Accounts**: The number of different accounts involved.

To slice the data further, click **+ Add breakdown** and select another
column to group the results by. Click **Clear breakdown** to remove all
breakdowns.

Click **Manage stats** to show or hide statistics columns, and
**Download** to export the statistics for offline analysis or reporting.

Filters you apply at the top of the page are kept when you switch
between the **Data** and **Stats** tabs.
