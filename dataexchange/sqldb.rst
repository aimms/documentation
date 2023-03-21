Relational Databases
====================

In addition to reading and writing data from and to files, the Data Exchange library also supports some relational databases. Typically one interacts with these databases using the query language SQL, but Data Exchanges allows us to do the reading and writing without SQL. Instead mappings used by the row based format can be used here as well.


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

Now the database only has to check two columns but still it requires comparing strings. DataExchange helps the database even more by creating helper tables for sets in the AIMMS model. Sets are either a root set or some subset of a root set, and their values are unique.
For each rootset involved in the database mapping, DataExchange creates a rootset table to store their values. The database will assiociate each value with an unique integer value.
Now each ``binds-to`` column can be declared as a foreighn key into the corresponding rootset table, so that all primary keys are integers that can be easily compared. Note that columns for Element Parameters are also created as foreing keys into root set tables, but unlike the ``binds-to`` columns they are not declared primary keys.

version

Three kind of tables:



Reing and Writing
-----------------

Reaing and writing
Introduction....ReadToDataSource()

Look at the following file

.. code-block:: xml

    <AimmsDexConnect>
        <Database name="mydatabase">
            <Client>SQLite</Client>
            <Username>bob</Username>
            <Password>p#ssw0rd</Password>
        </Database>
    </AimmsDexConnect>

here we see the 3 required nodes for a database. We must say which database 



Create Or Modify
----------------

explain when something can be modified....


Supported Databases
-------------------

tja



