Basic AIMMS Cloud Workflow
==========================

Basic Usage
-----------

In its most basic form, the AIMMS Cloud Platform allows you to dispatch an optimization request from within a PRO client application to a server-side AIMMS session, which the Cloud Platform schedules for execution. By default, the PRO client library transfers the application state between client- and server-side sessions using AIMMS case files, causing the server-side session to start from exactly the same state as where the request was made. When the server-side session finishes, the output results are stored for the client session to retrieve, and the client session is notified that the request has completed. The end-user can then load the output results via the *Request Manager* dialog that is part of the PRO GUI library.

Other Workflows
---------------

The AIMMS PRO framework allows you to implement other workflows between client- and server-side sessions. The additional features for controlling that interaction are described in `Advanced AIMMS Cloud Workflows <advanced-workflows.html>`_.

Modify Procedures
-----------------

Any procedure you want to execute in a server-side session instead of the client session must be modified by adding specific PRO-related code at the top of the procedure. Typically, such procedure calls involve optimization of a mathematical program, since a PRO client session does not support optimization. In its most basic form, add the following code at the top of the procedure you want to execute server-side:

.. code::

    if pro::DelegateToServer then
        return 1;
    endif;

The behavior of this function varies depending on whether it is running client-side or server-side.

Client-side Behavior of pro::DelegateToServer
+++++++++++++++++++++++++++++++++++++++++++++

When the ``pro::DelegateToServer`` statement is encountered, behind the scenes it:

* Creates a case of type AllIdentifiers containing the current application state and sends it to the Cloud backend.
* Prepares a message containing the name of the procedure and all its arguments, and sends it to the Cloud backend. This triggers a complete re-execution of the procedure in the server-side worker session.
* Returns the numeric value 1, since it is running client-side. Because this value is used in the if condition with ``return 1`` on the true branch, the statements after ``DelegateToServer`` are not executed in the client session.

Server-side Behavior of pro::DelegateToServer
+++++++++++++++++++++++++++++++++++++++++++++

When the Cloud backend receives the request, it queues the job and eventually starts a server-side instance of the project. That session loads the case and executes the same procedure call that contained the ``pro::DelegateToServer`` statement on the client side. On the server side, ``pro::DelegateToServer`` returns 0, causing the original content of the procedure to be executed. When the procedure finishes, the Cloud backend creates a case file containing the values of AllIdentifiers and notifies the client that the job is done.

Displaying the Request Manager
------------------------------

The final modification required in your AIMMS model is to add an action somewhere (for example, a button on a page or toolbar) that opens the Request Manager from the PRO GUI library. Call the procedure ``guipro::OpenRequestManagement`` to open the Request Manager as a dialog. This allows end-users to see an overview of all running and finished tasks, download results of finished jobs into the current session, terminate running jobs, and delete finished jobs.

Create a ``.aimmspack`` File and Publish
-----------------------------------------

After making the above modifications, create a ``.aimmspack`` file of the project and publish it via the Portal. For full details on publishing via the Portal, see `Apps (AIMMS Application Management) <newportal-apps.html>`_.
