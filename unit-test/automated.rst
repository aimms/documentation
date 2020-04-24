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

    AimmsCmd.exe (build 4.45.3.0)
    Copyright 1993 - 2014 AIMMS B.V.
    Running project: c:\u\Gitlab-Runner\builds\e03d9f06\0\Libraries\aimms-unit-test\AIMMSUnitTest-edit\test-AIMMSUnitTest-edit.aimms
    1:> Return value = 0
    2:> Ok
    Closing project
    +++++ Unit tests of project test-AIMMSUnitTest-edit.aimms succeeded

If any of the tests fail, the python script will list the contents of the file :token:`log/AimmsUnit.xml` to show the individual results of all tests.
