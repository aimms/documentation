Data Exchange Library
*********************

The AIMMS Data Exchange library is your one-stop resource for consuming and providing REST APIs, and map data formats regularly used in such APIs onto identifiers in your model.

The library allows mapping multi-dimensional AIMMS data onto tree-based data formats such as JSON, XML and table-based formats such as CSV, Excel and Parquet (as a trivial tree-based format). It does so by letting you describe the repetitive structure of a given JSON, XML, CSV, Excel or Parquet format in a mapping file that you can subsequently use to read data of a given format into multi-dimensional identifiers in your model, or write multi-dimensional data in your model to a given format. If you have an example JSON, XML, CSV, Excel or Parquet file, creating a mapping file with corresponding identifiers in the model to map the data onto is a fairly straightforward process. 
 
The library has similarities with the existing ReadXML and WriteXML functions in AIMMS, extending the existing capabilities of those functions in a common code base that supports JSON, XML, CSV, Excel and parquet formats alike. There is also an overlap in functionality with the DataLink library which solely focuses on exchanging tabular data with different types of tabular data sources, and has a provider for CSV and Excel files. 

Next to hand-crafting mappings, the Data Exchange library also can generate tabular mapping for JSON, XML, CSV, Excel and Parquet based on easy-to-use model annotations. This greatly simplifies the effort to create and use tabular data exchange with other applications.

Besides the ability to map identifier data onto various data formats, the Data Exchange library also provides an libCurl-based HTTP client, which allows you to interact with REST APIs using the DataExchange-supported formats for passing request bodies and/or retrieving API results. Obviously, you can also use the library to read and write JSON, XML, CSV, Excel and Parquet files in a standalone fashion. 
 
The Data Exchange library also allows you to expose procedures in your model through a REST API, based on simple and easy-to-use model annotations to specify the desired service names. Data Exchange mappings can be used for parsing the request bodies, and generating the responses. This capability will be the basis for future model-based REST API capabilities of the AIMMS Cloud Platform. The service can also be used in AIMMS Developer for testing and debugging model-based API services before deployment, or for allowing AIMMS models to be integrated in with, for instance, a Python session on your desktop. 

The following sections explain the Data Exchange library in more detail. 

.. Contents
.. ====================

.. toctree::
    
   using
   mapping
   standard
   rest-client
   openapi-client
   rest-server
   api
   troubleshoot
   release

.. spelling:word-list::
    libCurl