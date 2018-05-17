Installing AIMMS CDM
********************

In order to use AIMMS CDM, you need both a server-side component to manage the CDM data repository, and a client-side component that must be added to your model which connects to the server-side component and provides all version control functionality to the model. 

The server-side components use a relational database to for the actual storage of all data. Because the CDM service is very database-intensive, we strongly recommend to host the CDM service on the same machine where the database server is hosted, or at least within the same local area network. This ensures the lowest possible latency in the connection between the CDM service and the database, which results into the highest possible performance for CDM clients. The CDM client and server components communicate using relatively few, larger-sized packets where latency is less of a problem.

Adding the CDM library to your model
====================================

The AIMMS Collaborative Data Management component is provided in the form of a library :token:`AimmsCDM` in the AIMMS Library Repository, which is accessible from within the Library Manager within your model. After selecting the :token:`AimmsCDM` library from the Library Manager, it will be downloaded from the AIMMS Library Repository, and added to your model.

To add AIMMS CDM to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. Select AimmsCDM from the list to add the CDM library to your model, or select a specific version to upgrade from a previous version you already installed before. 

This will download the AimmsCDM library from the library repository, cache it on your local machine and add a reference to it in your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.


Selecting a database to back AIMMS CDM
======================================

The AIMMS CDM service provides all data services to CDM clients, so clients need not connect directly to the database used to store the underlying data. By doing so, the CDM service serializes all requests to the underlying database, providing the atomicity required for the version control services offered through AIMMS CDM. 

The CDM service supports the following databases for data storage

* SQLite
* PostgreSQL
* SQL Server
* MySQL

You can select the database to back the CDM service, through the :token:`CDMConfig.xml` file contained in the directory containing the CDMService executable. The subdirectory :token:`ConfigExamples` contains example configurations for all databases supported by the CDM service. In these example configurations you have to replace the fields :token:`host`, :token:`port`, :token:`database`, :token:`servername`, :token:`instancename`, :token:`user`, and :token:`password` fields by their actual values (without :token:`{` and :token:`}` characters), required to connect your database server of choice.

SQLite
------

SQLite is the default database configured in the configuration file provided with the service on Windows. It needs no installation of any other software and no further configuration, and thus is very well suited to run with the embedded CDM service provided by the CDM library itself, or when running the CDM service from your development machine. With the default configuration file all application databases will be stored in the folder :token:`C:\CDM`. Because the SQLite database is accessed in-process, the performance is very good, and backups are easily scripted with the sqlite command line interface provided with the CDM installation. Each application database instance created through CDM, will result in a separate SQLite database file, located in the specified storage folder.

PostgreSQL
----------

PostgreSQL is the database engine used by AIMMS PRO, so is a natural choice if you want to combine CDM with an on-premise AIMMS PRO installation. To make use of the PostgreSQL engine, the bin folder of your PostgreSQL installation must be in the global system path on the server where you will be running the CDM service. If you want to use the PRO PostgreSQL database, the path to add to the global system path is :token:`C:\\Program Files\\AimmsPRO 2.0\\pgsql\\bin`. PostgreSQL provides a solid performance for CDM, and provides integrated tools for database backup and restore. Note that you are responsible for setting up a backup scheme for your CDM-managed databases. Each application database instance created through CDM, will result in a separate schema in the specified database on the PostgreSQL server. You are advised to create a separate database to hold all the database schema created by the CDM service, and set up a new database user with full access to this database.

SQL Server
----------
 
You can back your CDM service by any SQLServer database instance in your network, as long as you have a SQLServer ODBC driver installed on the host where the CDM service is running. You can backup the database holding the CDM-managed schema through the SQL Server Management Studio. Each application database instance created through CDM, will result in a separate schema in the specified database instance on the SQLServer server.  You are advised to create a separate database to hold all the database schema created by the CDM service, and set up a new database user with full access to this database.

MySQL
-----

MySQL is the default choice of database when using CDM from within the AIMMS Cloud Platform. With your subscription to the AIMMS Cloud Platform, you have the option to include a MySQL application database, which you can then also use to the CDM-managed database schema. The on-demand CDM service available within the AIMMS Cloud Platform already contains the client software necessary to access any MySQL database. If you want to use MySQL in an on-premise instance of the CDM service, you need to make sure that the MySQL client DLL :token:`libmysql.dll` on Windows is accessible through the :token:`PATH` environment variable. Each application database instance created through CDM, will result in a separate schema in the specified MySQL server. In MySQL all database schema are created within a single database instance, for CDM you are advised to let all CDM-created schema names start with a common prefix, such as :token:`cdm-`, and set up a separate user that has full access to all schema starting with the given schema name prefix.
