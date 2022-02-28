Installation and Configuration of the License Server
====================================================

Before installing AIMMS PRO, you must first install and configure the AIMMS Network License Server. AIMMS PRO requires that you run at least version 4.0 of the AIMMS Network License Server. The latest version is available `here <https://aimms.com/english/developers/downloads/download-aimms/aimms-network-license-server>`_. Executing the installer will install the AIMMS Network License Server service on your server. This service is configured to start automatically.

Installation Location and Default Ports
---------------------------------------

The AIMMS Network License Server installs to

.. code-block:: none
    
    C:\Program Files (x86)\AIMMS\AIMMS License Server
    
and stores its runtime data in

.. code-block:: none

    C:\ProgramData\AIMMS

By default, the AIMMS Network License Server listens on TCP port 3400 for incoming license requests. If this port is in use during the initial installation, this will cause the installation to fail. Later on, you can change this port through the AIMMS Network License Manager program, as detailed in the installation instructions of the AIMMS Network License Server.

Setting up Licenses
-------------------

After you have installed the AIMMS Network License Server, you must activate the license for the PRO server itself, as well as the AIMMS licenses for client and server-side AIMMS sessions that you received with your AIMMS PRO installation. Follow the installation instructions that come with the AIMMS Network License Server to activate these licenses. Please make sure you select the option *Machine nodelock* when you activate the licenses.

Setting up License Profiles
---------------------------

By default, the AIMMS PRO Server assumes that you make

* the AIMMS PRO server license available using the *license profile* name ``ProLicense``, and
* the client-side AIMMS session license(s) available using the *license profile* name “Client”, and
* the server-side AIMMS session license(s) available using the *license profile* name “Server”.


Please note that you can change the names of these license profiles. If you use non-default names, however, you should also change the AIMMS PRO configuration accordingly. You may want to use non-default names for the client and especially the server licenses to prevent unauthorized use of these licenses. Note that if you change the name of the server-side AIMMS session license(s), all the applications that depend on that ``workerProfile`` will stop working. Exact details on how to add and/or rename license profiles can be found in the documentation of the AIMMS Network License Server.

License Server Maintenance
--------------------------

Whenever you need to perform maintenance to your license server, it is advisory to also stop the AIMMS PRO service if it has a non-empty job queue. When you leave the maintenance mode of the AIMMS Network License Server, it is restarted for the changes you made to take effect. This will cause all currently running jobs to be terminated with an error condition, as well as all queued jobs that will start during the restart of the license server.
