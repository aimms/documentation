Get Schema of Source
********************


purpose



.. js:function:: dl::GetDataSourceSchema(DataSource,ColumnName,ColumnType,DataSourceAttributes)

    :param DataSource: String representing the name of the data source
    :param ColumnName: Output String Parameter giving the column names for tables and column numbers
    :param ColumnType: Output String Parameter giving the column types for tables and column numbers
    :param DataSourceAttributes: The Read/write attribute specifying the provider


before we call this function we have to specify the otputs where we write the info in.

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
    StringParameter PickTheProvider {
        IndexDomain: (
            dl::rwattr  ! read/write attribute
        );
    }



.. code-block:: aimms

    PickTheProvider := {'DataProvider' : xlsprov::DataLink }; 

.. code-block:: aimms

    dl::GetDataSourceSchema(
        "Diet.xlsx",  ! choose a source
        Schema,
        ColumnType,
        PickTheProvider   
    );
