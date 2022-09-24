Installing AIMMS CDM
********************

In order to use AIMMS CDM, you need both a server-side component to manage the CDM data repository, and a client-side component that must be added to your model which connects to the server-side component and provides all version control functionality to the model. 

The server-side components use a relational database to for the actual storage of all data. Because the CDM service is very database-intensive, we strongly recommend to host the CDM service on the same machine where the database server is hosted, or at least within the same local area network. This ensures the lowest possible latency in the connection between the CDM service and the database, which results into the highest possible performance for CDM clients. The CDM client and server components communicate using relatively few, larger-sized packets where latency is less of a problem.

Adding the CDM library to your model
====================================

The AIMMS Collaborative Data Management component is provided in the form of a library ``AimmsCDM`` in the AIMMS Library Repository, which is accessible from within the Library Manager within your model. After selecting the ``AimmsCDM`` library from the Library Manager, it will be downloaded from the AIMMS Library Repository, and added to your model.

To add AIMMS CDM to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. Select AimmsCDM from the list to add the CDM library to your model, or select a specific version to upgrade from a previous version you already installed before. 

This will download the AimmsCDM library from the library repository, cache it on your local machine and add a reference to it in your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

Installing the CDM service
==========================

Before you can actually start using the CDM library to version control the data in your model, you need a running CDM service to which the CDM library can connect to store its data. Basically, you have three options to run the CDM service:

* The CDM library itself contains an embedded CDM service. This option is great during development of your model, as it allows you to easily experiment with CDM, creating and deleting CDM application databases as you see fit, and see the effects of choice of the CDM categories you introduced and version control actions you have implemented in your model.

* If you are deploying the model on an on-premise PRO server on Windows, you can install the CDM service stand-alone, either on the Windows PRO server itself or any other Windows server within your local area network or data center. You can also install the stand-alone CDM service on your own developer machine to let other users experiment with your app while it is still under development

* The AIMMS Cloud Platform already provides access to the CDM backend as an on-demand service that can be started from within any AIMMS app using CDM that is deployed from within the AIMMS Cloud Platform. This on-demand service will automatically start up as users connect, and shut itself down when no clients are connected to it for a specified amount of time.

Setting up a stand-alone service
--------------------------------

If you're planning on using the stand-alone CDM service, you need to download the service executable separately. Through the string parameter ``cdm::WindowsServiceDownloadLocation`` in the CDM library, you can retrieve the download location for the self-extracting executable containing the CDM service executable associated with the current library version that you have included in your model. It will unpack in the ``CDMService`` subdirectory of the directory where you stored the self-extracting executable. You can relocate the ``CDMService`` directory to any location of your liking.

CDM versions have a version number consisting of a major, a minor, a patch and a serial number. Version of the library and service that have coinciding major and minor version numbers should work together fine. We will upgrade the minor version number if the interface between the library and the service changed. When deploying CDM you should take into account whether you have compatible library and service versions deployed.

You can run the ``CDMService.exe`` executable located in the ``CDMService`` directory either as a stand-alone executable, or run it as a Windows service.

* To run the executable in stand-alone mode, run it as ``CDMService.exe --console``
* To install the executable as a Windows service, run it, with elevated rights, as ``CDMService.exe --install``, after which you can start the **AIMMS Collaborative Data Management Service** from within Windows Service Manager. To uninstall the service, run ``CDMService.exe --uninstall``.

Through the ``CDMConfig.xml`` file contained in the directory containing the CDMService executable, you can control the port on which the CDM service listens. The default port is TCP port 19999. You can change it by modifying the ``ListenPort`` field in the ``CDMConfig.xml`` file, and restarting the service. 

Installing multiple service instances
-------------------------------------

Each CDM service instance can only connect to a single database, as specified in the configuration file alongside the CDM service executable. If you need to connect to multiple databases, you can only accomplish this by starting multiple instances of the CDM service. On Windows, you can accomplish this by copying the folder containing the CDMService binaries and configuration files to a new directory, and install a separate instance of the service from that directory using the ``CDMService.exe --install --name <new-service-name>`` command line. 

.. note::
	
	If you are running multiple server instances on a single server, they all need a separate value for the ``ListenPort`` field in the configuration file.

In the AIMMS cloud, a separate on-demand CDM service instance will be started for each separate value that you assign to the  ``cdm::CloudServiceName`` configuration parameter.

Selecting a database to back AIMMS CDM
--------------------------------------

The AIMMS CDM service provides all data services to CDM clients, so clients need not connect directly to the database used to store the underlying data. By doing so, the CDM service serializes all requests to the underlying database, providing the atomicity required for the version control services offered through AIMMS CDM. 

The CDM service supports the following databases for data storage

* SQLite
* PostgreSQL
* SQL Server
* MySQL

You can select the database to back the CDM service, through the ``CDMConfig.xml`` file contained in the directory containing the CDMService executable. The subdirectory ``ConfigExamples`` contains example configurations for all databases supported by the CDM service. In these example configurations you have to replace the fields ``host``, ``port``, ``database``, ``servername``, ``instancename``, ``user``, and ``password`` fields by their actual values (without ``{`` and ``}`` characters), required to connect your database server of choice.

Through the configuration fields ``DBMaxInserts``, ``DBStringFieldType``, ``Threads``, ``AutoTerminate`` and ``LowerCaseTableNames`` you can arrange the maximum number of rows to insert in a single SQL insert statement when committing data, the database column type to use for string fields, the number of threads to retrieve data from the database in parallel when checking out or pulling data, whether to auto-terminate the service when no client connections are left (intended for the on-demand CDM service in the AIMMS cloud), and whether to convert the schema and table names to lower case in all SQL statements. 

SQLite
++++++

SQLite is the default database configured in the configuration file provided with the service on Windows. It needs no installation of any other software and no further configuration, and thus is very well suited to run with the embedded CDM service provided by the CDM library itself, or when running the CDM service from your development machine. With the default configuration file all application databases will be stored in the folder ``C:\CDM``. Because the SQLite database is accessed in-process, the performance is very good, and backups are easily scripted with the sqlite command line interface provided with the CDM installation. Each application database instance created through CDM, will result in a separate SQLite database file, located in the specified storage folder.

PostgreSQL
++++++++++

PostgreSQL is the database engine used by AIMMS PRO, so is a natural choice if you want to combine CDM with an on-premise AIMMS PRO installation. To make use of the PostgreSQL engine, the bin folder of your PostgreSQL installation must be in the global system path on the server where you will be running the CDM service. If you want to use the PRO PostgreSQL database, the path to add to the global system path is ``C:\\Program Files\\AimmsPRO 2.0\\pgsql\\bin``. PostgreSQL provides a solid performance for CDM, and provides integrated tools for database backup and restore. Note that you are responsible for setting up a backup scheme for your CDM-managed databases. Each application database instance created through CDM, will result in a separate schema in the specified database on the PostgreSQL server. You are advised to create a separate database to hold all the database schema created by the CDM service, and set up a new database user with full access to this database.

SQL Server
++++++++++
 
You can back your CDM service by any SQLServer database instance in your network, as long as you have a SQLServer ODBC driver installed on the host where the CDM service is running. You can backup the database holding the CDM-managed schema through the SQL Server Management Studio. Each application database instance created through CDM, will result in a separate schema in the specified database instance on the SQLServer server.  You are advised to create a separate database to hold all the database schema created by the CDM service, and set up a new database user with full access to this database. If you want to use a separate database for each CDM application database, instead of a separate schema in a single database, then on Windows you need to install separate service instances, one for each database. 

MySQL
+++++

MySQL is the default choice of database when using CDM from within the AIMMS Cloud Platform. With your subscription to the AIMMS Cloud Platform, you have the option to include a MySQL application database, which you can then also use to the CDM-managed database schema. The on-demand CDM service available within the AIMMS Cloud Platform already contains the client software necessary to access any MySQL database. Each application database instance created through CDM, will result in a separate schema in the specified MySQL server. In MySQL all database schema are created within a single database instance, for CDM you are advised to let all CDM-created schema names start with a common prefix, such as ``cdm-``, and set up a separate user that has full access to all schema starting with the given schema name prefix.

.. warning::
    
    If you want to use **MySQL** in an on-premise instance of the CDM service, you need to make sure that the MySQL client DLL ``libmysql.dll`` on Windows is accessible through the ``PATH`` environment variable. (This new path might look similar to the following: ``C:\Program Files\MySQL\MySQL Server 5.7\lib``). 
    
    Similarly, for a backing **PostgreSQL** database you need to make sure that the DLL ``libpq.dll`` is accessible through the ``PATH`` environment variable. 
    
    For the **SQL Server** database, the CDM service will rely on an ODBC driver for SQL Server being installed, which is typically already the case on any modern Windows system. Note, however, that some combinations of versions of ODBC drivers and SQL Server databases may lead to unexpected errors taking place for some queries being generated by the CDM service. In such cases, we advise to install the latest version of the SQL Server ODBC driver.
    
    For **SQLite**, the CDM service already contains the runtime SQLite DLL, so no further action is required.
