Release Notes
*************

The first public release of CDM was version 1.5.0.0, release date April 15, 2018. 

Versions with the same major and minor release number use the same protocol between CDM client and service, and can be interchanged freely. Higher release numbers for a given major and minor release number contain bug fixes and potentially new features that do not break the client-server protocol. The on-demand cloud CDM service, will always start a CDM service instance of the latest available release for a given major and minor release number.

New Features
------------

1.9.0.1
    - Added capability to retire intermediate commits by a single snapshot, via :token:`cdm::RetireBranchData` function.
    
1.8.0.27
    - Added capability to compare branches via :token:`cdmrt::bci` shadow identifiers, and :token:`cdm::AddBranchToCompareShapshot` and :token:`cdm::DeleteBranchFromCompareSnapshot` functions.
    
1.8.0.3
    - Added :token:`cdm::NextUniqueInteger`, :token:`cdm::CloneAndRollbackElementInCategory` and :token:`cdm::RollbackElementInCategory` functions.
    
1.7.0.0 
    - Added support for VS2017 builds of AIMMS.

1.6.0.0
    - Added :token:`cdm::DeleteBranch` function.
    
Bug Fixes
---------

1.8.0.22
    - Fix CloneAndRollbackElementInCategory for integer sets where integer master set (ie. not root set) is not in the category to which the function is applied.
    - Inactive data due to inactive domain set elements will lead to delta out of identifiers with such inactive data not to be stored, and consequently the commit to be only partial.
    - Element parameter with default that was not (by coincidence) an integer, lead to database query errors, because of not being translated to label number in all cases.
    - Circumvent MSOBDCSQL13 driver problem.
    - Skip adding unresolvable tuples when handling incoming changes for multi-dimensional identifiers, and log the corresponding offending label names, instead of dropping the entire assignment to the model identifiers
    
1.8.0.3
    - Identifier with additional index wasn't picked up correctly when connecting to database (non-matching or less indices were picked up correctly).
    
1.8.0.27
    - Added capability to compare branches via :token:`cdmrt::bci` shadow identifiers, and :token:`cdm::AddBranchToCompareShapshot` and :token:`cdm::DeleteBranchFromCompareSnapshot` functions.
    
1.6.0.6
    - Fix foreign key constraint problem when deleting branches
    - Catch connection lost exceptions and report properly to model




