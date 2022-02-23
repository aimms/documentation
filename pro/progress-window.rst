The PRO Progress Window
-----------------------

When running your AIMMS project under AIMMS PRO, the regular AIMMS progress window only has limited usability, as the most computation-intensive parts, namely solving your optimization model, will take part asynchronously on the server. Nevertheless, the AIMMS PRO GUI library has a built-in replacement for the regular progress window that will work with remote optimization runs, which allows you to observe math program characteristics like objective, MIP gap, etc., and lets you stop the remote optimization in exactly the same way as when you press **Ctrl + Shift + S** during an optimization run in the AIMMS desktop version.

Preparing the Use of the PRO Progress Window
++++++++++++++++++++++++++++++++++++++++++++


Unlike for the regular progress window, you have to slightly modify your model for the PRO progress window to function. More specifically, the PRO progress window depends on installing a callback procedure on any MATHEMATICAL PROGRAM you want to observe during a remote optimization run. For a mathematical program MyModel, you need to set

.. code:: 

    MyModel.CallbackProcedure := 'guipro::progress::UpdateCallback';
    MyModel.CallbackIterations := 1000;

prior to calling the SOLVE statement. It tells AIMMS that every 1000 iterations (or whatever number of iterations makes sense for your project) the predefined callback procedure ``guipro::progress::UpdateCallback`` is called during a solve. When instructed by the AIMMS PRO client application, this callback will collect various characteristics of the model being optimized, and send these back to the client.

From AIMMS 4.15 onwards you can also base progress information on elapsed time. To do so you need to set

.. code::

    MyModel.CallbackTime := 'guipro::progress::UpdateCallback';

prior to calling the SOLVE statement. By default this callback procedure will be called every two seconds. The frequency is controlled by the option 'Progress Time Interval' which also determines the time interval for the regular AIMMS progress window.

Opening the PRO Progress Window
+++++++++++++++++++++++++++++++

You can open the PRO progress window through the PRO request manager. If you select any request that has status running, click the Progress Window button. This will open the AIMMS **PRO progress window**, which will try to connect to the running session. Note that, depending on where the server session is in the solution process, it may take a while before there is an opportunity to notify the server session.

Implemented Using Messages
++++++++++++++++++++++++++

The PRO progress window is completely implemented using the messaging functionality discussed in `Using Messages in Your PRO Applications  <pro-messaging.html>`_. You can actually examine the underlying code in the PRO GUI library as an example of how delegated procedure calls are used to communicate between the client and server session.
