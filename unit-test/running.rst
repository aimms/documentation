Running test suites
*******************

The function :token:`aimmsunit::RunSelectedTestSuites` will run all, or a selected set of, test suites, determined by the set :token:`aimmsunit::TestSuitesToRun`. This set will be initialized to all available test suites at the start up of the project. If you add test suites, you can call :token:`aimmsunit::DetermineTestSuites` to determine the current collection of tests and test suites.

The function :token:`aimmsunit::RunSelectedTestSuites` will return 1 if all tests succeeded, or 0 otherwise. In addition, the AIMMS Unit Test framework will also indicate the success or failure through the existence of the files :token:`log/AimmsUnit.succeeded` / :token:`log/AimmsUnit.failed` after the tests have been run. The latter provides an easy way to check the test outcome when the tests are run `in an automated fashion <automated.html>`_ from the command line.

Example
=======

Invoking

.. code::

    aimmsunit::RunSelectedTestSuites;

will run all available test suites in a given AIMMS project.

During development of new unit tests, triggering ``aimmsunit::DetermineTestSuites`` will detect all new tests added to the project. You can test all new tests through the sequence 

  .. code::

    aimmsunit::DetermineTestSuites;
    aimmsunit::RunSelectedTestSuites;


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

If a test fails, the AIMMS Unit Test framework, will display as much detail about the failure as possible, e.g. the list of warnings created the AIMMS Unit Test framework itself, but also the AIMMS errors that occurred while running a particular test. This may help you to determine the cause of the failure.

Selecting the base name of the result file
------------------------------------------

Through the environment variable/command-line argument :token:`aimmsunit::ResultsBaseName` you can select the ``basename`` of the results files. The default ``basename`` is "AimmsUnit". You can use this feature to create multiple results files, when you want to run multiple test suites in parallel, for instance when an application uses the CDM library and you want to test the correct interaction between multiple sessions. To produce a single result file, you can merge the results stored in an alternative results file back into the current results through the function :token:`aimmsunit::MergeTestSuiteResults`.

Running from the command line 
-----------------------------

You can run the unit tests from the command line using the ``AimmsCmd`` program:

.. code-block:: console

	AimmsCmd [--aimmsunit::RunAllTests 1] \
			 [--aimmsunit::RunTestSuites <suite-1>,<suite-2>,...] \
			 [--aimmsunit::ExcludeTestSuites <suite-1>,<suite-2>,...] \
			 --run-only aimmsunit::TestRunner \
			 <your-project.aimms>
	
This will run all or a selected collection of test suites, or exclude a collection of test suites from specified test suites to run.
