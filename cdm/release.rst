Release Notes
*************

The first public release of CDM was version 1.5.0.0, release date April 15, 2018. 

Versions with the same major and minor release number use the same protocol between CDM client and service, and can be interchanged freely. Higher release numbers for a given major and minor release number contain bug fixes and potentially new features that do not break the client-server protocol. The on-demand cloud CDM service, will always start a CDM service instance of the latest available release for a given major and minor release number.

New Features and Bug Fixes
--------------------------
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




