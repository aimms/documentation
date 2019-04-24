Callbacks and hooks provided by CDM
***********************************

For many functionalities in the CDM library, the CDM library will specify default behavior, which can be overwritten for specific applications, might the need arise. In this section we will describe all hooks and callbacks that you can provide to override the default CDM behavior.

Remote commit notification
==========================

Upon every commit to a category in CDM, all connected clients will get a notification about the particular revision begin committed. You can specify how CDM should react to such notifications through the optional :token:`commitNotificationProcedure` argument of the procedures :js:func:`cdm::CreateCategory` and :js:func:`cdm::ConnectToCategory`.

Default implementation
----------------------

By default, the CDM library will call the procedure :token:`cdm::DefaultCommitInfoNotification` for every commit notification. It will automatically pull the changes for the category, if the branch being committed to is current branch for the specified category, and :token:`cdm::AutoPullCategory` has been set for the category.

Providing commit info
=====================

When committing changes, you can provide a callback which will set the commit author and provide the commit comment through the optional argument :token:`commitInfoProvider` of the :js:func:`cdm::CommitChanges` procedure.

Default implementation
----------------------

The default callback for this argument is the procedure :token:`cdm::CommitInfoProvider` which will get 

* the author from the parameter :token:`cdm::CommitAuthor`, which is set during the initialization of the session based on the run context
* the commit comment from the parameter :token:`cdm::CommitComment`, which you should set to an appropriate context-specific value programmatically, or which can be set by the end-user when committing from the :token:`Branch and Revision Overview` page.

Local data change notification
==============================

Upon data change in your model, the CDM library will get a notification from the AIMMS engine. If the CDM library detects data changes in any of your categories, it will call the procedure specified through the optional :token:`dataChangeProcedure` argument of the procedures :js:func:`cdm::CreateCategory` and :js:func:`cdm::ConnectToCategory`.

Default implementation
----------------------

By default, the CDM library will call the procedure :token:`cdm::DataChangeProcedure` for every data change notification, if it applies to the category at hand. The default implementation will automatically commit the changes for the category, if the parameter :token:`cdm::AutoPullCategory` has been set for the category.

Changes in connected state
==========================

Whenever a change in connected state the CDM service takes place, the CDM DLL will call the pre-defined procedure :js:func:`cdm::SetCDMConnectedState`. The callback will be called initially when the CDM library initially connects to the CDM service, and it will subsequently be called whenever you disconnect explicitly, or when the heartbeat mechanism included in the CDM library reports a failing connection to the CDM service.

By default, the only action taken by :js:func:`cdm::SetCDMConnectedState` is to set the parameter :token:`cdm::ConnectedToCDMService` to the appropriate value. It will in no way try to re-connect to the CDM service, if the connection has fallen away.

You can modify the behavior of :js:func:`cdm::SetCDMConnectedState` by assigning the a procedure to the global hook :token:`cdm::ConnectedStateProcedureHook`, which will be called at the end of :js:func:`cdm::SetCDMConnectedState`. In such a hook, you can, for instance, try to reconnect to the CDM service, or take any other measure to notify your end-users of the fact the connection has been dropped or has come up again.

Getting notified of errors
==========================

By default, all `low-level API <api.html>`_ and `high-level API <dtd.html#high-level-versus-low-level-api>`_ CDM functions provide their status through return values, returning 1 for success, and 0 in case of failure. 

All error messages, codes, dates and stack locations reported through the low-level API are collected in the identifiers in the :token:`Error Handling` section of the CDM library, whether you call the low-level API functions directly, or indirectly by calling high-level API functions. 

All low-level API methods also call the procedure pointed to by the :token:`cdm::OnErrorProcedureHook` parameter. You can use this hook to set a function, that you can use, for instance, to notify the end-user of any error occurring while calling either the low- or high-level CDM API. You can also use the on-error hook to raise error that you can catch in on-error blocks elsewhere in your code, or in the global AIMMS error handler.

The CDM library provides two default on-error hooks:

* :token:`cdm::EmptyOnErrorHook` (default), which just return 0. With the on-error hook you need to check the error codes of all low- and high-level API methods
* :token:`cdm::ErrorRaisingOnErrorHook`, which will raise an error that you can catch in an on-error block, reporting back the last reported CDM error.

Custom handling of conflict resolution
======================================

Either when pulling in changes, or when merging branches, merge conflicts can occur as discussed `here <dtd.html#merging-branches-and-resolving-conflicts>`_. Through the element parameter :token:`cdm::SelectedConflictResolutionMethod`, a `conflict resolution method <dtd.html#merging-branches-and-resolving-conflicts>`_ can be selected. 

When you specify the :token:`Custom` conflict resolution method, the CDM library will call the procedure pointed to by the element parameter :token:`cdm::ResolveConflictsHook`. Using this mechanism you can implement a custom, app-specific, conflict resolution method. 

In your conflict resolution method, you should select for all identifiers with conflicts whether, for each index tuple with conflicting values, you want to assign 

* the remote value (either from the pulled-in changes, or from the branch to merge in the current branch), or 
* the locally changed value (from a change by the local user when pulling in commits, or, when merging in another branch, from the changes on the current branch since the revision where the branch to merge in, was branched off the current branch).

Selecting remote or local value
-------------------------------

You can select for either value by either setting the value of

* the associated :token:`cdmrt::dori` `shadow identifier <impl.html#shadow-identifiers>`_ to 0 if you want to select the remote value (stored in the :token:`cdmrt::dii` identifier), or
* the associated :token:`cdmrt::diri` shadow identifier to 0 if you want to select the locally changed value (stored in the :token:`cdmrt::doi` identifier).

If your custom conflict resolution method returns 1, the CDM library will consider all conflicts resolved, and will assign all values of the :token:`cdmrt::dii` identifiers to their corresponding actual identifiers for all tuples for which :token:`cdmrt::diri` still hold non-zero values. This will override all actual values, whether or not they have been locally changed. 

Notice that the procedure to resolve conflicts will not commit the resulting local changes after resolving all conflicts to the CDM database. You can commit these local changes by explicitly `committing <dtd.html#committing-data>`_ the changes for the given category.
