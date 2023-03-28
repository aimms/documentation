Application Database
====================

In addition to reading and writing data from and to files, DataExchange also supports some relational databases. These can be used as an application database. Typically one interacts with databases using the query language SQL, but DataExchanges allows us to do the reading and writing without SQL. Instead mappings used by the row based format can be used here as well.


.. tip::

    It is still possible to see the SQL statements. When ``DataExchange.DbEngine`` logging is set to trace, it will show the status of the connection to the database and the SQL statements in the log file. 

Example: Database mapping
-------------------------

Look at the following mapping for a database with a single table:

.. code-block:: xml

    <AimmsDatabaseMapping>
        <TableMapping name="Table1">
            <RowMapping name="row">
                <ColumnMapping name="set1" binds-to="i"/>
                <ColumnMapping name="set2" binds-to="j"/>
                <ColumnMapping name="d1" maps-to="d1(i,j)"/>
                <ColumnMapping name="d2" maps-to="d2(i,j)"/>
                <ColumnMapping name="de" maps-to="de(i,j)"/>
                <ColumnMapping name="ds" maps-to="ds(i,j)"/>
                <ColumnMapping name="di" maps-to="di(i,j)"/>
            </RowMapping>
        </TableMapping>
    </AimmsDatabaseMapping>

This mapping will create a table similar as in :ref:`example-excel-mapping`. The only difference with the Excel mapping is that the nodes ``AimmsExcelMapping`` and ``SheetMapping`` are replaced with ``AimmsDatabaseMapping`` and ``TableMapping``. This is mainly because DataExchange uses Excel as a collection of tables with rows and columns and not as a spreadsheet calculator. Relational databases are intended as collection of tables and are optimized for quick retrieval of data and for maintaining the integrity of data.


Database tables
---------------

One of the integrity checks performed by the database is to make sure that every row is unique. Columns can be declared as "primary key" for this check. If we look at the example we see two columns "set1" and "set2" with a ``binds-to`` attribute. When writing all values for columns with a ``maps-to`` attribute, the parameters, the values of ``i`` and ``j`` are unique. Only the first two columns need to be checked for uniqueness and therefore DataExchange will create a table where columns "set1" and "set2" are defined as primary keys.

Rootset tables
^^^^^^^^^^^^^^

Now the database only has to check two columns but still it requires comparing strings. DataExchange helps the database even more by creating helper tables for sets in the AIMMS model. Sets are either a rootset or some subset of a rootset, and their values are unique.

For each root set involved in the database mapping, DataExchange creates a rootset table to store their values. The database will associate each value with an unique integer value. Now each ``binds-to`` column can be declared as a foreign key into the corresponding rootset table, so that all primary keys are integers that can be easily compared. 

Note that columns for Element Parameters are also created as foreign keys into rootset tables, but unlike the ``binds-to`` columns they are not declared primary keys. Also note that rootset tables are shared among data tables.

Version table
^^^^^^^^^^^^^

A database is less flexible than files so saving different versions of datasets into different files may not be possible.
For this reason DataExchange also includes a versioning mechanism by adding an extra helper table ``ds_version`` to the database. This table stores the name of the dataset and assigns an integer value to it. 

Each mapped table gets an extra column that is both a primary key and a foreign key into the versioning table. By passing along the name of the dataset when writing, multiple writes are possible into the same database.

Table names
^^^^^^^^^^^

All table names are small caps and a prefix is used to indicate their role. Three kind of tables are used by DataExchange:

* The tables defined in the database mapping are prefixed with ``data_``. The table from the example becomes ``data_table1``.
* The root set tables are prefixed with ``rs_``. If "Set1" is a rootset then the table becomes ``rs_set1``.
* The table with the dataset version names is ``ds_version``.


Example
^^^^^^^

From AIMMS everything still looks the same as when writing to an excel file, but if you take a look inside the database you will also see the helper tables. To shed some light into what you might expect in the database we use this little example. Suppose we have a table with the following data:

.. csv-table:: :token:`MyTable`
   :header: "SetI", "SetJ", "Par"
   :widths: 30, 30, 30

   "i1", "j1", 1.2
   "i1", "j2", 3.4
   "i2", "j1", 5.6
   "i2", "j2", 7.8

and suppose we use the following mapping: 

.. code-block:: xml

    <AimmsDatabaseMapping>
        <TableMapping name="MyTable">
            <RowMapping>
                <ColumnMapping name="SetI" binds-to="i"/>
                <ColumnMapping name="SetJ" binds-to="j"/>
                <ColumnMapping name="Par" maps-to="P(i,j)"/>
            </RowMapping>
        </TableMapping>
    </AimmsDatabaseMapping>

Here ``i`` and ``j`` are indices of sets :token:`SetI` and :token:`SetJ`.

When writing this data we can pass on a name for this dataset, like "Hello Data". 
DataExchange checks first if table :token:`ds_version` exists and creates it if it doesn't. Then if the name does not exists yet (it should be unique) the name is insert into the table. The database will assign unique integer value to it. This is an auto increment primary key in SQL jargon, hence the column name "pk". The result is the table below:

.. csv-table:: :token:`ds_version`
   :header: "pk", "name"
   :widths: 30, 30

   1, "Hello Data"
   
Before starting to write the rows of the data, two rootset tables :token:`rs_seti` and :token:`rs_setj` are created for :token:`SetI` and :token:`SetJ`.
Then all values for :token:`SetI` and :token:`SetJ` are inserted into their rootset tables when needed. The  corresponding primary key is inserted in the row. 
After writing the rootset tables look like:

.. csv-table:: :token:`rs_seti`
   :header: "pk", "val"
   :widths: 30, 30

   1, "i1"
   2, "i2"

.. csv-table:: :token:`rs_setj`
   :header: "pk", "val"
   :widths: 30, 30

   1, "j1"
   2, "j2"

After writing the actual table with data will look like:

.. csv-table:: :token:`data_mytable`
   :header: "Ver", "SetI", "SetJ", "Par"
   :widths: 30, 30, 30, 30

   1, 1, 1, 1.2
   1, 1, 2, 3.4
   1, 2, 1, 5.6
   1, 2, 2, 7.8

Columns :token:`ver`, :token:`SetI` and :token:`SetJ` are the primary keys that make sure that each row in the table are unique. They are also foreign keys pointing to tables :token:`ds_version`, :token:`rs_seti` and :token:`rs_setj`. Note that in table :token:`MyTable` the string values of :token:`SetI` an :token:`SetJ` appear multiple times, while in :token:`rs_seti` and :token:`rs_setj` they appear only once. For checking integrity :token:`data_mytable` only has to deal with integers, which is more efficient that with strings.


When reading, first the dataset name is looked up in table :token:`ds_version`. The corresponding :token:`pk` value is used to select only those rows from :token:`data_mytable` for which :token:`ver` has this value. Then, instead of sending the integer values from column :token:`Set` to AIMMS, the corresponding :token:`val` values from table :token:`rs_set` are send to AIMMS. So from AIMMS is still seems like we are reading from one single table while all four are involved. 



Reading and Writing
-------------------

Reading and writing from and to the database can be accomplished with the functions ``dex::ReadFromDataSource()`` and ``dex::WriteToDataSource()``. They are similar to ``dex::ReadFromFile()`` and ``dex::WriteToFile()``, but there are two differences:

1. The first argument of the function is not *the* file, but a so called DexConnect file. This is an xml configuration specifying the connection to the database.
2. The last argument is string "version", which is the version name of the data set. Each call to ``dex::WriteToDataSource()`` will add this version as an entry to the :token:`ds_version` table. When calling ``dex::ReadFromDataSource()``, the version to read can be selected.

Note: When the database does not exist when writing, DataExchange will first try to create the database.

The DexConnect file
^^^^^^^^^^^^^^^^^^^

Look at the following DexConnect file

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydatabase">
            <Client>SQLite</Client>
            <Username>bob</Username>
            <Password>p#ssw0rd</Password>
        </Database>
    </AimmsDexConnect>

The node ``Database`` tells that this is a connection to  a database.
It has 3 **required** child nodes:

Client
    A client has to be chose from: SQLite, MySql, PostgreSQL or SQLServer.

Username
    The username for connecting to the database.

Password
    The password for connecting to the database.


Optional
^^^^^^^^

There are a few extra options that can be configured as child nodes of ``Database``:

Path 
    This is used by SQLite to specify the folder of the database file. The default value is empty.

Server
    This is used by MySql, PostgreSQL and SQLServer. When not specified it defaults to ``localhost``. If the server does not use the default port the attribute port can be used to specify the port.

StringSize
    A database has two ways of storing strings. Use value 'text' for generic text storage. Use an integer value for a fix length string. The default value is 255. Note that this only applies to String Parameters. Version names and rootset tables always use integer value 255.

WriteBatchSize
    The batch size is the integer value of how many rows are inserted to the database at once. A high value is slower for a database, but for networking high is more efficient. A trade off has to be found. The default value is 1.

Comment
    This node will be ignored, so it can be used to add comments

This is an extended example for a MySql database. The server does not have the default port (3306 for MySql), the String Parameters are represented as :token:`text` and write uses a batch size of 7:

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydb"> 
            <Comment> This is an example connect file for mysql </Comment>
            <Client>Mysql</Client>	
            <Username>bob</Username>
            <Password>p#ssw0rd</Password>
            <Server port="3307">myserver.mydomain.com</Server>
            <StringSize>text</StringSize>
            <WriteBatchSize>7</WriteBatchSize>
        </Database>
    </AimmsDexConnect>


Attributes of the Database node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Besides the required attribute ``name`` the node ``Database`` can have optional attributes:

RootsetTable
    we can switch of the rootset tables and store the table just as in Excel by setting this to 0.

VersionName
    The default name of the column for versions is :token:`ver` and this can lead to a name clash with other column names in a table. With ``VersionName`` a different name for version columns can be chosen. If the name is an empty string the versioning itself is switch off.

This is an example for a SQLite database ``simpletables.db`` in folder "data". Attribute ``RootsetTables`` is 0, so values of set elements are appear directly into the tables. Also there is no versioning because the ``VersionName`` is set to be empty. All tables will be the same as when they would have been save in an Excel file.

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="simpletables" RootsetTables="0" VersionName=""> 
            <client>SQLite</client>	
            <username>admin</username>
            <password>admin</password>
            <path>data</path>
        </Database>
    </AimmsDexConnect>


Create Or Modify
----------------

When an AIMMS application uses an application database, the end user is primary interested in reading and writing data. This can be accomplished using functions ``dex::ReadFromDataSource()`` and ``dex::WriteToDataSource()``. The application developer also has to look after the database itself. While developing the application the database connection has to be tested, and tables have to be created etc. Then when the application is in use a version 2.0 can be under development and schemes of tables may have to be modified.

The function ``dex::CreateOrModifyDataSource()`` targets the application developers. It has two arguments:

1. DexConnect file: This determines the name of the database and the authorization. 
2. Database mapping file: This determines the schemas of all tables

When the function is called it will try to make sure that the database exists and that all schemas correspond to the mapping. 

If the database does not exist it will be created. This is similar to ``dex::WriteToDataSource()`` when all identifiers involved are empty. The only difference is that it also does not add a new dataset name to the ``ds_version`` table.

If the database exists and if data already has been written we must be careful not to make the existing data meaningless. For this reason we can only add ``maps-to`` columns to a table. Suppose we have an application that has been writing data using the following mapping:

.. code-block:: xml

    <AimmsDatabaseMapping>
        <TableMapping name="MyTable">
            <RowMapping>
                <ColumnMapping name="S" binds-to="i"/>
                <ColumnMapping name="P" maps-to="P(i)"/>
            </RowMapping>
        </TableMapping>
    </AimmsDatabaseMapping>

Function ``dex::CreateOrModifyDataSource()`` can be called with the following new mapping:

.. code-block:: xml

    <AimmsDatabaseMapping>
        <TableMapping name="MyTable">
            <RowMapping>
                <ColumnMapping name="S" binds-to="i"/>
                <ColumnMapping name="P" maps-to="P(i)"/>
                <ColumnMapping name="Q" maps-to="Q(i)"/>
            </RowMapping>
        </TableMapping>
    </AimmsDatabaseMapping>

The column for "Q" is added to the schema of the table. Then we can make a new version of the application that uses the new mapping to write data. The old version can still be running because when it tries to read data written by the new version, the values of column "Q" are just ignored because it is not present in the old mapping. 

When the new version tries to read data written by the old version then it will also read column "Q", and here it will only read empty values.
This is because when the column was added to the schema, for all existing rows the value NULL was assigned. This is also the reason that we cannot add a ``binds-to`` columns, since NULL values are not allowed for these columns.

When a ``maps-to`` column is added that corresponds to a Element Parameter for which there is no rootset table, also a new rootset table is created when ``dex::CreateOrModifyDataSource()`` is called.

Function  ``dex::CreateOrModifyDataSource()`` will not remove columns from a table, because this would mean that data written by an older version may be deleted. Instead just remove the unneeded columns from the mapping and the columns will be ignored.



Supported Databases
-------------------

SQLite
^^^^^^

SQLite is the only supported database that that is stored as a file.  For this reason it runs "out of the box" and does not require an external server to be running.  

We can use the following DexConnect file:

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydb"> 
            <Client>SQLite</Client>	
            <Username>admin</Username>
            <Password>admin</Password>
            <Path>myfolder</Path>
        </Database>
    </AimmsDexConnect>

The database is here the file ``mydb.db`` (so the ``name`` attribute of ``DataBase`` followed by extension ``db``). The file is located in :token:`myfolder`` as specified in :token:`path`. The ``Username`` and ``Password`` are set when the file is created. So this is different from the server databases, where the permissions are set by the server/database.




MySql
^^^^^

A MySql connection can be made by connecting to the MySql server. 

On windows MySql must be installed. After installation the ``bin`` and the ``lib`` folder must be added to the windows environment path. I.e.:

* C:\\Program Files\\MySQL\\MySQL Server 8.0\\lib
* C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin

Assume MySql is setup with a user named "bob" and that the server is started. We can then use the following DexConnect file:

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydb"> 
            <Client>Mysql</Client>	
            <Username>bob</Username>
            <Password>p#ssw0rd</Password>
            <Server>localhost</Server>
        </Database>
    </AimmsDexConnect>

This connects via the default port 3306 on localhost to a database called ``mydb``.

PostgreSQL
^^^^^^^^^^

A PostgreSQL connection can be made by connecting to the PostgreSQL server. 

On windows PostgreSQL must be installed. After installation the ``bin`` folder must be added to the windows environment path. I.e.:

* C:\\Program Files\\PostgreSQL\\15\\bin

Assume PostgreSQL is setup with a user named "bob" and that the server is started. We can then use the following DexConnect file:

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydb"> 
            <Client>PostgreSQL</Client>	
            <Username>bob</Username>
            <Password>p#ssw0rd</Password>
            <Server>localhost</Server>
        </Database>
    </AimmsDexConnect>

This connects via the default port 5432 on localhost to a database called ``mydb``.

SQL Server
^^^^^^^^^^

SQL Server is supported via OCDB. This means that SQL Server Management Studio is needed to create a connection on windows.

We can use the following DexConnect file:

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydb"> 
            <Client>SQLServer</Client>	
            <Username>bob</Username>
            <Password>p#ssw0rd</Password>
            <Server>tcp:This-PC</Server>
        </Database>
    </AimmsDexConnect>

In ``Server`` we notice that we explicitly have to connect via ``tcp``. Also we notice that localhost cannot be used. Instead we connect to the (full) Device Name. This can be found when asking for properties for "This PC" in the explorer. The default port 1433 is used for the connection.