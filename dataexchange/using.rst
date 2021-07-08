Using the Data Exchange library for communicating data
======================================================

The AIMMS Data Exchange library allows mapping multi-dimensional AIMMS data onto tree-based data formats such as JSON, XML or even CSV (as a trivial tree-based format). It does so by letting you describe the repetitive structure of a given JSON, XML or CSV format in a mapping file that you can subsequently use to read data of a given format into multi-dimensional identifiers in your model, or write multi-dimensional data in your model to a given format. 
 
In the mapping file you specify how repetitive structure in the tree-based data binds to indices in your model, and how actual values in the data map to multi-dimensional identifiers over such bound indices.

Typically a tree-based data format can consists of several types of nodes:

* structural nodes, which can hold multiple structurally different named childnodes,
* repetitive nodes, which can hold multiple (named or unnamed) child nodes of the same type and structure, and
* value-holding leaf nodes, which hold the actual labels of bound indices or values of multi-dimensional identifiers.

The following simple examples demonstrate some basic uses of the Data Exchange library for JSON, XML and CSV formats. Next to these examples, you can also download our internal :download:`unit test project<downloads/DataExchangeTest.zip>` for the Data Exchange library, which will provide you with more example mappings demonstrating various capabilities of the Data Exchange library. It also contains the mappings and corresponding collections of AIMMS identifiers for reading and writing the JSON formats for geocoding and distance service from Google and GraphHopper.


Example: JSON mapping
---------------------

Look at the following mapping for a JSON format

.. code-block:: xml

    <AimmsJSONMapping>
        <ObjectMapping>
            <ValueMapping name="scalarValue" maps-to="a"/>
            <ValueMapping name="scalarElement" maps-to="b"/>
            <ValueMapping name="scalarString" maps-to="c"/>
            <ArrayMapping name="array">
                <ObjectMapping>
                    <ValueMapping name="k" binds-to="k"/>
                    <ValueMapping name="val" maps-to="d(k)"/>
                </ObjectMapping>
            </ArrayMapping>
        </ObjectMapping>
    </AimmsJSONMapping>

It describes a JSON file with an object with four children, one of which is an array holding multiple structurally identical objects, bound to an index :token:`k`. A matching JSON file could look like: 

.. code-block:: json

    {
        "scalarValue": 123.45,
        "scalarElement": 1,
        "scalarString": "a string",
        "array": [
            {
                "k": "Amsterdam",
                "val": 1.0
            },
            {
                "k": "London",
                "val": 2.0
            },
            {
                "k": "New York",
                "val": 3.0
            }
        ]
    }

Example: XML Mapping
---------------------

Look at the following mapping for an XML format

.. code-block:: xml

    <AimmsXMLMapping>
        <ElementObjectMapping name="RootObject">
            <ElementValueMapping name="scalarValue" maps-to="a"/>
            <ElementValueMapping name="scalarElement" maps-to="b"/>
            <ElementValueMapping name="scalarString" maps-to="c"/>
            <ElementObjectMapping name="array">
                <ElementValueMapping name="val" maps-to="d(k)">
                    <AttributeMapping name="k" binds-to="k"/>
                </ElementValueMapping>
            </ElementObjectMapping>
        </ElementObjectMapping>
    </AimmsXMLMapping> 
    
It describes an XML file with an object with four children, one of which is another object holding multiple structurally identical values, bound to an index :token:`k`. A matching XML file could look like: 

.. code-block:: xml

    <RootObject>
        <scalarValue>123.45</scalarValue>
        <scalarElement>1</scalarElement>
        <scalarString>a string</scalarString>
        <array>
            <val k="1">1.0</val>
            <val k="2">2.0</val>
            <val k="3">3.0</val>
            <val k="4">4.0</val>
            <val k="5">5.0</val>
            <val k="6">6.0</val>
            <val k="7">7.0</val>
            <val k="8">8.0</val>
            <val k="9">9.0</val>
            <val k="10">10.0</val>
        </array>
    </RootObject>

These examples make clear that each mapping closely follows the structure of the JSON, XML, or CSV file being described. Thus, if you know the format of the file to map, creating a corresponding mapping file for the Data Exchange library is rather straightforward.

Example: CSV mapping
---------------------

Look at the following mapping for a CSV format:

.. code-block:: xml

    <AimmsCSVMapping>
        <RowMapping>
            <ColumnMapping name="set1" binds-to="i"/>
            <ColumnMapping name="set2" binds-to="j"/>
            <ColumnMapping name="d1" maps-to="d1(i,j)"/>
            <ColumnMapping name="d2" maps-to="d2(i,j)"/>
            <ColumnMapping name="de" maps-to="de(i,j)"/>
            <ColumnMapping name="ds" maps-to="ds(i,j)"/>
            <ColumnMapping name="di" maps-to="di(i,j)"/>
        </RowMapping>
    </AimmsCSVMapping>

It describes a repetitive table node, i.e. a repetitive structure consisting of multiple rows, each consisting of multiple named column leaf-nodes either being bound to the indices :token:`i` and :token:`j`, or to multi-dimensional identifiers over these two indices. A CSV file associated with this mapping could look like:

.. code-block:: 
    
    set1,set2,d1,d2,de,ds,di
    arr-1,a-2,0.0,0.0,,,51
    arr-1,a-4,0.0,0.0,8,,90
    arr-1,a-5,0.0,0.0,,,87
    arr-1,a-7,0.0,0.0,,,90
    arr-1,a-10,0.0,0.0,9,,66
    arr-2,a-1,0.5,1.07,,,0
    arr-2,a-2,0.963846,0.0,,,0
    arr-2,a-3,0.248,1.579363,5,,13
    arr-2,a-4,0.25,0.0,,"string ,""5",73
    arr-2,a-5,0.112488,0.0,,"string ,""2",86

Example: Excel mapping
----------------------

Look at the following mapping for a Excel file with a single sheet with a table:

.. code-block:: xml

    <AimmsExcelMapping>
        <SheetMapping name="Table1">
            <RowMapping name="row">
                <ColumnMapping name="set1" binds-to="i"/>
                <ColumnMapping name="set2" binds-to="j"/>
                <ColumnMapping name="d1" maps-to="d1(i,j)"/>
                <ColumnMapping name="d2" maps-to="d2(i,j)"/>
                <ColumnMapping name="de" maps-to="de(i,j)"/>
                <ColumnMapping name="ds" maps-to="ds(i,j)"/>
                <ColumnMapping name="di" maps-to="di(i,j)"/>
            </RowMapping>
        </SheetMapping>
    </AimmsExcelMapping>

This mapping will create the same table as in the CSV example, but will now output the table to an Excel workbook with a sheet called :token:`Table1`. A single Excel mapping can contain mappings for multiple sheets.

