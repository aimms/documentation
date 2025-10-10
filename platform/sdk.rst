:orphan:

AIMMS SDK
==============


The AIMMS SDK (Software Development Kit) extends the integration capabilities of your AIMMS applications. It allows you to integrate an AIMMS optimization model with your custom application through a Java, C# or C++ interface. Typically you would use the AIMMS SDK to start an AIMMS session (either locally or remote), assign data to AIMMS identifiers, run an AIMMS procedure to solve the AIMMS optimization model, and retrieve the (solution) data. Of course, this flow can be adjusted to your preference. For example, you can import data from databases directly into the AIMMS model by calling AIMMS procedures. The AIMMS SDK is backwards compatible and runs with all currently supported AIMMS versions. More details, as well as examples about the AIMMS SDK, can be found in the `AIMMS SDK documentation <http://download.aimms.com/aimms/AimmsSDK/frames.html?frmname=topic&frmfile=index.html>`_.
 
.. Note::

 The AIMMS SDK is no longer actively supported. The preferred methods for interacting between AIMMS and other applications are the :doc:`AIMMS PRO API </pro/api>` and the AIMMS API.
 

Download AIMMS SDK or AIMMS SDK Server
----------------------------------------
You need to install the AIMMS SDK for developing and locally running Java, C# or C++ projects that use AIMMS. You need to install the AIMMS SDK Server on each remote machine, if you want to use your Java, C# or C++ projects to communicate with remote AIMMS sessions. We advise you to always use the most recent version of the AIMMS SDK. This brings you the advantage of improvements and bug fixes, and ensures maximal stability. The latest SDK also works with the installation free AIMMS versions, which we have been releasing from AIMMS 4.3.1 onwards. 

You can download the latest version of the AIMMS SDK/SDK Server by clicking on one of the download links below.

* `Download SDK 1.4.2.90 (Windows x86/x64) <https://download.aimms.com/aimms/download/data/SDK/AimmsSDK-1.4.2.90.msi>`_
* `Download SDK 1.4.2.90 Server (Windows x64) <http://download.aimms.com/aimms/download/data/SDK/AimmsSDKServer-1.4.2.90.exe>`_
* `Download SDK 1.4.2.90 (Linux x64) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-1.4.2.90.tar.gz>`_
* `Download SDK 1.4.2.90 Server (Linux x64, gcc 6.1) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-1.4.2.90-gcc61.tar.gz>`_

The Linux artifacts are also available as signed RPMs signed with `this key <https://download.aimms.com/aimms/download/data/PGP_RPM_Key/RPM-GPG-KEY-AIMMS>`_.

* `Download SDK 1.4.2.90 (signed RPM for Linux x64) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-1.4.2-90.x86_64.rpm>`_
* `Download SDK 1.4.2.90 Server (signed RPM for Linux x64, gcc 6.1) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-gcc61-1.4.2-90.x86_64.rpm>`_

For Linux, signed RPM files are available for version 2.0:

* `Download SDK 2.0.0 (signed RPM for Linux x64) <https://download.aimms.com/aimms/download/data/SDK/aimmssdk-2.0.0-1.x86_64.rpm>`_
* `Download SDK 2.0.0 Server (signed RPM for Linux x64, gcc 6.1) <https://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-gcc11-2.0.0-1.x86_64.rpm>`_


Older versions:

* `Download SDK 1.4.2.26 (Windows x86/x64) <http://download.aimms.com/aimms/download/data/SDK/AimmsSDK-1.4.2.26.msi>`_
* `Download SDK 1.4.2.26 Server (Windows x64) <http://download.aimms.com/aimms/download/data/SDK/AimmsSDKServer-1.4.2.26.exe>`_
* `Download SDK 1.4.2.26 (Linux x64) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-1.4.2.26.tar.gz>`_
* `Download SDK 1.4.2.26 Server (Linux x64, gcc 6.1) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-1.4.2.26-gcc61.tar.gz>`_
* `Download SDK 1.4.2.26 Server (Linux x64, gcc 4.9) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-1.4.2.26-gcc49.tar.gz>`_


* `Download SDK 1.4.2.26 (signed RPM for Linux x64) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-1.4.2-26.x86_64.rpm>`_
* `Download SDK 1.4.2.26 Server (signed RPM for Linux x64, gcc 6.1) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-gcc61-1.4.2-26.x86_64.rpm>`_
* `Download SDK 1.4.2.26 Server (signed RPM for Linux x64, gcc 4.9) <http://download.aimms.com/aimms/download/data/SDK/aimmssdk-server-gcc49-1.4.2-26.x86_64.rpm>`_

Release history
---------------

Version 2.0.0
++++++++++++++++
Works with AIMMS 25.

    .. note:: For this version, only Linux RPM files are distributed.


Version 1.4.2.90
++++++++++++++++
The Linux SDK server no longer ships with the stdc++ libraries, they are assumed to be on the system.


Version 1.4.2
++++++++++++++

If a call to a procedure using the java and c# front end took over a minute to return, the session was killed.
The host application chosen for VS2017 versions of AIMMS  for windows could not start up.
 

Version 1.4.1
++++++++++++++

This version does not bring any new functionality, but some issues for running on Linux have been addressed:

At the client side, there is now only an AIMMS SDK version compiled with gcc 4.9, as there were some compatibility issues with the gcc 6.1 versions we distributed earlier.
At the server side, there is now only a Host application compiled with gcc 6.1, which is supporting AIMMS 4.29 and up.

.. note::

  If you need to run with older AIMMS versions on Linux, the 1.4.0.10 gcc 4.9 still applies.
 

Version 1.4.0.10
+++++++++++++++++
Re-instated support for AIMMS versions prior to 4.29 on Linux, using gcc 4.9.

Version 1.4.0
+++++++++++++++++

An exception is raised and/or thrown when during a run of an AIMMS procedure the connection severed (either by means of a crashing AIMMS, a hanging AIMMS or because of a network failure).
Improved error handling when AIMMS throws unexpected exceptions on different threads.
This version supports AIMMS versions on Windows that have been compiled with a new C++ Compiler (soon, AIMMS will be released in two compiler versions, and within a few months, we will stop release AIMMS compiled with the older compiler).
This version no longer supports AIMMS versions on Linux older than version 4.29.
 
Version 1.3.1.0
+++++++++++++++++

When setting the HostLoggerConfigfile in the CPP front-end, the file could not be found if it contained a space in its name.
 
Version 1.3.0.0
+++++++++++++++++
 
Due to a compiler change for Linux of AIMMS, the older versions of the SDK do not support the Aimms versions 4.29 and higher. This version of the SDK supports all Aimms versions 4.3 and higher.
 
.. note::
  
  If you are using the SDK Server on Linux, you will need to use the rules provided in this version if you are using an AIMMS version 4.29 or newer. The rule for 4.29 is provided, for newer AIMMS versions you will need to (copy and) adapt the 4.29 rule See also `the documentation <http://download.aimms.com/aimms/AimmsSDK/frames.html?frmname=topic&frmfile=index.html>`_ on how to do this.

Version 1.2.5.0
+++++++++++++++++

Upon a timeout while awaiting data to be written to AIMMS, an identifier is closed. When the host then tried to send the data to AIMMS afterwards, an error "No correct handle" was issued, and communicated to the user even before the timeout was communicated. This problem was solved in version 1.2.5.0 by canceling the sending of data to AIMMS on an already closed identifier.

SDK version, 1.2.4.0
+++++++++++++++++++++++++ 

.. note:: only SDK, the compatible version of the SDK Server with SDK 1.2.4.0 is still 1.2.3.0)

When a procedure was run with a timeout, the timeout fired immediately.
This timeout was documented as being in seconds, while in reality it is in milliseconds.
 

Version 1.2.3.0
+++++++++++++++++

We added the possibility to abort a running procedure. For more information, please see the `SDK documentation <http://download.aimms.com/aimms/AimmsSDK/frames.html?frmname=topic&frmfile=index.html>`_.
 
Version 1.2.2.0
+++++++++++++++++

We added an option to the IConfig to pass command line options to the host. 

.. Note:: 

  if the session connects to an already running host, this configuration has no effect.
  We added an option to the IConfig to not wait for AIMMS/the host to acknowledge a cancel on a running procedure, and also changed the default behavior when running a procedure with a timeout: when the procedure is not finished before the timeout runs out, the SDK no longer waits indefinitely for AIMMS/the host to acknowledge the cancel, but uses the provided timeout.
  From this version on, the SDK on Windows requires AIMMS 4.3 or newer.

Version 1.1.2.8, contained json.net version 8.0.1 for the .net front end.

.. spelling:word-list::

    gcc
    stdc