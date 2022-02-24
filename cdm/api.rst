Low-level CDM API
*****************

Below you will find a description of the external procedures in the CDM library that make up the low-level CDM API. These methods will mostly be called by higher-level AIMMS procedures in the CDM library, but may potentially also be called independently to implement functionality beyond that of the higher level functions.

Library Management Functions
============================

.. js:function::  cdm::CreateCDMRuntimeLibrary(categoryMap,categoryOrder,alternateName)

   This function creates the ``CDMRuntime`` library, and sets up the internal data structures in the ``libcdm.dll`` needed to communicate category data with a CDM server. 

   :param categoryMap: provides the map of all identifiers to a CDM category
   :param categoryOrder: specifies the relative order of dependencies between such identifiers, where a higher order identifier depends on lower order identifiers
   :param alternateName: specifies an optional alternate name for each identifier under which it may still be found in the CDM database in case of a name change.

.. js:function::  cdm::UninitializeCDMLibrary

   This function closes all connections to the CDM service the CDM client is connected to, stops the embedded CDM server (if started), and removes all internal data structures for categories and identifiers in those categories in the ``libcdm.dll``.

.. js:function::  cdm::StartListeningToDataChanges(timeout)

   This function will cause ``libcdm.dll`` register itself with the AIMMS engine to be notified of changes to any identifier data, and starts separate thread to examine which CDM category (if any) are affected by these data changes, and for each of them calls an internal callback procedure specified in the :any:`cdm::CreateCategory` or :any:`cdm::ConnectToCategory` calls (with default implementation ``cdm::DataChangeProcedure``) to act upon such a change. Based on the user-specified settings for the category, the CDM library may decide to automatically commit such changes, or register the change for the user to act upon, or take the actions implemented by a user-specified callback.
  
   :param timeout: notifies the timeout in milliseconds, the ``libcdm.dll`` will wait before examining all CDM categories after receiving the last data change notification from the AIMMS engine

.. js:function::  cdm::StopListeningToDataChanges

   This function will cause ``libcdm.dll`` to stop reacting to data change notifications by the AIMMS engine.

ApplicationDB Functions
=======================

.. js:function::  cdm::ConnectToApplicationDatabase(URL,dbName,callTimeout,commitTimeout)

   Create a connection to the CDM server at the specified hostname and port, connect to the given application database, and register the given application database to use this connection for subsequent low-level calls. If the application database requested does not exist yet, the CDM server will create an empty application database with the given name. The call will fail if the server cannot be reached, of if the user is not `authorized <auth.html>`_ to access the application database. 

   :param URL: should be of the form ``tcp://hostname:port`` and specifies the hostname and TCP port where the CDM server can be reached
   :param dbName: specifies the name of the application database to connect to. Notice that a single CDM server can serve multiple application database, each hosting a separate CDM data repository.
   :param callTimeout: specifies the timeout that will be applied on any call to the given CDM server (default 30000 ms). 
   :param commitTimeout: specifies the timeout that will be applied waiting for commits to be finished (default 300000 ms). Increase this number only when your application makes huge commits, which cannot be handled by the CDM server within the default timeout. 
   
   When successfully connecting to the CDM service, the :any:`cdm::ConnectToApplicationDatabase` function will call the ``cdm::SetCDMConnectedState`` callback. This callback will also be called whenever the connection to the CDM service drops. The ``cdm::SetCDMConnectedState`` will store the connected state in the ``cdm::ConnectedToCDMService`` parameter, and will call the procedure pointed to by the ``cdm::ConnectedStateProcedureHook`` parameter. This allows you to gracefully handle connection state changes in your application code, e.g. by trying to reconnects if the connection drops.

.. js:function::  cdm::DeleteApplicationDatabase(dbName)
   
   Delete the given application database. The function will fail if there is no connection the given application database, of if the user is not `authorized <auth.html>`_ to delete the application database.  
  
   :param dbName: specifies the name of the application database to delete.

.. js:function::  cdm::CloneApplicationDatabase(dbName, dbTo, configFile)

   Clone the given application database ``dbName`` to application database ``dbTo`` running on the database server specified through ``configFile``. This function may be used to change a CDM database between any of the supported database backends. 
  
   :param dbName: specifies the name of the application database to clone.
   :param dbTo: specifies the schema to which the existing application database is cloned.
   :param configFile: CDM configuration file which specifies the database type and settings, and user credentials of the database (server) to which to clone the existing database.

.. js:function:: cdm::RemoveElementsFromDatabase(dbName, setName)

	 Clean up the given application dabatase ``dbName`` by removing all references to elements from the set ``setName`` from all tables. This function will remove all elements from the corresponding name space table, and remove all rows of all datatables where its elements are referenced in either the tuple or in value of element parameters.
	 
	 :param dbName: specifies the name of the application database to clean up.
	 :param setName: specifies the set from with all references to its elements need to be removed from the database.
	 
.. js:function::  cdm::GetKeyValue(db,key,value)
  
   Retrieve the value for the given key from the key-value store embedded within given application database. The function will fail if the specified key cannot be found.
  
   :param db: specifies the application database
   :param key: specifies the key to look for
   :param value: specifies the output argument in which the value will be stored.

.. js:function::  cdm::SetParam(db,param,value)

   Set the value for the given runtime parameter in the key-value store embedded within given application database. The runtime parameter values are persisted, i.e., are *not* restricted to the lifetime of the session in which they are set.
  
   :param db: specifies the application database
   :param param: specifies the runtime parameter to set
   :param value: specifies the value to be stored.

.. js:function::  cdm::GetParam(db,param,value)
  
   Retrieve the value for the given runtime parameter from the key-value store embedded within given application database. The function will fail if the specified runtime parameter cannot be found.
  
   :param db: specifies the application database
   :param param: specifies the runtime parameter to look for
   :param value: specifies the output argument in which the value will be stored.

.. js:function::  cdm::SetKeyValue(db,key,value)

   Set the value for the given key in the key-value store embedded within given application database. The function will fail if the user attempts to set the value for a protected key.
  
   :param db: specifies the application database
   :param key: specifies the key to set
   :param value: specifies the value to be stored.

.. js:function::  cdm::NextUniqueInteger(db,key)

   Atomically return the next unique integer for a given string key. If no integer has been requested for the given key, the value 1 is returned and stored in the key-value store of the 
   given database under using the key ``integerKey-key``. Upon subsequent requests for the same key, the key-value store will be used to compute and save the next integer for the given key. You can use the function :any:`cdm::SetKeyValue` to reset the stored value to an arbitrary value. This function is typically used for uniquely numbering set elements, at the cost of a roundtrip to the CDM service. Alternatively, you can use the function :any:`cdm::CreateUuid` which can a less intuitive unique set element, but does not require a server roundtrip.
  
   :param db: specifies the application database
   :param key: specifies the key for which to get the next unique integer
   
Branch and Revision Functions
=============================

.. js:function::  cdm::EnumerateBranches(db, activeOnly)

   Enumerate all branches in the given application database
  
   :param db: specifies the application database to query
   :param activeOnly: specifies whether to only list branches which have an `active` status

.. js:function::  cdm::CreateBranch(db,branchName,branchAuthor,branchcomment,fromBranch,fromRev,authProfile)

   Create a new branch from a given revision on an existing branch in a given application database. The function will if branch already exists in the application database, if the user has no global authorization to create branches, or to create branches on the given branch
  
   :param db: specifies the name of the application database in which to create a new branch
   :param branchName: specifies the name of the new branch to create
   :param branchAuthor: specifies the name of the user who creates the branch. 
   :param branchcomment: specifies the comment entered by the user when creating the branch
   :param fromBranch: specifies the branch name from which to branch
   :param fromRev: specifies the revision on ``fromBranch`` from which to branch
   :param authProfile: specifies the authorization profile name to apply to the new branch. If left empty, the new branch will inherit the authorization profile from its parent branch

.. js:function::  cdm::DeleteBranch(db,branchName)

   Delete the given branch, its derived branches, and all data on these branches. The function will fail if the branch does not exists, if you do not have the permission to delete the branch, or if you try to delete the protected branches ``system`` or ``master``.
 
   :param db: specifies the name of the application database in which to delete a branch
   :param branchName: specifies the name of the branch to delete

.. js:function::  cdm::DeleteDependentBranches(db,branchName,endRevision)

   Delete all branches, derived branches, and all data on these branches starting on branch ``branchName`` up until revision ``endRevision``. The function will fail if you do not have the permission to delete these branches, or if you try to delete the protected branches ``system`` or ``master``. Note that this function will not delete branch ``branchName`` itself, only the branches sprouting from it.
 
   :param db: specifies the name of the application database in which to delete dependent branches
   :param branchName: specifies the name for which to delete all dependent branches
   :param endRevision: specifies the highest possible end revision before which all branches and child branches on the branch should be removed.

.. js:function::  cdm::SetBranchStatus(db,branchName,active)

   Set the branch status to either active or inactive, which will effect the result of :any:`cdm::EnumerateBranches`. The function will fail if the branch does not exist, or if the user is not authorized to change the branch status.
 
   :param db: specifies the name of the application database in which to set the branch status
   :param branchName: specifies the name of the branch for which to set the status
   :param active: specifies whether the branch should be set as active (1) or inactive (0)

.. js:function::  cdm::GetGlobalBranch(db,branch)

   Get the branch name of the branch in the application database set as the global branch. The global branch is initially set to the ``master`` branch. When calling the high-level ``cdm::ConnectToApplicationDB`` procedure, the CDM library will checkout the latest revision of the global branch after connecting to an application database.
  
   :param db: specifies the name of the application database for which to retrieve the global branch
   :param branch: is the output parameter in which the global branch will be stored

.. js:function::  cdm::SetGlobalBranch(db,branchName)

   Set the global branch for a given application database. The function will fail if the branch does not exist in the application database, or if the user has no authorization to set the global branch.
  
   :param db: specifies the name of the application database for which to set the global branch
   :param branchName: specifies the name of the global branch to set.

.. js:function::  cdm::GetRevisions(db,branchName,lowRev)

   Get the information about all revisions on a specific branch of an application database. The results will be stored in the identifiers in the ``Library Interface/Revision Information`` section of the CDM library.
  
   :param db: specifies the name of the application database from which to retrieve revision information
   :param branchName: specifies the branch to use as a filter to retrieve revision information
   :param lowRev: specifies the lowest revision number to retrieve.
  
Authorization Functions
=======================

.. js:function::  cdm::EnumerateAuthorizationProfiles(db, activeOnly)

   Enumerate the existing authorization profiles from the application database. The results will be stored in the identifiers in the ``Library Interface/Authorization`` section of the CDM library.
  
   :param db: specifies the application database from which to retrieve authorization profiles
   :param activeOnly: specifies whether to retrieve active authorization profiles only

.. js:function::  cdm::AddAuthorizationProfile(db,profileName)

   Add a new `authorization profile <auth.html#creating-authorization-profiles>`_ to the application database. The details of the authorization profile to add will be taken from the identifiers in the ``Library Interface/Authorization`` section of the CDM library. The function will fail if the user is not authorized to add authorization profiles, or if the profile cannot be found in the model data.
  
   :param db: specifies the application database to which to add a new authorization profile
   :param profileName: specifies the name of the authorization profile to add

.. js:function::  cdm::SetAuthorizationProfileStatus(db,profileName,active)

   Set the authorization profile status to either active or inactive, which will effect the result of :any:`cdm::EnumerateAuthorizationProfiles`. The function will fail if the authorization profile 
   does not exist, or if the user is not authorized to change the authorization profile status.
  
   :param db: specifies the name of the application database in which to set the authorization profile status
   :param profileName: specifies the name of the authorization profile for which to set the status
   :param active: specifies whether the authorization profile should be set as active (1) or inactive (0)

.. js:function::  cdm::SetBranchAuthorization(db,branchName,profileName)

   Apply a given authorization profile to a branch in the application database. The function will fail if the profile does not exist or if the user is not authorized to change the authorizations for the given branch.
  
   :param db: specifies the name of the application database for which to set the authorization profile for the branch
   :param branchName: specifies the name of the new branch for which to set the authorization profile
   :param profileName: specifies the name of the authorization profile to apply.
  
Category Functions
==================

.. js:function::  cdm::CreateCategory(db,category,notificationProcedure,dataChangeProcedure)
   
   Create a new category, or update an existing category in the given application database, according to he category information passed through the ``cdm::CreateRuntimeLibrary`` function, and set the notification and data change callback functions for the category. The function will fail if the user is not authorized to create or update the category, or if no information has been specified for the category in the call to ``cdm::CreateRuntimeLibrary``.

   :param db: specifies the application database in which to create or update a category.
   :param category: specifies the category name to add or update.
   :param notificationProcedure: specifies the notification callback to be used when new revision are added for the given category (defaults to ``cdm::DefaultCommitInfoNotification``)
   :param dataChangeProcedure: specifies the data change callback to be used when the CDM library detects changes in the data of the identifiers in the category (defaults to ``cdm::DataChangeProcedure``)

.. js:function::  cdm::ConnectToCategory(db,category,notificationProcedure,dataChangeProcedure)
   
   Connect to an existing category in the given application database, according to he category information passed through the ``cdm::CreateRuntimeLibrary`` function, and set the notification and data change callback functions for the category. The function will fail if the user is not authorized to connect the existing category, or if the category specification provided through  ``cdm::CreateRuntimeLibrary`` does not match the category information stored in the application database.

   :param db: specifies the application database in which to connect to an existing category.
   :param category: specifies the category name to connect to.
   :param notificationProcedure: specifies the notification callback to be used when new revision are added for the given category (defaults to ``cdm::DefaultCommitInfoNotification``)
   :param dataChangeProcedure: specifies the data change callback to be used when the CDM library detects changes in the data of the identifiers in the category (defaults to ``cdm::DataChangeProcedure``).
  
Commit and Pull Functions
=========================

.. js:function::  cdm::CheckoutSnapshot(category,branch,revid,labelsOnly,skipInactive)
   
   Checkout a data snapshot for all identifiers the specified category from the application database, for a given branch and revision. The snapshot can be specified to only retrieve the labels for root sets, or to also contain inactive data, i.e. identifier values registered in the application database for tuples containing root set elements that are not actually contained in the root set themselves in the snapshot. As a result of the call both the actual identifiers of the category will be updated, as well as the shadow identifiers holding the latest committed values and the revision numbers at which these values where committed. Also the branch and revision information for the category will be set to checkout revision. The function will fail if the user has no read access for the category or branch.
   
   When checking out data with the argument ``skipInactive`` set (default), the CDM service can employ an alternative domain filtering strategy on a per-category basis. This alternative strategy is slower when retrieving the data for identifiers with high cardinality and no substantial filtering due to inactive elements in one or more domain sets, but may speed up data retrieval considerably when there is substantial filtering due to inactive elements in domain sets. You can specify that you want to use the alternative domain filtering strategy for a particular category, by setting the runtime parameter ``alternativeFilterStrategy-\<category\>`` to 1 through the function :any:`cdm::SetParam`. By default, the alternative strategy is not used for any category.
   
   :param category: specifies the category for which to retrieve the data snapshot
   :param branch: specifies the branch from which to retrieve the data snapshot for the category
   :param revid: specifies the (optional) specific revision on the branch from which to retrieve the snapshot, if not specified the head of the specified branch will be taken
   :param labelsOnly: specifies an optional argument whether or not to only retrieve root set elements, defaults to 0
   :param skipInactive: specifies an optional argument whether or not to skip inactive data in the snapshot, defaults to 1 

.. js:function::  cdm::RevertToSnapshot(category,branch,revid,skipInactive)
   
   Checkout a data snapshot for all identifiers the specified category from the application database, for a given branch and revision. The snapshot can be specified to also contain inactive data, i.e. identifier values registered in the application database for tuples containing root set elements that are not actually contained in the root set themselves in the snapshot. As a result of the call only the actual identifiers of the category will updated, but not the shadow identifiers holding the latest committed values and the revision numbers at which these values where committed, and the branch and revision information for the category will not be updated either. The function will fail if the user has no read access to the category or branch. This function will only revert the category to the requested category *locally*, committing the category after this call will be actually reverting the data on the current branch of the category to the state of the specified branch and revision *in the application database as well*. 

   :param category: specifies the category for which to retrieve the data snapshot
   :param branch: specifies the branch from which to retrieve the data snapshot for the category
   :param revid: specifies the (optional) specific revision on the branch from which to retrieve the snapshot, if not specified the head of the specified branch will be taken
   :param skipInactive: specifies an optional argument whether or not to skip inactive data in the snapshot, defaults to 1

.. js:function::  cdm::PullChanges(category,resolved,revto)
   
   Retrieve and apply the changes for all identifiers in the given category, compared to the state of the model data for the current branch and revision of that category. The resulting changes will be applied to the actual identifiers, as well as to the shadow identifiers holding the latest committed values and the revision numbers at which these values where committed. In case there are conflicts between the changes being applied pulled from the application database, and changes made to the local identifiers by the end-user, the CDM library will try to `resolve the conflicts <dtd.html#merging-branches-and-resolving-conflicts>`_ based on the current model settings. The function will fail if the user has no read access to the category or branch. If the function succeeds without conflicts, the branch and revision information for the category will be set to latest revision on the current branch.

   :param category: specifies the category for which o 
   :param resolved: specifies an output argument, which indicates whether any conflicts were successfully resolved.
   :param revto: an optional argument, indicating to pull all changes up to which revision. In the absence of this argument, CDM will pull up to the head to the current branch.

.. js:function::  cdm::CherryPickChanges(category,branch,revfrom,revto,resolved)
   
   Cherry pick changes from a range from a given branch, and apply them to all identifiers in the specified category in your current branch. The resulting changes will only be applied to the actual identifiers, In case there are conflicts between the changes being applied pulled from the application database, and changes made to the local identifiers by the end-user, the CDM library will try to `resolve the conflicts <dtd.html#merging-branches-and-resolving-conflicts>`_ based on the current model settings.  To commit them to the application database, subsequently call the function :any:`cdm::CommitChanges`. The function will fail if the user has no read access to the category or branch to cherry pick from.
  
   :param category: specifies the category to which to apply the cherry pick operations
   :param branch: specifies the branch from which to cherry pick
   :param revfrom: specifies the lower bound of the range of revisions on the specified branch to cherry pick changes from
   :param revto: specifies the upper bound of the range of revisions on the specified branch to cherry pick changes from
   :param resolved: specifies an output argument, which indicates whether any conflicts were successfully resolved.

.. js:function::  cdm::ApplyCommits(category,branch,revfrom,revto,resolved,assignToId,applyToCommitted)
   
   Apply changes from a range from a given branch, to the actual and/or committed identifiers of the specified category. In case there are conflicts between the changes being applied pulled from the application database, and changes made to the local identifiers by the end-user, the CDM library will try to `resolve the conflicts <dtd.html#merging-branches-and-resolving-conflicts>`_ based on the current model settings. The function will fail if the user has no read access to the category or branch to cherry pick from.
   This function is a more general version of :any:`cdm::CherryPickChanges` and has its main use when `merging branches <dtd.html#merging-branches-and-resolving-conflicts>`_. 

   :param category: specifies the category to which to apply the selected commits
   :param branch: specifies the branch from which to apply the selected commits
   :param revfrom: specifies the lower bound of the range of revisions on the specified branch to apply the selected commits from
   :param revto: specifies the upper bound of the range of revisions on the specified branch to apply the selected commits from
   :param resolved: specifies an output argument, which indicates whether any conflicts when applying the commits to the actual identifiers were successfully resolved.
   :param assignToId: indicates whether the retrieved changes and any resolved conflicts should be assigned to the local model identifiers.
   :param applyToCommitted: indicates whether the retrieved changes should be assigned to the committed identifiers. 
   
.. js:function::  cdm::MergeDeltaInWithId(category)
   
   Actually merge the changes stored in the ``DeltaInIdentifiers`` in ``CDMRuntime`` library for the specified category into the actual identifiers. Changes will only be applied if the corresponding tuple in ``DeltaInRevisionIdentifiers`` holds a non-zero value. This low-level procedure is used when merging branches, and can used to merge incoming changes when pulling changes or merging branches did not resolve successfully, and manual intervention is required. For examples of use, inspect the function ``cdm::MergeBranches``.

   :param category: specifies the category to which to apply the stored delta in changes.

.. js:function::  cdm::CommitChanges(category,commitInfoProcedure)
   
   Compute the local changes between the actual identifiers in the given category, and, if any, commit the resulting change set to the *current* branch of the category in the application database. If successful, update the ``CommittedIdentifiers`` with the local changes, and set the revision for the category to the revision under which the change set was stored. The function will fail if the user has no write access to the category or branch, or if the client is not at the latest revision of the current branch of the category. In the latter case, the client application should first pull the changes of current category, resolve any conflicts, and re-commit. 
   Through the runtime parameter ``logCommittedValues`` you can specify the number of tuples for which the transferred tuple-value pairs will be logged server side at TRACE level. By default, no logging of such tuple-value pairs will occur. You can set the runtime parameter through the function :any:`cdm::SetParam`.

   :param category: specifies the category for which to commit local changes to the current branch of the category in the application database
   :param commitInfoProcedure: specifies an (optional) callback procedure (with default ``cdm::CommitInfoProvider``), which will be called to retrieve the commit author and comment to be associated with the commit

.. js:function::  cdm::CommitElementsInCategory(category,setName,commitInfoProcedure)

   Commit all data defined over the elements of a given subsets in the given category. If the given subset occurs at multiple index positions in a multi-dimensional identifier, only tuple changes will be committed where any of its elements equals the specified element at each of these locations. If the elements occurs in data of multiple categories, you may have to call this function for each category to achieve the desired effect. 
   
   You can use this function, to perform a partial commit, for instance, when multiple elements have been added to a set, but you only want to commit some of these elements, and its associated data additions. See also the corresponding utility functions to empty, rollback, and clone and rollback data changes for specific element(s).

   :param category: specifies the category for which to commit all data for all identifiers in the category.
   :param setName: specifies the set for which to commit all data for its element
   :param commitInfoProcedure: specifies an (optional) callback procedure (with default ``cdm::CommitInfoProvider``), which will be called to retrieve the commit author and comment to be associated with the commit

.. js:function::  cdm::WaitForCommitNotifications(timeout)

    Wait for incoming commit notifications for the specified timeout, and execute the corresponding commit notification procedure for all commit notifications. The function will return 1 when all available (but at least one) commit notifications are handled, or 0 when the given timeout is reached.
    
    :param timeout: specifies the for which the function will wait for external commit notification to arrive.
    
.. js:function::  cdm::RollbackChanges(category)
   
   Reset the actual values of all identifiers in the given category, back to the values stored in the ``CommittedIdentifiers`` in the ``CDMRuntime`` library for the given category.

   :param category: specifies the category for which to rollback the local changes

.. js:function::  cdm::GetValuesLog(category,paramref,lowRev)
   
   Retrieve a history log of previous values for a *slice* of an identifier in the given category on the *current* branch and store the history in the corresponding ``ValueLogIdentifiers`` of the ``CDMRuntime`` library. You can use this function to retrieve a detailed overview of changes to the given identifier slice, which you can, for instance, subsequently present to an end-user of your application. 
  
   :param category: specifies the category containing the identifier for which to retrieve the history log
   :param paramref: specifies a *slice* of an identifier in your model for which to retrieve the history log
   :param lowRev: specifies the lower bound of revisions for which to report any changes to the given identifier slice.

.. js:function::  cdm::ComputeDeltaOut(category)
   
   Compute the changes between the actual identifiers of the given category and the committed values stored in the ``CommittedIdentifiers`` section of ``CDMRuntimeLibrary`` for the category, store the changed values in the ``DeltaOutIdentifiers`` and set the corresponding tuples in the ``DeltaOutRevisionIdentifiers`` to 1. This low-level function is used when `visually inspecting the differences between revisions <dtd.html#visually-viewing-differences>`_.

   :param category: specifies the category for which to compute the local changes.

.. js:function::  cdm::ResolveIdentifierConflicts(category,idName,useLocal)
   
   Low-level function used to resolved *all* conflicts for a given identifier in a category, either by *always* using the local changes or by *always* using the remote changes in case of a conflict. This function is used by the visual conflict resolution method implemented in the CDM library.

   :param category: specifies the category for which to resolve conflicts
   :param useLocal: specifies whether to always use local changes (1) or remote changes (0). 

.. js:function::  cdm::SetRevision(category,branch,revid)
   
   Set the branch and revision for a given category, regardless of the actual contents of the identifiers in the category, and the contents of the category related shadow identifiers in the ``CDMRuntime`` library. Use this function only if you know what you are doing, as subsequent commits and pulls may give unexpected results if the state of the data in the shadow identifiers does not match the specified branch and revision.
  
   :param category: specifies the category for which to set the branch and revision
   :param branch: specifies the branch to set for the category
   :param revid: specifies the (optional) specific revision within the branch to set for the category, if not set the head revision of the branch will be taken

.. js:function::  cdm::AddBranchToCompareSnapshots(category,branch)
   
   Add data from the given branch to the branch comparison identifiers for the specified category. See `comparing branches <dtd.html#comparing-multiple-branches>`_ for further details.
  
   :param category: specifies the category for which to add branch data to the branch compare identifiers
   :param branch: specifies the branch for which to add data to the branch compare identifiers
   
.. js:function::  cdm::RemoveBranchFromCompareSnapshots(category,branch)
   
   Remove data for the given branch from the branch comparison identifiers for the specified category. See `comparing branches <dtd.html#comparing-multiple-branches>`_ for further details.
  
   :param category: specifies the category for which to remove branch data from the branch compare identifiers
   :param branch: specifies the branch for which to remove data from the branch compare identifiers

Snapshot Functions
==================
   
.. js:function::  cdm::CreateSnapshot(category,branch,revid,cacheUpdate)
   
   Create a cached data snapshot in the database for all identifiers the specified category from the application database, for a given branch and revision. Through the argument ``cacheUpdate``, you indicate how often the cached snapshot needs to be updated in an automated fashion. By specifying a value >= 0, you indicate the interval in seconds since creation after which you want to snapshot to be updated with the latest data on the given category and branch. A value of 0 indicates that the snapshot will be created, but never updated. You can use the latter option for instance to create a cached snapshot that can be used for all branches branching off a given revision higher than the cached snapshot revision.

   The cached snapshot created through this function, will never contain inactive data. If the data in the category depends on domain sets in other categories, the *currently checked out* branches and revisions of such categories  will be passed along to determine the actual content of the snapshot.
   
   :param category: specifies the category for which to create the cached snapshot
   :param branch: specifies the branch from which to created the cached snapshot for the category
   :param revid: specifies the (optional) specific revision on the branch from which to create the cached snapshot, if not specified the head of the specified branch will be taken
   :param cacheUpdate: specifies cache update interval to employ (in seconds), defaults to 86400 seconds (once per day)

   .. warning:: 
        If you are creating snapshots for branches *that are not currently checked out*, you must make sure that the current branches for all categories are set to the branches to which such categories would be set when you actually would check out ``category`` in branch ``branch``. Failure to do so, may lead to a situation where the cached data snapshot will contain data for cross-category domain elements that are present *in the currently checked out branch* for the category containing the corresponding domain set, but not in the branch which will be actually checked out when a check out of category ``category`` will actually use the cached data snapshot. In such a case, CDM will not be able to map the cached cross-category domain elements to actual elements present in the domain set at the time of checkout, and return with an error. 
   
        For such situations, prior to calling :any:`cdm::CreateSnapshot`, you can temporarily set the current branch for any category *without changing the data of that category* using the function :any:`cdm::SetRevision`, where you can retrieve the latest revision of such a branch from the identifier ``cdm::BranchHead`` after calling :any:`cdm::EnumerateBranches`. After calling :any:`cdm::CreateSnapshot` you should reset the branches of all categories back to the branches and revisions of the actual branches that are currently checked out.
     
.. js:function::  cdm::GetSnapshotCache(db)

   Retrieve the collection of checkout snapshots stored in the current database. The snapshot information retrieved is stored in the section ``Library State/Snapshot Information`` of the CDM library. The function returns 1 is successful, or 0 otherwise.
 
   :param db: specifies the name of the application database for which to retrieve the collection of cached snapshots

.. js:function::  cdm::DeleteSnapshot(db,snapshotId)

   Delete a given snapshot from the collection of checkout snapshots stored in the current database. The function returns 1 if successful, or 0 otherwise.
 
   :param db: specifies the name of the application database in which to delete the given snapshot
   :param snapshotId: specifies the id of the snapshot to be deleted.
  
Combine Category Revisions Functions
====================================
   
.. js:function::  cdm::CombineCategoryRevisions(category,branch,endRevision,removeDefaults)

   Combine all most recent values of all revisions for the identifiers in the given ``category`` on the given ``branch`` proper (i.e. not on parent branches) into a single end revision, being the highest revision for the given branch lower than ``endRevision``. When ``removeDefaults`` has the value 1, then all default values at the end revision of the identifier will be subsequently removed from the database. You should only remove defaults if there is no data for the given category in any of the parent branches of ``branch``, or removed values still present on a parent branch may re-appear if you checkout the branch.
   
   :param category: specifies the category for which to combine category revisions
   :param branch: specifies the branch from which to combine category revisions
   :param endRevision: specifies the highest possible end revision on the branch at which to combine category revision
   :param removeDefaults: (optional) argument indicating whether default values should be removed for all identifiers at the computed end revision.

.. js:function::  cdm::FinalizeCombineCategoryRevisions(db,branch,endRevision)

   Finalize combining the most recent values of all revisions for the identifiers in all categories on the given ``branch`` proper (i.e. not on parent branches) into a single end revision, being the highest revision for the given branch lower than ``endRevision``. This function will remove all data on intermediate commits on the given branch, remove revisions from the revision table and update the cardinalities of all changesets at the computed end revision. For this function to be called successfully, there should be no branches left sprouting of the given branch prior to the computed end revision. You can delete such dependent branches through the function :any:`cdm::DeleteDependentBranches`. 
   
   :param db: specifies the database for which to finalize combining category revisions
   :param branch: specifies the branch from which to finalize combining category revisions
   :param endRevision: specifies the highest possible end revision on the branch at which to finalize combining category revisions
   
Embedded Server Functions
=========================

.. js:function::  cdm::StartEmbeddedCDMServer(path,configPath)
   
   Start an embedded CDM server, which can be used for testing CDM during application development. The function fails if the listen port for the CDM service has already been taken.

   :param path: specifies the directory where ``libcdmservice.dll`` can be found
   :param configPath: specifies the directory from which to take the ``CDMConfig.xml`` file from which the embedded server will read its configuration

.. js:function::  cdm::StopEmbeddedCDMServer()

   Stop an embedded CDM server started earlier.

Utility Functions
=================

.. js:function::  cdm::CloneElementInCategory(category,setName,elemName,newName)

   Clone a existing element to a new element in a given set, and clone all data defined for the existing element in the given category for the new element. If the existing element occurs in data of multiple categories, you may have to call this function for each category to achieve the desired effect. 

   :param category: specifies the category for which to clone all data for all identifiers in the category.
   :param setName: specifies the set in which to clone the existing element
   :param elemName: specifies the element name of the existing element
   :param newName: specifies the element name of the new element to be cloned

.. js:function::  cdm::RollbackElementsInCategory(category,setName)

   Rollback all data associated with the elements of a given subset in the given category, while leaving all other changes to the local data of a category untouched. Compared to the function :any:`cdm::RollbackChanges` this function provides a more fine-grained method to rollback sliced data over the element of a given subset that is displayed in, for instance, a page in the AIMMS WebUI. 

   :param category: specifies the category for which to rollback all data for all identifiers in the category.
   :param setName: specifies the set containing the elements to rollback
   
.. js:function::  cdm::CloneAndRollbackElementInCategory(category,setName,elemName,newName)

   Clone a existing element to a new element in a given set, clone all data defined for the existing element in the given category for the new element, and rollback the corresponding changes in all identifiers in the category for the original element. You can use this function, for instance, to store changed values for the data slices in a page in the AIMMS WebUI as a new element, while restoring the data values of the original element back to its committed values. 

   :param category: specifies the category for which to clone and rollback all data for all identifiers in the category.
   :param setName: specifies the set in which to clone and rollback the existing element
   :param elemName: specifies the element name of the existing element
   :param newName: specifies the element name of the new element to be cloned
   
.. js:function::  cdm::EmptyElementsInCategory(category,setName)

   Empty all data defined over the element of the given subset in the given category. If the elements occurs in data of multiple categories, you may have to call this function for each category to achieve the desired effect.

   :param category: specifies the category for which to empty all data for all identifiers in the category.
   :param setName: specifies the set for the elements of which to empty all data

.. js:function::  cdm::CreateUuid(uuid)

   Create a Universally Unique Identifier (UUID). This function is typically used for unique set element names, without requiring a server roundtrip.  Alternatively, you can use the function :any:`cdm::NextUniqueInteger` to create uniquely numbered set elements, but at the cost of a roundtrip to the CDM service.
  
   :param uuid: string output argument, in which the created UUID will be stored.
  
