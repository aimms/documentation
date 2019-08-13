Data Map Automation
*******************

The data map requires to manually specify a lot of details about the mapping of the columns and the identifiers. Data map automation is about not having to specify the whole data map by hand but instead call methods to do so. The price we pay for automation is that we cannot control all aspects of the mapping. What we gain, besides convenience, is that the model and the source get decoupled more.


Category Mapping
================

It is possible to group parameters into catagories and tables using annotations. Then there is a function to automatically turn this into a specific kind of data map call category map. Inside DataLink this is an ordinary classic data map and has a data map name. But we can add this data map using the name of the category.

.. js:function:: dl::AddCategoryMapping(MapName,Category,Attributes)

    :param MapName: Data map name (string)
    :param Category: Category name (string)
    :param Attributes: Column attribute


The category can be specified using annotations :token:`dl::Category:` for the category and :token:`dl::Table:` for the tables inside this category. An example is given below:

.. code-block:: aimms

    DeclarationSection Declaration_Category {
        dl::Category: Cat;            ! <----  annotation: category
        Set SI {
            Index: i;
        }
        Set SJ {
            Index: j;
        }
        Parameter p0 {
            dl::Table: Dim0Table;    ! <----  annotation: table
        }
        Parameter p1 {
            IndexDomain: i;
            dl::Table: Dim1Table;    ! <----  annotation: table
        }
        Parameter p2 {
            IndexDomain: (i,j);
            dl::Table: Dim2Table;    ! <----  annotation: table
        }
    }

This creates one category with three tables. Instead of creating a data map, we can add this using only the name of the category *"Cat"* using:

.. code-block:: aimms

    dl::AddCategoryMapping(
        "TheDataMap",      ! The name of this data map
        "Cat",             ! The name of the category (from annotation dl::Category)
        ColAttributes      ! Column Attribute
    );


This is equivalent as doing:   

.. code-block:: aimms

    dl::DataTables += {'Dim0Table , Dim1Table , Dim2Table'} ;

    SP_ClassicDataMap(dl::dt,dl::idn,dl::cn,dl::dn) := data { 
        ! table            , identifier      , C, D   :  column name
        ( Dim0Table        , p0              , 1, 0 ) : "p0",

        ( Dim1Table        , SI              , 1, 1 ) : "i",
        ( Dim1Table        , p1              , 2, 0 ) : "p1",

        ( Dim1Table        , SI              , 1, 1 ) : "i",
        ( Dim1Table        , SJ              , 2, 2 ) : "j",
        ( Dim1Table        , p2              , 2, 0 ) : "p2",
    };

    dl::AddDataSourceMapping(
        "TheDataMap",              ! The name of this data map
        SP_ClassicDataMap,         ! The data map
        dl::DependEmpty,           ! not used
        dl::TableAttributesEmpty,  ! not used
        ColAttributes              ! Column Attribute
    );

We see here that the names of the columns in the source are "filled in". This means that we loose some control over how we map the identifiers to columns.
