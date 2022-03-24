DataExchange Library Release Notes
==================================

The first public release of the DataExchange library was version 1.0.0.18, release date July 10, 2020. 

.. _Data Exchange roadmap:

Data Exchange Roadmap
---------------------

The DataExchange library is under active development. The following new features are on the roadmap of the DataExchange library:

- Creation of OpenAPI specifications for model-based REST APIs
- Automated creation of client code for a given REST API from its OpenAPI specification
- Automated creation of application databases based on the ``dex::Dataset`` and ``dex::TableName`` annotations. 
- Adding these application databases as an additional data source to the (synchronous) DataExchange read and write methods next to JSON, XML, CSV and Excel files.
- Exposing these application databases to external applications via dedicated application database-specific API services. This will also allow for asynchronous reading and writing to such application databases from within an AIMMS model. 

New Features and Bug Fixes
--------------------------
1.3.1.3 [24-03-2023]
	- Sets in document mappings did ignore dex::FieldName annotations

1.3.1.2 [23-03-2023]
	- Labels were right trimmed, but not trimmed from the left.
	
1.3.1.1 [12-03-2022]
	- Prevent uninitialized warnings during ``dex::ReadAllMappings``

1.3.0.53 [07-02-2022]
	- Respect the ordering of :token:`name-binds-to` index when writing.

1.3.0.51 [02-02-2022]
	- The maximum line length for CSV files is increased to 64KB.

1.3.0.50 [28-01-2022]
	- Runtime errors within a web service request handler would propagate to a controlling :token:`dex::api::Yield` loop. 
	
1.3.0.49 [27-01-2022]
	- Limit Excel sheet names to 32 characters
	- Allow tables of scalars in AIMMS-generated data sets
	- Add support, through the :token:`dex::AutoTablePrefix`, for auto-generating tables names in AIMMS-generated data sets, based on index occurrence

1.3.0.48 [25-01-2022]
	- Introduced new mapping attribute write-defaults to determine whether for name-binds-to fields, default values will be explicitly written or omitted
	- Prevent an Excel sheet to be written when it contains no data
	- Allow write-filter on Excel sheets

1.3.0.45 [21-01-2022]
	- Empty cells in Excel sheet will read to default value, instead of skipping
	- Empty cells on the first row in Excel sheet will now be skipped, instead of terminating the column range being read
	- All labels will be right trimmed before adding the a set during read

1.3.0.40 [20-01-2022]
	- Add support for Parquet file format
	- When constructing a regular expression from the elements retrieved from ``name-regex-from``, special Regex characters will be escaped.
	- Regex search for ``name-binds-to`` attributes will take place in a case-insensitive fashion, as set elements in AIMMS are also case-insensitive.
	- Field names offered for Regex search for a ``name-binds-to`` attribute will first be right trimmed. 

1.3.0.30 [17-01-2022]
	- Add support for the OAuth Authorization Code flow for WebUI applications on the PRO/CLoud platform (requires AIMMS 4.84 and PRO/Cloud 2.42)
	- Introduce :token:`alt-name` and :token:`name-regex-from` attributes for mapping files.
	
1.3.0.22 [02-01-2022]
	- Refresh token could exceed length of 1024 characters, leading to failed OAuth2 refresh token flow.
	- Added scope to token request.
	

1.3.0.19 [23-12-2021]
	- Add support for the OAuth2 Authorization Code and Client Credentials flows to the Data Exchange library. The Authorization Code flow will currently only function on AIMMS desktop sessions. The Client Credentials flow can be used both in desktop and cloud sessions.	
	
1.3.0.15 [22-12-2021]
	- Rows in a CSV and Excel files with an empty value for a binding column would produce duplicate values for the last bound element.	- Introduced the attribute :token:`binds-skip-non-existing` that will determine whether to skip rows/objects with an non-existing (or empty) binding or to produce a runtime error. 
	
1.3.0.8 [16-11-2021]
	- The procedure :any:`dex::ReadAllMappings` would read from a non-existing directory.
	
1.3.0.5 [31-10-2021]
	- Added support in Excel mappings to map date valued columns to calendars and calendar-valued element parameters.

1.3.0.3 [29-10-2021]
	- Unicode characters taking more than 2 bytes, would not be written correctly to CSV files.

1.3.0.0 [22-10-2021]
	- Introduced new annotation-based JSONDocument generator that creates a mapping for a standardized nested JSON document to read and write all data for a given collection of identifiers in a model. 
	- The ``iterative-reset`` can now also specify a list of indices that needs to be reset at a particular node prior to handling all child nodes.
	- Introduced a new function :any:`dex::ResetMappingData` to empty all identifiers, sets, and reset counters used in a particular mapping.
	- Changed the default of the ``resetCounters`` argument of :any:`dex::ReadFromFile` function from 1 to 0, to promote specification-based resetting of counters.
	
1.2.1.4 [13-10-2021]
	- Allow adding additional suffices to tables in datasets through ``dex::SuffixList`` annotation
	- Allow specifying custom mapping attributes to identifiers contained in tables in datasets through the ``dex::ExtraAttributeList`` annotation
	- Allow adding row filters for writing tables in datasets through the ``dex::RowFilter`` annotation
	- Added the function :any:`dex::DeleteMapping` to delete previously added mappings. AIMMS would crash when mappings were deleted that contained runtime identifiers from a runtime library that was deleted prior to deleting the mapping.
	
1.2.1.1 [29-09-2021]
	- The Data Exchange ``LibraryInitialization`` procedure could crash some models running on the AIMMS Cloud platform
	- Excel sheets with additional columns without a header in the first row would crash in :any:`dex::ReadFromFile`

1.2.0.49 [16-09-2021]
	- Add support for applying NFC/NFD normalizations to composed Unicode character both contained in the model, or when reading or writing an JSON, XML, CSV or Excel data source.

1.2.0.47 [15-09-2021]
	- When reading CSV files, guess the most likely delimiter
	- Read/write all values according to the identifier unit/selected convention
	- Add :any:`dex::ReadMappings` function to allow reading mappings from various locations

1.2.0.46 [13-09-2021]
	- Added new function :any:`dex::ConvertFileToEncoding`

1.2.0.38 [26-07-2021]
	- :any:`dex::ExportStreamContent` would crash for streams bigger than 8 KB
	- Allow `dex::ColumnName` annotation to be set on separate index declarations
	
1.2.0.36 [16-07-2021]
	- Memory streams with binary content could be truncated prematurely when read.
	
1.2.0.34 [14-07-2021]
	- :any:`dex::client::GetResponseHeaders` and other functions would not support arguments that are identifier slices. 
	
1.2.0.30 [30-06-2021]
	- Allow memory streams to be read twice by :any:`dex::ReadFromFile`
	- Allow double values in JSON documents to be read into string parameters

1.2.0.28 [28-06-2021]
	- Add support for memory streams that can be used instead of files in :any:`dex::WriteToFile`, :any:`dex::ReadFromFile` and :any:`dex::client::NewRequest`.
	- Add support for `dex::client` request tracing
	- Allow reading integer and double values from JSON string properties.
	- Fixed crash in :any:`dex::client::GetInfoItems` when calling for string items with no result.
	
1.2.0.19 [23-06-2021]
	- Add :any:`dex::client::SetDefaultOptions` and :any:`dex::client::SetDefaultHeaders` methods
	- Support for setting and retrieving headers for up to 4096 characters
	- Also support GET, PUT and DELETE requests for echo service

1.2.0.8 [10-06-2021]
	- Prevent crash on program exit on Linux
	
1.2.0.2 [28-05-2021]
    - Updated REST service listener component that used a faulty concurrency setting, potentially leading to connectivity loss

1.2.0.1 [26-05-2021]
    - Added a DLL that was missing in the PROClient IFA on Windows, causing WinUI PRO sessions to fail

1.2.0.0 [17-05-2021]
    - Add a completely asynchronous Curl-based HTTP client to the DataExchange library, supporting all string- and integer-valued options provided by ``libCurl``.
    - Add a REST API server to the DataExchange library, allowing model procedures to become available through a REST API via simple model annotations.
    - Allow generic ``RowMapping`` and ``ColumnMapping`` names to be used in row-based formats such as CSV, Excel, and row- and column-oriented JSON mappings next to the mapping type-specific names available before. This allows for easier switching between various mapping types.
    - Allow string values up to 8 kB during data transfer with string parameters in the model. The default max string size is 1 kB, which can be changed via the ``max-string-size`` attribute for particular string-valued nodes mapped onto AIMMS identifiers.
    - Add support for transferring sliced AIMMS data via ``ExternalBinding`` mappings that bind indices to the value of an element parameter.
    - Allow nodes with an ``included-mapping`` attribute to dynamically map the value of bound indices in the outer mapping to externally bound indices in the included mapping. This allows for splitting mappings into smaller constituting components.
    - Allow an index bound via the ``binds-to`` attribute to become available higher up in a JSON/XML tree via the ``implicit-binds-to`` attribute.
    - Allow read filtering by skipping all data that cannot be bound to an existing element via the ``binds-existing`` attribute.
    
1.1.0.25 [08-02-2021]
    - Introduce new RowOrientedObjectNode and ColumnOrientedObjectNode for JSON mappings, that are both faster and more compact. 
    - Introduce ``max-string-size`` attribute to allow string parameters to hold strings of up to 8KB (default 1KB).
    - When mapping from/to JSON, the memory used for storing the JSON object in memory would not be returned to the system.
    
1.1.0.19 [17-08-2020]
    - The library could crash when writing to a workbook with a duplicate sheet name.

1.1.0.18 [12-08-2020]
    - The library could crash because of using a different version of the ``libxl.dll`` (used to actually read and write to Excel files) than the AimmsXLLibrary.

1.1.0.12 [06-10-2020]
    - Added support for reading from and writing to tables in sheets in Excel workbooks
    - Added support for automatically generating standard Data Exchange mappings from model annotations
    - Added new mapping attributes ``dense-children``, ``included-mapping`` and ``value``.
    
1.0.0.24 [27-07-2020]
    - Name attributes used at mapping locations where no name is needed for a child element are now warned against when reading a mapping
    - ``Name-regex`` attributes used at mapping locations where no name is needed for a child element now result in an error
    - Boolean values in a JSON file are now correctly mapped onto integer, double and string parameters. During a write the value will be output according to the AIMMS storage type.

1.0.0.22 [23-07-2020]
    - Changed name of ``dense-write`` attribute to ``force-dense`` to indicate that attribute is not only used during write.

1.0.0.21 [21-07-2020]
    - Upgraded internally used library because of performance issue
    
1.0.0.18 [10-07-2020]
    - Initial public release of the DataExchange library
