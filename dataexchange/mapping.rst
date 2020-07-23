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

* the :token:`AimmsCSVMapping` element, the mandatory root of a CSV mapping
* the :token:`TableMapping` element, a mapping element used to map a CSV table
* the :token:`ColumnMapping` element, a mapping element used to map the value of column in a CSV table

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
* write-filter      
* force-dense       
* embedded-mapping  
* base64-encoded    

The name attribute
------------------
The :token:`name` attribute specifies the name of the mapped element in a JSON, XML or CSV format. Not every element needs a name, for instance to root value in a JSON file, or the child mapping of a JSON array.

The binds-to attribute
----------------------

The :token:`binds-to` attribute, which can be added to the mapping of any value-holding element. The :token:`binds-to` attribute will also provide an index binding for all sibling mapping elements of mapping element for which it is specified, or for the parent element in case the :token:`binds-to` attribute is applied to an :token:`AttributeMapping` element.

The name-binds-to attribute
---------------------------

The :token:`name-binds-to` attribute provides a way of binding the name of an element in a JSON or XML file to an index in your AIMMS model. You would typically use this if a JSON or XML file holds elements with different names but with the same structure. Rather than creating a mapping for each of the elements you can create a mapping where the element names serves as an extra index in the binding of the multi-dimensional identifiers mapped to the values contained in each of the elements.

The :token:`name-regex` attribute should be used in conjuction with a :token:`name-binds-to` attribute, to specify a regular expression to restrict the element to which the :token:`name-binds-to` attribute should be applied. 

Withe the :token:`name-regex-prefix` attribute you can specify a prefix that is used in the JSON, XML or CSV file, but which should not be included in the element names in the model.

The iterative-binds-to attribute
--------------------------------

The :token:`iterative-binds-to` attribute can be used if the given JSON or XML format does not hold an explicit value which can be bound to an index in your model. The  :token:`iterative-binds-to` attribute will generate elements using an increasing integer counter.

The :token:`iterative-prefix` attribute can be used alongside the :token:`iterative-binds-to` attribute. All elements created in the model will be prefixed with the prefix specified here. If you don't specify a prefix, the element names will be just increasing integer values.

The :token:`iterative-existing` attribute causes the :token:`iterative-binds-to` attribute to not generate new elements, but instead to use existing elements of the set bound to the index specified in the :token:`iterative-binds-to` attribute, starting at the element with ordinal 1.

The :token:`iterative-reset` attribute can be specified at the parent element of a mapping element which holds a :token:`iterative-binds-to` attribute. It will cause the integer counter of all direct child mappings to be reset to 1.

The maps-to attribute
---------------------

You can assign the :token:`maps-to`  attribute to any value-holding mapping element. Its value should be a reference to an identifier in your model, including the indices bound at this location in the mapping tree. Note that this should match the dimension of the identifier exactly, and that the root domain of the identifier should match the root domains of the indices.  

The :token:`write-filter` attribute can be specified at any node in the mapping tree, and should be a reference to an identifier in the model including the bound indices at this location as for the :token:`maps-to` attribute. For any tuple of bound indices for which the :token:`write-filter` attribute does not hold a non-default value, the corresponding part of the generate JSON, XML or CSV file will be skipped. 

The :token:`force-dense` attribute should contain a reference to an identifier plus bound indices as for the :token:`maps-to` attribute. You can use it to force an empty node to be generated in the XML or JSON file even if there is no data to fill the node. This may be important when the bound indices are generated thru the :token:`iterative-binds-to` attribute, and not explicitly represented thru a regular :token:`binds-to` attribute. In such cases, not writing nodes that hold no non-default data, may lead to inconsistent numbering of generated elements when reading the generated JSON or XML files back in. When reading a JSON, XML or CSV file, the library will assign a value of 1 to any tuple encountered, such that the same file will be generated when writing back the file using the same mapping based on the data just read in.

Note that none of the :token:`maps-to`, :token:`write-filter` and :token:`force-dense` attributes may contain an identifier *slice*, but must be bound to indices in the mapping for *all* dimensions of the given identifier.

The embedded-mapping attribute
------------------------------

Through the :token:`embedded-mapping` attribute, you can indicate that a value-holding element in the given JSON or XML file should hold a string that can be read or written using the mapping specified in this attribute. Note that the mapping element to which this attribute is attached may not have bound indices. 

The :token:`base64-encoded` attribute indicates whether embedded mapped string is or should be base64 encoded.

How does the mapping work for reading and writing?
==================================================


In this section we will explain how the Data Exchange library uses the mapping to read or write a given format.

During read
-----------

When reading a JSON, XML or CSV file using a specified mapping, the Data Exchange library will iterate over the entire tree. 

If reading a particular node in the data file, it will first try to bind any indices specified at direct child nodes thru the :token:`binds-to` attribute and maintain a stack bound indices. Subsequently it will examine all other child nodes. If such a node is a structural or iterative node, it will recursively try to read the data associated with the child node. If the examined node is a value-holding node mapped to an multi-dimensional identifier, the value will be assigned to that identifier. Finally, if the node itself is a value-holding node mapped onto an identifier, it will also assign this value.

During write
------------

When generating a JSON, XML or CSV file for a given mapping, at any given node, the Data Exchange library will examine all multi-dimensional identifiers associated with the node or any of its sub-nodes thru either the :token:`maps-to`, :token:`write-filter` or :token:`force-dense` attributes, and will try to find the lowest subtuple associated with all these identifiers, for all indices bound at this level while fixing the indices already found at a previous level. If such a subtuple can found, bind the new indices at this level, write any mappped value-holding nodes at this level, and iterate over any structural or iterative nodes recursively. If such a node does not exist, there is nothing to generate for this node, and the Data Exchange library will track back to the previous node, and try to progress there. 

The message here is that an JSON, XML or CSV tree is generated solely on the basis of multi-dimensional identifiers in the mapping, *never* on the basis of any of the :token:`binds-to` attributes. Such nodes will be generated based on bound indices by iterating over multi-dimensional data.

Thus, for instance, to generate a JSON array containing only all element names of a set in your model, you must combine a :token:`binds-to` attribute, together with a :token:`force-dense` attribute consisting an identifier over the index you want to generate the elements for, holding a value of 1 for every element you want to be contained in the array.
