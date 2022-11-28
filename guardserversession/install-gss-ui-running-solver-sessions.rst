Inspect Running Solver Sessions
=================================

In this section, the installation of running solver sessions is detailed.

Start
--------------------

Start with creating a page named ``GSSInspectRunningSessions``.

We will first check the layout of the page, and then start adding each of the three widgets in a separate section.

Layout of page
-----------------------

Choose Layout 9, adapt it, by choosing "row" for the ``gridAutoFLow`` of ``area A``.

Overview of Running Solver Sessions
------------------------------------

The first widget to be added is a table widget named ``tableGSSRunningSessionList``.
The contents of this widget should be:

* ``gss::sp_requestDescription``

* ``gss::sp_application``

* ``gss::sp_createTime``

* ``gss::sp_userEnv``

* ``gss::sp_userName``

* ``gss::sp_requestProcedure``

* ``gss::p_runTimeoutHour``


Identifier Settings
^^^^^^^^^^^^^^^^^^^^^^ 

In the Identifier Settings of each of the above identifiers, change the index ``gss::i_sess`` to ``gss::i_runningSess``

Pivoting
^^^^^^^^^^^^^^

swap rows and cols.

Store Focus
^^^^^^^^^^^^^^^^^^

Map ``gss::i_runningSess`` to ``gss::ep_selectedSession``



Miscellaneous
^^^^^^^^^^^^^^^^

The title of this table should be set to ``gss::sp_titleRunningSessionList``

Widget Extensions
^^^^^^^^^^^^^^^^^^^^^^^^^^ 

Widget Actions should be set to ``gss::sp_widgetActionsRunningSessionList``

Item Actions should be set to ``gss::sp_itemActionsRunningSessionList``

Progress table of selected session
------------------------------------

The second widget to be added is a table widget named ``tableGSSProgressData``

Contents
^^^^^^^^^^^^

The contents of the widget should be ``gss::sp_value``
In the Identifier Settings, 

* switch index ``gss::i_timeSlot`` to ``gss::i_progressTimeslot``, and

* switch index ``gss::item`` to ``gss::i_shownItem``

Pivoting
^^^^^^^^^^^^

Pivoting: rows: ``gss::i_progressTimeslot``, Columns: ``gss::i_shownItem``, Totals: ``<IDENTIFIER>``.

Miscellaneous properties:
^^^^^^^^^^^^^^^^^^^^^^^^^^

Default column width: ``gss::p_progressColwidth``

Title:  ``gss::sp_progressTitle``

The Gap Curve
------------------

The third widget is a (classic) line chart named ``linechartGSSGapDevelopment``

Contents
^^^^^^^^^^

* ``gss::p_GAP``
* ``gss::p_Incumbent``
* ``gss::p_Bestbound``

Identifier Settings
^^^^^^^^^^^^^^^^^^^^^^^^

For each of the above identifiers, switch index ``gss::i_timeSlot`` to ``gss::i_gapObDevTimeslot``.

Miscellaneous
^^^^^^^^^^^^^^^^^^

Title should be ``gss::sp_titleGapEvolutionWidget``
















