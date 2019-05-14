Release Notes
*************

The first public release of CDM was version 1.5.0.0, release date April 15, 2018. 

Versions with the same major and minor release number use the same protocol between CDM client and service, and can be interchanged freely. Higher release numbers for a given major and minor release number contain bug fixes and potentially new features that do not break the client-server protocol. The on-demand cloud CDM service, will always start a CDM service instance of the latest available release for a given major and minor release number.

New Features and Bug Fixes
--------------------------

1.10.0.4 [14-05-2019]
    - Added support for release notes

1.10.0.3 [11-05-2019]
    - Improve performance by not unnecessarily pulling category data upon new commit notifications when categories were already at the latest revision. Note that the commit notification procedures   have gotten a new optional 4th argument, which is required for this performance improvement to work. If you have implemented a custom commit notification procedure, then you should add the 4th argument and re-visit :token:`cdm::DefaultCommitInfoNotification` to investigate what further changes to your custom commit notification procedure are required.

1.9.0.12 [25-04-2019]
    - On-demand CDM service in AIMMS cloud could hang on exit, leading to new clients not being serviced properly
    
1.9.0.11 [24-04-2019]
    - Automatic conversion of string to int did not work on all databases in cdm::NextUniqueInteger.
    - cdm::EmptyElementInCategory could assign empty value to non-existing tuple.
    - Records of snapshot revision in :token:`cdm::RetireBranchData` had ids potentially greater than ids of later revisions on same branch, leading to erroneous checkout results.

1.9.0.7 [23-04-2019]
    - MSOBDCSQL13 driver for SQLServer did not accept automatic conversion from integer to string in cdm::NextUniqueInteger implementation.

1.9.0.6 [11-04-2019]
    - Added DLL that was preventing CDM from being run from Windows PRO client

1.9.0.4 [09-04-2019]
    - :token:`cdm::Branches` set elements were determined wrt to incorrect set in :token:`cdm::AddBranchToCompareSnapshots`.
    
1.9.0.3 [05-04-2019]
    - Added capability to retire intermediate commits by a single snapshot, via :token:`cdm::RetireBranchData` function.
    - Modified code to use non-persistent intermediate tables for storing current set content when checking out data to speed up checkout.
    - Added :token:`cdm::RevisionIdentifierCard` identifier, holding per-revision cardinality of changes for each individual identifier.
    - When checking out data, cleanup :token:`cdmrt::ci` and :token:`cdmrt::cri` identifiers in addition to emptying, in case domain sets have been cleared which might leave inactive data behind.
    
1.8.0.27 [27-03-2019]
    - Added capability to compare branches via :token:`cdmrt::bci` shadow identifiers, and :token:`cdm::AddBranchToCompareShapshot` and :token:`cdm::DeleteBranchFromCompareSnapshot` functions.
    
1.8.0.22 [04-03-2019]
    - Fixed CloneAndRollbackElementInCategory for integer sets where integer master set (i.e. not root set) is not in the category to which the function is applied.
    - Inactive data due to inactive domain set elements could lead to delta out of identifiers with such inactive data not to be stored, and consequently the commit to be only partial.
    - Element parameter with default that was not (by coincidence) an integer, lead to database query errors, because of not being translated to label number in all cases.
    - Modified code to circumvent MSOBDCSQL13 driver problem.
    - Modified code to skip unresolvable tuples when handling incoming changes for multi-dimensional identifiers, and log the corresponding offending label names, instead of skipping the entire assignment to the model identifiers

1.8.0.3 [09-10-2018]
    - Added :token:`cdm::NextUniqueInteger`, :token:`cdm::CloneAndRollbackElementInCategory` and :token:`cdm::RollbackElementInCategory` functions.
    - Identifier with additional index wasn't picked up correctly when connecting to database (non-matching or less indices were picked up correctly).
    
1.7.0.0 [12-09-2018]
    - Added support for VS2017 builds of AIMMS.

1.6.0.6 [06-09-2018]
    - Fixed foreign key constraint problem when deleting branches
    - Modified code to catch connection lost exceptions and report properly to model
    
1.6.0.0 [26-07-2018]
    - Added :token:`cdm::DeleteBranch` function.
    
1.5.0.10 [09-05-2018]
    - Modified code to use relative tolerance when comparing values
    
1.5.0.0 [15-04-2018]
    - Initial public release of CDM library




