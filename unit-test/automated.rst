Automated testing
*****************

To run tests in an automated fashion, the AIMMS Unit Test framework comes with a Python script :token:`AIMMSUnitTests.py` that you can call from the command line to run all, or selected tests. You can copy the :token:`AIMMSUnitTest.py` script to your project folder by calling the procedure :token:`aimmsunit::CopyPythonScript`. The arguments of the Python script are:

* the AIMMS version to be used to run the test (e.g. :token:`4.53.1.8`), the test script will automatically download the AIMMS version from the AIMMS download site and unpack it in the *aimms* subfolder of the location from which you run the script. This may take some time when you run the script for the first time.
* the architecture to run the test on (:token:`x86` / :token:`x64` on Windows, or :token:`x64` on Linux)
* the project folder, relative to the working folder, containing the AIMMS project to test
* the name of the project file (e.g. :token:`MyProject.aimms`)
* optionally, the names of the test suites to test (:token:`--suites` argument), if not specified all test suites will be run.

.. tip::
    
    You can use this script, for instance, when checking in a new version of your project into your version control system. 

Requirements for the Python script
==================================

To successfully run the script, you should have the following software installed on your test machine:

* Python > 3.7
* Python requests module installed (install via :token:`pip install requests`)
* 7-zip (Windows only, installed in :token:`C:\\Program Files\\7-zip\\7z.exe`

Example - we practise what we preach
=======================================

When checking in a new version of the AIMMS Unit Test library into our internal *Gitlab* repository, a build script will automatically be run to

* build all external DLLs that come with the AIMMS Unit Test library,
* run the unit test suites defined by the AIMMS Unit Test library project itself, and
* if successful, package the AIMMS Unit Test library, and upload it to the AIMMS Library repository.

The following output of running the test suites is returned during the second step

.. code-block:: none

     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     +++++ Unit tests of project test-AIMMSUnitTest-edit.aimms succeeded:
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
     <testsuites>
       <testsuite id="1" name="TestAimmsUnitTest" timestamp="2020-07-11T14:33:48" tests="21" time="4.909">
         <testcase name="001-TestActiveTestSuite" time="0.001"/>
         <testcase name="002-TestKVValues" time="0.055"/>
         <testcase name="003-TestSimpleNumericalEquality" time="0.002"/>
         <testcase name="004-TestNumericalTolerances" time="0.001"/>
         <testcase name="005-TestStructuralDifferences" time="0.003"/>
         <testcase name="006-TestComparingBigDatasets" time="1.165"/>
         <testcase name="007-TestSpecialNumberComparison" time="0.002"/>
         <testcase name="008-TestEqualityWithInactiveData" time="0.001"/>
         <testcase name="009-TestEqualityWithOrderedSet" time="0.001"/>
         <testcase name="010-TestElementParameterComparison" time="0.001"/>
         <testcase name="011-TestStringParameterComparison" time="0.058"/>
         <testcase name="012-TestSimpleThrow" expected-exceptions="1" time="0.001"/>
         <testcase name="013-TestRaise" expected-exceptions="1" time="0.001"/>
         <testcase name="014-TestNonPresentExternalProcedure" expected-exceptions="1" time="0.001"/>
         <testcase name="015-TestCreateClonedDataSet" time="0.002"/>
         <testcase name="016-TestFillClonedDataSet" time="1.264"/>
         <testcase name="017-TestCompareClonedDataSet" time="0.001"/>
         <testcase name="018-TestRestoreFromClonedDataSet" time="1.228"/>
         <testcase name="019-TestDeleteClonedDataSet" time="0.006"/>
         <testcase name="020-TestGetRandomSeed" time="0.001"/>
         <testcase name="021-TestStopWatch" time="1.114"/>
       </testsuite>
     </testsuites>

If any of the tests fail, the python script will list the contents of the file :token:`log/AimmsUnit.xml` to show the individual results of all tests.
