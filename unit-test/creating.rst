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

* :js:func:`aimmsunit::AssertTrue`
* :js:func:`aimmsunit::AssertFalse`
* :js:func:`aimmsunit::AssertThrow`

.. js:function:: aimmsunit::AssertTrue(desc, expression, cont)
   
   The function evaluates whether the given *expression* evaluates to :token:`true`. If it evaluates to :token:`false`, this will be caught by the AIMMS Unit Test framework and reported back to the user with the given description. 
   
   :param desc: description to be displayed when the assertion fails
   :param expression: expression to be evaluated
   :param cont: optional argument whether or not to continue with the test upon failure (default 0)
   
   For example, the test

   .. code::
   
       p := 1;
       aimmsunit::AssertTrue("p should be equal to 1", p = 1);

   will succeed, while the test

   .. code::
   
       p := 2;
       aimmsunit::AssertTrue("p should be equal to 1", p = 1);

   will fail. The latter will then throw an exception with description :token:`"p should be equal to 1"`.

.. js:function:: aimmsunit::AssertFalse(desc, expression, cont)
   
   The function evaluates whether the given *expression* evaluates to :token:`false`. If it evaluates to :token:`true`, this will be caught by the AIMMS Unit Test framework and reported back to the user with the given description. 

   :param desc: description to be displayed when the assertion fails
   :param expression: expression to be evaluated
   :param cont: optional argument whether or not to continue with the test upon failure (default 0)
   
.. js:function:: aimmsunit::AssertThrow(desc, errorcode, errormessage)
   
    By default, when a test procedure raises a runtime error, the test runner will catch the error and report it as a failed test. Through the :token:`aimmsunit::AssertThrow` evaluator you indicate to the AIMMS Unit Test framework that the test is supposed to give rise to an AIMMS runtime error. Through the optional :token:`errorcode` and :token:`errormessage` you can test for specific error codes and error messages in the recorded runtime error. If either or both are specified, and are non-matching, the assertion will fail. 
    
    :param desc: description to be displayed when the function does not throw
    :param errorcode: optional argument to specify the expected ``errorcode``
    :param errormessage: optional argument to specify the expected ``errormessage``

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

Creating cloned data sets
=========================

In order to be able to easily compare multiple identifiers affected by a single test, the AIMMS Unit Test framework supports *cloned datasets*, i.e., a clone of a collection of multi-dimensional parameters created in a runtime library. Once created, you can store the current values of the collection of parameters into the cloned dataset, and later when you have performed some test that have modified the values of the parameters, you can compare the parameter data with the values stored into the cloned dataset, to verify that the test succeeded.

Cloned datasets are restricted to numerical, element and string parameters and variables. Because of their role in iterating over multi-dimensional data, sets can principally not be part of cloned datasets, and advanced data types, such as unit parameters and special data types for specific mathematical model types, are also excluded because they are much less likely to be changed computationally.
 

Available cloned data set functions
-----------------------------------

.. js:function:: aimmsunit::CreateClonedDataSet(idSet, cloneName)
   
   Create a cloned data set named :token:`cloneName` containing all parameters in the identifier set :token:`idSet` (which should be a subset of :token:`AllIdentifiers`). The function will create a module with the name :token:`cloneName` within the runtime library :token:`AimmsUnitTestRuntime` that will contain a clone of all parameters contained in the set :token:`idSet`. 

   :param idSet: the set of identifiers to clone
   :param cloneName: the name of the cloned data set to create

.. js:function:: aimmsunit::DeleteClonedDataSet(cloneName)
   
   Delete the cloned data set named :token:`cloneName`. This function will remove the module created through the function :js:func:`aimmsunit::CreateClonedDataSet`.

   :param cloneName: the name of the cloned data set to delete

.. js:function:: aimmsunit::FillClonedDataSet(idSet, cloneName)
   
   Fill the cloned parameters in cloned data set :token:`cloneName` with the actual values of parameters contained in :token:`idSet`.

   :param idSet: the set of identifiers to copy the data from
   :param cloneName: the name of the cloned data set to copy.

.. js:function:: aimmsunit::RestoreClonedDataSet(idSet, cloneName)
   
   Restore the actual values of the parameters contained in :token:`idSet` from the cloned parameters in cloned data set :token:`cloneName`.

   :param idSet: the set of identifiers to restore the data from
   :param cloneName: the name of the cloned data set to restore from.

.. js:function:: aimmsunit::EmptyClonedDataSet(idSet, cloneName)
   
   Empty the cloned parameters in cloned data set :token:`cloneName` for each of the parameters contained in :token:`idSet`.

   :param idSet: the set of identifiers to empty the cloned data for
   :param cloneName: the name of the cloned data set to empty.

.. js:function:: aimmsunit::CompareClonedDataSet(idSet, cloneName, eps)
   
   Compare the values of cloned parameters in cloned data set :token:`cloneName` with each of the parameters contained in :token:`idSet`. The function will return 1 if there are no structural differences, and if all numerical differences are smaller than :token:`eps`.

   :param idSet: the set of identifiers to compare the cloned data with
   :param cloneName: the name of the cloned data set to compare
   :param eps: the relative and absolute tolerance to use for numerical comparison
