Advanced Usage of :token:`pro::DelegateToServer`
------------------------------------------------------

:token:`pro::DelegateToServer` arguments
+++++++++++++++++++++++++++++++++++++++++

So far, we have only discussed a basic workflow when using :token:`pro::DelegateToServer` in your model. You can influence this workflow by specifying one or more of the optional arguments of this procedure.
 
* ``procedureName``
* ``requestDescription``
* ``completionCallback``
* ``timeOut``
* ``waitForCompletion``
* ``inputCase``
* ``delegationOverride``
* ``authorization``
* ``licenseName``
* ``priorityAdjustment``
* ``scheduledAt``


Specifying a Procedure
^^^^^^^^^^^^^^^^^^^^^^

Through the argument ``procedureName`` you can indicate which procedure you want to be called from within the server-side session, after the session has been initialized by AIMMS PRO. If you do not specify a procedure name, AIMMS PRO will take the name of the procedure from which the call to :token:`pro::DelegateToServer` was made. It can, however, be any procedure currently on your execution stack. AIMMS PRO will determine the current content of all the arguments of the specified procedure, and use these to serialize the procedure call, so that it can be re-executed in the server-side session.

Specifying a Description
^^^^^^^^^^^^^^^^^^^^^^^^

Through the argument ``requestDescription`` you can specify a description of how you want the request to be described in the Request Manager or the AIMMS PRO portal. If you do not specify a description yourself, AIMMS will take the name of the current case, followed by the time at which the request was made.

Specifying a Callback
^^^^^^^^^^^^^^^^^^^^^

By providing a callback procedure to the :token:`pro::DelegateToServer` function, specified through the ``completionCallback`` argument, you can instruct AIMMS to automatically execute the provided callback procedure, whenever the server notifies the client that it has finished solving the submitted request. The callback procedure that you supply must have a single string parameter as its input argument. This string parameter will contain the session id of the PRO session. So, execution on the client side of the following statement

.. code::

    if pro::DelegateToServer( completionCallback: 'procedureAfterServerFinished' ) then
        return 1 ;
    endif ;

will save a case of the current state, send it to the server, and instruct the server to load the input case and execute the same procedure on the server. After the server is finished, a message is sent back by the server to the client, notifying the client that the server is finished. This notification triggers the AIMMS PRO library to call the procedure you provided as the completionCallback argument.

Predefined Callbacks
^^^^^^^^^^^^^^^^^^^^

The AIMMS PRO library already provides a number of predefined callbacks that you can use. They are:
 
* :token:`pro::session::DefaultCallback`, notifies the user via the status bar.
* :token:`pro::session::LoadResultsCallback`, automatically loads the results after completion of the request.
* :token:`pro::session::EmptyCallback`, does nothing.

Counting Completed Requests
^^^^^^^^^^^^^^^^^^^^^^^^^^^

A good use for a custom callback is when your end-user is sending lots of different instances to the server (i.e. hundreds). Using a custom callback, you can count the number of instances that were finished. If you know how many instances you sent to the server, this callback can easily determine when all tasks you sent to the server are finished.

Timing out Requests
+++++++++++++++++++

To prevent a server session from running indefinitely, the :token:`pro::DelegateToServer` function provides an optional ``timeOut`` argument. By specifying a value for the ``timeOut`` argument, you can control the maximum time (in milliseconds) that a request is allowed to run. If this timeout is exceeded, the job will be terminated automatically and will receive a request status of Terminated. If you do not specify this argument, the default value will be one hour.

Timed-out Sessions
++++++++++++++++++

If a session is terminated because the maximum execution time has been reached, the PRO server will call the fixed callback :token:`pro::session::ServerErrorCallback`. If you want to have your own callback function called as well in such cases, you can set this additional callback function via the element parameter :token:`pro::session::ServerErrorCallbackHook` into ``AllProcedures``. When this time-out is reached, solver sessions will be killed with 'error' status and case will not be saved in this situation.

Asynchronous...
+++++++++++++++

By default, a call to :token:`pro::DelegateToServer` will be executed asynchronously, that is, when the call returns on the client, the results of the delegated request are not available by default. A successful call only means that the request has been successfully queued at the server and will be executed when all necessary resources are available for the request to run. By specifying callbacks as demonstrated above, you will get a notification that your request has completed, but these callbacks are, by default, also executed in a completely asynchronous manner.

...Versus Blocking
++++++++++++++++++

By setting the ``waitForCompletion`` argument to 1, the call to :token:`pro::DelegateToServer` will block until the server-side session has been completed or interrupted because of the specified timeout. Upon return, the completion or error callback will already have been executed. You have now created a synchronous workflow.

.. warning::

    You should realize, however, that a call to :token:`pro::DelegateToServer` will just add your execution request to the existing job queue at the server, and that it may take a while before it is up for execution. In such cases, or if the execution of your request takes a long time, the synchronous workflow enforced by the *waitForCompletion* argument may not be the best approach in your situation, and it may be beneficial to redesign your application to use an asynchronous workflow around the requests that need to be executed on the server.

Using a Shared Input Case
+++++++++++++++++++++++++

By default, AIMMS PRO will save your application state prior to every request. This is a fine approach if each request operates on different input data. However, if you want to use PRO, for instance, to run a large number of scenarios all based on the same input data, saving the same application state for every scenario is unnecessary and will introduce considerable overhead in space and time to schedule and execute all requests. In such cases, you can pass a shared input case file reference to be used for all execution requests through the inputCase argument, and indicate which scenario based on this input case to execute through the arguments of the procedure call to be run within the server-side session.

Accepted Values
^^^^^^^^^^^^^^^

The inputCase argument accepts the following values:
 
* the URL of an existing case stored in the PRO Central Storage area.
* the id of an input case that was created as the result of a previous call to :token:`pro::DelegateToServer`.


To determine the internal PRO id of an input case you can call the function :token:`pro::session::CurrentInputCaseID` which will return the input case id of the latest started session.

Distributing Work
+++++++++++++++++

By default, a call to :token:`pro::DelegateToServer` will initiate a server-side session within the client session, and will run locally within a server-side session. Through the ``delegationOverride`` argument you can override the default behavior.
 
* If the value is < 0, no server-side session will be initiated.
* If the value equals 0 and the client session is run in developer mode, the PRO library will ask whether to run locally or initiate a server-side session, or just initiate a server-side session if the client session runs in end-user mode (default).
* If the value is > 0, a new server-side session will only be initiated if the value is greater than the value of :token:`pro::CurrentDelegationLevel`.


By specifying values > 0, you can enforce that :token:`pro::DelegateToServer` will initiate a new server-side session, *even when executed from within an existing server-side session*. The value of :token:`pro::CurrentDelegationLevel` within a server-side session, equals the value of the ``delegationOverride`` argument within the session that initiated the current server-side session.

.. note::

    As the value of :token:`pro::CurrentDelegationLevel` increases in a session in which a delegated call is executed compared to the session from which is was delegated, you should not use :token:`pro::CurrentDelegationLevel` directly in the call to :token:`pro::DelegateToServer`. More specifically, the call
    :token:`pro::DelegateToServer(delegationOverride: pro::CurrentDelegationLevel + 1)`

    will effectively start up new sessions recursively until you reach the number of available AIMMS licenses. Rather, you should pass :token:`pro::CurrentDelegationLevel` as an argument of the procedure you want to be delegated, or assign it to a parameter that is part of your input case, and use either of these in the ``delegationOverride`` argument.

Overriding the License Profile
++++++++++++++++++++++++++++++

Through the ``licenseName`` argument you can override the default license profile that has been associated with the published project you are running. If ``licenseName`` refers to an existing license profile, that license profile will be used by the server-side session. If licenseName does not refer to an existing license profile, the default license profile will be used.

Note: Starting from AIMMS PRO 2.12.1, if ``licenseName`` does not refer to an existing license profile then AIMMS will give error message and it will not use default license profile.

Adjusting the Job Priority
++++++++++++++++++++++++++

By default, your execution requests will be scheduled with a priority that is set by the administrators of your AIMMS PRO installation. This priority can be dependent on a specific application, on specific users, or combinations thereof. Through the ``priorityAdjustment`` argument, you can instruct the PRO framework to lower the priority of the request you want to initiate by the specified amount. Note, that you can only lower the priority of your requests in this way. Attempts to increase the priority of your request will cause the call to :token:`pro::DelegateToServer` to fail.

When to use
^^^^^^^^^^^

You can lower the priority of your requests, for instance, when you want to run a large number of different scenarios and don't want these requests to disturb the execution requests of regular users. Without lowering the priority of your requests, the requests of regular users may end up remaining queued unacceptably long.

Scheduling a Session in the Future
++++++++++++++++++++++++++++++++++

By specifying the ``scheduledAt`` argument, you indicate to the PRO server, that you want the server-side session to be scheduled for execution within one minute after the indicated time. The argument should be a time string in the format ``YYYY-MM-DD hh:mm:ss``, referring to the local time after which you want the server-side session to be scheduled for execution. Until the scheduled time, the job will be in "Created" status, afterwards it will appear in "Queued" status.