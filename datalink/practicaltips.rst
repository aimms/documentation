Tips and Tricks
***************


Read from file
==============

If the data map is defined in the AIMMS model then this model will contain the names of the tables and columns in the source. When we want to use this model using a source with different names we have to modify the model. 

An easy way to decouple the model from the source is by defining the data map in a separate text file and store it next to the source. We can then use :token:`read from file` ,to read the data map.

Suppose we have the following code:

.. code-block:: aimms

    dl::DataTables += {'TableNameInSource'} ;
    SP_ClassicDataMap(dl::dt,dl::idn,dl::cn,dl::dn) := data { 
        ! table            , identifier      , C, D   :  column name
        ( TableNameInSource, S_TheSet        , 1, 1 ) : "ColumnNameInSource",
        ( TableNameInSource, P_TheParameter  , 2, 0 ) : "OtherColumnNameInSource", 
    };
    dl::AddDataSourceMapping(
        "TheMapping",              ! The name of this data map
        SP_ClassicDataMap,         ! The data map
        dl::DependEmpty,           ! not used
        dl::TableAttributesEmpty,  ! not used
        dl::ColAttributeEmpty      ! Column Attribute
    );



We can make a text file `datamap.txt` containing:

.. code-block:: aimms

   SP_ClassicDataMap(dl::dt,dl::idn,dl::cn,dl::dn) := data { 
        ( TableNameInSource, S_TheSet        , 1, 1 ) : "ColumnNameInSource",
        ( TableNameInSource, P_TheParameter  , 2, 0 ) : "OtherColumnNameInSource", 
    };



Now we can change our code to: 

.. code-block:: aimms

    read from file "datamap.txt";

    dl::AddDataSourceMapping(
        "TheMapping",              ! The name of this data map
        SP_ClassicDataMap,         ! The data map
        dl::DependEmpty,           ! not used
        dl::TableAttributesEmpty,  ! not used
        dl::ColAttributeEmpty      ! Column Attribute
    );

Here we see that the code no longer contains the names of the columns in the source.

.. note::

    We also do not need to explicitly add the table names to :token:`dl::DataTables`, this will happen automatically when reading the text file.


