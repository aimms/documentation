Installation of AIMMS PRO on Windows
====================================

Now that you have installed the AIMMS Network License Server and set up the required licenses and profiles, you can install AIMMS PRO 2.0. The installer will install three Windows services:

* AIMMS PRO 2.0 Portal Service
* PRO 2.0 Service
* AIMMS PRO postgresql-x64-9.3

The AIMMS PRO services are configured to start automatically. The AIMMS PRO 2.0 Portal Service will fail to start if the AIMMS PRO 2.0 Service is not already running. Depending on the host performance, a minimum of 30 seconds is required for the AIMMS PRO 2.0 Service to start.

Database Support
----------------

AIMMS PRO 2.0 stores all of its data in a database. The database used is PostgreSQL. In order to ensure the optimal performance of AIMMS PRO 2.0, the database should be in the same data center as the AIMMS PRO installation. The PostgreSQL administration application (called 'pgAdmin') can be found in *installDir/pgsql/bin/pgAdmin3.exe*.

Installation and Data Location
------------------------------

As part of the installation of AIMMS PRO, you can select the locations where the executable files will be installed (from now on referred to as *installDir*), as well as the location where AIMMS PRO will store its configuration files and runtime data (from now on referred to as *dataDir*). The default installation location is:

.. code::
    
    C:/Program Files/AimmsPRO 2.0
    
whereas the default data location is:

.. code::

    C:/ProgramData/AimmsPRO 2.0

Default Ports
-------------

By default, the AIMMS PRO service is configured to listen on TCP port 19340, whereas the AIMMS PRO Portal service will listen on port 8080 over HTTP. You can modify these settings, configure SSL for PRO communications and HTTPS access to the portal using the `AIMMS PRO Configurator <#using-the-aimms-pro-configurator>`_ tool, which is automatically installed for you when installing AIMMS PRO 2.0.

