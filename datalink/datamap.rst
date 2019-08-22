The Data Map
******************

The data map is a string parameter that describes how columns in the source are mapped onto identifiers in AIMMS. You can add it to DataLink and give it a name. Then this data map can be used for reading and writing by using its name. 


What is a data map
==================

There are two kinds of data maps, an old one referred to as the "classic data map", and a new one referred to as the "data map". The classic data map was created by reusing some parts of the ``flatfilereader`` and augmenting it by adding support for other providers. The use of the classic data map still has elements that are there for historic reasons. Parts that are no longer used by DataLink still exist for backward compatibility of existing models. The new data map was introduced because the structure of the classic data map, particular when it comes to column numbers, was to rigid for some new features.


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



.. _LinkAddClassicDataMap:

Add the Map
-----------

To use a data map we first have to add it to DataLink and assign a name to it that we can use to tell DataLink which data map we want to use. We can add a data map using the following function:

.. js:function:: dl::AddDataSourceMapping(MapName,DataMap,ColDepend,TableAttribute,ColAttribute)

    :param MapName: String representing the name of the data map
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

    :param MapName: String representing the name of the data map
  

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


We use the same example as in the description of the classic data map. We assume that we have a set identifier  :token:`S_TheSet` in AIMMS, and a parameter  :token:`P_TheParameter` indexed over :token:`S_TheSet`. Then we can specify the data map as:

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

    :param MapName: String representing the name of the data map
    :param DataMap: The data map (new style) we add to DataLink 


So we can do,  

.. code-block:: aimms

    dl::AddDataMap("TheMapping",dl::DataMap);

Again we have to make sure that the data map name already does not exist in DataLink, so we can make a call 

.. code-block:: aimms

    dl::RemoveDataSourceMapping("TheMapping");  

Since this function only has a string as argument we can use the same function to remove a new style data map as the classic data map. 


.. tip ::

    Keep in mind that the data map is just a string parameter with 4 indices. The order in which we specify everything does not matter. For large complicated data maps you may want to stick to a fixed strategy of ordering. You could group it based on the data map attribute, or you can decide to keep all specifications of an identifier close to each other.


.. _LinkColumnParameters:

Parameters with Column Indices
------------------------------


One of the limitations of the classic data map is that we need to assign one column number to each parameter. This means that it can only associate this parameter with one column in the source, which is a serious limitation. 

The Problem
```````````

Let's look at a simple example to understand this limitation. Consider we have a model with 

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


Here the values 1, 2 and 3 for :token:`dl::xd` have no meaning, any non zero positive integer is allowed. The purpose of these numbers is that it allows us to specify multiple columns per table/identifier pair. So they only have to be distinct for each column. When DataLink encounters those non zero numbers then:

1. DataLink will see the non zero positive value for :token:`dl::xd` and concludes that :token:`P_NutrientValue` is **NOT** a normal single column parameter.
2. DataLink looks at the index domain of parameter :token:`P_NutrientValue` and sees that it has :token:`f` and :token:`n` as index domain.
3. DataLink looks at all sets defined for table *"TableName"* and finds only set :token:`S_FoodType` with index :token:`f`.
4. DataLink understands that the columns correspond to elements from the set with :token:`n` as index.

This procedure will only work if the parameter have an index in the index domain that is not mapped to a column in the data map. The location of this index can be anywhere. So if :token:`C` is the column index we could have a parameter :token:`P(i,j,C)`, or :token:`P(i,C,j)`, or :token:`P(C,i,j)`.

.. tip ::

    The recommended location of the column index is the last element from the index domain. So :token:`P(i,j,C)` would be preferred over the other possibilities. For reading this is not important. For writing the table structure has to be constructed from the data from AIMMS and when the column index is last, the order DataLink receives the data resembles the row structure of the table most.


The IdxMap Attribute
````````````````````

If we use a parameter with column index then the *'colname'* attribute specifies the column name in the source. This will also be used as the value for the corresponding index. Suppose we had the set :token:`S_Nutrients` defined as:

.. code-block:: aimms

    Set S_Nutrients {
        Index: n;
        Definition: {
            {'p','f','c'}
        }
    }

If we want to read from the multi-column table we need to somehow tell which column corresponds to which elements in :token:`S_Nutrients`. For this we introduced the data map attribute :token:`idxmap` to map the index value to a column. 


.. code-block:: aimms

    dl::DataMap := data{
        ! table name  ,  identifier          , X ,  attribute   : value
        ( 'TableName' ,  'S_FoodType'        , 0 , 'colname' )  : "FoodType", 
        ( 'TableName' ,  'P_NutrientValue'   , 1 , 'colname' )  : "Protein",   ! xd = 1: column name "Protein" in the source
        ( 'TableName' ,  'P_NutrientValue'   , 1 , 'idxmap' )   : "p",         ! xd = 1: index n has value 'p' 
        ( 'TableName' ,  'P_NutrientValue'   , 2 , 'colname' )  : "Fat" ,
        ( 'TableName' ,  'P_NutrientValue'   , 2 , 'idxmap' )   : "f",                
        ( 'TableName' ,  'P_NutrientValue'   , 3 , 'colname' )  : "Carbohydrates"
        ( 'TableName' ,  'P_NutrientValue'   , 3 , 'idxmap' )   : "c",                
    };

In this table for *'TableName'*, *'P_NutrientValue'* and *'dl::xd = 1'* we see both a :token:`colname` and an :token:`idxmap` specified.
Here we say that column *"Protein"* in the source corresponds to :token:`P_NutrientValue(f,'p')` in the AIMMS model.  


Valid tables and their domains
==============================

DataLink reads and writes tables row by row. This requires that for each parameter all elements of its index domain must be in that row. This makes that parameters become dependent on the presence of columns corresponding to their index domain. So there is a **restriction** on what kind of tables can be mapped by the data map.

We will say that all data in columns representing a set in AIMMS will be **"Domain Columns"** , because this data will also be passed on as values for the index domains of the parameters.



Indices from the same set
-------------------------

In the classic data map we explicitly spell out which column has what domain number. This allows us to use the same set as domain multiple times. 

Suppose we have a parameter :token:`P(i,j)` and a set:

.. code-block:: aimms

    Set S {
        Index: i,j;
    }

Then in the data map below it is clear that data from domain column "Si" is mapped onto the first domain index of :token:`P(i,j)` and data from domain column ``Sj`` is mapped onto onto the second domain index:

.. code-block:: aimms

    ClassicDataMap := data{
        ( 'TableOne' ,  'S'  , 1 , 1 ) : "Si",   ! Set S
        ( 'TableOne' ,  'S'  , 2 , 2 ) : "Sj",   ! Also set S 
        ( 'TableOne' ,  'P'  , 1 , 0 ) : "P" 
    };


We cannot do the same in the new data map because we do not specify the domain number. Instead of using the names of the set :token:`S`, we can use the names of the indices :token:`i` and :token:`j` to map them onto domain columns ``Si`` and ``Sj``:

.. code-block:: aimms

    dl::DataMap := data{
        ( 'TableOne' ,  'i'  , 0 , 'colname' ) : "Si",   ! Index i ( of set S )
        ( 'TableOne' ,  'j'  , 0 , 'colname' ) : "Sj",   ! Index j ( also of set S )
        ( 'TableOne' ,  'P'  , 0 , 'colname' ) : "P" 
    };



Parameters in different tables
------------------------------


Because each table is read row by row, we cannot reuse a domain columns from a different table. Suppose we want to read parameters :token:`P(i)` and :token:`Q(i)` from two different table. Then we run into problems when we try create a classic data map: 

.. code-block:: aimms

    ClassicDataMap := data{
      ! table one
        ( 'TableOne' , 'S' , 1 , 1 ) : "S", 
        ( 'TableOne' , 'P' , 2 , 0 ) : "P",  
      ! table two
        ( 'TableTwo' , 'Q' , 1 , 0 ) : "Q" ! Obvious: Cannot read this because it is missing the S column
    };

Here it becomes immediately clear that we miss a domain column for the second table. If :token:`Q` has a domain we need to have a column with domain number 1 (and thus column number 1) and so :token:`Q` cannot have column number 1.

In the new data map this is less obvious. DataLink will deduce which domain columns correspond to the index domain so we no longer have to express this explicitly. Even if we cannot see this in the data map, we still cannot have a parameter without the required domain column in the table: 

.. code-block:: aimms

    dl::DataMap := data{
      ! table one
        ( 'TableOne' , 'S' , 0 , 'colname' ) : "S", 
        ( 'TableOne' , 'P' , 0 , 'colname' ) : "P",  
      ! table two
        ( 'TableTwo' , 'Q' , 0 , 'colname' ) : "Q" ! Not so obvious: Cannot read this because it is missing the S column
    };



The shared domain of a table
----------------------------


In the classic map the mapping of the index domain of parameters are very clear. If we have a parameter :token:`P(i,j)` we know that the first column must be set containing index :token:`i`, and a second column must be the set with index :token:`j`. These will have domain number 1 and 2 and :token:`P` will have domain number 0. It clear that we cannot just add any parameter to the table, because with the domain numbers we are basically saying "use the first two columns as index domain". For this reason we can only add parameters that have the same index domain as :token:`P(i,j)`.

With the introduction of the new data map this all becomes less clear. The domain numbers are no longer used and with the column parameter, the index domains of parameters in the same table no longer have to be the same. We need some extra jargon. We will say that:

* All domain columns of a table form the **"Shared Domain"** of that table.
* All parameters in a table must be compatible with the shared domain of the table.

Now we can reason about which parameters can be in the same table. Suppose we have a parameter :token:`P(i,j)`, what :token:`Q` can be added to the table?

 :token:`Q(i,j)`
    This is possible because the index domain is the same.

 :token:`Q(i,k)`
    This is only possible if :token:`k` is and index in the same set as :token:`j` (or for situation :token:`Q(k,j)` the :token:`k` is the index in the same set as :token:`i`)

 :token:`Q(j,i)`
    Not possible. The order of the index domain must be the same (This limitation has nothing to do with the shared domain, it is just that flipping index domains would make the data transfer inefficient.)

 :token:`Q(i,j,k)`
    Not possible with the classic data map, but possible with the new data map when we use :token:`k` as the column index. In that case it is also possible to have :token:`Q(k,i,j)` or :token:`P(i,k,j)`.

 :token:`Q(i,j,k,l)`
    Not possible. We can only have one extra index in the new data map to serve as column index.


The name "shared domain" is derived from the column parameters. These parameters can have index domains with different column indices. The part of the index domain that they must have in common is the shared domain.


.. note::

    When reading a row of data, all values in the shared domain must have a valid value. Otherwise no data for parameters can be send to AIMMS. If one of the values in the shared domain is missing or invalid, the entire row will be skipped and an error will be reported.