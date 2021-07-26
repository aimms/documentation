DataExchange Library Release Notes
==================================

The first public release of the DataExchange library was version 1.0.0.18, release date July 10, 2020. 

.. _Data Exchange roadmap:

Data Exchange Roadmap
---------------------

The DataExchange library is under active development. The following new features are on the roadmap of the DataExchange library:

- Adding `parquet <https://parquet.apache.org/documentation/latest/>`_ as a new support data format
- Creation of OpenAPI specifications for model-based REST APIs
- Automated creation of client code for a given REST API from its OpenAPI specification
- Automated creation of application databases based on the :token:`dex::Dataset` and :token:`dex::TableName` annotations. 
- Adding these application databases as an additional data source to the (synchronous) DataExchange read and write methods next to JSON, XML, CSV and Excel files.
- Exposing these application databases to external applications via dedicated application database-specific API services. This will also allow for asynchronous reading and writing to such application databases from within an AIMMS model. 

New Features and Bug Fixes
--------------------------

1.2.0.38 [26-07-2021]
	- :js:func:`dex::ExportStreamContent` would crash for streams bigger than 8 KB
	- Allow `dex::ColumnName` annotation to be set on separate index declarations
	
1.2.0.36 [16-07-2021]
	- Memory streams with binary content could be truncated prematurely when read.
	
1.2.0.34 [14-07-2021]
	- :js:func:`dex::client::GetResponseHeaders` and other functions would not support arguments that are identifier slices. 
	
1.2.0.30 [30-06-2021]
	- Allow memory streams to be read twice by :js:func:`ReadFromFile`
	- Allow double values in JSON documents to be read into string parameters

1.2.0.28 [28-06-2021]
	- Add support for memory streams that can be used instead of files in :js:func:`dex::WriteToFile`, :js:func:`dex::ReadFromFile` and :js:func:`dex::client::NewRequest`.
	- Add support for `dex::client` request tracing
	- Allow reading integer and double values from JSON string properties.
	- Fixed crash in :js:func:`dex::client::GetInfoItems` when calling for string items with no result.
	
1.2.0.19 [23-06-2021]
	- Add :js:func:`dex::client::SetDefaultOptions` and :js:func:`dex::client::SetDefaultHeaders` methods
	- Support for setting and retrieving headers for upto 4096 characters
	- Also support GET, PUT and DELETE requests for echo service

1.2.0.8 [10-06-2021]
	- Prevent crash on program exit on Linux
	
1.2.0.2 [28-05-2021]
    - Updated REST service listener component that used a faulty concurrency setting, potentially leading to connectivity loss

1.2.0.1 [26-05-2021]
    - Added a DLL that was missing in the PROClient IFA on Windows, causing WinUI PRO sessions to fail

1.2.0.0 [17-05-2021]
    - Add a completely asynchronous Curl-based HTTP client to the DataExchange library, supporting all string- and integer-valued options provided by libCurl.
    - Add a REST API server to the DataExchange library, allowing model procedures to become available through a REST API via simple model annotations.
    - Allow generic :token:`RowMapping` and :token:`ColumnMapping` names to be used in row-based formats such as CSV, Excel, and row- and column-oriented JSON mappings next to the mapping type-specific names available before. This allows for easier switching between various mapping types.
    - Allow string values upto 8 kB during data transfer with string parameters in the model. The default max string size is 1 kB, which can be changed via the :token:`max-string-size` attribute for particular string-valued nodes mapped onto AIMMS identifiers.
    - Add support for transferring sliced AIMMS data via :token:`ExternalBinding` mappings that bind indices to the value of an element parameter.
    - Allow nodes with an :token:`included-mapping` attribute to dynamically map the value of bound indices in the outer mapping to externally bound indices in the included mapping. This allows for splitting mappings into smaller constituing components.
    - Allow an index bound via the :token:`binds-to` attribute to become available higher up in a JSON/XML tree via the :token:`implicit-binds-to` attribute.
    - Allow read filtering by skipping all data that cannot be bound to an existing element via the :token:`binds-existing` attribute.
    
1.1.0.25 [08-02-2021]
    - Introduce new RowOrientedObjectNode and ColumnOrientedObjectNode for JSON mappings, that are both faster and more compact. 
    - Introduce :token:`max-string-size` attribute to allow string parameters to hold strings of up to 8KB (default 1KB).
    - When mapping from/to JSON, the memory used for storing the JSON object in memory would not be returned to the system.
    
1.1.0.19 [17-08-2020]
    - The library could crash when writing to a workbook with a duplicate sheet name.

1.1.0.18 [12-08-2020]
    - The library could crash because of using a different version of the libxl.dll (used to actually read and write to Excel files) than the AimmsXLLibrary.

1.1.0.12 [06-10-2020]
    - Added support for reading from and writing to tables in sheets in Excel workbooks
    - Added support for automatically generating standard Data Exchange mappings from model annotations
    - Added new mapping attributes :token:`dense-children`, :token:`included-mapping` and :token:`value`.
    
1.0.0.24 [27-07-2020]
    - Name attributes used at mapping locations where no name is needed for a child elemen are now warned against when reading a mapping
    - Name-regex attributes used at mapping locations where no name is needed for a child element now result in an error
    - Boolean values in a JSON file are now correctly mapped onto integer, double and string parameters. During a write the value will be output according to the AIMMS storage type.

1.0.0.22 [23-07-2020]
    - Changed name of :token:`dense-write` attribute to :token:`force-dense` to indicate that attribute is not only used during write.

1.0.0.21 [21-07-2020]
    - Upgraded internally used library because of performance issue
    
1.0.0.18 [10-07-2020]
    - Initial public release of the DataExchange library
