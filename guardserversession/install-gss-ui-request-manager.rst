Install UI Request manager
===========================

The request manager is a dialog page with name ``gss_request_manager``.
Please ensure that the slug of that page is ``gss_request_manager`` by closing AIMMS, and checking the ``webui.json`` file.

The request manager is a custom ``dialogpage`` one row, eight columns.

The layout consist of one row, two columns, relative size left 1fr, right 3fr.

On the left pane there are two widgets:

#.  A scalar widget, named ``scalarGSSSessionSelection``, to make selections of the sessions shown.

#.  A download widget, named ``downloadGSSSessionLog``, permitting to download the AIMMS session log of that session (only avialable on AIMMS PRO on Prem).

On the pane to the right, there is only a table widget, named ``tableGSSSelectedSessions``

In the below, the details of each widget is presented.

The scalar widget ``scalarGSSSessionSelection``
---------------------------------------------------------

The contents of this widget are:

* ``gss::ep_listSessionsSince``

* ``gss::bp_allUsers``

* ``gss::bp_allModels``

* ``gss::bp_allVersions``

The download widget ``downloadGSSSessionLog``
----------------------------------------------------

The action of this widget is the procedure ``gss::pr_downloadSessionLog``.

The visibility is controlled by the parameter ``gss::bp_downloadSessionLogFile``

The title is the literal string "Session log of selected session".

The table widget ``tableGSSSelectedSessions``
--------------------------------------------------

The contents of this widget are:

* ``gss::sp_application``

* ``gss::sp_createTime``

* ``gss::sp_userEnv``

* ``gss::sp_userName``

* ``gss::p_currentStatus``

* ``gss::sp_currentStatus``

* ``gss::bp_gotResults``

* ``gss::bp_mark``

The Identifier Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Set the display domain of each of the above identifiers to 1, except ``p_currentStatus``, set this to 0.

Miscellaneous
^^^^^^^^^^^^^^

Set the decimal places to 0, and the title to ``gss::sp_titleRequestManager``.

Widget Extensions
^^^^^^^^^^^^^^^^^^^^^^^^

Widget actions: ``gss::sp_widgetActionsRequestManager``

Item actions: ``gss::sp_itemActionsRequestManager``

Store focus
^^^^^^^^^^^^^^^^^^^^^^^^^ 

Link ``gss::i_sess`` to ``gss::ep_selectedSession``




