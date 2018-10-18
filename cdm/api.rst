Low-level CDM API
*****************

Below you will find a description of the external procedures in the CDM library that make up the low-level CDM API. These methods will mostly be called by higher-level AIMMS procedures in the CDM library, but may potentially also be called independently to implement functionality beyond that of the higher level functions.

Library Management Functions
============================

.. js:function::  cdm::CreateCDMRuntimeLibrary(categoryMap,categoryOrder,alternateName)

   This function creates the :token:`CDMRuntime` library, and sets up the internal data structures in the :token:`libcdm.dll` needed to communicate category data with a CDM server. 

   :param categoryMap: provides the map of all identifiers to a CDM category
   :param categoryOrder: specifies the relative order of dependencies between such identifiers, where a higher order identifier depends on lower order identifiers
   :param alternateName: specifies an optional alternate name for each identifier under which it may still be found in the CDM database in case of a name change.

.. js:function::  cdm::UninitializeCDMLibrary

   This function closes all connections to the CDM service the CDM client is connected to, stops the embedded CDM server (if started), and removes all internal data structures for categories and identifiers in those categories in the :token:`libcdm.dll`.

.. js:function::  cdm::StartListeningToDataChanges(timeout)

   This function will cause :token:`libcdm.dll` register itself with the AIMMS engine to be notified of changes to any identifier data, and starts separate thread to examine which CDM category (if any) are affected by these data changes, and for each of them calls an internal callback procedure specified in the :js:func:`cdm::CreateCategory` or :js:func:`cdm::ConnectToCategory` calls (with default implementation :token:`cdm::DataChangeProcedure`) to act upon such a change. Based on the user-specified settings for the category, the CDM library may decide to automatically commit such changes, or register the change for the user to act upon, or take the actions implemented by a user-specified callback.
  
   :param timeout: notifies the timeout in milliseconds, the :token:`libcdm.dll` will wait before examining all CDM categories after receiving the last data change notification from the AIMMS engine

.. js:function::  cdm::StopListeningToDataChanges

   This function will cause :token:`libcdm.dll` to stop reacting to data change notifications by the AIMMS engine.

ApplicationDB Functions
=======================

.. js:function::  cdm::ConnectToApplicationDatabase(URL,dbName,timeout)

   Create a connection to the CDM server at the specified hostname and port, connect to the given application database, and register the given application database to use this connection for subsequent low-level calls. If the application database requested does not exist yet, the CDM server will create an empty application database with the given name. The call will fail if the server cannot be reached, of if the user is not `authorized <auth.html>`_ to access the application database. 

   :param URL: should be of the form :token:`tcp://hostname:port` and specifies the hostname and TCP port where the CDM server can be reached
   :param dbName: specifies the name of the application database to connect to. Notice that a single CDM server can serve multiple application database, each hosting a separate CDM data repository.
   :param timeout: specifies the timeout that will be applied on any call to the given CDM server (default 90000 ms). Increase this number only when your application makes huge commits, which cannot be handled by the CDM server within the default timeout.
   
   When successfully connecting to the CDM service, the :js:func:`cdm::ConnectToApplicationDatabase` function will call the :js:func:`cdm::SetCDMConnectedState` callback. This callback will also be called whenever the connection to the CDM service drops. The :js:func:`cdm::SetCDMConnectedState` will store the connected state in the :token:`cdm::ConnectedToCDMService` parameter, and will call the procedure pointed to by the :token:`cdm::ConnectedStateProcedureHook` parameter. This allows you to gracefully handle connection state changes in your application code, e.g. by trying to reconnects if the connection drops.

.. js:function::  cdm::DeleteApplicationDatabase(dbName)
   
   Delete the given application database. The function will fail if there is no connection the given application database, of if the user is not `authorized <auth.html>`_ to delete the application database.  
  
   :param dbName: specifies the name of the application database to delete.

.. js:function::  cdm::GetKeyValue(db,key,value)
  
   Retrieve the value for the given key from the key-value store embedded within given application database. The function will fail if the specified key cannot be found.
  
   :param db: specifies the application database
   :param key: specifies the key to look for
   :param value: specifies the output argument in which the value will be stored.

.. js:function::  cdm::SetKeyValue(db,key,value)

   Set the value for the given key in the key-value store embedded within given application database. The function will fail if the user attempts to set the value for a protected key.
  
   :param db: specifies the application database
   :param key: specifies the key to set
   :param value: specifies the value to be stored.

.. js:function::  cdm::NextUniqueInteger(db,key)

   Atomically return the next unique integer for a given string key. If no integer has been requested for the given key, the value 1 is returned and stored in the key-value store of the 
   given database under using the key :token:`integerKey-key`. Upon subsequent requests for the same key, the key-value store will be used to compute and save the next integer for the given key. You can use the function :js:func:`cdm::SetKeyValue` to reset the stored value to an arbitrary value. This function is typically used for uniquely numbering set elements, at the cost of a roundtrip to the CDM service. Alternatively, you can use the function :js:func:`cdm::CreateUuid` which can a less intuitive unique set element, but does not require a server roundtrip.
  
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
   :param fromRev: specifies the revision on :token:`fromBranch` from which to branch
   :param authProfile: specifies the authorization profile name to apply to the new branch. If left empty, the new branch will inherit the authorization profile from its parent branch

.. js:function::  cdm::DeleteBranch(db,branchName)

   Delete the given branch, its derived branches, and all data on these branches. The function will fail if the branch does not exists, if you do not have the permission to delete the branch, or if you try to delete the protected branches :token:`system` or :token:`master`.
 
   :param db: specifies the name of the application database in which to delete a branch
   :param branchName: specifies the name of the branch to delete

.. js:function::  cdm::SetBranchStatus(db,branchName,active)

   Set the branch status to either active or inactive, which will effect the result of :js:func:`cdm::EnumerateBranches`. The function will fail if the branch does not exist, or if the user is not authorized to change the branch status.
 
   :param db: specifies the name of the application database in which to set the branch status
   :param branchName: specifies the name of the branch for which to set the status
   :param active: specifies whether the branch should be set as active (1) or inactive (0)

.. js:function::  cdm::GetGlobalBranch(db,branch)

   Get the branch name of the branch in the application database set as the global branch. The gobal branch is initially set to the :token:`master` branch. When calling the high-level :js:func:`cdm::ConnectToApplicationDB` procedure, the CDM library will checkout the latest revision of the global branch after connecting to an application database.
  
   :param db: specifies the name of the application database for which to retrieve the global branch
   :param branch: is the output parameter in which the global branch will be stored

.. js:function::  cdm::SetGlobalBranch(db,branchName)

   Set the global branch for a given application database. The function will fail if the branch does not exist in the application database, or if the user has no authorization to set the global branch.
  
   :param db: specifies the name of the application database for which to set the global branch
   :param branchName: specifies the name of the global branch to set.

.. js:function::  cdm::GetRevisions(db,branchName,lowRev)

   Get the information about all revisions on a specific branch of an application database. The results will be stored in the identifiers in the :token:`Library Interface/Revision Information` section of the CDM library.
  
   :param db: specifies the name of the application database from which to retrieve revision information
   :param branchName: specifies the branch to use as a filter to retrieve revision information
   :param lowRev: specifies the lowest revision number to retrieve.
  
Authorization Functions
=======================

.. js:function::  cdm::EnumerateAuthorizationProfiles(db, activeOnly)

   Enumerate the existing authorization profiles from the application database. The results will be stored in the identifiers in the :token:`Library Interface/Authorization` section of the CDM library.
  
   :param db: specifies the application database from which to retrieve authorization profiles
   :param activeOnly: specifies whether to retrieve active authorization profiles only

.. js:function::  cdm::AddAuthorizationProfile(db,profileName)

   Add a new `authorization profile <auth.html#creating-authorization-profiles>`_ to the application database. The details of the authorization profile to add will be taken from the identifiers in the :token:`Library Interface/Authorization` section of the CDM library. The function will fail if the user is not authorized to add authorization profiles, or if the profile cannot be found in the model data.
  
   :param db: specifies the application database to which to add a new authorization profile
   :param profileName: specifies the name of the authorization profile to add

.. js:function::  cdm::SetAuthorizationProfileStatus(db,profileName,active)

   Set the authorization profile status to either active or inactive, which will effect the result of :js:func:`cdm::EnumerateAuthorizationProfiles`. The function will fail if the authorization profile 
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
   
   Create a new category, or update an existing category in the given application database, according to he category information passed through the :js:func:`cdm::CreateRuntimeLibrary` function, and set the notification and data change callback functions for the category. The function will fail if the user is not authorized to create or update the category, or if no information has been specified for the category in the call to :js:func:`cdm::CreateRuntimeLibrary`.

   :param db: specifies the application database in which to create or update a category.
   :param category: specifies the category name to add or update.
   :param notificationProcedure: specifies the notification callback to be used when new revision are added for the given category (defaults to :token:`cdm::DefaultCommitInfoNotification`)
   :param dataChangeProcedure: specifies the data change callback to be used when the CDM library detects changes in the data of the identifiers in the category (defaults to :token:`cdm::DataChangeProcedure`)

.. js:function::  cdm::ConnectToCategory(db,category,notificationProcedure,dataChangeProcedure)
   
   Connect to an existing category in the given application database, according to he category information passed through the :js:func:`cdm::CreateRuntimeLibrary` function, and set the notification and data change callback functions for the category. The function will fail if the user is not authorized to connect the existing category, or if the category specification provided through  :js:func:`cdm::CreateRuntimeLibrary` does not match the category information stored in the application database.

   :param db: specifies the application database in which to connect to an existing category.
   :param category: specifies the category name to connect to.
   :param notificationProcedure: specifies the notification callback to be used when new revision are added for the given category (defaults to :token:`cdm::DefaultCommitInfoNotification`)
   :param dataChangeProcedure: specifies the data change callback to be used when the CDM library detects changes in the data of the identifiers in the category (defaults to :token:`cdm::DataChangeProcedure`).
  
Commit and Pull Functions
=========================

.. js:function::  cdm::CheckoutSnapshot(category,branch,revid,labelsOnly,skipInactive)
   
   Checkout a data snapshot for all identifiers the specified category from the application database, for a given branch and revision. The snapshot can be specified to only retrieve the labels for root sets, or to also contain inactive data, i.e. identifier values registered in the application database for tuples containing root set elements that are not actually contained in the root set themselves in the snapshot. As a result of the call both the actual identifiers of the category will be updated, as well as the shadow identifiers holding the latest committed values and the revision numbers at which these values where committed. Also the branch and revision information for the category will be set to checkout revision. The function will fail if the user has no read access for the category or branch.

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

.. js:function::  cdm::PullChanges(category,resolved)
   
   Retrieve and apply the changes for all identifiers in the given category, compared to the state of the model data for the current branch and revision of that category. The resulting changes will be applied to the actual identifiers, as well as to the shadow identifiers holding the latest committed values and the revision numbers at which these values where committed. In case there are conflicts between the changes being applied pulled from the application database, and changes made to the local identifiers by the end-user, the CDM library will try to `resolve the conflicts <dtd.html#merging-branches-and-resolving-conflicts>`_ based on the current model settings. The function will fail if the user has no read access to the category or branch. If the function succeeds without conflicts, the branch and revision information for the category will be set to latest revision on the current branch.

   :param category: specifies the category for which o 
   :param resolved: specifies an output argument, which indicates whether any conflicts were successfully resolved.

.. js:function::  cdm::CherryPickChanges(category,branch,revfrom,revto,resolved)
   
   Cherry pick changes from a range from a given branch, and apply them to all identifiers in the specified category in your current branch. The resulting changes will only be applied to the actual identifiers, In case there are conflicts between the changes being applied pulled from the application database, and changes made to the local identifiers by the end-user, the CDM library will try to `resolve the conflicts <dtd.html#merging-branches-and-resolving-conflicts>`_ based on the current model settings.  To commit them to the application database, subsequently call the function :js:func:`cdm::CommitChanges`. The function will fail if the user has no read access to the category or branch to cherry pick from.
  
   :param category: specifies the category to which to apply the cherry pick operations
   :param branch: specifies the branch from which to cherry pick
   :param revfrom: specifies the lower bound of the range of revisions on the specified branch to cherry pick changes from
   :param revto: specifies the upper bound of the range of revisions on the specified branch to cherry pick changes from
   :param resolved: specifies an output argument, which indicates whether any conflicts were successfully resolved.

.. js:function::  cdm::ApplyCommits(category,branch,revfrom,revto,resolved,assignToId,applyToCommitted)
   
   Apply changes from a range from a given branch, to the actual and/or committed identifiers of the specified category. In case there are conflicts between the changes being applied pulled from the application database, and changes made to the local identifiers by the end-user, the CDM library will try to `resolve the conflicts <dtd.html#merging-branches-and-resolving-conflicts>`_ based on the current model settings. The function will fail if the user has no read access to the category or branch to cherry pick from.
   This function is a more general version of :js:func:`cdm::CherryPickChanges` and has its main use when `merging branches <dtd.html#merging-branches-and-resolving-conflicts>`_. 

   :param category: specifies the category to which to apply the selected commits
   :param branch: specifies the branch from which to apply the selected commits
   :param revfrom: specifies the lower bound of the range of revisions on the specified branch to apply the selected commits from
   :param revto: specifies the upper bound of the range of revisions on the specified branch to apply the selected commits from
   :param resolved: specifies an output argument, which indicates whether any conflicts when applying the commits to the actual identifiers were successfully resolved.

.. js:function::  cdm::MergeDeltaInWithId(category)
   
   Actually merge the changes stored in the :token:`DeltaInIdentifiers` in :token:`CDMRuntime` library for the specified category into the actual identifiers. Changes will only be applied if the corresponding tuple in :token:`DeltaInRevisionIdentifiers` holds a non-zero value. This low-level procedure is used when merging branches, and can used to merge incoming changes when pulling changes or merging branches did not resolve successfully, and manual intervention is required. For examples of use, inspect the function :token:`cdm::MergeBranches`.

   :param category: specifies the category to which to apply the stored delta in changes.

.. js:function::  cdm::CommitChanges(category,commitInfoProcedure)
   
   Compute the local changes between the actual identifiers in the given category, and, if any, commit the resulting change set to the *current* branch of the category in the application database. If successful, update the :token:`CommittedIdentifiers` with the local changes, and set the revision for the category to the revision under which the change set was stored. The function will fail if the user has no write access to the category or branch, or if the client is not at the latest revision of the current branch of the category. In the latter case, the client application should first pull the changes of current category, resolve any conflicts, and re-commit. 

   :param category: specifies the category for which to commit local changes to the current branch of the category in the application database
   :param commitInfoProcedure: specifies an (optional) callback procedure (with default :token:`cdm::CommitInfoProvider`), which will be called to retrieve the commit author and comment to be associated with the commit

.. js:function::  cdm::RollbackChanges(category)
   
   Reset the actual values of all identifiers in the given category, back to the values stored in the :token:`CommittedIdentifiers` in the :token:`CDMRuntime` library for the given category.

   :param category: specifies the category for which to rollback the local changes

.. js:function::  cdm::GetValuesLog(category,paramref,lowRev)
   
   Retrieve a history log of previous values for a *slice* of an identifier in the given category on the *current* branch and store the history in the corresponding :token:`ValueLogIdentifiers` of the :token:`CDMRuntime` library. You can use this function to retrieve a detailed overview of changes to the given identifier slice, which you can, for instance, subsequently present to an end-user of your application. 
  
   :param category: specifies the category containing the identifier for which to retrieve the history log
   :param paramref: specifies a *slice* of an identifier in your model for which to retrieve the history log
   :param lowRev: specifies the lower bound of revisions for which to report any changes to the given identifier slice.

.. js:function::  cdm::ComputeDeltaOut(category)
   
   Compute the changes between the actual identifiers of the given category and the committed values stored in the :token:`CommittedIdentifiers` section of :token:`CDMRuntimeLibrary` for the category, store the changed values in the :token:`DeltaOutIdentifiers` and set the corresponding tuples in the :token:`DeltaOutRevisionIdentifiers` to 1. This low-level function is used when `visually inspecting the differences between revisions <dtd.html#visually-viewing-differences>`_.

   :param category: specifies the category for which to compute the local changes.

.. js:function::  cdm::ResolveIdentifierConflicts(category,idName,useLocal)
   
   Low-level function used to resolved *all* conflicts for a given identifier in a category, either by *always* using the local changes or by *always* using the remote changes in case of a conflict. This function is used by the visual conflict resolution method implemented in the CDM library.

   :param category: specifies the category for which to resolve conflicts
   :param useLocal: specifies whether to always use local changes (1) or remote changes (0). 

.. js:function::  cdm::SetRevision(category,branch,revid)
   
   Set the branch and revision for a given category, regardless of the actual contents of the identifiers in the category, and the contents of the category related shadow identifiers in the :token:`CDMRuntime` library. Use this function only if you know what you are doing, as subsequent commits and pulls may give unexpected results if the state of the data in the shadow identifiers does not match the specified branch and revision.
  
   :param category: specifies the category for which to set the branch and revision
   :param branch: specifies the branch to set for the category
   :param revid: specifies the (optional) specific revision within the branch to set for the category, if not set the head revision of the branch will be taken
  
Embedded Server Functions
=========================

.. js:function::  cdm::StartEmbeddedCDMServer(path,configPath)
   
   Start an embedded CDM server, which can be used for testing CDM during application development. The function fails if the listen port for the CDM service has already been taken.

   :param path: specifies the directory where :token:`libcdmservice.dll` can be found
   :param configPath: specifies the directory from which to take the :token:`CDMConfig.xml` file from which the embedded server will read its configuration

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

.. js:function::  cdm::RollbackElementInCategory(category,setName,elemName)

   Rollback all data associated with an existing element in the given category, while leaving all other changes to the local data of a category untouched. Compared to the function :js:func:`cdm::RollbackChanges` this function provides a more fine-grained method to rollback sliced data over the given element that is displayed in, for instance, a page in the AIMMS WebUI. 

   :param category: specifies the category for which to rollback all data for all identifiers in the category.
   :param setName: specifies the set in which to rollback the existing element
   :param elemName: specifies the element name of the existing element
   
.. js:function::  cdm::CloneAndRollbackElementInCategory(category,setName,elemName,newName)

   Clone a existing element to a new element in a given set, clone all data defined for the existing element in the given category for the new element, and rollback the corresponding changes in all identifiers in the category for the original element. You can use this function, for instance, to store changed values for the data slices in a page in the AIMMS WebUI as a new element, while restoring the data values of the original element back to its committed values. 

   :param category: specifies the category for which to clone and rollback all data for all identifiers in the category.
   :param setName: specifies the set in which to clone and rollback the existing element
   :param elemName: specifies the element name of the existing element
   :param newName: specifies the element name of the new element to be cloned
   
.. js:function::  cdm::EmptyElementInCategory(category,setName,elemName)

   Empty all data defined over the existing element in the given category. If the existing element occurs in data of multiple categories, you may have to call this function for each category to achieve the desired effect.

   :param category: specifies the category for which to empty all data for all identifiers in the category.
   :param setName: specifies the set for which to empty all data for the existing element
   :param elemName: specifies the element name of the existing element

.. js:function::  cdm::CreateUuid(uuid)

   Create a Universally Unique Identifier (UUID). This function is typically used for unique set element names, without requiring a server roundtrip.  Alternatively, you can use the function :js:func:`cdm::NextUniqueInteger` to create uniquely numbered set elements, but at the cost of a roundtrip to the CDM service.
  
   :param uuid: string output argument, in which the created UUID will be stored.
  
