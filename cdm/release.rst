CDM Library Release Notes
**************************

The first public release of CDM was version 1.5.0.0, release date April 15, 2018. 

Versions with the same major and minor release number use the same protocol between CDM client and service, and can be interchanged freely. Higher release numbers for a given major and minor release number contain bug fixes and potentially new features that do not break the client-server protocol. The on-demand cloud CDM service, will always start a CDM service instance of the latest available release for a given major and minor release number.

New Features and Bug Fixes
--------------------------
25.7.1.1 [16-09-2025]
	- Snapshots would be created using a multi-threaded and buffered approach, which could lead to connection starvation by the MySQL server when the time to resume fetching the data of a particular identifier in order to fill the next buffer would become too big due to increased application data size, or due to multiple clients creating too much load on either the CDM or MySQL server. This could lead to server crashes when updating snapshots. Data for a single identifier will now be fetched in one go, and intermediately stored in a new blob table, before being delivered to clients in batches
	- When committing data, the revision number in the committing client is now properly set to the commit revision
	- Very large commits for a single identifier that is sent in multiple batches, could lead to duplicate entry errors in the database
	- When starting a new database, initially loading data into the database could lead to runtime errors about inconsistent state transitions for defined sets
	- When the set contents of defined sets was not already registered in CDM, the external data refactor would prevent defined set elements from being committed to CDM, potentially leading to negative CDM labels for data defined over such sets.
	
	
25.6.2.1 [05-09-2025]
	- When checking out a branch, while elements were deleted from a previous checkout, CDM would call an AIMMS API method that would produce a runtime error that could not be prevented.
	
25.6.1.1 [01-09-2025]
	- Add functionality to change update interval for snapshots, and trigger snapshot updates.
	
25.5.2.1 [29-08-2025]
	- Addressed some issues in the refactored handling of sets for dealing with external data, when changing the contents of a set during e.g. a branch change would re-introduce the elements just replaced.

25.5.1.1 [10-06-2025]
	- Deleting a branch in MySQL required temporarily switching off foreign key checks
	- When retiring a branch snapshots and deltas could get invalid because of elements removed as part of retiring data, all snapshots and deltas are now automatically deleted when retiring data
	- Pulling changes could end-up in and endless loop when retrieving deltas while the delta list was recombined by another client
	
25.4.1.1 [26-05-2025]
	- This release requires AIMMS 25.4+
	- Added support for telemetry
	- Elements added to the model data followed by a checkout would not remove the newly added elements from the set

25.3.1.3 [08-04-2025]
	- Added support for resetting overridden external data back to the base value coming from the external data
	- Overrides and resets of external data are now properly dealt with when checking out or merging deltas
	- After restoring a CDM schema to another service, all snapshots and deltas will be deleted

25.2.2.1 [31-03-2025]
	- Improved `cdm::RetireBranchData` to prevent foreign key errors due to incorrect revision traversal
	
25.2.1.1 [17-03-2025]
	- Added support for external data
	
25.1.3.3 [25-02-2025]
	- Element parameters into subsets of `Integers` with the `ElementsAreLabels` option set, would loose data on checkout when the '0' element was assigned in newer AIMMS versions.
	- Fixes errors reported by AIMMS 25.1.2.3+ when creating the CDM runtime library

25.1.2.2 [19-02-2025]
	- New build system failed to include SQLite DLL in released artifacts, and did not run tests in the build pipeline so it passed undetected

25.1.1.1 [15-02-2025]
	- Upgrade to latest version of build system and libraries

24.6.1.10 [03-02-2025]
	- Changing the category order would trigger a warning in AIMMS 24.6
	- The commit changeset would sometimes be deleted prematurely on Linux, leading to crashes.

24.6.1.8 [29-01-2025]
	- The reconnect logic contained a procedure call within an if-then-else expression, which might cause the auto-reconnect to fail

24.6.1.7 [27-01-2025]
	- If a database transaction failed when committing a change set, a thread in the CDM service would crash when trying to delete the database connection
	- The commit delta was stored outside of the commit transaction

24.6.1.6 [22-12-2024]
	- When disconnecting from an application database, the embedded server would also be stopped
	- Destroying the CDM runtime library would leave the model in an unrunnable state, prevent the model termination procedures from being executed
	
24.6.1.4 [19-12-2024]
	- Checking out data from an empty snapshot would stop the client from retrieving subsequent delta change sets
	
24.6.1.1 [07-12-2024]
	- Improve CDM performance by storing snapshots automatically and also storing deltas for every commit, such that checkouts do not require expensive SQL queries any longer
	
24.5.1.1 [27-11-2024]
	- Set the AIMMS option `warning_range_violation` to `off` during CDM startup to prevent incorrect range violation errors when checking out elements that are added and deleted in multiple commits after a snapshot
	- Refactored the database connection sharing logic to prevent race conditions from happening when multiple threads update the database in parallel
	- Allowed commits to retry `cdm::CommitRetries` times in case of failure (defaults to 5 times)
	- Refactored the function `cdm::NextUniqueInteger` to prevent SQL error on `SQLServer` databases

24.4.1.1 [23-09-2024]
	- Implement reconnect logic to (automatically) reconnect to (and/or, in the AIMMS cloud, start a new on-demand) CDM service in case of disconnect. This can be accomplished via the new function `cdm::ReconnectToApplicationDB` and `cdm::AutoReconnectToCDMService`
	- The CDM schema upgrade could fail in case multiple schema upgrades were executed at once.
	
24.3.1.1 [25-08-2024]
	- Set `MySQL` ``net_write_timeout`` variable to 3600 seconds on all connections to prevent lost connections when pulling data for identifiers with a huge amount of data in a lot of revisions
	- Database exceptions were not always properly propagated, potentially leading to incorrect pull change sets and/or cached snapshots
	
24.2.1.5 [22-08-2024]
	- `loopcount` did not produce the correct value in an `onerror` clause, leading to errors not being propagated properly
	- CDMService could crash on empty changesets for sets
	- Location of Windows `CDMService` download location had changed and was shown incorrectly

24.2.1.2 [15-05-2024]
	- Increase number of dispatcher threads from 16 to 64 in CDM service
	- Improve handling of heartbeat message by making them priority messages
	- Improve fix in version 24.1.1.3 by setting locale in CDM service

24.1.1.4 [17-04-2024]
	- During checkout CDM would complain unnecessarily about non-existing elements when using AIMMS 24, where AIMMS >= 4.84 should have prevented this

24.1.1.3 [16-04-2024]
	- Set labels with non-ASCII Unicode characters might result in duplicate entries in namespace tables due to incorrect lower case conversion

24.1.1.1 [30-03-2024]
	- Categories are now traversed in the dependency order, to make sure changes for categories are committed in the order in which they should be pulled.
	
23.1.0.8 [09-12-2023]
	- A warning is issued for identifiers with a non-zero identifier order, but without assigned to a CDM category. When these identifiers are referenced as root set in the index domain of multi-dimensional data or of the range of an element parameter, as the begin/end date of a calendar, or in the definition of a root set, such identifiers may give problems when checking out data, and hence need to be assigned to a category themselves. Because of the broadness of the dependency checks in CDM, the warning may also point to harmless identifiers. After investigation, the user can suppress any further warning for such identifiers by setting `cdm::SuppressDependencyWarning` to 1.
	
23.1.0.7 [04-12-2023]
	- Updating the CDM schema version would set the revision of updated categories to 2 after checking them out in recent AIMMS versions
	
1.30.0.0 [10-05-2023]
	- Root set labels inserted in batches, would fail in case the table contained existing elements
	
1.29.0.3 [17-04-2023]
	- Fix creation of active set tables for SQLServer
	- Fix in 1.29.0.1 did not work for MySQL 5.7, now only applied to affected databases
	
1.29.0.1 [30-02-2023]
	- Addressed an issue where a checkout of an identifier with two indices in the same, very large, set took a very long time

1.28.0.0 [09-03-2023]
	- Commit times for sets and multi-dimensional identifiers are now measured and logged (at trace level)
	- Root set labels are now inserted into the CDM database in batches (instead of one-by-one) like multi-dimensional identifier values

1.27.0.8 [17-02-2023]
	- Add additional safeguard to location where crash occurred that should not be possible
	
1.27.0.6 [13-02-2023]
	- Rolling back a root set to which a large number of elements were added could crash AIMMS

1.27.0.5 [09-01-2023]
	- Identifiers from the CDM library will no longer be part of any CDM category (but identifiers defined over sets from the CDM library still can)

1.27.0.3 [29-11-2022]
	- Remove some warnings about handle arguments of external procedures that were triggered by AIMMS 4.90+

1.27.0.2 [04-11-2022]
	- Add ``cdm::ComputeDeltaOutExt`` method which computes the delta out and reports the number of changes detected.

1.27.0.0 [16-10-2022]
	- Replaced temporary tables used during checkout to filter set elements by a different filtering approach using permanent tables to fix performance issue in Azure MySQL databases due to very slow DDL performance in Azure MySQL
	
1.26.0.33 [23-09-2022]
	- Allow multiple instances of the CDMService to be installed on Windows, to facilitate connecting to multiple databases
	- ``cdm::RollbackChanges`` would not correctly rollback integer sets and root sets 

1.26.0.30 [14-09-2022]
	- First version compatible with new build system for AIMMS
	- Fixed crash in cdm::ComputeDeltaOut

1.25.0.6 [26-07-2022]
	- When creating a new table for a modified identifier, the associated unique constraint kept the same name as for the previous table, leading to a SQLServer error

1.25.0.4 [09-05-2022]
	- The procedure :any:`cdm::EmptyElementsInCategory`, erroneously pointed to the non-existing DLL function ``EmtpyElementInCategory`` instead of ``EmptyElementsInCategory``

1.25.0.3 [03-05-2022]
	- Add :any:`cdm::RenameElement` method to change an element name *globally*, i.e. in all clients, and in the CDM database across all branches and regardless of history.
	- This version modifies the wire format of changesets to accommodate passing element renames. As a result cached snapshots will be temporarily invalidated after upgrading the CDM service, and will be restored upon the first refresh of the snapshot cache. 
	- After *every* commit containing an element rename, the snapshot cache will also be temporarily invalidated to prevent the old element name(s) from being passed to clients when checking out a branch. 
	
1.24.1.8 [09-03-2022]
	- The function :any:`cdm::GetValuesLog` did not function properly for identifier slices.

1.24.1.6 [24-02-2022]
	- Add :any:`cdm::RemoveElementsFromDatabase` to cleanup backing CDM database by removing all data associated with a subset of an element space
	- :any:`cdm::RollbackElementsInCategory`, :any:`cdm::EmptyElementsInCategory` and :any:`cdm::CommitElementsInCategory` now operate on a subset of elements instead of on a single element
	- Add ``cdm::SnapshotSize`` identifier to retrieve size of snapshots from :any:`cdm::GetSnapshotCache`.

1.23.0.9 [23-01-2022]
	- Use of generated action procedure to determine data differences gave rise to extreme memory usage in particular situations
	- Warnings for unmapped labels are only reported 5 times.

1.23.0.6 [25-11-2021]
	- Add additional logging to facilitate better tracing of on-demand CDM service connection failures
	- Fix problem connecting to on-demand CDM service when this was just closing down
	
1.23.0.3 [11-11-2021]
	- Complex category orders could be determined incorrectly

1.23.0.2 [8-11-2021]
	- CDM client could crash when category was no longer connected due to heartbeat failure
	- CDM service erroneously was set to stopping state while it was actually still waiting for new connections

1.23.0.1 [29-10-2021]
	- Set default character set for MySQL to ``utf8mb4`` for new CDM schemas to allow for 4-byte UTF-8 characters, and set up the MySQL client for transport of 4-byte UTF-8 characters. For existing schema, you can replace the character set for the *columns* in identifier tables that hold values with 4-byte UTF-8 characters to ``utf8mb4``, in combination with using CDM version >= 1.23.

1.22.0.15 [09-10-2021]
	- :any:`cdm::CheckoutSnapshot` will now skip non-existing elements when assigning data to model identifiers, instead of producing an error, but only when used with AIMMS versions >= 4.82.4. Such non-existing elements could occur when checking out multiple categories which consisted of a cached snapshot in conjunction with a pull changeset, where the element was deleted in a pull changeset of one category, and some data for that element was changed in another category.
	
1.22.0.11 [02-10-2021]
	- Non-mapped labels in tables for multi-dimensional identifiers and set memberships could lead to client errors, and are now filtered.

1.22.0.10 [30-09-2021]
	- Added capability to clone a CDM database from on database to another (see :any:`cdm::CloneApplicationDatabase`)
	- ``cdm::CommitTimeout`` has been renamed to ``cdm::AsyncTimeout``, is now also used for :any:`cdm::CloneApplicationDatabase`. Normally, the CDM name change file should take care of this name change.
	
1.21.0.4 [21-09-2021]
	- Notify server of regular client termination
	- Decrease heartbeat timings to allow for quicker shutdown of on-demand service
	- Serialize access to list of clients in service to prevent potential race condition in shutdown of on-demand service
	
1.20.0.6 [12-08-2021]
	- In certain situations the identifier ordering could be wrong because of taking into account defined parameters multiple times, leading to botched data checkouts.

1.20.0.3 [06-07-2021]
	- Element names with accents in characters and trailing spaces could lead to a unique index constraint to fail for the MySQL backend. Depending on MySQL version, specific character sets and collations may need to be set on the `name_nc` column in the element space tables associated with the affected sets.
	- Deletion of empty branches could take a lot of time because of needlessly trying to remove data from identifier and set tables.
	- The function ``cdm::EmptyElementInCategory`` would not remove values from element parameters which held the specified element value.
	
1.19.0.25 [22-06-2021]
	- On-demand service in cloud now prints stack trace before exiting on crash.
	
1.19.0.21 [21-06-2021]
	- The function :any:`cdm::CloneAndRollbackElementInCategory` and ``cdm::EmptyElementInCategory`` could crash when logging element names.

1.19.0.19 [11-06-2021]
	- Set maximum lifetime of non-connected on-demand CDM service in cloud to 4 hours
	
1.19.0.15 [10-06-2021]
	- Only load log configuration if no one has been loaded already
	- Table definition would not correctly retrieve the latest version during table verification when connecting to category

1.19.0.9 [09-02-2021]
    - ``cdm::CommitElementInCategory`` could create negative label numbers in the CDM database, when additional elements were created in a set next to the one offered as an argument to the function.
    - :any:`cdm::CommitChanges` would not create any left-over new elements of a set, after a call to ``cdm::CommitElementInCategory``.
    - Added retry capability for cloud CDM service, which may time out and terminate in between obtaining the service URL and the actual connection attempt. 

1.19.0.6 [20-11-2020]
    - Snapshot updating mechanism could end up in an infinite loop performing a check every millisecond.
    - Reduce auto-termination period by 1 minute.

1.19.0.4 [11-09-2020]
    - Evaluation of ``cdm::RevisionBranch`` would result in dense execution, taking excessively long for a large number of revisions.
    
1.19.0.3 [09-09-2020]
    - Calls to :any:`cdm::GetValuesLog` could produce no values if some domain elements in the log values domain or range were not present in the current contents of the corresponding domain sets. Such tuples are now skipped, and the number of skipped values is reported in the log file.
    
1.19.0.2 [03-09-2020]
    - Server-side lock was being held for too long, causing a dead-lock when multiple :any:`cdm::CreateSnapshot` requests were fired at the same time.

1.19.0.1 [31-08-2020]
    - Accessing multiple CDM application databases within a single database server would lead to a separate collection of database connections being used for every application database. All access to CDM application databases within a single database server will now use a shared connection pool, and connections in the pool will be automatically garbage collected after 15 minutes of inactivity.

1.18.0.29 [27-08-2020]
    - Some definitions of sets in the CDM library gave syntax and semantic errors in the cloud, preventing CMD apps from being published.
    - The thread for automatically updating snapshots could crash the CDM service when a database connection was misconfigured.
    - The function ``cdm::DetermineCategoryOrder`` did not fully compute all category dependencies. Because this makes the check for cross-dependencies stricter, in rare cases this might lead to a re-ordering of cross-dependent categories and a potential change in the loading order of data if a model actually has dependency problems with its CDM categories.
    
1.18.0.26 [17-08-2020]
    - Subsets were not filtered during checkout to only pass the non-empty elements.
    
1.18.0.25 [12-08-2020]
    - Re-committing unmapped labels when a client category was not up-to-date, could cause a crash in the CDM server.
    - Addded new function to fill ``cdm::Categories`` without actually having to call ``cdm::CreateRuntimeLibrary``.
    
1.18.0.23 [05-08-2020]
    - The function :any:`cdm::CreateBranch` will now automatically update the set ``cdm::Branches`` with the new branch information.
    
1.18.0.21 [21-07-2020]
    - Addresses a performance degradation in computing differences between current and committed data.
    - Function :any:`cdm::DeleteDependentBranches` could delete branches originating after the given end revision.
    - :any:`cdm::PullChanges` could fail to use cached commits when called from a commit notification if two categories were committed intermittently, leading to increased pull times in the presence of multiple clients auto-pulling the changes.
    
1.18.0.14 [16-07-2020]
    - Changing 0.0 to zero would not be detected by CDM because of the semantics of numerical ``<>`` operator in AIMMS.

1.18.0.13 [14-07-2020]
    - Unitialized local variable could cause crash on Linux.
    
1.18.0.11 [01-07-2020]
    - Fixed missing symbol in ``libcdm.so`` on Linux

1.18.0.9 [24-06-2020]
    - Changesets are now compressed during transport to reduce transmission time and in database cache to reduce stored snapshot size.
    - Introduced separate function :any:`cdm::CreateSnapshot` to create a cached snapshot asynchronously and completely server-side.
    - Removed the optional ``cacheUpdate`` argument from :any:`cdm::CheckoutSnapshot` function.
    - The procedure ``cdm::RetireBranchData`` has been implemented in a totally different manner because a fix to the previous implementation fundamentally prevented it from working for SQLServer-backed CDM instances.
    - Stopped supporting VC120-based AIMMS versions.

NB. Because the wire and storage format for snapshots changed, all cached snapshots stored in the CDM database will be deleted. Also, the function prototypes for creating snapshots and retiring branch data are changed. If you used these functionalities before, you should update your model.

1.17.1.13 [10-03-2020]
    - In ``cdm::DataChangeProcedure`` pass on exception only on last retry.
    
1.17.1.12 [25-02-2020]
    - CDM runtime identifiers for identifiers with defaults and a derived unit, would inadvertently get a default in the base unit, leading to unnecessary commits to the CDM database.
    - Identifier-specific commit cardinalities could fail the ``cdm::GetRevisions`` function for identifiers that no longer exist in the model
    - The CDM runtime could fail when retrieving branch data for branch- and revision-related identifiers in the CDM library with different internal AIMMS storage types.

1.17.1.9 [17-02-2020]
    - Listen to incoming commit notifications in default callback ``cdm::DataChangeProcedure`` to minimize the chance for ``cdm::CommitChanges`` to fail for auto-commit categories.

1.17.1.8 [14-02-2020]
    - Fixed membership check for element parameters into root sets.
    - Deleted root set elements would not be deleted properly from other sessions in all circumstances.
    - Re-order changeset handling such that all changesets are retrieved prior to handling all element space changes of all changesets prior to handling all data changes of all changesets in order to prevent root set mismatches when reading multi-dimensional data from a snapshot in some category associated with a root set from another category where the element was deleted during a revision after the snapshot revision.
    - Make rollback more robust against element parameters holding inactive values.
    - When committing root sets adapt label membership of element space.
    - Check for incoming notifications after waiting for data changes to allow notifications to be handled prior to auto-committing.
    - Function to retrieve branch name would actually try to find branch name in databases set.
    - Elements of defined root sets would not always be committed immediately the first commit after database creation.
    
1.17.1.2 [12-02-2020]
    - Data changes for identifiers in some category associated with set elements added and removed to a root set contained in another category in a revision range loaded after a cached snapshot would lead to a runtime error, because such set elements would not be contained in this root set when loading the data. Data changes for such elements are now filtered out when loading the data in the AIMMS client.
    - In rare occasions, CDM could try to retrieve the element name of set elements that were registered as being added at one time, but removed from the model later on, leading to faulty element names. Element names are now registered when the corresponding newly added elements are discovered by CDM.

NB. This fix required a change in the format of the changesets sent over the wire, which is also the format of the cached snapshots in the CDM database. Consequently, any existing old-format snapshots stored in the CDM database will be deleted on first load, and should be re-created from within the CDM-enabled application.

1.16.0.8 [05-02-2020]
    - Labels added prior to a snapshot revision, but then removed from the set in the snapshot revision, could lead to client-side data loss when such a label was re-added as part of a revision range passed to the client during a checkout based on a cached snapshot.
1.16.0.7 [30-01-2020]
    - Having predeclared identifiers in ``cdm::AllCDMIdentifiers`` would make the call to :any:`AttributeToString` fail PRO solver sessions.
    - Add ``cdm::IdentifierOrderOverride`` to CDM library to allow manually setting identifier order for category identifiers set via ``cdm::IdentifierCategoryOverride``.
    
1.16.0.5 [29-01-2020]
    - Pull changesets being appended to checkout snapshots could represent revision ranges that add root set elements with associated data, and subsequently delete such elements, leading to partially failed checkouts because of inactive data when handling the changeset.
    - Domain errors when pulling in changes would only appear in log files and not in client session.

1.16.0.3 [22-01-2020]
    - Predeclared identifiers could not be part of any category.

1.16.0.2 [21-01-2020]
    - When contents of root sets was added Through multiple change sets during checkout (e.g. when using cached checkout snapshots), the root set would only contain the elements added during the last change set. 
    - Recompile CDM runtime library before calling action procedures to prevent compile errors due to edit actions in other runtime libraries such as the WebUI runtime library.

1.16.0.0 [16-01-2020]
    - Data manipulations involving shadow identifiers when committing, checking out and pulling changes, are now running faster by executing them in a procedure in the CDM runtime library, instead of retrieving, comparing and setting all data Through the AIMMS API.

1.15.0.22 [11-01-2020]
    - Add ``cdm::IdentifierCategoryOverride`` to CDM library to allow adding identifiers from read-only libraries to categories

    Up until release 1.15.0.20, set membership for newly added labels to any (non-integer) root set in your model was *never* set explicitly, but was *always* implicitly set server-side when such labels were presented to the CDM service. In support of the commit changeset caching feature introduced in CDM release 1.15, set membership is now always required to be set explicitly,  but explicitly setting set membership is only possible if the root set is actually contained in *some* category in your CDM setup. However, for any root set that is part of read-only libraries of your model, adding it to a category was impossible because it was impossible to add the ``cdm::category`` annotation. Through the identifier ``cdm::IdentifierCategoryOverride``, you now have the ability to add such root sets to a CDM category. 

1.15.0.21 [10-01-2020]
    - Terminating the cache update thread would crash AIMMS developer when closing a project running an embedded CDM service
    
1.15.0.20 [08-01-2020]
    - Failed commit could lead to labels to be translated to non-existent label numbers in subsequent commits
    - Label numbers erroneously ending up with an empty label name in the database could confuse the corresponding set in model and lead to an execution error; such labels are now skipped
    - Fix a potential commit error when committing to a newly created database a label that was added as a default to an element parameter
    - Speed-up of :any:`cdm::EnumerateBranches` and :any:`cdm::ConnectToCategory` by reducing the number of database queries used to produce the result
    - *Commit changesets* are now cached, allowing other clients pulling the same changeset due to a commit notification to retrieve it without any database access, leading to a drastic reduction in database load and pull timings 
    - *Checkout snapshots* for a specific category-branch combination can now be cached, with a specified interval for the cached snapshot to be updated by the server. Checkout requests on the same category-branch combination will now look for a cached snapshot, and combine this with a pull request from the cached snapshot to the head of the branch to produce the requests checkout. When snapshot caching is enabled, this will lead to drastically reduced checkout times.
    
    For CDM backends backed by a MySQL database, you may need to increase the value of the MySQL option ``max_allowed_packet`` for categories containing a lot of data. If packet size is not big enough to contain the entire snapshot, the connection to the database will be lost when the CDM service tries to store the snapshot. 
    
1.14.0.7 [24-10-2019]
    - Left-over temporary tables are now removed at service startup

1.14.0.6 [14-10-2019]
    - Checkout of a simple *integer* subset with large amount of both element additions and deletions could lead to crash
    
1.14.0.5 [04-10-2019]
    - Modified ``cdm::DefaultCommitInfoNotification`` to allow strictly sequential pulling per commit per category in order to maintain proper cross-category root set - subset relationships in special cases.

1.14.0.4 [03-10-2019]
    - Changes in multi-dimensional identifiers due to data becoming inactive due to elements being removed from domain sets that were true *subsets* were committed on the first *real* change to such identifiers. Changes due to data becoming inactive are now never committed regardless of whether the domain sets are root set or subsets.
    - Yet unhandled data change events could cause the function :any:`cdm::WaitForCommitNotifications` to timeout
    
1.14.0.1 [27-09-2019]
    - Selected sensible default and alternative filter strategies for all supported databases.
    - Added commit timeout next to call timeout argument in :any:`cdm::ConnectToApplicationDatabase`, and lowered default call timeout.
    - Suppressed commit dialog that appeared when commits lasted at least 60 seconds in the WinUI by default.
    - Added customizable notification and datachange procedures to ``cdm::CreateCategories`` call as well
    - Introduced state machine for correctly keeping CDM identifier state in all use cases
    - Merging in external data could lead to AIMMS errors in certain situations
    - Commit notifications could be held back by the CDM DLL, causing certain revisions of some categories not to be updated as much as they could by the default commit notification procedure. All commit notifications are now forwarded to the specified commit notification procedure in the model.
    - Introduced :any:`cdm::WaitForCommitNotifications` function, to allow the model to wait for and execute commit notifications synchronously prior to e.g. committing category changes to minimize the chance of failed commits due to running behind compared to the CDM server.
    
1.13.1.33 [29-08-2019]
    - Index columns of multidimensional identifier tables were not declared as ``not null``.
    - Added option to database configuration file to convert schema and table names to lower case.

1.13.1.31 [27-08-2019]
    - Improved code to implement CDM schema update CDM-2019-06-01 to prevent empty column names for redefined tables.
    
1.13.1.30 [21-08-2019]
    - CDM schema update CDM-2019-06-01 could leave upgraded CDM databases with wrong value column names
    - Introduced runtime parameter to allow for alternative filtering strategy that works more performant for a low active/total ratio of domain set elements during checkout.

1.13.1.26 [20-08-2019]
    - Failed data pull would rollback local changes instead of clearing delta-in identifiers.
    - :any:`cdm::ConnectToCategory` could be called multiple times, leading to multiple commit notifications being fired to single client.
    - Category-dependent notification and datachange procedures communicated when calling ``cdm::ConnectToApplicationDB`` can now be set via element parameters ``cdm::DefaultNotificationProcedure`` and ``cdm::DefaultDataChangeProcedure``.

1.13.1.18 [31-07-2019]
    - Translation vectors for set elements could be resized too small when extending sets, leading to potential data loss
    
1.13.1.15 [18-07-2019]
    - Multiple clients retrieving domain set data simultaneously (e.g. upon commit notify), could result in a server crash due to a race condition introduced by the branch-dependent domain set filtering added in CDM version 1.11
    - Newly added domain set elements during ``cdm::CommitElementInCategory`` are now restricted to the specified element in the specified set only
    
1.13.1.4 [11-07-2019]
    - Added client and service instance ids to improve service logging and matching of service and client log files
    - Improve dump file creation on-premise
    
1.12.0.7 [09-07-2019]
    - Added support for new ``cdm::CommitElementInCategory`` method
    - Added support creating of dump files (on-premise) or core dumps (cloud platform)
    
1.11.0.4 [16-06-2019]
    - When domain set membership tables were stored in a category checked-out from a different branch than the categories containing identifier data dependent on these domain sets, checking out the data category containing such identifiers would result in empty data. Now, when checking out, identifier data will be filtered against the active set elements of domain sets with regard to the checked-out branch of the categories containing such domain sets. 
    - When upgrading older CDM servers to more recent versions, the naming of truncated column names longer than the maximum column name length supported by the backing database could be changed depending on the deployment platform and compiler used to create the CDM server executables, leading to errors when checking out or committing data from such old databases. During the upgrade to version 1.11.0.1 or beyond, the existing truncated column names will now be stored in an additional column of the intrinsic CDM data definition table and used during data transfer. This will upgrade the CDM database version key. After the CDM database upgrade, the original CDM servers will still be able to use such upgraded CDM databases as before.
    - Negative integer labels could erroneously be translated to unmapped labels from other sets, leading to data being stored for incorrect tuples, and possibly to duplicate tuple error during commits.
    - Category ordering algorithm could lead to incorrect ordering in the presence of defined subsets that were artificially included in the identifier ordering to help the CDM dll to update such subsets when needed during checkouts.
    - This build will no longer support Win32 AIMMS versions
      
1.10.0.7 [20-05-2019]
    - Reading data for integer sets could cause a crash
 
1.10.0.6 [14-05-2019]
    - Added support for release notes

1.10.0.3 [11-05-2019]
    - Improve performance by not unnecessarily pulling category data upon new commit notifications when categories were already at the latest revision. Note that the commit notification procedures   have gotten a new optional 4:superscript:`th` argument, which is required for this performance improvement to work. If you have implemented a custom commit notification procedure, then you should add the 4:superscript:`th` argument and re-visit ``cdm::DefaultCommitInfoNotification`` to investigate what further changes to your custom commit notification procedure are required.

1.9.0.12 [25-04-2019]
    - On-demand CDM service in AIMMS cloud could hang on exit, leading to new clients not being serviced properly
    
1.9.0.11 [24-04-2019]
    - Automatic conversion of string to int did not work on all databases in :any:`cdm::NextUniqueInteger`.
    - ``cdm::EmptyElementInCategory`` could assign empty value to non-existing tuple.
    - Records of snapshot revision in ``cdm::RetireBranchData`` had ids potentially greater than ids of later revisions on same branch, leading to erroneous checkout results.

1.9.0.7 [23-04-2019]
    - MSOBDCSQL13 driver for SQLServer did not accept automatic conversion from integer to string in :any:`cdm::NextUniqueInteger` implementation.

1.9.0.6 [11-04-2019]
    - Added DLL that was preventing CDM from being run from Windows PRO client

1.9.0.4 [09-04-2019]
    - ``cdm::Branches`` set elements were determined with respect to incorrect set in :any:`cdm::AddBranchToCompareSnapshots`.
    
1.9.0.3 [05-04-2019]
    - Added capability to retire intermediate commits by a single snapshot, via ``cdm::RetireBranchData`` function.
    - Modified code to use non-persistent intermediate tables for storing current set content when checking out data to speed up checkout.
    - Added ``cdm::RevisionIdentifierCard`` identifier, holding per-revision cardinality of changes for each individual identifier.
    - When checking out data, cleanup ``cdmrt::ci`` and ``cdmrt::cri`` identifiers in addition to emptying, in case domain sets have been cleared which might leave inactive data behind.
    
1.8.0.27 [27-03-2019]
    - Added capability to compare branches via ``cdmrt::bci`` shadow identifiers, and ``cdm::AddBranchToCompareShapshot`` and 
		``cdm::DeleteBranchFromCompareSnapshot`` functions.
    
1.8.0.22 [04-03-2019]
    - Fixed :any:`cdm::CloneAndRollbackElementInCategory` for integer sets where integer master set (i.e. not root set) is not in the category to which the function is applied.
    - Inactive data due to inactive domain set elements could lead to delta out of identifiers with such inactive data not to be stored, and consequently the commit to be only partial.
    - Element parameter with default that was not (by coincidence) an integer, lead to database query errors, because of not being translated to label number in all cases.
    - Modified code to circumvent MSOBDCSQL13 driver problem.
    - Modified code to skip unresolvable tuples when handling incoming changes for multi-dimensional identifiers, and log the corresponding offending label names, instead of skipping the entire assignment to the model identifiers

1.8.0.3 [09-10-2018]
    - Added :any:`cdm::NextUniqueInteger`, :any:`cdm::CloneAndRollbackElementInCategory` and ``cdm::RollbackElementInCategory`` functions.
    - Identifier with additional index was not picked up correctly when connecting to database (non-matching or less indices were picked up correctly).
    
1.7.0.0 [12-09-2018]
    - Added support for VS2017 builds of AIMMS.

1.6.0.6 [06-09-2018]
    - Fixed foreign key constraint problem when deleting branches
    - Modified code to catch connection lost exceptions and report properly to the model
    
1.6.0.0 [26-07-2018]
    - Added :any:`cdm::DeleteBranch` function.
    
1.5.0.10 [09-05-2018]
    - Modified code to support relative tolerance when comparing values
    
1.5.0.0 [15-04-2018]
    - Initial public release of the CDM library




.. spelling:word-list::

    performant
    unhandled