Creating unit test suites
*************************

You can create suites of unit tests through the model annotations 

* :token:`aimmsunit::TestSuite`
* :token:`aimmsunit::Setup`
* :token:`aimmsunit::TearDown`

Creating a test suite
=====================

You can create a suite of unit tests by setting the annotation :token:`aimmsunit::TestSuite` to the name of the test suite you want to create 

* for all procedures separately that you want to be part of the test suite, or 
* on a section in your model that contains all the procedures that you want to add to the test suite

Adding setup and teardown procedures
====================================

By default, all procedures in a test suite will be considered as procedures that contain unit tests to be executed when testing the given test suite. By setting the additional annotations :token:`aimmsunit::Setup` or :token:`aimmsunit::TearDown` to the value *1* you indicate that these procedure do not contain tests, but are intended to set up the data and/or state of your model necessary for the tests in the test suite to run successfully (for :token:`aimmsunit::Setup`), or to restore the model to its original state (for :token:`aimmsunit::TearDown`). Any `assertion evaluators <#assertion-evaluators>`_ in the setup and teardown procedures of a test suite will be ignored.

Duplicating test suites
=======================

If you want to test a test suite for different scenarios, you can duplicate an existing test suite through the function :token:`aimmsunit::DuplicateTestSuite`. This will create a new test suite with exactly the same setup, teardown and test procedures as the original test suite. When running the tests, you can use the element parameter :token:`aimmsunit::ActiveTestSuite` to select the proper scenario in the setup procedure of the test suite.

Assertion evaluators
====================

The results of your unit tests reported back by the AIMMS Unit Test framework are completely driven by the *assertion evaluators*
* :token:`aimmsunit::AssertTrue`
* :token:`aimmsunit::AssertFalse`
* :token:`aimmsunit::AssertThrow`

.. js:function:: aimmsunit::AssertTrue(desc, expression)
   
   The function evaluates whether the given *expression* evaluates to :token:`true`. If it evaluates to :token:`false`, this will be caught by the AIMMS Unit Test framework and reported back to the user with the given description. 
   
   :param desc: description to be displayed when the assertion fails
   :param expression: expression to be evaluated
   
   For example, the test

   .. code::
   
       p := 1;
       aimmsunit::AssertTrue("p should be equal to 1", p = 1);

   will succeed, while the test

   .. code::
   
       p := 2;
       aimmsunit::AssertTrue("p should be equal to 1", p = 1);

   will fail. The latter will then throw an exception with description :token:`"p should be equal to 1"`.

.. js:function:: aimmsunit::AssertFalse(desc, expression)
   
   The function evaluates whether the given *expression* evaluates to :token:`false`. If it evaluates to :token:`true`, this will be caught by the AIMMS Unit Test framework and reported back to the user with the given description. 

   :param desc: description to be displayed when the assertion fails
   :param expression: expression to be evaluated
   
.. js:function:: aimmsunit::AssertThrow(desc)
   
    By default, when a test procedure raises a runtime error, the test runner will catch the error and report it as a failed test. Through the :token:`aimmsunit::AssertThrow` evaluator you indicate to the AIMMS Unit Test framework that the test is supposed to give rise to an AIMMS runtime error. 
    
    :param desc: description to be displayed when the function does not throw

    For example, the test

    .. code::
    
        aimmsunit::AssertThrow("This procedure should throw");
        a := 1/0;

    will succeed, because the division by zero in the assignment will cause a runtime error.
 
Comparing multi-dimensional identifier data
-------------------------------------------

A very common test you might want to use, is to compare the contents of two multi-dimensional identifiers. 

.. js:function:: aimmsunit::CompareEqual(p1,p2,eps) 

   This function test whether the given identifier slices are equal, where equality means:
   
   * same dimension,
   * same root domain sets,
   * same value type, and
   * tuple-wise value equality within the given relative tolerance

   :param p1: first identifier slice to compare
   :param p2: second identifier slice to compare
   :param eps: relative tolerance for testing equality (optional argument, default *1.0e-14*)

   The following three tests will all succeed.

   .. code::    

        p1(i) := 1;
        p2(i) := 1 + 9.9e-15;
        aimmsunit::AssertTrue("p1 should be equal to p2 within relative tolerance", aimmsunit::CompareEqual(p1,p2));

   .. code::
    
        p1(i) := 1;
        p2(i) := 1 + 1.1e-14;
        aimmsunit::AssertFalse("p1 should be unequal to p2 within relative tolerance", aimmsunit::CompareEqual(p1,p2));

   .. code::
    
        p1(i) := 0;
        p2(i) := 1e-15;
        aimmsunit::AssertTrue("p1 should be equal to p2 within absolute tolerance", aimmsunit::CompareEqual(p1,p2));
