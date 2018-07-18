Communication Between client-side and Server-side Sessions
----------------------------------------------------------

Bidirectional Communication Between Sessions
++++++++++++++++++++++++++++++++++++++++++++

AIMMS PRO allows two sessions to communicate in a bidirectional, asynchronous way. This is accomplished by sending messages that serialize procedure calls made in one session, to a queue to which the other session is listening. When a listening session receives such a message it will deserialize the message, and execute the corresponding procedure call. The PRO library provides this basic functionality through the procedure 

.. code::

    pro::DelegateToPeer(requestQueue, procedureName, flags)

One or Multiple Peers
^^^^^^^^^^^^^^^^^^^^^

You can use pro::DelegateToPeer in procedures for which you want to delegate the execution to another session in exactly the same manner as pro::DelegateToServer, where the requestQueue must be a queue to which you know the peer session is listening. If multiple sessions are listening to this queue, each of these sessions will execute the delegated procedure call.

Specializations
^^^^^^^^^^^^^^^

In most cases you'll want to send messages from a client session to a server-side session or vice versa. For these common cases, the PRO library offers two specializations, where you don't have to specify the queue manually:
 
* ``pro::DelegateToCurrentSession``, delegates a procedure call from a client session to the latest started server-side session.
* ``pro::DelegateToClient``, delegates a procedure call from a server-side session to its corresponding client session.


.. warning::

    These specializations make use of the internal state of the PRO library to determine whether a procedure call is made at the client- or at the server-side session and act accordingly. However, if these specializations are called in a chain of server-side sessions, they may not behave as expected, because the PRO library is not able to determine unambiguously whether a particular server-side session acts as a client- or as a server-side session at any particular moment. In such cases, calling pro::DelegateToPeer with an explicit queue id that is also passed over to the other peer (for instance as an argument to the procedure in which pro::DelegateToPeer is called) will prevent such ambiguities.
	

Current Session Info
++++++++++++++++++++

The following functions allow you to retrieve information about the latest started session by calling pro::DelegateToServer:
 
* ``pro::session::CurrentSession``, the internal PRO session id.
* ``pro::session::CurrentSessionQueue``, the queue through which the client session can communicate with the server session.
* ``pro::session::CurrentClientQueue``, the queue through which the server session will communicate with the client session.


Message Flags
+++++++++++++

When delegating a procedure call through pro::DelegateToPeer, you can modify the way in which the message is being handled by AIMMS PRO by adding one or more message flags:

* ``pro::PROMFLAG_PRIORITY``, indicates priority message which is also dealt with in between statements in your model, when your model is already running a procedure.
* ``pro::PROMFLAG_SYNC_ONLY``, indicates that the message should not be handled asynchronously, but only through an explicit call to pro::WaitForHandledMessages in your model.
* ``pro::PROMFLAG_LIVE``, indicates that AIMMS PRO will only pass this message to any session that is currently listening on the indicated queue, and will not store the message for later retrieval when there are no such sessions.
* ``pro::PROMFLAG_REQUEST``, message flag used to indicate a request to initiate a session. When the session-initiating procedure call is handled, the PRO library will also handle any additional messages with this flag set that are sent from within your model.
* ``pro::PROMFLAG_RESPONSE``, message flag used to indicate that the server-side session completed.
* ``pro::PROMFLAG_ERROR``, message flag used to indicate an error response, that the server-side session timed-out.
* ``pro::PROMFLAG_SESSION``, message flag used to indicate that this is not a message of any of the above types. You can use this flag to wait for framework generated messages.
* ``pro::PROMFLAG_USER``, the lowest flag value that you can use within your model to design your own specialized workflows. You can create additional user-defined flags by multiplying pro::PROMFLAG USER by any power of 2.
 
If you want to add multiple flags to a call to ``pro::DelegateToPeer``, you should add all relevant flag values.

Waiting for Messages
++++++++++++++++++++

You can explicitly wait for incoming procedure calls, through the procedure

.. code::

    pro::messaging::WaitForHandledMessages(queueID,flags,timeOut)
    
This procedure will wait for a given *timeOut* time for messages that are sent to the specific *queueID* and with the indicated *flags* set. Any messages that satisfy the given criteria will be handled before the procedure returns, that is, delegated procedure calls encoded in the message will be executed. The procedure will return the number of handled messages, or 0 if no messages satisfying the given criteria arrived within the given *timeOut*. If you do not specify a *queueID*, the procedure will listen on all queues. If you do not specify *flags*, the procedure will handle all incoming messages.

Synchronous Workflows
^^^^^^^^^^^^^^^^^^^^^

By waiting for messages, you can create a synchronous workflow around the optimization requests that will be executed in server-side sessions. For instance, from within a server-side session you can send a message to the client session, and wait for a response for a given amount of time before continuing the execution. This allows you to steer the execution through feedback given by the end-user. By adding *user flags* to the message, you can make sure that you only wait for and handle those messages that are meaningful in the context of your application.

.. warning::

	PRO messages are limited in size and frequency in AIMMS PRO. Default characteristics are as follows:
		- less than 3 messages per seconds.
		- messages should not exceed 1000 AIMMS elements. In other words, the cardinality of each parameter of the delegated procedure should not exceed 1000. Please remember that DelegateToServer procedures should not transfer data, but only adjusting parameters. Data are optimally transferred through an AIMMS case.
	
	* If the number of messages exceeds 3 per seconds, they will be queued up. **However, if those are live messages (using** ``PROMFLAG_LIVE`` **tag, see above), they will be lost.**
	* You may change the number of messages per seconds by calling the procedure ``pro::messaging::SetMaxMessagesPerSecond(20);``. The maximum value is 20 messages per seconds.
	* If one DelegateToServer procedure would exceed 1000 AIMMS elements, AIMMS will raise an error when using the Cloud AIMMS PRO platform, thus **aborting the execution of the delegated procedure**. Using a PRO platform on premise, AIMMS will write a warning in the PRO log files.