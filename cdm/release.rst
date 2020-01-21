Release Notes
*************

The first public release of CDM was version 1.5.0.0, release date April 15, 2018. 

Versions with the same major and minor release number use the same protocol between CDM client and service, and can be interchanged freely. Higher release numbers for a given major and minor release number contain bug fixes and potentially new features that do not break the client-server protocol. The on-demand cloud CDM service, will always start a CDM service instance of the latest available release for a given major and minor release number.

New Features and Bug Fixes
--------------------------
1.16.0.1 [21-01-2020]
    - When contents of root sets was added thru multiple change sets during checkout (e.g. when using cached checkout snapshots), the root set would only contain the elements added during the last change set. 

1.16.0.0 [16-01-2020]
    - Data manipulations involving shadow identifiers when committing, checking out and pulling changes, are now running faster by executing them in a procedure in the CDM runtime library, instead of retrieving, comparing and setting all data thru the AIMMS API.

1.15.0.22 [11-01-2020]
    - Add :token:`cdm::IdentifierCategoryOverride` to CDM library to allow adding identifiers from read-only libraries to categories

    Up until release 1.15.0.20, set membership for newly added labels to any (non-integer) root set in your model was *never* set explicitly, but was *always* implicitly set server-side when such labels were presented to the CDM service. In support of the commit changeset caching feature introduced in CDM release 1.15, set membership is now always required to be set explicitly,  but explicitly setting set membership is only possible if the root set is actually contained in *some* category in your CDM setup. However, for any root set that is part of read-only libraries of your model, adding it to a category was impossible because it was impossible to add the :token:`cdm::category` annotation. Through the identifier :token:`cdm::IdentifierCategoryOverride`, you now have the ability to add such root sets to a CDM category. 

1.15.0.21 [10-01-2020]
    - Terminating the cache update thread would crash AIMMS developer when closing a project running an embedded CDM service
    
1.15.0.20 [08-01-2020]
    - Failed commit could lead to labels to be translated to non-existent label numbers in subsequent commits
    - Label numbers erroneously ending up with an empty label name in the database could confuse the corresponding set in model and lead to an execution error; such labels are now skipped
    - Fix a potential commit error when committing to a newly created database a label that was added as a default to an element parameter
    - Speed-up of :js:func:`cdm::EnumerateBranches` and :js:func:`cdm::ConnectToCategory` by reducing the number of database queries used to produce the result
    - *Commit changesets* are now cached, allowing other clients pulling the same changeset due to a commit notification to retrieve it without any database access, leading to a drastic reduction in database load and pull timings 
    - *Checkout snapshots* for a specific category-branch combination can now be cached, with a specified interval for the cached snapshot to be updated by the server. Checkout requests on the same category-branch combination will now look for a cached snapshot, and combine this with a pull request from the cached snapshot to the head of the branch to produce the requests checkout. When snapshot caching is enabled, this will lead to drastically reduced checkout times.
    
    For CDM backends backed by a MySQL database, you may need to increase the value of the MySQL option :token:`max_allowed_packet` for categories containing a lot of data. If packet size is not big enough to contain the entire snapshot, the connection to the database will be lost when the CDM service tries to store the snapshot. 
    
1.14.0.7 [24-10-2019]
    - Left-over temporary tables are now removed at service startup

1.14.0.6 [14-10-2019]
    - Checkout of a simple *integer* subset with large amount of both element additions and deletions could lead to crash
    
1.14.0.5 [04-10-2019]
    - Modified :js:func:`cdm::DefaultCommitInfoNotification` to allow strictly sequential pulling per commit per category in order to maintain proper cross-category root set - subset relationships in special cases.

1.14.0.4 [03-10-2019]
    - Changes in multi-dimensional identifiers due to data becoming inactive due to elements being removed from domain sets that were true *subsets* were committed on the first *real* change to such identifiers. Changes due to data becoming inactive are now never committed regardless of whether the domain sets are root set or subsets.
    - Yet unhandled data change events could cause the function :js:func:`cdm::WaitForCommitNotifications` to timeout
    
1.14.0.1 [27-09-2019]
    - Selected sensible default and alternative filter strategies for all supported databases.
    - Added commit timeout next to call timeout argument in :js:func:`cdm::ConnectToApplicationDatabase`, and lowered default call timeout.
    - Suppressed commit dialog that appeared when commits lasted at least 60 seconds in the WinUI by default.
    - Added customizable notification and datachange procedures to :js:func:`cdm::CreateCategories` call as well
    - Introduced state machine for correctly keeping CDM identifier state in all use cases
    - Merging in external data could lead to AIMMS errors in certain situations
    - Commit notifications could be held back by the CDM DLL, causing certain revisions of some categories not to be updated as much as they could by the default commit notification procedure. All commit notifications are now forwarded to the specified commit notification procedure in the model.
    - Introduced :js:func:`cdm::WaitForCommitNotifications` function, to allow the model to wait for and execute commit notifications synchronously prior to e.g. committing category changes to minimize the chance of failed commits due to running behind compared to the CDM server.
    
1.13.1.33 [29-08-2019]
    - Index columns of multidimensional identifier tables were not declared as :token:`not null`.
    - Added option to database configuration file to convert schema and table names to lower case.

1.13.1.31 [27-08-2019]
    - Improved code to implement CDM schema update CDM-2019-06-01 to prevent empty column names for redefined tables.
    
1.13.1.30 [21-08-2019]
    - CDM schema update CDM-2019-06-01 could leave upgraded CDM databases with wrong value column names
    - Introduced runtime parameter to allow for alternative filtering strategy that works more performant for a low active/total ratio of domain set elements during checkout.

1.13.1.26 [20-08-2019]
    - Failed data pull would rollback local changes instead of clearing delta-in identifiers.
    - :js:func:`cdm::ConnectToCategory` could be called multiple times, leading to multiple commit notifications being fired to single client.
    - Category-dependent notification and datachange procedures communicated when calling :js:func:`cdm::ConnectToApplicationDB` can now be set via element parameters :token:`cdm::DefaultNotificationProcedure` and :token:`cdm::DefaultDataChangeProcedure`.

1.13.1.18 [31-07-2019]
    - Translation vectors for set elements could be resized too small when extending sets, leading to potential data loss
    
1.13.1.15 [18-07-2019]
    - Multiple clients retrieving domain set data simultaneously (e.g. upon commit notify), could result in a server crash due to a race condition introduced by the branch-dependent domain set filtering added in CDM version 1.11
    - Newly added domain set elements during :js:func:`cdm::CommitElementInCategory` are now restricted to the specified element in the specified set only
    
1.13.1.4 [11-07-2019]
    - Added client and service instance ids to improve service logging and matching of service and client log files
    - Improve dump file creation on-premise
    
1.12.0.7 [09-07-2019]
    - Added support for new :js:func:`cdm::CommitElementInCategory` method
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
    - Improve performance by not unnecessarily pulling category data upon new commit notifications when categories were already at the latest revision. Note that the commit notification procedures   have gotten a new optional 4th argument, which is required for this performance improvement to work. If you have implemented a custom commit notification procedure, then you should add the 4th argument and re-visit :js:func:`cdm::DefaultCommitInfoNotification` to investigate what further changes to your custom commit notification procedure are required.

1.9.0.12 [25-04-2019]
    - On-demand CDM service in AIMMS cloud could hang on exit, leading to new clients not being serviced properly
    
1.9.0.11 [24-04-2019]
    - Automatic conversion of string to int did not work on all databases in :js:func:`cdm::NextUniqueInteger`.
    - :js:func:`cdm::EmptyElementInCategory` could assign empty value to non-existing tuple.
    - Records of snapshot revision in :js:func:`cdm::RetireBranchData` had ids potentially greater than ids of later revisions on same branch, leading to erroneous checkout results.

1.9.0.7 [23-04-2019]
    - MSOBDCSQL13 driver for SQLServer did not accept automatic conversion from integer to string in :js:func:`cdm::NextUniqueInteger` implementation.

1.9.0.6 [11-04-2019]
    - Added DLL that was preventing CDM from being run from Windows PRO client

1.9.0.4 [09-04-2019]
    - :js:func:`cdm::Branches` set elements were determined with respect to incorrect set in :js:func:`cdm::AddBranchToCompareSnapshots`.
    
1.9.0.3 [05-04-2019]
    - Added capability to retire intermediate commits by a single snapshot, via :js:func:`cdm::RetireBranchData` function.
    - Modified code to use non-persistent intermediate tables for storing current set content when checking out data to speed up checkout.
    - Added :js:func:`cdm::RevisionIdentifierCard` identifier, holding per-revision cardinality of changes for each individual identifier.
    - When checking out data, cleanup :token:`cdmrt::ci` and :token:`cdmrt::cri` identifiers in addition to emptying, in case domain sets have been cleared which might leave inactive data behind.
    
1.8.0.27 [27-03-2019]
    - Added capability to compare branches via :js:func:`cdmrt::bci` shadow identifiers, and :js:func:`cdm::AddBranchToCompareShapshot` and :js:func:`cdm::DeleteBranchFromCompareSnapshot` functions.
    
1.8.0.22 [04-03-2019]
    - Fixed :js:func:`cdm::CloneAndRollbackElementInCategory` for integer sets where integer master set (i.e. not root set) is not in the category to which the function is applied.
    - Inactive data due to inactive domain set elements could lead to delta out of identifiers with such inactive data not to be stored, and consequently the commit to be only partial.
    - Element parameter with default that was not (by coincidence) an integer, lead to database query errors, because of not being translated to label number in all cases.
    - Modified code to circumvent MSOBDCSQL13 driver problem.
    - Modified code to skip unresolvable tuples when handling incoming changes for multi-dimensional identifiers, and log the corresponding offending label names, instead of skipping the entire assignment to the model identifiers

1.8.0.3 [09-10-2018]
    - Added :js:func:`cdm::NextUniqueInteger`, :js:func:`cdm::CloneAndRollbackElementInCategory` and :js:func:`cdm::RollbackElementInCategory` functions.
    - Identifier with additional index was not picked up correctly when connecting to database (non-matching or less indices were picked up correctly).
    
1.7.0.0 [12-09-2018]
    - Added support for VS2017 builds of AIMMS.

1.6.0.6 [06-09-2018]
    - Fixed foreign key constraint problem when deleting branches
    - Modified code to catch connection lost exceptions and report properly to the model
    
1.6.0.0 [26-07-2018]
    - Added :js:func:`cdm::DeleteBranch` function.
    
1.5.0.10 [09-05-2018]
    - Modified code to support relative tolerance when comparing values
    
1.5.0.0 [15-04-2018]
    - Initial public release of the CDM library




