
Source Information
******************


Before reading or writing form a source you may want to understand the source better. For this we need to obtain the schema of the source.



Get Schema of Source
====================


There following function can be used to obtain the schema of a source. Whether the type can be determined depends on the provider.


.. js:function:: dl::GetDataSourceSchema(DataSource,ColumnName,ColumnType,DataSourceAttributes)

    :param DataSource: Name of the data source (string)
    :param ColumnName: Output String Parameter giving the column names for tables and column numbers
    :param ColumnType: Output String Parameter giving the column types for tables and column numbers
    :param DataSourceAttributes: The Read/write attribute specifying the provider


Before we call this function we have to specify the outputs:

.. code-block:: aimms

    StringParameter Schema {
        IndexDomain: (
            dl::dt,      ! table name
            dl::cn       ! column number
        );
    }
    ElementParameter ColumnType {
        IndexDomain: (
            dl::dt,      ! table name
            dl::cn       ! column number
        );
        Range: dl::ColumnTypes;
    }
    
Now we can call:

.. code-block:: aimms

    dl::GetDataSourceSchema(
        "TheSource.xlsx",          ! choose a source
        Schema,                    ! outputs the colum names            
        ColumnType,                ! outputs the types
        ReadWriteAttribute         ! only needed to choose a provider     
    );


We have to make sure that we choose the right provider fitting for the source. In the example above we see that we need the XLSProvider. So :token:`ReadWriteAttribute` needs to have defined this as provider:

.. code-block:: aimms

    ReadWriteAttribute := {'DataProvider' : xlsprov::DataLink }; 



