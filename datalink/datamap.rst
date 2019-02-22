The Data Map
******************



What is a data map
==================

two types
data map classic datamap




The "Classic" Data Map
======================

A classic data map is a string parameter that can be defined as:

.. code-block:: aimms

    StringParameter SP_ClassicDataMap {
        IndexDomain: (
            dl::dt,   ! Table name
            dl::idn,  ! Identifier name
            dl::cn,   ! Column number
            dl::dn    ! Domain number
        );
    } 

The :token:`dl::dt` is the index of set :token:`dl::DataTables`. We have to make sure that the table name exists in that set before we can use it to specify the data map. We can do this by

.. code-block:: aimms

    dl::DataTables += {'TableNameInSource'} ;

witch will add table name :token:`TableNameInSource` to set :token:`dl::DataTables`. 

Suppose we have a set identifier  :token:`S_TheSet` in AIMMS, and a parameter  :token:`P_TheParameter` indexed over :token:`S_TheSet`. Then we can specify the data map as:

.. code-block:: aimms

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

.. js:function:: dl::AddDataSourceMapping(MapName,DataMap,ColDepend,TableAttribute,ColAttribute)

    :param MapName: String representing the name of the datamap
    :param DataMap: The data map we add to DataLink
    :param ColDepend: not used
    :param TableAttribute: not used
    :param ColAttribute: Column attributes (optional) 

If we want to use the data map :token:`SP_ClassicDataMap` that we specified before and give it the name  *"TheMapping"*, we can do

.. code-block:: aimms

    dl::AddDataSourceMapping(
        "TheMapping",              ! The name of this data map
        SP_ClassicDataMap,         ! The data map
        dl::DependEmpty,           ! not used
        dl::TableAttributesEmpty,  ! not used
        dl::ColAttributeEmpty      ! Column Attribute
    );

The input arguments :token:`dl::depends`  and :token:`dl tableabtributes` are not used and for this empty placeholder values :token:`dl::DependEmpty` and :token:`dl TableAttributesEmpty` are used.

For the column attributes also an empty placeholder :token:`dl::ColAttributeEmpty` is used but here we can specify some attributes that the provider can use. If we define a string parameter :token:`SP_ColAttr` as:

.. code-block:: aimms

    StringParameter SP_ColAttr {
        IndexDomain: (
            dl::dt,             ! Table name
            dl::cn,             ! Column number
            dl::colattr         ! Attribute type
            );
    }

We could set some attribute for the :token:`P_TheParameter` column

.. code-block:: aimms

    SP_ColAttr := data{
        !   table name        , C , attribute      : value
        ( 'TableNameInSource' , 2 , 'Width'     ) : "8", 
        ( 'TableNameInSource' , 2 , 'Precision' ) : "2" 
    };

when we replace the placeholder :token:`dl::ColAttributeEmpty` by :token:`SP_ColAttr` as argument for :token:`AddDataSourceMapping`, then these attribute values will be passed on to the provider.



Internally DataLink keeps track of a list of data map and their names. It is possible that the name 
A data map can be removed 


.. js:function:: dl::RemoveDataSourceMapping(MapName)

    :param MapName: String representing the name of the datamap
  

.. note::

    If a procedure in AIMMS contains a call to :token:`dl::AddDataSourceMapping` it can happen quiet easily that we call it with the same data map name if we rerun the procedure. To prevent DataLink from throwing errors it is possible to always call :token:`dl::RemoveDataSourceMapping` before calling :token:`dl::AddDataSourceMapping`.



.. _LinkNewDataMap:

The New Data Map
================

The new data map is recently introduced to add functionality that is very hard to implement using the classic data map. Also some other future enhancements were taking into account in coming up with this data map.

A data map is a string parameter that can be defined as:

.. code-block:: aimms

    StringParameter SP_DataMap {
        IndexDomain: (
            dl::dt,   ! Table name
            dl::idn,  ! Identifier name
            dl::xd,   ! eXtra data map number
            dl::dma   ! Data map attribute 
        );
    } 


The third and fourth element have changed. The third element is an integer value that is used for some new functionality described later. For now we can leave it as 0, to have the same setup as with the classic data map. 

The fourth element is the data map attribute. This is a string expressing what information about the table and identifier we are expressing. The most important and mandatory attribute is :token:`colname` which tels that we specify the column name in the source. Also it allows us to specify column attributes in the data map instead of separate string parameter, like in the classic data map configuration. 

The first two element have not changed, so we also have to make sure that the table name is added to the set :token:`dl::DataTables`:

.. code-block:: aimms

    dl::DataTables+={'TableName'};  ! define a tablename


We tae the same example as in the description of the classic data map. We assume that we have a set identifier  :token:`S_TheSet` in AIMMS, and a parameter  :token:`P_TheParameter` indexed over :token:`S_TheSet`. Then we can specify the data map as:

.. code-block:: aimms

    dl::DataMap := data{
        ! table name  ,  identifier         , X ,  attribute  : value
        ( 'TableName' ,  'S_TheSet'         , 0 ,  'colname' ): "ColumnNameInSource", 
        ( 'TableName' ,  'P_TheParameter'   , 0 ,  'colname' ): "OtherColumnNameInSource"
    };


Here, instead of first declaring the string parameter, we use the build in :token:`dl::DataMap`. This is possible because after we added the map to DataLink we no longer need it and can reused the same parameter to add more data maps.

If we also want to specify some column attributes we can do:

.. code-block:: aimms

    dl::DataMap := data{
        ! table name  ,  identifier         , X ,  attribute   : value
        ( 'TableName' ,  'S_TheSet'         , 0 , 'colname' )  : "ColumnNameInSource", 
        ( 'TableName' ,  'P_TheParameter'   , 0 , 'colname' )  : "OtherColumnNameInSource",
        ( 'TableName' ,  'P_TheParameter'   , 0 , 'width' )    : "8" ,
        ( 'TableName' ,  'P_TheParameter'   , 0 , 'precision') : "2"
    };

We can see here how the attributes works. Basically it allows us for the combination :token:`TableName` ,  :token:`P_TheParameter` and :token:`0` to specify three different properties. (Also we can already hint on the role of the extra number, because this will allow us to specify the same attribute for a table/identifier pair more than once.) 

For the new style data map a new function is created to add it to DataLink:

.. js:function:: dl::AddDataMap(MapName,DataMap)

    :param MapName: String representing the name of the datamap
    :param DataMap: The data map (new style) we add to DataLink 


So we can do,  

.. code-block:: aimms

    dl::AddDataMap("TheMapping",dl::DataMap);

Again we have to make sure that the data map name already does not exist in DataLink, so we can make a call 

.. code-block:: aimms

    dl::RemoveDataSourceMapping("TheMapping");  

Since this function only has a string as argument we can use the same function to remove a new style data map as the classic datamap.


.. _LinkColumnParameters:

Parameters with Column Indices
------------------------------


One of the limitations of the classic data map is that we need to assign one column number to each parameter. This means that it can only associate this parameter with one column in the source, which is a serious limitation. 

The Problem
```````````

Let's look at a simple example to understand this limitation. Consider we have model with 

.. code-block:: aimms

    Set S_FoodTypes {
        Index: f;
    }
    Set S_Nutrients {
        Index: n;
    }
    Parameter P_NutrientValue{
            IndexDomain: (f,n);
    }

To read the :token:`P_NutrientValue` from a source the table must at least have the same columns as in the one-column table below.

.. csv-table:: One-column table
   :header: "FoodType", "Nutrients", "NutrientValue"
   :widths: 30, 30, 30

   "Big Mac", "Protein", 25
   "Big Mac", "Fat", 22
   "Big Mac", "Carbohydrates", 44
   "Quarter Pounder", "Protein", 32.4
   "Quarter Pounder", "Fat", 25
   "etc.", "etc.", "etc."

This table is rather awkward to work with and more importantly, when the source is supplied by an other program it is unlikely that it has this form. A more natural way to present this data is shown in the multi-column table.

.. csv-table:: Multi-column table
   :header: "FoodType", "Protein", "Fat", "Carbohydrates"
   :widths: 30, 30, 30, 30

   "Big Mac", 25, 22, 44
   "Quarter Pounder", 32.4, 25, 40.4
   "French Fries", 5, 21, 54
   "etc.", "etc.", "etc.", "etc."

There are two main difference between these two tables.

1. We see that the "data" values from the *"Nutrients"* in the one-column table are now column names in the multi-column table.

2. We see that the multi-column table no longer has a column *"NutrientValue"*, while three columns have data for/from :token:`P_NutrientValue`.


The Solution
````````````

We want to read all the data in the multi-column table into one parameter :token:`P_NutrientValue`, but now they are split among different columns. For this we introduced the extra :token:`dl::xd` in the new data map. This makes it possible to specify more than one column name for a single parameter. Consider the following data map.


.. code-block:: aimms

    dl::DataMap := data{
        ! table name  ,  identifier          , X ,  attribute   : value
        ( 'TableName' ,  'S_FoodType'        , 0 , 'colname' )  : "FoodType", 
        ( 'TableName' ,  'P_NutrientValue'   , 1 , 'colname' )  : "Protein",
        ( 'TableName' ,  'P_NutrientValue'   , 2 , 'colname' )  : "Fat" ,
        ( 'TableName' ,  'P_NutrientValue'   , 3 , 'colname' )  : "Carbohydrates"
    };


Here the values 1, 2 and 3 for :token:`dl::xd` have no meaning, any non zero positive integer is allowed. The purpose of these numbers is that it allows us to specify multiple columns per table/identifier pair. So they only have to be distinct for each column. When DataLink encounters thos non zero numbers then:

1. DataLink will see the non zero positive value for :token:`dl::xd` and concludes that :token:`P_NutrientValue` is **NOT** a normal single column parameter.
2. DataLink looks at the indexdomain of parameter :token:`P_NutrientValue` and sees that it has :token:`f` and :token:`n` as indexdomain.
3. DataLink looks at all sets defined for table *"TableName"* and finds only set :token:`S_FoodType` with index :token:`f`.
4. DataLink understands that the columns correspond to elements from the set with :token:`n`.

This procedure will only work if the parameter have and index in the indexdomain that is not mapped to a column in the data map. The location of this index can be anywhere. So if :token:`C` is the column index we could have a parameter :token:`P(i,j,C)`, or :token:`P(i,C,j)`, or :token:`P(C,i,j)`.

.. tip ::

    The recommended location of the column index is the last element from the index domain. So :token:`P(i,j,C)` would be preferred over the other possibilities. For reading this is not important. For writing the table structure has to be constructed from the data from AIMMS and when the column index is last, the order DataLink receives the data resembles the row structure of the table most.


The IdxMap Attribute
````````````````````

If we use a parameter with column index then *'colname'* attribute specifies the column name in the source. This will also be used as the value for the corresponding index. Suppose we had the set :token:`S_Nutrients` defined as:

.. code-block:: aimms

    Set S_Nutrients {
        Index: n;
        Definition: {
            {'p','f','c'}
        }
    }

If we want to read from the multi-column table we need to somehow tell which column corresponds to the which elements in :token:`S_Nutrients`. For this we introduced the data map attribute :token:`idxmap` to map the index value to a column. 


.. code-block:: aimms

    dl::DataMap := data{
        ! table name  ,  identifier          , X ,  attribute   : value
        ( 'TableName' ,  'S_FoodType'        , 0 , 'colname' )  : "FoodType", 
        ( 'TableName' ,  'P_NutrientValue'   , 1 , 'colname' )  : "Protein",   ! column "Protein" in the source
        ( 'TableName' ,  'P_NutrientValue'   , 1 , 'idxmap' )   : "p",         ! index n has value 'p' 
        ( 'TableName' ,  'P_NutrientValue'   , 2 , 'colname' )  : "Fat" ,
        ( 'TableName' ,  'P_NutrientValue'   , 2 , 'idxmap' )   : "f",                
        ( 'TableName' ,  'P_NutrientValue'   , 3 , 'colname' )  : "Carbohydrates"
        ( 'TableName' ,  'P_NutrientValue'   , 3 , 'idxmap' )   : "c",                
    };

In this data map we say that column *"Protein"* corresponds to :token:`P_NutrientValue(f,'p')`.  


Domains of valid tables
=======================





also do the i,j,P(i,j) for i,j in S












