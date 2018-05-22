Basic AIMMS PRO Workflow
========================

Basic Usage
-----------

In its most basic form, AIMMS PRO allows you, from within the PRO client application, to dispatch an optimization request to the server, which will be scheduled for execution by a server-side AIMMS session. By default, the PRO client library will transfer the application state between the client- and server-side session by means of AIMMS case files. This will cause the server-side session to start from exactly the same state as where the request was made in the client-side session. When the server-side session is finished, the output results will be stored for the client session to retrieve, and the client session will be notified that the request has completed. The end-user will then be able to load the output results via the <em>Request Manager</em> dialog that is part of the PRO GUI library.

Other Workflows
---------------

Obviously, the AIMMS PRO framework allows you to implement other workflows between the client- and server-side sessions. The additional features that are necessary to take more control over the interaction between the client-side and the server-side sessions are described in `Advanced AIMMS PRO workflows <advanced-workflows.html>`_.

Modify Procedures
-----------------

Any procedure that you would like to execute in a server-side session instead of within the client session, should be modified by adding specific PRO-related code at the top of the procedure. Typically, such procedure calls will involve optimization of a mathematical program, as a PRO client session does not support optimization. However, you can also dispatch other computationally intensive tasks that do not involve optimization to a server-side session. In its most basic form, to PRO-enable your project, you should add the following code at the top of the procedure that you want to be executed in a server-side session:

.. code::

    if pro::DelegateToServer then
        return 1;
    endif;


The behavior of this function varies, depending on whether it is running client-side or server-side.


Client-side Behavior of pro::DelegateToServer
+++++++++++++++++++++++++++++++++++++++++++++

The following section explains what happens on the client side when the pro::DelegateToServer procedure is called from the AIMMS application.
When the pro::DelegateToServer statement is encountered, behind the scenes, it:
 
* creates a case of type AllIdentifiers containing the current state of the application and sends to the AIMMS PRO server.
* prepares a message containing the name of the procedure (containing the DelegateToServer statement) and all its arguments and sends to the AIMMS PRO server. This message will lead to a complete re-execution of the procedure at the server-side worker session.
* Because it is running client-side, the statement will return the numeric value 1. Since this value is used in an if condition that has 'return 1' on the true branch, the statements after DelegateToClient will not be executed.


Server-side Behavior of pro::DelegateToServer
+++++++++++++++++++++++++++++++++++++++++++++

When the PRO server receives the request, it queues the job, and eventually starts up a server-side instance of the project. This session then loads the case and executes the same procedure call that contains the pro::DelegateToServer statement on the client-side that initiated the server-side session. On the server-side, the pro::DelegateToServer statement will return a value of 0, which results in the original content of the procedure being executed. When the procedure containing the pro::DelegateToServer call has finished executing, the PRO server will create a case file containing the values of AllIdentifiers and will send a message to the client that the job is finished.

Displaying the Request Manager
------------------------------

The final modification required in your AIMMS model is that at some place (for exmaple, a button on a page, or a button on the toolbar) you should add an action that opens the Request Manager contained in the PRO GUI library. To open the Request Manager, you should call the procedure guipro::OpenRequestManagement, which will open the Request Manager as a dialog. This will allow end-users to get an overview of all the tasks that are finished or still running. Furthermore, the Request Manager allows the end-user to download the results of finished jobs into the current session, to terminate running jobs, and to delete finished jobs.

Create a .aimmspack File and Publish
------------------------------------

After you made the above modifications to your project, the only step that is left is to create a .aimmspack file of the project and publish it via the AIMMS PRO Portal. For more details about publishing via the portal, see `AIMMS Application Management <appl-man.html>`_.
