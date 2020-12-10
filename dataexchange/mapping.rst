Data Exchange Mappings
**********************

Each Data Exchange mapping is an XML file describing the structure of the JSON, XML or CSV format being mapped. Below you find the elements specific for each of the mapping types. The attributes that you can specify for each element are shared 

JSON Mapping elements
======================

The following are the elements allowed in a JSON mapping

* the :token:`AimmsJSONMapping` element, the mandatory root of a JSON mapping
* the :token:`ObjectMapping` element, a mapping element used to map a JSON object value (enclosed in curly brackets :token:`{` and :token:`}`)
* the :token:`ArrayMapping` element, a mapping element used to map a JSON array value (enclosed in square brackets :token:`[` and :token:`]`). A JSON array mapping can only have a single child mapping, specifying the type of every element in the array.
* the :token:`ValueMapping` element, a mapping element used to map a integer, double or string value in a JSON file

XML Mapping elements
======================

The following are the elements allowed in a XML mapping

* the :token:`AimmsXMLMapping` element, the mandatory root of a XML mapping
* the :token:`ElementObjectMapping` element, a mapping element used to map an XML element that holds child elements, but no value
* the :token:`ElementValueMapping` element, a mapping element used to map an XML element that holds a value, but no child elements
* the :token:`AttributeMapping` element, a mapping element used to map the value of an attribute of an XML element

CSV Mapping elements
======================

The following are the elements allowed in a CSV mapping

* the :token:`AimmsCSVMapping` element, the mandatory root of a CSV mapping. It should contain a single :token:`CSVTableMapping` element.
* the :token:`CSVTableMapping` element, a mapping element used to map a CSV table
* the :token:`CSVColumnMapping` element, a mapping element used to map the value of a column in a CSV table

Excel Mapping elements
======================

The following are the elements allowed in a CSV mapping

* the :token:`AimmsExcelMapping` element, the mandatory root of an Excel mapping. It can contain multiple :token:`ExcelSheetMapping` elements.
* the :token:`ExcelSheetMapping` element, a mapping element used to map an Excel sheet
* the :token:`ExcelColumnMapping` element, a mapping element used to map the value of a column in an Excel sheet

Mapping attributes
======================

The attributes of the elements in a Data Exchange mapping are shared among the different types of mappings, although not all attributes are supported by every type of mapping element.

The available mapping attributes are:

* name              
* binds-to          
* name-binds-to     
* name-regex    
* name-regex-prefix    
* iterative-binds-to
* iterative-prefix  
* iterative-existing
* iterative-reset   
* maps-to
* value           
* write-filter      
* force-dense
* dense-children     
* included-mapping  
* embedded-mapping 
* base64-encoded    

The name attribute
------------------
The :token:`name` attribute specifies the name of the mapped element in a JSON, XML, CSV or Excel format. Not every element needs a name, for instance to root value in a JSON file, or the child mapping of a JSON array.

The binds-to attribute
----------------------

The :token:`binds-to` attribute, which can be added to the mapping of any value-holding element. The :token:`binds-to` attribute will also provide an index binding for all sibling mapping elements of mapping element for which it is specified, or for the parent element in case the :token:`binds-to` attribute is applied to an :token:`AttributeMapping` element.

The name-binds-to attribute
---------------------------

The :token:`name-binds-to` attribute provides a way of binding the name of an element in a JSON or XML file to an index in your AIMMS model. You would typically use this if a JSON or XML file holds elements with different names but with the same structure. Rather than creating a mapping for each of the elements you can create a mapping where the element names serves as an extra index in the binding of the multi-dimensional identifiers mapped to the values contained in each of the elements.

The :token:`name-regex` attribute should be used in conjuction with a :token:`name-binds-to` attribute, to specify a regular expression to restrict the element to which the :token:`name-binds-to` attribute should be applied. 

With the :token:`name-regex-prefix` attribute you can specify a prefix that is used in the JSON, XML, CSV or Excel file, but which should not be included in the element names in the model. Note that the value of the :token:`name-regex-prefix` attribute is automatically prepended to the regular expression specified in the :token:`name-regex` attribute, and subsequently removed from the match if a match has been found.

The iterative-binds-to attribute
--------------------------------

The :token:`iterative-binds-to` attribute can be used if the given JSON or XML format does not hold an explicit value which can be bound to an index in your model. The  :token:`iterative-binds-to` attribute will generate elements using an increasing integer counter.

The :token:`iterative-prefix` attribute can be used alongside the :token:`iterative-binds-to` attribute. All elements created in the model will be prefixed with the prefix specified here. If you don't specify a prefix, the element names will be just increasing integer values.

Assigning a value of 1 to the the :token:`iterative-existing` attribute causes the :token:`iterative-binds-to` attribute to not generate new elements, but instead to use existing elements of the set bound to the index specified in the :token:`iterative-binds-to` attribute, starting at the element with ordinal 1.

The :token:`iterative-reset` attribute can be specified at the parent element of a mapping element which holds a :token:`iterative-binds-to` attribute. It will cause the integer counter of all direct child mappings to be reset to 1.

The maps-to attribute
---------------------

You can assign the :token:`maps-to`  attribute to any value-holding mapping element. Its value should be a reference to an identifier in your model, including the indices bound at this location in the mapping tree. Note that this should match the dimension of the identifier exactly, and that the root domain of the identifier should match the root domains of the indices.  

The :token:`write-filter` attribute can be specified at any node in the mapping tree, and should be a reference to an identifier in the model including the bound indices at this location as for the :token:`maps-to` attribute. For any tuple of bound indices for which the :token:`write-filter` attribute does not hold a non-default value, the corresponding part of the generate JSON, XML or CSV file will be skipped. 

The force-dense attribute
-------------------------
The :token:`force-dense` attribute should also contain a reference to an identifier plus bound indices as for the :token:`maps-to` attribute. Thru this attribute you can force a specific density pattern by specifying a domain for which nodes *should* be generated, regardless of whether non-default data is present to fill such nodes, e.g. because the identifier specified in the :token:`maps-to` attribute of the node itself, or any of its sub-nodes, holds no non-default data. Note that a density pattern enforced thru the :token:`force-dense` attribute is still subject to a write filter specified in a :token:`write-filter` attribute.

Enforcing a density pattern may be important when the bound indices are generated thru the :token:`iterative-binds-to` attribute, and not explicitly represented thru data-holding node bound to a regular :token:`binds-to` attribute. In such cases, not writing nodes that hold no non-default data, may lead to inconsistent numbering of generated elements when reading the generated JSON or XML files back in. *When reading a JSON, XML, CSV or Excel file, the library will assign a value of 1 for the identifier specified in the* :token:`force-dense` *attribute to any tuple encountered, such that the same file will be generated when writing back the file using the same mapping based on the data just read in.* 

.. note::
    
        None of the :token:`maps-to`, :token:`write-filter` and :token:`force-dense` attributes may contain an identifier *slice*, but must be bound to indices in the mapping for *all* dimensions of the given identifier. *Thus, for instance, specifying a value of 1 to the* :token:`force-dense` *attribute to enforce full density is not allowed.* Instead you should create a full-dimensional parameter holding 1 for every tuple in its domain and assign that to the  :token:`force-dense` attribute.

The dense-children attribute
----------------------------

With the :token:`dense-children` you can indicate that when a node will be written, because of the density pattern of all of its children, all direct *value-holding* child elements with the same bound indices as the parent node, will be written in a dense manner. For example, with this attribute you can cause all columns in a table row to be written to a CSV or Excel file, whenever at least one of the columns holds a non-default value.

With this attribute you cannot cause an array to be written in a dense manner, as the array elements need to bind an additional index. To enforce writing an array in a dense manner, you have to use the :token:`force-dense` attribute.

The value attribute
-------------------

With the :token:`value` attribute you can specify that, when writing a file, the value of a value-holding mapping element should become the static string value specified through this attribute. When reading a file, a node with a :token:`value` attribute will be silently ignored. 

.. note::

        Any value-holding mapping element may have only one of the :token:`binds-to`, :token:`maps-to` or :token:`value` attributes specified. 

The included-mapping attribute
------------------------------

Through the :token:`included-mapping` attribute, you can indicate that the contents of an object or array element in a given JSON or XML file should be read/written using a mapping, the name of which is contained in the string parameter specified in this attribute. The dimension of the string parameter should match the indices already bound at the given node. With this attribute you can specify a *data-driven* mapping name for a certain sub-tree of a JSON or XML file, e.g., to specify a table-specific mapping, where the table name is already bound in a parent node of the node at hand. 

Note that the mapping specified here cannot refer to the indices already bound at the node, e.g. the contents of the tree node should be able to be read/written as if read from/written to a completely separate JSON/XML file.  

The embedded-mapping attribute
------------------------------

Through the :token:`embedded-mapping` attribute, you can indicate that a value-holding element in the given JSON or XML file should hold a string that can be read or written using the mapping specified in this attribute. Note that the mapping element to which this attribute is attached may not have bound indices. The mapping specified in this attribute may be of any type (e.g. XML, JSON, CSV or Excel) and will be represented as a single (base64 encoded) string.

Assigning a value of 1 to the :token:`base64-encoded` attribute indicates whether embedded mapped string is or should be base64 encoded.

How does the mapping work for reading and writing?
==================================================


In this section we will explain how the Data Exchange library uses the mapping to read or write a given format.

During read
-----------

When reading a JSON, XML, CSV or Excel file using a specified mapping, the Data Exchange library will iterate over the entire tree. 

If reading a particular node in the data file, it will first try to bind any indices specified 

* at the node itself thru the :token:`name-binds-to` or :token:`iterative-binds-to` attributes, or 
* at direct child nodes thru the :token:`binds-to` attribute, 

and maintain a stack bound indices. Subsequently it will examine all other child nodes. If such a node is a structural or iterative node, it will recursively try to read the data associated with the child node. If the examined node is a value-holding node mapped to an multi-dimensional identifier, the value will be assigned to that identifier. Finally, if the node itself is a value-holding node mapped onto an identifier, it will also assign this value.

During write
------------

When generating a JSON, XML, CSV or Excel file for a given mapping, at any given node, the Data Exchange library will examine all multi-dimensional identifiers associated with the node or any of its sub-nodes thru either the :token:`maps-to`, :token:`write-filter` or :token:`force-dense` attributes, and will try to find the lowest subtuple associated with all these identifiers, for all indices bound at this level while fixing the indices already found at a previous level. If such a subtuple can found, bind the new indices at this level, write any mappped value-holding nodes at this level, and iterate over any structural or iterative nodes recursively. If such a node does not exist, there is nothing to generate for this node, and the Data Exchange library will track back to the previous node, and try to progress there. 

The message here is that an JSON, XML, CSV or Excel sheet tree is generated solely on the basis of multi-dimensional identifiers in the mapping, *never* on the basis of any of the :token:`binds-to` attributes. Such nodes will be generated based on bound indices by iterating over multi-dimensional data.

Thus, for instance, to generate a JSON array containing only all element names of a set in your model, you must combine a :token:`binds-to` attribute, together with a :token:`force-dense` attribute consisting an identifier over the index you want to generate the elements for, holding a value of 1 for every element you want to be contained in the array.
