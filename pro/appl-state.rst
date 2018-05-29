Determining the Application State to Transfer
---------------------------------------------

In many cases, it is not necessary to transfer the entire state of your client application to initiate the server-side session appropriately. In some cases, you may not need to transfer any application state at all, because the arguments of the procedure call initiating the server-side session already provide all the information necessary to retrieve the data that is needed to successfully execute the request.

Specifying Case Content
+++++++++++++++++++++++

To reduce the amount of data that is sent between the server and the client, or to prevent that data is transferred at all, you can provide the AIMMS PRO library with information about what data should be stored in the case files sent back and forth. The mechanisms are slightly different for projects using the data management style storing all cases in a single .dat file, as opposed to the data management style where all individual cases are directly stored in separate files on disk. The latter option is only available in AIMMS 3.12 and later.

Specifying Case Types
^^^^^^^^^^^^^^^^^^^^^

For the single .dat file data management style, you can instruct the AIMMS PRO library to use a specific case type by setting the following element parameters:

* pro::ManagedSessionInputCaseType, denoting which case type should be used for data transfer from the client to the server
* pro::ManagedSessionOutputCaseType, denoting which case type should be used for data transfer from the server to the client


If you do not set these two element parameters explicitly, the AIMMS PRO library will use the predefined case type All Identifiers by default. This means that the values of all identifiers that do not have the NoSave property set will be transferred back and forth. If you set any of the above element parameters explicitly to the empty element, AIMMS PRO will not create and transfer an input, and/or output case file respectively.

Specifying Case Content
^^^^^^^^^^^^^^^^^^^^^^^

For the data management style using separate files on disk for each case, case content is specified through a subset of the predefined set AllIdentifiers. You can specify the contents sent in input and output cases by filling the following sets:

* pro::ManagedSessionInputCaseIdentifierSet, for input cases
* pro::ManagedSessionOutputCaseIdentifierSet, for output cases
 
If not specified explicitly, both sets will default to AllIdentifiers. If you assign the empty set to any of these sets, AIMMS PRO will not create and transfer an input, and/or output case file respectively.

Caveats:
 
* pro::ManagedSessionOutputCaseIdentifierSet needs to be assigned during the solver session.
* Make sure that the data of sets and parameters referenced in the index domain attribute of the variables computed server side and communicated via the output case to the client side, are also available client side or passed in the output case.

.. note::

    The function ReferencedIdentifiers can be used to find all referenced identifiers in a given subset of AllIdentifiers and thus extend the identifier subsets pointed to by pro::ManagedSessionInputCaseIdentifierSet and pro::ManagedSessionOutputCaseIdentifierSet as needed.


Optional action to be taken after case load
+++++++++++++++++++++++++++++++++++++++++++

You can specify the action to be taken after a case is loaded client or server side. In the client session, the action to be taken after a case load is defined by the element parameter <code>pro::session::PostLoadResultCaseHook</code>. For example, by setting:

.. code::

    pro::session::PostLoadResultCaseHook := 'postProcessComputedResults' ;

the procedure postProcessComputedResults will be executed by the pro::delegateToServer completion callback procedures that load the result case, and by the load results button in the "Managed Requests" dialogue. The element assigned to pro::session::PostLoadResultCaseHook should reference a procedure without arguments.

Similarly, the pro::session::PostLoadInputCaseHook can reference a procedure to be executed in a server session after loading the input case.

Saving Log Files
++++++++++++++++


By default, at the end of a server-side session, the messages.log file created during that session will be stored for inspection within the client session. If you do not want to have this log file saved, you can prevent this by setting the parameter pro::session::SaveSessionMessages to 0.