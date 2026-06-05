Debugging Cloud-enabled Projects
=================================

When you start an application via the Portal, the AIMMS AppLauncher downloads the ``.aimmspack`` file from the Cloud, extracts the contents, and starts the installation-free PRO client version of AIMMS with an end-user license obtained from the Cloud backend. Because a PRO client uses an end-user license, you cannot use the AIMMS debugging tools to inspect the client-side project in case of problems. To debug a Cloud-enabled AIMMS project, use the development version of your project with an AIMMS developer license.

Connecting With the Cloud
--------------------------

To connect a developer version of your project to the Cloud backend, the following conditions must be met:

* The PRO library version included in your development project must match the version provided by the Cloud backend you are connecting to.
* Your development folder must contain a file ``pro_arguments.txt`` with the following content:

  .. code::

      pro::ReadArguments(pro::CL) := data
      { _pro-modelname : "MyModel",
        _pro-modelversion : "1.0",
        _pro-dll-directory : "C:\\Users\\<user>\\AppData\\Local\\AIMMS\\PRO\\<Cloud Server>\\AimmsPROLibrary-2.0\\vc120",
        _pro-environment : "ROOT",
        _pro-username : "admin",
        _pro-tmpfolder : "PROTemp",
        _pro-endpoint : "wss://your-cloud-instance.aimms.cloud/ws-proxy/backend/",
        _pro-language : "1" } ;

  Adjust the model name, version, environment, username, and endpoint to match your Cloud instance.

.. tip::

    To obtain a valid ``pro_arguments.txt`` and the required DLL folder, publish your app as a WinUI app via the Portal and launch it once on your desktop. The launch process creates both the ``pro_arguments.txt`` file and the libraries in the folder indicated by ``_pro-dll-directory``.

Opening the Project
-------------------

When you open the project with an AIMMS developer license and a ``pro_arguments.txt`` file is present, the PRO library uses the file's contents to initialize the project's connection with the Cloud backend, as if it were started through the Portal.

Logging on
----------

The first time the PRO library tries to connect to the Cloud backend, you will be prompted for your logon information. The username and environment are preset to the values in ``pro_arguments.txt``. Click **Connect** and enter your password to establish the connection.

Debugging the Client Session
----------------------------

After connecting, you can use the AIMMS debugger to step through your model code and the PRO library to follow execution within the client session and detect any errors.

Server-side Session Debugging is Hard
-------------------------------------

When you initiate a server-side session from your client session, it is nearly impossible to inspect what is happening in that session while it runs on the Cloud. The practical approach is to add log statements to your model and analyze them after the run.

Server-side Debugging in Developer Mode
----------------------------------------

By checking the additional flag "I want to manually start up a server-side debug session" in the PRO Logon dialog, the PRO framework prepares a server-side session but does not queue it for execution on the Cloud. Instead, it creates an additional file ``debug_arguments.txt`` in the project folder. When you restart the project, you can choose to debug the prepared server-side session or return to a regular client session.

.. warning::

    When the argument ``waitForCompletion`` of ``pro::DelegateToServer`` is set to 1, AIMMS will not return during debug session setup. Set this argument to 0 when setting up a server-side debug session.

Debugging a Server-side Session
--------------------------------

If you choose to debug the prepared server-side session, the project starts up in exactly the same way as it would when started by the Cloud backend. At the beginning of the procedure called by the PRO framework to initiate the server-side session, AIMMS execution stops at a breakpoint. From there you can use the AIMMS debugger to track any problems caused by the server-side execution context: inspect input cases, verify that expected data is present, and observe how Cloud execution affects your optimization tasks.
