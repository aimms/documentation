DataLink configuration
**********************

Installation and setup
======================

To use DataLink only two things are needed:

* The DataLink library should be added to the project.
* A provider library should be added to the project.

The libraries are made available in through the AIMMS library repository, and can be installed from the **AIMMS Library Manager**.

The use of DataLink always takes two steps:

* **Step 1** is the configuration. The provider has to be specified and also the mapping of identifiers to column names has to be specified. Optionally extra column and table attributes can be set depending of the kind of provider.
* **Step 2** is the call to DataRead or DataWrite. This is when the data is transfered between AIMMS and the data source.

All providers have a string identifier called :token:`DataLink` containing the location of the binary file (the code) that has to run to transfer the data. All we have to do to specify a provider is to pass this string as attribute 'Provider' to DataLink. DataLink then can call this code to do the actual reading and writing.

Read and Write Attributes
=========================

Suppose the *XLSProvider* is used. It has a library prefix :token:`xlsprov` and so we can do:

.. code::

        SP_ReadWriteAttributes(dl::rwattr) :={ 'DataProvider' : xlsprov::DataLink , ... }
        dl::DataRead("MyExcelFile.xlsx", "TheMapping" , ReadWriteAttributes);

.. topic:: In this code example, 

    * :token:`SP_ReadWriteAttributes` is a string parameter indexed over the *DataLink Library* :token:`dl::rwattr`, where you will specify (among others) the provider,
    * :token:`"TheMapping"` is the name of the mapping which we still have to specify, 
    * :token:`"MyExcelFile.xlsx"` is the name of the data source. 

.. note::
    
    To write in the Excel file, you may use the function :token:`dl::DataWrite`, using same arguments than :token:`dl::DataRead`.

There are other elements than ``'DataProvider'`` in :token:`dl::rwattr`, but their use depends on the kind of provider:

* ``'EmptyData'``: If :token:`1` or :token:`"yes"` then the data will be cleared after writing.
* ``'OverWrite'``: If :token:`1` or :token:`"yes"` the data in the data source will be cleared before writing.
* ``'MissingValue'``: What to do when the reader encounters a missing or unreadable value in the data source. If :token:`"error"` an error is reported and the running function stops. If :token:`"ignore"` nothing happens. The default value is :token:`"warn"`, a message is send to the message window, but the function keeps running.
* ``'Separator'``: This is needed by the CSVProvider to turn lines in the CSV file into columns. The default value is :token:`","`.

The mapping
===========

Mappings can be added and removed from DataLink using their names.

.. code::

    dl::AddDataSourceMapping("TheMapping", DataMap, ...); 

:token:`"TheMapping"` string is the name of the mapping.  It will persist until it is removed from DataLink by doing :token:`dl::RemoveDataSourceMapping("TheMapping");`. The String Parameter :token:`DataMap` defines the mapping.

A basic data-map looks like this:

.. code::

     DataMap(dl::dt,dl::idn,dl::cn,dl::dn) := data { 
     ( TableNameInSource, S_TheSet        , 1, 1 ) : "ColumnNameInSource",
     ( TableNameInSource, P_TheParameter  , 2, 0 ) : "OtherColumnNameInSource", 
     };

We tried to make names as explicit as possible. :token:`S_TheSet` is a Set identifier in AIMMS, and :token:`P_TheParameter` is a Parameter indexed over :token:`S_TheSet`. The numbers 1 and 2 are column numbers. For each table they start at 1 and are counted up, starting with all the domains (sets) first, followed by all the parameters. The numbers 1 and 0 are the domain numbers. If the domain number equals the column number it is a set that can serve as a domain. If the domain number is zero then it is a parameter that has all the sets in the table as domain.

In this example the source only has one table named :token:`TableNameInSource` but more tables can be specified if they are present in the data source. A table *TableNameInSource* in the source can have as many columns in any order, but in the data-map we say that we are only interested in the two columns with the names specified ("ColumnNameInSource" and "OtherColumnNameInSource"). It is up to the provider to figure out which columns are available and how to connect these to the DataLink columns.

One thing to keep in mind is that the data map is just a 4D string parameter in AIMMS. This means that we can only assign the data (*:= data*) when all elements of the domain set exist. For the column numbers, the domain numbers and the identifier names, it is not a problem. For the table names, the first domain of the data map, DataLink cannot know in advanced what these names should be and starts with an empty set :token:`dl::DataTables`. We can simply add the name :token:`TableNameInSource` to this set by doing:

.. code::

    dl::DataTables += {'TableNameInSource'} ;



Function :token:`dl::AddDataSourceMapping` has three extra arguments to pass extra attributes to the specific providers. 
Datalink provides empty argument parameters for when no attribute needs to be set. The full call to :token:`dl::AddDataSourceMapping` with empty attributes becomes:

.. code::

    dl::AddDataSourceMapping("TheMapping",DataMap, dl::DependEmpty, dl::TableAttributesEmpty, dl::ColAttributeEmpty);