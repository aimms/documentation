Running test suites
*******************

The function :token:`aimmsunit::TestRunner` will run all, or a selected set of, test suites. Which test suites to run can be arranged through the environment variables/command-line arguments

* :token:`aimmsunit::RunAllTests`
* :token:`aimmsunit::RunTestSuites`

If you set :token:`aimmsunit::RunAllTests` to the value "1", all tests suites will be run. The function :token:`aimmsunit::TestRunner` will return 1 if all tests succeeded, or 0 otherwise. In addition, the AIMMS Unit Test framework will also indicate the success or failure through the existence of the files :token:`log/AimmsUnit.succeeded` / :token:`log/AimmsUnit.failed` after the tests have been run. The latter provides an easy way to check the test outcome when the tests are run `in an automated fashion <automated.html>`_ from the command line.

Through the environment variable/command-line argument :token:`aimmsunit::RunTestSuites` you can specify a comma-separated list of test suites you want to run. 

Example
=======

Invoking

.. code::

    EnvironmentSetString("aimmsunit::RunAllTests","1");
    aimmsunit::TestRunner;

will run all available test suites in a given AIMMS project.

.. note::

  During development of new unit tests, triggering ``aimmsunit::DetermineTestSuites`` makes it easier to write and debug the tests.

  .. code::

      aimmsunit::DetermineTestSuites;
      EnvironmentSetString("aimmsunit::RunAllTests","1");
      aimmsunit::TestRunner;


Detailed inspection of results
==============================

The XML file :token:`log/AimmsUnit.xml` contains a detailed listing of the results of running your tests. Per test suite, it will list the all tests, their run times, and their failures (if any). For example, the file 

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <testsuites>
      <testsuite id="1" name="TestAimmsUnitTest" timestamp="2018-04-30T16:16:49" tests="11" failures="1" time="0.739">
        <testcase name="TestKVValues" time="0.001"/>
        <testcase name="TestSimpleNumericalEquality" time="0.001"/>
        <testcase name="TestNumericalTolerances" time="0.001">
          <failure message="p1 should be equal to p2 within absolute tolerance."/>
        </testcase>
        <testcase name="TestStructuralDifferences" time="0.001"/>
        <testcase name="TestComparingBigDatasets" time="0.690"/>
        <testcase name="TestSpecialNumberComparison" time="0.001"/>
        <testcase name="TestElementParameterComparison" time="0.001"/>
        <testcase name="TestStringParameterComparison" time="0.040"/>
        <testcase name="TestSimpleThrow" time="0.001"/>
        <testcase name="TestRaise" time="0.001"/>
        <testcase name="TestNonPresentExternalProcedure" time="0.001"/>
      </testsuite>
    </testsuites>

indicates that the test suite :token:`TestAimmsUnitTest` of the AIMMS Unit Test framework itself was run, with one failure for the test :token:`TestNumericalTolerances`. The test was run in 0.739 seconds, with the majority of the time being spent in the test :token:`TestComparingBigDatasets`. 

Selecting the base name of the result file
------------------------------------------

Through the environment variable/command-line argument :token:`aimmsunit::ResultsBaseName` you can select the basename of the results files. The default basename is "AimmsUnit". You can use this feature to create multiple results files, when you want to run multiple test suites in parallel, for instance when an application uses the CDM library and you want to test the correct interaction between multiple sessions. To produce a single result file, you can merge the results stored in an alternative results file back into the current results through the function :token:`aimmsunit::MergeTestSuiteResults`.
