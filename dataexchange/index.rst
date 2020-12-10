Data Exchange Library
*********************

The AIMMS Data Exchange library allows mapping multi-dimensional AIMMS data onto tree-based data formats such as JSON, XML or even table-based formats such as CSV and Excel (as a trivial tree-based format). It does so by letting you describe the repetitive structure of a given JSON, XML, CSV or Excel format in a mapping file that you can subsequently use to read data of a given format into multi-dimensional identifiers in your model, or write multi-dimensional data in your model to a given format. If you have an example JSON, XML, CSV or Excel file, creating a mapping file with corresponding identifiers in the model to map the data onto is a fairly straightforward process. 
 
The library is primarily intended as a complementary library to the HTTPClient library, allowing you, as a modeler, to interact with REST APIs in formats such as JSON, XML, CSV and Excel which are regularly used by REST web services to provide request bodies and/or results. The documentation contains an example project with mappings for the request body and result formats of a couple of well-known geocoding and distance services by e.g. Google and GraphHopper. Obviously, you can also use the library to read and write JSON, XML, CSV and Excel files in a standalone fashion. 
 
The library has similarities with the existing ReadXML and WriteXML functions in AIMMS, extending the existing capabilities of those functions in a common code base that supports JSON, XML, CSV and Excel formats alike. There is also an overlap in functionality with the DataLink library which solely focuses on exchanging row-based data with different types of row-based data sources, and has a provider for CSV and Excel files. 
 
Future versions of the HTTPClient library will allow you to provide mappings for generating request bodies or reading back the responses directly onto identifiers in your model, without having to rely on intermediate files to store such request bodies and responses.

The following sections explain the Data Exchange library in more detail. 

.. Contents
.. ====================

.. toctree::
    
   using
   mapping
   standard
   api
   release

