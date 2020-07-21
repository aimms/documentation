Release Notes
*************

The first public release of AIMMSUnitTest was version 1.0.0.32, release date December 13, 2017

New Features and Bug Fixes
--------------------------
1.0.0.95 [21-07-2020]
    - Upgraded internal library due to performance issue
    
1.0.0.76 [23-04-2020]
    - Added support for cloning and comparing cloned datasets
    - Adapted AIMMSUnitTest.py for python 3 compatability
    
1.0.0.69 [23-05-2019]
    - Added capability to duplicate existing test suite to allow for testing multiple scenarios of the same test suite
    - Added capability to use different names for results files
    - Added capability to merge results stored in a results file into the current results

1.0.0.66 [16-05-2019]
    - :js:func:`aimmsunit::CompareEqual` could return false when either argument contained inactive data

1.0.0.59 [14-05-2019]
    - Added support for release notes

1.0.0.58 [28-04-2018]
    - Added NoSave option to library to prevent loading cases from destroying internal state of AIMMSUnitTest library
    
1.0.0.56 [13-09-2018]
    - Added support for VC2017
    
1.0.0.43 [01-08-2018]
    - Used improved annotation support of AIMMS
    
1.0.0.42 [04-07-2018]
    - Testrunner did not return any value
 
1.0.0.40 [01-05-2018]
    - Fixed fetching AIMMS executable in automation script
    - Added relative comparison to :js:func:`aimmsunit::CompareEqual`
    
1.0.0.35 [30-04-2018]
    - Added python script for test automation

1.0.0.32 [13-12-2017]
    - Initial public release of AIMMSUnitTest