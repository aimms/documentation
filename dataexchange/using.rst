Using the Data Exchange library for communicating data
======================================================

The AIMMS Data Exchange library allows mapping multi-dimensional AIMMS data onto tree-based data formats such as JSON, XML or even CSV (as a trivial tree-based format). It does so by letting you describe the repetitive structure of a given JSON, XML or CSV format in a mapping file that you can subsequently use to read data of a given format into multi-dimensional identifiers in your model, or write multi-dimensional data in your model to a given format. 
 
In the mapping file you specify how repetitive structure in the tree-based data binds to indices in your model, and how actual values in the data map to multi-dimensional identifiers over such bound indices.

Typically a tree-based data format can consists of several types of nodes:

*  structural nodes, which can hold children that are structured differently,
* repetitive nodes, which can hold multiple (named or unnamed) child nodes of the same type and structure, and
* value-holding leaf nodes, which hold the actual labels of bound indices or values of multi-dimensional identifiers.

`This How-To article <https://how-to.aimms.com/Articles/534/534-dealing-with-the-different-data-types.html>`__ provides some simple examples to demonstrate basic uses of the Data Exchange library for JSON, XML, CSV and Parquet formats. Next to these examples, you can also download our internal :download:`unit test project<downloads/DataExchangeTest.zip>` for the Data Exchange library, which will provide you with more example mappings demonstrating various capabilities of the Data Exchange library. It also contains the mappings and corresponding collections of AIMMS identifiers for reading and writing the JSON formats for geocoding and distance service from Google and GraphHopper.
