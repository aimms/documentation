Data Exchange Mappings
**********************

Each Data Exchange mapping is an XML file describing the structure of particular formats (like JSON, YAML, XML, CSV/TSV, Excel or Parquet) being mapped. Below you find the elements specific for each of the mapping types. The attributes that you can specify for each element are shared. In `this How-To article <https://how-to.aimms.com/Articles/534/534-dealing-with-the-different-data-types.html>`__ you can find some simple examples on the usages. `Here <https://documentation.aimms.com/dataexchange/api.html#methods-for-reading-and-writing-data>`__ you can find the functions related to mappings.

JSON Mapping elements
=====================

The following are the elements allowed in a JSON mapping

* the ``AimmsJSONMapping`` element, the mandatory root of a JSON mapping
* the ``ObjectMapping`` element, a mapping element used to map a JSON object value (enclosed in curly brackets ``{`` and ``}``)
* the ``ArrayMapping`` element, a mapping element used to map a JSON array value (enclosed in square brackets ``[`` and ``]``). A JSON array mapping can only have a single child mapping, specifying the type of every element in the array.
* the ``ValueMapping`` element, a mapping element used to map a integer, double or string value in a JSON file
* the ``RowMapping`` element (underneath an ``ObjectMapping``), a mapping element used to map all underlying mapping nodes as an array of row arrays (containing heterogeneous value types)
* the ``RowMapping`` element (underneath a ``ColumnMapping``), a mapping element used to map the value of a particular element in a ``ColumnMapping`` to a specific identifier in the model.
* the ``ColumnMapping`` element (underneath an ``ObjectMapping``), a mapping element used to map all underlying mapping nodes as an array of column arrays (containing homogeneous value types)
* the ``ColumnMapping`` element (underneath a ``RowMapping``), a mapping element used to map the value of a particular element in a ``RowMapping`` to a specific identifier in the model.

The represent row-oriented data, the ``RowMapping`` and ``ColumnMapping`` will provide the most compact JSON representations and will execute the fastest.

YAML Mapping elements
=====================

The following are the elements allowed in a YAML mapping

* the ``AimmsYAMLMapping`` element, the mandatory root of a YAML mapping
* the ``MapMapping`` (alternatively you can use the ``ObjectMapping``) element, a mapping element used to map a YAML map 
* the ``SequenceMapping`` (alternatively you can use the ``ArrayMapping``) element, a mapping element used to map a YAML sequence. A YAML sequence mapping can only have a single child mapping, specifying the type of every element in the sequence.
* the ``MapMapping`` (alternatively you can use the ``ValueMapping``) element, a mapping element used to map a integer, double or string value in a YAML file

By using the JSON mapping elements, you can easily switch between a JSON and YAML mapping, by just changing the root element of the mapping from ``AimmsJSONMapping`` to ``AimmsYAMLMapping`` and vice versa. Everywhere below where a comment is directed towards a JSON mapping element, the same applies to the corresponding YAML mapping element.

XML Mapping elements
====================

The following are the elements allowed in a XML mapping

* the ``AimmsXMLMapping`` element, the mandatory root of a XML mapping
* the ``ElementObjectMapping`` element, a mapping element used to map an XML element that holds child elements, but no value
* the ``ElementValueMapping`` element, a mapping element used to map an XML element that holds a value, but no child elements
* the ``AttributeMapping`` element, a mapping element used to map the value of an attribute of an XML element


Row-based Table mapping elements
=================================

For files types like CSV/TSV, Parquet, Excel and SQLite, data is organized in tables or collection of tables. This makes these table-based mapping simple 
and the same for all these file types.

The root of the mapping specifies the file type. These are the possible roots of a row based table mappings

* the ``AimmsCSVMapping`` element for CSV/TSV files. The Data Exchange library will output a TSV file if the file extension is .tsv, or CSV otherwise.
* the ``AimmsParquetMapping`` element for Parquet files
* the ``AimmsExcelMapping`` element for Excel files (.xlsx)
* the ``AimmsDatabaseMapping`` element for SQLite files (.db)

The child elements of these root nodes are

* the ``TableMapping`` element is always directly underneath the root and represents the meta information of the table, like it's name. 
* the ``RowMapping`` element a single child element of the ``TableMapping`` and maps the rows
* the ``ColumnMapping`` element maps a column and is always underneath a ``RowMapping`` element

For CSV/TSV and Parquet each table is stored as one file, so if a ``TableMapping`` is specified then it will determine the name of the file.
Therefore the first argument of Procedures  ``dex::WriteToFile()`` and ``dex::ReadFromFile()`` is interpreted as a folder containing the files.
When no ``TableMapping`` is specified the first argument of Procedures  ``dex::WriteToFile()`` and ``dex::ReadFromFile()`` is the file name and only one single table can be written.

The ``AimmsDatabaseMapping`` is not exclusive for SQLite, but this is the only database format that is a file and can be used with Procedures  ``dex::WriteToFile()`` and ``dex::ReadFromFile()``. For other databases see :ref:`DEX_Application_Database`.

.. note::
        In older versions of DataExchange each file type had their own child element mapping nodes, like ``SheetMapping`` or ``CSVColumnMapping``. When reading the mapping these old style elements are automatically converted to the corresponding ``TableMapping``, ``RowMapping`` and ``ColumnMapping``.


Mapping attributes
==================

The attributes of the elements in a Data Exchange mapping are shared among the different types of mappings, although not all attributes are supported by every type of mapping element.

The available mapping attributes are:

* name
* alt-name              
* binds-to          
* name-binds-to
* name-binds-to-display-name     
* name-regex
* name-regex-from    
* name-regex-prefix    
* name-regex-postfix    
* iterative-binds-to
* iterative-prefix  
* iterative-existing
* iterative-reset
* implicit-binds-to
* binds-existing
* skip-non-existing
* skip-empty-rows
* maps-to
* precision
* max-string-size    
* range-existing
* value
* number-type
* write-defaults           
* write-filter      
* force-dense
* dense-children     
* included-mapping  
* embedded-mapping 
* base64-encoded
* read-normalize
* write-normalize
* color

The name and alt-name attributes
--------------------------------
The ``name`` attribute specifies the name of the mapped element in the format. Not every element needs a name, for instance to root value in a JSON file, or the child mapping of a JSON array. With the ``alt-name`` attribute you can indicate an alternative name for the mapping element when reading a file, e.g. when the name has been recently altered, and there are still data files that use the old name. When writing, the Data Exchange library will always use the ``name`` attribute.

The binds-to attribute
----------------------

The ``binds-to`` attribute, which can be added to the mapping of any value-holding element. The ``binds-to`` attribute will also provide an index binding for all sibling mapping elements of mapping element for which it is specified, or for the parent element in case the ``binds-to`` attribute is applied to an ``AttributeMapping`` element. 

Subset filtering
++++++++++++++++

If during a write the index specified in the ``binds-to`` attribute is an index into a subset of the index domain an identifier specified in a ``maps-to`` attribute, then all values outside of the subset will not be written even though data may be available in the identifier. You can use subset filtering to output just the subset of values you are interested in. 

.. note::
	
		If the value of the ``binds-to`` attribute coincides with the ``binds-to`` attribute of an 	``ExternalBinding``, then the value of the external binding will be written to the corresponding value-holding element during a write, even though the write will be sliced to the value of the ``binding`` attribute of ``ExternalBinding``.

The name-binds-to attribute
---------------------------

The ``name-binds-to`` attribute provides a way of binding the name of an element in a JSON or XML file to an index in your AIMMS model. You would typically use this if a JSON or XML file holds elements with different names but with the same structure. Rather than creating a mapping for each of the elements you can create a mapping where the element names serves as an extra index in the binding of the multi-dimensional identifiers mapped to the values contained in each of the elements.

Through the ``name-binds-to-display-name`` attribute you can specify the display name to be used for elements created via a ``name-binds-to`` attribute. The value of the attribute should be a one-dimensional string parameter defined over the index used in the ``name-binds-to`` attribute. When writing a file, the Data Exchange library will use this name for the elements to be created rather than the set label.  When reading a file, the Data Exchange library will both support elements that hold the original index label as well as the display name specified through the ``name-binds-to-display-name`` attribute. Note that the display names will be collected during the call to :js:func:`dex::AddMapping`.

The ``name-regex`` attribute should be used in conjunction with a ``name-binds-to`` attribute, to specify a regular expression to restrict the element to which the ``name-binds-to`` attribute should be applied. Alternatively, you can use the ``name-regex-from`` attribute to let the Data Exchange library dynamically create a regular expression for you, *when you call* :js:func:`dex::AddMapping` *for the given mapping*, that exactly matches all elements from a simple set or index in your model that you can specify through this attribute.

As the name suggests, you can use any accepted `regular expression <https://regex101.com/>`_ within these attributes' definitions. For example, using ``name-regex=".*"`` in your ColumnMapping will accept *any* column name, which makes it a very useful expression if you're iterating over data with different column names binding to the same index.

With the ``name-regex-prefix`` attribute you can specify a prefix that is used in the JSON, XML, CSV/TSV, Excel, Parquet file or database, but which should not be included in the element names in the model. Note that the value of the ``name-regex-prefix`` attribute is automatically prepended to the regular expression specified in the ``name-regex`` attribute, and subsequently removed from the match if a match has been found.

By default, when writing CSV/TSV files, Excel sheets, Parquet files and databases, AIMMS will first generate columns generated on the basis of the current contents associated with the ``name-binds-to`` index. Subsequently, it will fill individual fields, on a row-per-row basis, based on the presence of data in the ``maps-to`` identifier. If that identifier contains data for tuples which do not currently lie in the set associated with the ``name-binds-to`` index, such data will not be written, and may potentially lead to rows without any data. 

The iterative-binds-to attribute
--------------------------------

The ``iterative-binds-to`` attribute can be used if the given JSON or XML format does not hold an explicit value which can be bound to an index in your model.  The  ``iterative-binds-to`` attribute will generate elements using an increasing integer counter. You should specify the ``iterative-binds-to`` attribute for a ``RowMapping`` underneath a ``TableMapping`` or for object, value or nested array nodes underneath an ``ArrayMapping``. Specifying the ``iterative-binds-to`` attribute to a ``TableMapping`` or an ``ArrayMapping`` will not have the desired effect.

The ``iterative-prefix`` attribute can be used alongside the ``iterative-binds-to`` attribute. All elements created in the model will be prefixed with the prefix specified here. If you don't specify a prefix, the element names will be just increasing integer values.

Assigning a value of 1 to the the ``iterative-existing`` attribute causes the ``iterative-binds-to`` attribute to not generate new elements, but instead to use existing elements of the set bound to the index specified in the ``iterative-binds-to`` attribute, starting at the element with ordinal 1. If a generated element is not present, the reading will stop with an error.

The ``iterative-reset`` attribute can be specified at a particular element of your mapping. If attribute value is "1", it will cause the integer counter associated with the ``iterative-binds-to`` attributes of all direct _child_ mappings to be reset to 1. If it contains a comma-separated list of indices used in the mapping or in any of its included mappings, then the integer counter associated with each of these indices will be reset to 1. The indices specified in an ``iterative-reset`` attribute do not have to be bound at that node.  

The implicit-binds-to attribute
-------------------------------

By default, if a node in a mapping has sibling nodes, any index bound via a ``binds-to`` attribute at such a node *n* can be used in any attribute of all nodes in the subtree starting at the *parent* node of *n*. Via the ``implicit-binds-to`` attribute you can make such an index available for use in subtrees starting at even higher parent nodes. You can use this, for instance, if an id of a JSON/XML data structure, that you intend to use as the index value for all data in such a data structure, is stored deeper in such a data structure. By means of the ``implicit-binds-to`` attribute you can make sure that the Data Exchange library will first read the entire subtree containing the index value, prior to reading the subtrees where this index is referenced in e.g. a ``maps-to`` attribute.

The binds-existing and skip-non-existing attribute
--------------------------------------------------------

The ``binds-existing`` attribute can be used in conjunction with the ``binds-to``, ``name-binds-to`` and ``iterative-binds-to`` attribute to indicate that, when reading a data file, no new set elements will be created based on node values or names. If a newly read or generated element is not present in the set, any data value underneath the node to which the element is bound will be skipped or lead to an error depending on the value of the ``skip-non-existing`` attribute. This allows for a filtering mechanism where a data file can only be partially read for all nodes that correspond to existing set elements in the model. This option behaves slightly different than the  ``iterative-existing`` attribute for iterative bindings which will always return with an error in such a case. 

The ``skip-non-existing`` attribute specifies the desired behavior when the Data Exchange library encounters a non-existing element for a ``binds-to``, ``name-binds-to``, ``iterative-binds-to``, or  attribute. If you specify a value of 0, an error will be returned, while with the default value of 1 all data dependent on the empty value for the ``binds-to``, ``name-binds-to`` or ``iterative-binds-to`` attribute will be silently skipped. A value of 2 will skip the value, but will also issue a warning. You can use this attribute to skip objects or rows that are indexed by empty labels in the data file, but also by non-empty labels that cannot be added to e.g. a defined set in the model.

The skip-empty-rows attribute
-----------------------------

With the ``skip-empty-rows`` attribute you can let the Data Exchange library skip completely empty rows in row-based mappings. When specified, all columns present in the mapping will be checked, while non-mapped columns will be not be checked. You can use this to allow reading data from e.g. Excel sheets where the user inserted empty lines in between data. When ``skip-non-existing`` is set to 0, the Data Exchange library will still pick up empty fields for columns that bind to indices in your model on non-empty lines.

External bindings in mappings
-----------------------------

Directly underneath the root node of any mapping you can specify one or more ``ExternalBinding`` nodes. An external mapping node has two attributes:

* binds-to
* binding

Through the ``binds-to`` attribute you can specify the index which should be bound externally to the scalar element parameter specified through the ``binding`` attribute. 

As a result of an ``ExternalBinding``, any externally bound index cannot be bound any longer within the document, and any use of an externally bound index in multi-dimensional identifiers used in e.g. a ``maps-to`` attribute will refer to the slice of that identifier associated with the element parameter specified through the ``binding`` attribute.

You can use an ``ExternalBinding`` node to read or write a document only for the slice associated with the specified element parameter. Alternatively, you can use it to bind it in an ``included-mapping`` to the current value of an index bound in an outer mapping at the node containing the ``included-mapping``.

The maps-to attribute
---------------------

You can assign the ``maps-to`` attribute to any value-holding mapping element. Its value should be a reference to an identifier in your model, including the indices bound at this location in the mapping tree *in the exact order in which they are bound in the mapping, including any external bindings present*. Note that this implies that the dimension of the identifier must be matched exactly with the number of bound indices, and that the root domain of the identifier should match the root domains of the indices. Also this requirement prevents you from permuting the bound indices bound in the identifier reference specified in the ``maps-to`` attribute.

The ``write-filter`` attribute can be specified at any node in the mapping tree, and should be a reference to an identifier in the model including the bound indices at this location as for the ``maps-to`` attribute. For any tuple of bound indices for which the ``write-filter`` attribute does not hold a non-default value, the corresponding part of the generate JSON, XML or CSV/TSV file will be skipped. 

When writing numerical data, you can use the ``precision`` attribute to specify the number of decimals with which the numerical data should be written. The attribute should hold a value between 0 and 16, and the numerical value will be rounded to the specified number of decimals.

By default, the Data Exchange library assumes that all string values will hold up to 1024 characters. Through the ``max-string-size`` attribute a maximum string size up to 1 MB can be specified.

The write-defaults attribute
----------------------------

For all row-based formats (CSV/TSV, Excel, Parquet or database), cells for which no data is present in the ``maps-to`` identifier will be left empty by default. With the ``write-defaults`` attribute you can indicate that you want the default value of that identifier to be written to such cells instead. You can specify the value 1 to the ``write-defaults`` attribute on a ``ColumnMapping``, or on the ``RowMapping`` or ``ExcelSheetMapping``. For the latter, the ``write-defaults`` attribute will be applied to all underlying ``ColumnMappings``. The default value for the ``write-defaults`` attribute is 0.

Similarly, for JSON and XML mappings, you can set the ``write-defaults`` attribute for any value-holding mapping element. On its own it will never cause an element which contains a value with the  ``write-defaults`` attribute set to generated, but if such an element is generated because another child holds a non-default value, then the value with `` write-defaults`` attribute will also be generated, even if it holds no non-default value. 

The range-existing attribute
----------------------------

If the identifier associated with a ``maps-to`` attribute is an element parameter, the ``range-existing`` attribute can be used to that any values encountered that do not correspond to an existing element in the range set, should be skipped, rather than creating a new element in the range set for such a value. When an non-existing element is encountered, the Data Exchange library will follow the ``skip-non-existing`` attribute to determine whether to raise an error, to skip the value, or to skip the value but raise a warning to the model.

The force-dense attribute
-------------------------

The ``force-dense`` attribute should also contain a reference to an identifier plus bound indices as for the ``maps-to`` attribute. Through this attribute you can force a specific density pattern by specifying a domain for which nodes *should* be generated, regardless of whether non-default data is present to fill such nodes, e.g. because the identifier specified in the ``maps-to`` attribute of the node itself, or any of its sub-nodes, holds no non-default data. Note that a density pattern enforced through the ``force-dense`` attribute is still subject to a write filter specified in a ``write-filter`` attribute.

Enforcing a density pattern may be important when the bound indices are generated through the ``iterative-binds-to`` attribute, and not explicitly represented through data-holding node bound to a regular ``binds-to`` attribute. In such cases, not writing nodes that hold no non-default data, may lead to inconsistent numbering of generated elements when reading the generated JSON or XML files back in. *When reading a JSON, XML, CSV/TSV, Excel, Parquet file or database, the library will assign a value of 1 for the identifier specified in the* ``force-dense`` *attribute to any tuple encountered, such that the same file will be generated when writing back the file using the same mapping based on the data just read in.* 

.. note::
    
        None of the ``maps-to``, ``write-filter`` and ``force-dense`` attributes may contain an identifier *slice*, but must be bound to indices in the mapping for *all* dimensions of the given identifier. *Thus, for instance, specifying a value of 1 to the* ``force-dense`` *attribute to enforce full density is not allowed.* Instead you should create a full-dimensional parameter holding 1 for every tuple in its domain and assign that to the  ``force-dense`` attribute. 
        
        To enforce slicing for a particular index, you can specify an ``ExternalBinding`` node directly underneath the root node of the mapping.

The dense-children attribute
----------------------------

With the ``dense-children`` you can indicate that when a node will be written, because of the density pattern of all of its children, all direct *value-holding* child elements with the same bound indices as the parent node, will be written in a dense manner. For example, with this attribute you can cause all columns in a table row to be written to a CSV/TSV, Excel, Parquet file or database, whenever at least one of the columns holds a non-default value.

With this attribute you cannot cause an array to be written in a dense manner, as the array elements need to bind an additional index. To enforce writing an array in a dense manner, you have to use the ``force-dense`` attribute.

The value attribute
-------------------

With the ``value`` attribute you can specify that, when writing a file, the value of a value-holding mapping element should become the static string value specified through this attribute. If the value starts with a ``#`` character, the value will be interpreted as a the name of a memory stream, and the Data Exchange library will take the value from the contents of the given memory stream. This will allow you to set the value *dynamically*. When reading a file, a node with a ``value`` attribute will be silently ignored. 

.. note::

        Any value-holding mapping element may have only one of the ``binds-to``, ``maps-to`` or ``value`` attributes specified. 

The number-type attribute
-------------------------

For JSON mappings you can specify a ``number-type`` attribute for every numerical value-holding node to be used when writing a JSON file. The possible values for the ``number-type`` attribute are ``integer``, ``double`` or ``boolean``.

The color attribute
-------------------

For Excel workbooks, you can set the color of the tab for a sheet, or the color of a column header in a sheet, by setting the ``color`` attribute of a ``TableMapping`` or a ``ColumnMapping`` respectively. The ``color`` attribute will be ignored by any other mapping than an ``AimmsExcelMapping``. The value of the ``color`` attribute can be one of the colors

* `darkblue`
* `orange`
* `gray`
* `yellow`
* `lightblue`
* `green`

The included-mapping attribute
------------------------------

Through the ``included-mapping`` attribute, you can indicate that the contents of an object or array element in a given JSON or XML file should be read/written using a mapping, the name of which is contained in the string parameter specified in this attribute. The dimension of the string parameter should match the indices already bound at the given node. With this attribute you can specify a *data-driven* mapping name for a certain sub-tree of a JSON or XML file, e.g., to specify a table-specific mapping, where the table name is already bound in a parent node of the node at hand.

Alternatively, if the string value of the ``included-mapping`` attribute starts with the ``@`` character, the remainder of the value will be interpreted as the *fixed* name of a mapping to be applied for the node at hand, instead of as a string parameter holding mapping names.

Note that when reading the contents of the node associated with the included mapping you cannot refer to the indices already bound at that node in the containing mapping, i.e., the contents of the tree node should be able to be read/written as if read from/written to a completely separate JSON/XML file. 

It is possible, however, to externally bind the values of bound indices to indices used in the included mapping by specifying an ``ExternalBinding`` node underneath the node containing the ``included-mapping`` attribute. To this end, the included mapping itself should have an possess an ``ExternalBinding`` for the index you want to bind to. In addition, you should specify an ``ExternalBinding`` node underneath the node with ``included-mapping`` attribute, with the ``binds-to`` attribute set to the externally bound index in the included mapping, and the ``binding`` attribute set to the bound index in the outer mapping you want to bind to. 

You can use external bindings in combination with included mappings to break a longer mapping into its constituting components. Note, however, that breaking up mappings this way will carry a performance penalty, especially if there is a lot of repetition in the nodes using an included mapping. 

The embedded-mapping attribute
------------------------------

Through the ``embedded-mapping`` attribute, you can indicate that a value-holding element in the given JSON or XML file should hold a string that can be read or written using the mapping specified in this attribute. Note that the mapping element to which this attribute is attached may not have bound indices. The mapping specified in this attribute may be of any type (e.g. XML, JSON, CSV/TSV or Excel) and will be represented as a single (base64 encoded) string.

Assigning a value of 1 to the ``base64-encoded`` attribute indicates whether embedded mapped string is or should be base64 encoded.

Unicode normalization
=====================

The Data Exchange library can read and write the text-based formats JSON, XML and CSV/TSV files which are encoded as UTF-8. However, in Unicode there multiple ways to represent composed characters such as characters with accents. In the Unicode standard these representations are considered equivalent, although their binary representations are different (see for instance `Unicode equivalence <https://en.wikipedia.org/wiki/Unicode_equivalence>`_) When you are reading data from multiple data sources, this may present a problem in your AIMMS model. Set elements may be read from a data source using one representation, while data defined over these sets may come from data sources using another representation. 

The Unicode standard provides several normalization procedures to normalize different text representations to various normalized forms. By itself, AIMMS will not normalize any incoming Unicode characters, as this may lead to problems when, for instance, you are trying to write back data to a database which was read in a different normalized form and then re-normalized in AIMMS. 
Instead the Data Exchange library offers support for normalizing Unicode data from and to the NFC (representing composed characters as a single character, preferred) and the NFD representation (representing composed characters decomposed as the character itself and separate characters for the accents). In addition, it offers an option to remove all diacritics completely, as well as trim the string from leading and trailing spaces.

In a mapping you can specify a normalization to apply before writing any string data to AIMMS through the ``read-normalize`` attribute, while the attribute ``write-normalize`` indicates the normalization to apply when writing out data to a data source. You can specify these attributes for any string-valued tree node in the mapping that binds to an index or maps to a string or element parameter. The value of these attributes can be ``nfc``, ``nfd`` or ``no-diacritics``, indicating whether to apply the NFC or NFD normalization or to remove all diacritics before reading the data from or writing the data to a data source. For additional trimming it also supports the values ``trim``, ``nfc-trim``, ``nfd-trim`` and ``no-diacritics-trim``. 

In addition, the Data Exchange library offers the functions :js:func:`dex::NormalizeString` and :js:func:`dex::NormalizeSet` to normalize strings and set elements that are already present in the model.

How does the mapping work for reading and writing?
==================================================

In this section we will explain how the Data Exchange library uses the mapping to read or write a given format.

During read
-----------

When reading a file or database using a specified mapping, the Data Exchange library will iterate over the entire tree. 

If reading a particular node in the data file, it will first try to bind any indices specified 

* at the node itself through the ``name-binds-to`` or ``iterative-binds-to`` attributes, 
* at direct child nodes through the ``binds-to`` attribute, or
* at deeper child nodes that make their indices available through ``implicit-binds-to`` attributes.

All elements associated with indices bound this way will be maintained in a stack of bound indices. 

Subsequently the Data Exchange library will examine all other child nodes. If such a node is a structural or iterative node, it will recursively try to read the data associated with the child node. If the examined node is a value-holding node mapped to an multi-dimensional identifier, the value will be assigned to that identifier. Finally, if the node itself is a value-holding node mapped onto an identifier, it will also assign this value.

If a node in the mapping contains an included mapping, all externally bound indices bound to the values of bound indices in the outer mapping, will be carried over to the included mapping, prior to reading the subtree associated with the included mapping.

During write
------------

When generating a file or database for a given mapping, at any given node, the Data Exchange library will examine all multi-dimensional identifiers associated with the node or any of its sub-nodes through either the ``maps-to``, ``write-filter`` or ``force-dense`` attributes, and will try to find the lowest sub-tuple associated with all these identifiers, for all indices bound at this level (through the ``binds-to``, ``name-binds-to``, ``iterative-binds-to``, or ``implicit-binds-to`` attributes) while fixing the indices already found at a previous level. If such a sub-tuple can be found, the new indices at this level will be stored, and any mapped value-holding nodes at this level will be written the associated values of any multi-dimensional identifiers matching with the value of the currently bound indices, and the Data Exchange library will iterate over all any structural or iterative child nodes recursively. If no further multi-dimensional data can be found for a particular node, the Data Exchange library will track back to the parent node, and try to progress there. 


The message here is that an JSON, XML, CSV/TSV, Excel sheet, Parquet file tree or database is generated solely on the basis of multi-dimensional identifiers in the mapping, and *never* on the basis of any of the ``binds-to`` attributes. Such nodes will be generated based on indices bound by iterating over multi-dimensional data.

Thus, for instance, to generate a JSON array containing only all element names of a set in your model, you must combine a ``binds-to`` attribute, together with a ``force-dense`` attribute consisting an identifier over the index you want to generate the elements for, holding a value of 1 for every element you want to be contained in the array.

If a node in the mapping contains an included mapping, all externally bound indices bound to the values of bound indices in the outer mapping, will be carried over to the included mapping, resulting in the Data Exchange library to use the identifier slices corresponding to the externally bound indices to generate the node contents.

.. spelling:word-list::

    regex
	tsv