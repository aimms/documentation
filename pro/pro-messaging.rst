Using Messages in Your PRO Applications
---------------------------------------

The messaging mechanism through which client- and server-side sessions communicate, can also be used for other purposes in your own PRO-enabled applications. For instance, you can use it to implement a ’message bus’ through which multiple users of the same application can notify each other of data changes that are also relevant to other users.

Implementing a Message Bus
++++++++++++++++++++++++++

If you want to introduce a message bus into your application, the following steps are required:

* Create a queue.
* Start listening to the queue.
* Communicate the queue id to other users of your application.
* Send messages to other users.

Creating a Queue
++++++++++++++++

You can create a queue by calling the function ``pro::messaging::CreateQueue``

When creating a queue, you can specify a queue authorization, determining which users can listen and send messages to the queue. You can create the correct authorization string through the PRO *Authorization Editor*, which you can invoke by calling the procedure ``progui::EditAuthorization``.

Starting with **AIMMS PRO 2.30** and **AIMMS 4.63**, it is possible to retrieve and/or modify the authorization string of a queue. You can achieve this by calling the functions,

.. code::
	
	pro::messaging::GetQueueAuthorization
	pro::messaging::UpdateQueueAuthorization


Connecting to a Queue
+++++++++++++++++++++

Given a ``queueID`` of the queue you just created, you can listen to incoming messages on this queue by attaching it to the connection your application already has with the AIMMS PRO server.

.. code::

    ret := pro::messaging::AddQueueToConnection(queueID, pro::ListeningConnectionId);
   
The method will return 1 if successful. If you want to stop listening, you can remove the queue from the connection by calling

.. code::

    ret := pro::messaging::RemoveQueueFromConnection(queueID, pro::ListeningConnectionId);

Communicating the Queue to Other Users
++++++++++++++++++++++++++++++++++++++

Before other users of your application can listen to or send to the message bus just created, you must communicate the queue id of the queue implementing the message bus to them. To accomplish this, you can, for instance,
 
* write the queue id to a file and store it to a fixed location in the PRO Central Storage area, or on a network share all users have access to, or
* write the queue id to a database that all other users have access to.


After retrieving the queue id, they can start listening to the message bus by adding the queue to their connection with the PRO server, as illustrated above.

Sending Messages
++++++++++++++++

All messages on the message bus come in the form of remote procedure call requests, created by adding the statement

.. code::

    if (pro::DelegateToPeer(queueID: queueID)) then return 1; endif;

to those procedure calls that you want to pass to all listeners on the message bus. You can optionally add message flags as discussed in the previous section, to influence the way in which messages are handled by your application, or to create application-specific workflows.

