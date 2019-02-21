The Data Map
******************



What is a data map
==================

two types
data map classic datamap




The "Classic" Mata Map
======================

A classic data map is a string parameter that can be defined as:

.. code::

    StringParameter SP_ClassicDataMap {
        IndexDomain: (
            dl::dt,   ! Table name
            dl::idn,  ! Identifier name
            dl::cn,   ! Column number
            dl::dn    ! Domain number
        );
    } 

The :token:`dl::dt` is the index of set :token:`dl::DataTables`. We have to make sure that the table name exists in that set before we use it to specify the data map. We can do this by

.. code::

    dl::DataTables += {'TableNameInSource'} ;

witch will add table name :token:`TableNameInSource` to set :token:`dl::DataTables`. 

Suppose we have a set identifier  :token:`S_TheSet` is a in AIMMS, and a parameter  :token:`P_TheParameter` indexed over :token:`S_TheSet`. Then we can specify the data map as:

.. code::

     SP_ClassicDataMap(dl::dt,dl::idn,dl::cn,dl::dn) := data { 
        ! table            , identifier      , C, D   :  column name
        ( TableNameInSource, S_TheSet        , 1, 1 ) : "ColumnNameInSource",
        ( TableNameInSource, P_TheParameter  , 2, 0 ) : "OtherColumnNameInSource", 
     };

The numbers 1 and 2 are column numbers. For each table they start at 1 and are counted up, starting with all the domains (sets) first, followed by all the parameters. The numbers 1 and 0 are the domain numbers. If the domain number equals the column number it is a set that can serve as a domain. If the domain number is zero then it is a parameter that has all the sets in the table as domain.

The string values *"ColumnNameInSource"* and *"OtherColumnNameInSource"* are the names in the data source.



Add the Map
-----------

To use a data map we first have to add it to DataLink and assign a name to it that we can use to tell DataLink which data map we want to use. We can add a data map using the following function:

.. py:function:: dl::AddDataSourceMapping(MapName,DataMap,ColDepend,TableAttribute,ColAttribute)

    :param MapName: String representing the name of the datamap
    :param DataMap: The data map we add to DataLink
    :param ColDepend: not used
    :param TableAttribute: not used
    :param ColAttribute: Column attributes (optional) 

If we want to use the data map :token:`SP_ClassicDataMap` that we specified before and give it the name  *"TheMapping"*, we can do

.. code::

    dl::AddDataSourceMapping(
        "TheMapping",              ! The name of this data map
        SP_ClassicDataMap,         ! The data map
        dl::DependEmpty,           ! not used
        dl::TableAttributesEmpty,  ! not used
        dl::ColAttributeEmpty      ! Column Attribute
    );

The input arguments :token:`dl::depends`  and :token:`dl tableabtributes` are not used and for this empty placeholder values :token:`dl::DependEmpty` and :token:`dl TableAttributesEmpty` are used.

For the column attributes also an empty placeholder :token:`dl::ColAttributeEmpty` is used but here we can specify some attributes that the provider can use. If we define a string parameter :token:`SP_ColAttr` as:

.. code::

    StringParameter SP_ColAttr {
        IndexDomain: (
            dl::dt,             ! Table name
            dl::cn,             ! Column number
            dl::colattr         ! Attribute type
            );
    }

We could set some attribute for the :token:`P_TheParameter` column

.. code::

    SP_ColAttr := data{
        !   table name        , C , attribute      : value
        ( 'TableNameInSource' , 2 , 'Width'     ) : "8", 
        ( 'TableNameInSource' , 2 , 'Precision' ) : "2" 
    };

when we replace the placeholder :token:`dl::ColAttributeEmpty` by :token:`SP_ColAttr` as argument for :token:`AddDataSourceMapping`, then these attribute values will be passed on to the provider.









.. _LinkNewDataMap:

The New Data Map
================




The basics
----------


Add the Map
-----------

.. _LinkColumnParameters:

Column Parameters
-----------------







