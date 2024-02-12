DataExchange Library Release Notes
==================================

The first public release of the DataExchange library was version 1.0.0.18, release date July 10, 2020. 

.. 
	.. _Data Exchange roadmap:

	Data Exchange Roadmap
	---------------------

	The DataExchange library is under active development. The following new features are on the roadmap of the DataExchange library:

New Features and Bug Fixes
--------------------------
24.1.1.0 [08-02-2024]
	- Add support for colored sheet tabs and column headers in Excel mappings

24.0.0.13 [01-02-2024]
	- API service would not work with AIMMS 24 because of missing DLL
	- An HTTP file request could fail when a previous for the same file was not completed
	- Regression: labels for a calendar subset would not be shown in Excel, where they should have been shown as date fields 
	
23.1.1.2 [07-01-2024]
	- The `max-string-size` attribute of row-based formats would still check for an 8 Kb limit

23.1.0.15 [19-12-2023]
	- Fix write Calendar type to table issue

23.1.0.14 [17-12-2023]
	- Row-based column values would not set `force-dense` identifiers

23.1.0.13 [16-12-2023]
	- Local API requests could be interpreted as being executed from the AIMMS CLoud if an `apikey` header was specified for the request, leading to failing impersonation requests
	- Mappings with excessive nested included mappings (such as `JSONAny`), would become unnecessarily slow because of the fix for DEX version 2.1.2.49

23.1.0.11 [13-12-2023]
	- The DEX documentation changed the API version of the Task functionality in DEX to `v2`, while the implementation still used `v1` only

23.1.0.8 [03-12-2023]
	- `ArrayNode` mappings would erroneously accept multiple child nodes, leading to read errors
	- `x-ms-date` header would contain wrong date format for single-digit day numbers, causing some Azure Blob Storage calls to fail 
	
23.1.0.1 [26-11-2023]
	- In some scenarios, the necessary mappings for split uploads were not read in when needed
	- `dex::dls::StorageAccount` is made public again, as the storage account name may be needed to create URLs
	- Add support for creating and retrieving stored access policies of Azure Blob Storage containers, and using these for creating DLS container SAS tokens
	- Make `RequestHeaderValue`, `ResponseHeaderValue`, `CookieValue`, `RequestFile`, `ResponseFile`, `MimeHeaderValue`, `TracingFile` and `AdditionalQueryParameters` API-method independent in generated OpenAPI client libraries
	- Add support for generating dataset mappings with external bindings
	
2.1.2.54 [21-11-2023]
	- Split uploads to Azure Data Lake Storage > 2 GB would result in errors because file size determination would fail
	- Allow skipping to add `iterative-reset` attributes to array mappings via `dex::schema::IterativeResetArrays`
	- Allow adding headers to generated API calls that are not part of the headers specified in the OpenAPI specification
	- Remove arguments from generated API calls that have a fixed value according to the OpenAPI specification
	- Automatically add required headers with a fixed value to a generated API calls
	- Do not try to read binary responses using a mapping that is not generated
	- Make `dex::dls::StorageAccount` and `dex::dls::StorageAccessKey` private to the Data Exchange library

2.1.2.53 [16-11-2023]
	- Automatically add `dense-children` attribute to generated CSV mappings
	- Huge uploads to Azure Data Lake Storage could generate an HTTP 413 error
	- API Service could crash on AIMMS termination

2.1.2.49 [15-11-2023]
	- Mappings with external bindings might not write any sliced data in the presence of ordered sets for any of the non-externally bound indices

2.1.2.48 [08-11-2023]
	- Mitigated against curl CVE-2023-38545
	- Synchronized the task status with the AIMMS task API running in the AIMMS cloud

2.1.2.44 [30-10-2023]
	- The ``trim`` normalization would replace characters < 32 by spaces instead of removing the character

2.1.2.42 [06-10-2023]
	- The mapping attribute ``value`` may now also hold a memory stream name to allow dynamically set values
	- Introduced new session and task callbacks to be used when a DEX session is being called as part of a PRO task service. 
	- Introduced ``--dex::listenPort`` and ``--dex::serviceTimeOut`` command line arguments for externally setting API service configuration parameters.
	- Introduce a new function :js:func:`dex::GetOptionValues`.
	
2.1.2.17 [21-08-2023]
	- String values read from or written to files can now be dynamically extended to 1 MB via the `max-string-size` attribute in a mapping
	- Extended support for reading/writing any JSON file using a pre-defined generic `JSONAny/JSONAny` mapping to support larger string-valued properties
	- Added functions to create/iterate any JSON document programmatically 

2.1.2.14 [15-08-2023]
	- Writing a CSV or Parquet file in the project folder would generate an error

2.1.2.11 [03-08-2023]
	- OpenAPI methods with multipart request bodies would not set the type of mapped parts correctly in generated clients
	- Added support for reading/writing any JSON file using a pre-defined generic `JSONAny/JSONAny` mapping

2.1.2.5 [21-07-2023]
	- Add methods for accessing Azure Data Lake Storage
	- Use case-insensitive comparison for finding mapping nodes based on name, to prevent different casing in OpenAPI specs letting data reads loose data.
	
2.1.2.1 [18-07-2023]
	- Allow ``TableMapping`` in ``AimmsCSVMapping`` and ``AimmsParquetMapping`` such that the first argument of ``dex::ReadFromFile()`` and ``dex::WriteToFile()`` can be interpreted as a folder containing a collection of CSV or Parquet tables

2.1.1.18 [13-07-2023]
	- Files written by DEX would become empty if external bindings were used, and any of the elements with internal element number 2 were removed from the index sets coming after the externally bound indices
	
2.1.1.16 [10-07-2023]
	- Sheets referring to defined sets depending on data read in from previous sheets, could lead to read errors because the defined sets were not up-to-date.
	
2.1.1.13 [03-07-2023]
	- The ``InitializeAPIClient`` method of generated OpenAPI client libraries would not read mappings recursively, as is now required for concurrent support for JSON/XML mappings
	- The newly added ``AdditionalQueryParameters`` parameter for generated OpenAPI client libraries would not work correctly for libraries generated with the ``explodeDefault`` argument set to 2. 

2.1.1.11 [20-06-2023]
	- Add support for OpenAPI specs that require both XML and JSON mappings
	- Increase maximum transferable string size to 16 KB
	- Allow conversion of "true"/"false" string values to integer/double parameters
	
2.1.1.7 [16-06-2023]
	- The ``write-defaults`` attribute would incorrectly advance the data iterator when writing

2.1.1.2 [02-06-2023]
	- DEX build version is now properly reported in ``dex::client`` User-Agent headers
	- ``dex::api`` request termination callbacks are now always logged
	
2.1.0.46 [01-06-2023]
	- AIMMS function to convert calendar element to date and vice versa would not function correctly for calendar subsets

2.1.0.41 [29-05-2023]
	- Make recursively included mappings more efficient during write
	- Add support for passing client id and secret to OAuth token service using basic authentication
	- Add support for task termination callbacks for the task REST service
	- Add support for reading and generating JWT tokens

2.1.0.29 [19-05-2023]
	- Single column CSV files would not be read correctly
	- Tasks that end in the ``Finished with errors`` state, will now provide more detail in the status error message
	- Storing the task response in Azure Blob Storage would fail because of a missing ``x-ms-blob-type`` header

2.1.0.25 [08-05-2023]
	- The mapping attribute ``binds-skip-non-existing`` has been renamed to ``skip-non-existing`` (but old name will remain for backward compatibility)
	- The ``skip-non-existing`` attribute can have values 0 (raise error for non-existing elements), 1 (skip non-existing elements silently, default), or 2 (skip non-existing elements with runtime warning, new extension)
	- The ``skip-non-existing`` attribute can both be used in conjunction with the ``...-binds-existing`` attributes, but now also with the ``range-existing`` attribute.

2.1.0.23 [04-05-2023]
	- SAS URL generation could generate invalid SAS token depending on the UTC option settings of the AIMMS project
	
2.1.0.22 [02-05-2023]
	- Allow setting extra dataset attributes on indices.
	- Allow setting extra dataset attributes and suffix attributes via the *string parameters* ``dex::ExtraAttributeList`` and ``dex::SuffixList``.
	- Create more meaningful generated names for unnamed JSON schema associated with media types in OpenAPI specs, based on where these schema are used
	- Add a method for generating Account SAS query strings for Azure Blob Storage
	- Add snappy compression to Parquet files generated by the DEX library
	- Make file transfer support in DEX more robust
		
2.1.0.7 [06-04-2023]
	- JSON schema parser ignored `required` status of properties in a JSON schema when writing using the generated mappings
	
2.1.0.6 [01-04-2023]
	- Fixed name length check for sheet names in Excel, and table and column names in databases

2.1.0.5 [31-03-2023]
	- Empty cells in an excel sheet of type string would return an exception when converted to a numeric value
	- Removing set elements from sets would result in inactive data being displayed in generated data files
	- Introduced new mapping attribute `skip-empty-rows` to skip empty rows in row-based mappings
	
2.1.0.2 [29-03-2023]
	- Add capability to generate and read/write to application databases from DEX mappings (whether manually created or generated from annotations), with support for SQLite, MySQL, PostgreSQL and SQLServer backends
	- The function ``dex::schema::ParseJsonSchema`` failed because the mapping to generate an AIMMS library project file was not loaded.
	
2.0.1.44 [27-03-2023]
	- Allow JSON documents to expand relative JSON in place
	- Filter unnecessary parameter schema from generated OpenAPI client code
	- If possible, provide a more descriptive name for media type schema in generated OpenAPI client code

2.0.1.41 [22-03-2023]
	- Add support in DEX for keeping sessions alive for task REST service in cloud

2.0.1.40 [22-03-2023]
	- 64-bits fields in a Parquet file could lead to runtime errors when exceeding ``maxint``
	- When converting string fields to numeric parameters in the model when reading Excel, partially successful conversions where unconditionally accepted potentially resulting in truncated numerical values. Now partially successful conversions are only accepted when the remainder of the string fields starts with a white space character
	- Data Exchange runtime errors when reading a file now print a context where the error occurred (e.g. Excel workbook, sheet, row and column)
	- Fix issue in JSON schema support where an array of arrays would result in a duplicate index in the generated library

2.0.1.35 [15-03-2023]
	- Missing columns in row-based formats that bind to an index are now reported as an error
	- The error message about mismatching dimensions has been extended with showing the currently bound dimensions
	- Mapping nodes with duplicate names are now reported as an error
	- Reading from files with filenames with special characters would fail on Windows
	- Error messages generated when reading specific row-based formats are now properly propagated and reported
	
2.0.1.30 [09-03-2023]
	- ``dex::ReadAllMappings`` now reads all mappings from the ``Mappings`` folder recursively

2.0.1.29 [07-03-2023]
	- String fields in an Excel file mapped to a numeric field would be skipped; they are now converted when possible, or produce a runtime error otherwise
	
2.0.1.28 [28-02-2023]
	- Indices bound via ``implicity-binds-to`` attribute would not always be carried over to parent node to allow usage in sibling nodes

2.0.1.27 [20-02-2023]
	- Trim normalization will now also trim FEFF BOM characters
	- Labels will be trimmed from FEFF BOM characters before being added to sets

2.0.1.24 [12-02-2023]
	- Dataset mappings generated now also include an Excel mapping that writes sheets regardless of whether or not data is available for that sheet
	
2.0.1.23 [07-02-2023]
	- Added support for XML request and response bodies in generated OpenAPI clients

2.0.1.22 [04-02-2023]
	- Added trimming leading and trailing spaces off strings as a new string normalization method.
	
2.0.1.19 [30-01-2023]
	- Empty procedures for JSON schema inadvertently omitted duplicate module prefixes when these occurred in generated identifier names to be emptied
	
2.0.1.16 [09-01-2023]
	- Data pages for identifiers in the DEX library could cause the extraction of ``.aimmspack`` files to fail when the DEX library was included in the ``.aimmspack``. The publishing process of libraries to the library repository will now automatically remove all data pages. 

2.0.1.15 [29-12-2022]
	- Add ``no-diacritics`` as an additional normalization option next to ``nfc`` and ``nfd``.
	
2.0.1.14 [27-12-2022]
	- Allow ``force-dense`` on ``ExcelSheetNodeMappings`` with a ``name-binds-to`` attribute, and ``dense-children`` on ``ExcelRootNode`` for outputting empty non ``name-binds-to`` sheets
	- **This release does no longer support AIMMS versions prior to 4.88**

2.0.1.4 [05-12-2022]
	- OpenAPI client code now supports multi-part request bodies
	- ``..._iter`` sets generated to add an extra dimension to identifiers for JSON array properties, are now a subset of ``Integers``
	- Issue a warning for ``ColumnNodes`` in a row-based format mapping (CSV, Excel, Parquet) that cannot be mapped onto a column in a data source during read
	- Protect the ``dex::ReadFile`` call in generated API callbacks to not stop the execution flow when reading faulty responses

2.0.1.2 [02-12-2022]
	- Optional query parameter arguments in generated API calls will only be added as query parameter to the URL if their value is non-default
	- The method :js:func:`dex::schema::GenerateClientFromOpenAPISpec` will now generate a library on disk, which can be directly included into your project. Using the generated runtime library directly was often problematic because it is impossible to create parameter with an index domain referring to indices from the runtime library or using sets from the runtime library in the range of element parameters.
	- Date fields from a Parquet file can now be translated to labels of a regular set, or as values of an element parameter with a regular set range.
	
2.0.0.48 [29-11-2022]
	- Tab characters in label names were not accepted and would cause a crash, all characters < 32 in label names are now replaced by spaces
	
2.0.0.47 [28-11-2022]
	- Prevent warning for string parameter passed as handle to external function
	- ``AimmsCSVMapping`` mappings would not accept iterative-reset attribute
	- Allow only a subset of mappings to be generated with ``dex::GenerateDatasetMappings``

2.0.0.43 [24-11-2022]
	- Integer-valued headers in Excel files were represented with 5 decimals as a string
	- Improve double-to-string conversion in the JSON reader to generate the representation using the minimal number of decimals
	- Add arguments to ``dex::client::AddMimePart`` for adding headers and encodings to multi-part request bodies
	- Add support Decimal128, Date32 and Date64 Parquet data types in Parquet reader
	- Parquet reader would not read Parquet files correctly where not all columns were read into model identifiers
	- The generated sets ``<schemaName>::Instances`` are now subsets of the global set ``dex::Instances``	to make the use of the generated runtime libraries in the main model easier
	- The generated identifiers ``<schemaName>::api::RequestFiles``, ``<schemaName>::api::RequestHeaderValue`` and ``<schemaName>::api::CookieValue`` are now also dependent on the set ``<schemaName>::Instances``
	
2.0.0.28 [15-11-2022]
	- API keys passed via query parameters did not correctly end up in the URL in api call methods generated by DEX from an OpenAPI specification file

2.0.0.26 [11-11-2022]
	- Reading integer cells from Excel tables into string parameters was not handled correctly
	- Reading Parquet file containing columns with no data would cause a crash

2.0.0.21 [08-11-2022]
	- Boolean cells from Excel tables were not handled correctly
	- Improve reading number cells from Excel tables to string parameters, using the minimal number of decimals necessary
	- Set elements created from integer columns in a Parquet file would cause a crash

2.0.0.16 [04-11-2022]
	- Add methods for computing HMAC and SHA256 digests, base64(-url) encoding and decoding, and url encoding
	- Add support for binary request and response bodies
	- Add ``EmptyInstance`` methods for all generated JSON schema
	- URL encode the argument values for path parameters in generated ``apiCall`` methods

2.0.0.5 [28-09-2022]
	- PATCH curl requests would not send a request body
	- Better handling of defaults in generated REST API client code to prevent uninitialized data warnings
	
2.0.0.0 [18-09-2022]
	- Initial release of the REST API client generator from OpenAPI specification files
	
1.3.2.46 [13-08-2022]
	- Allow ``write-defaults`` attribute on ``RowMapping`` and ``ColumnMapping`` types in all row-based mappings, regardless of ``name-binds-to`` attribute. By default, all row-based formats will now leave non-default cells empty.

1.3.2.45 [11-08-2022]
	- Fix string to calendar conversion for CSV and Parquet reading

1.3.2.37 [03-08-2022]
	- Fix string to calendar conversion for Excel reading

1.3.2.34 [02-08-2022]
	- Sheets were read in alphabetical order instead of original order
	- Write-filter on Excel sheet names was lost during the row-based refactor

1.3.2.9 [22-07-2022]
	- Labels generated from Excel cells with integer values inadvertently contained decimals

1.3.2.4 [20-07-2022]
	- Values from evaluated cells with formulas in Excel files would not be read

1.3.2.3 [16-07-2022]
	- Allow name-binds-to attribute on ``ExcelSheetMappings``

1.3.2.1 [09-07-2022]
	- All row-based formats (CSV, Excel, Parquet) refactored to a common code base w.r.t. the read/write logic
	- Internal: prepare for new build system

1.3.1.7 [01-07-2022]
	- OAuth2 ClientCredentials flow would only work on second try.
	- Add option ``dex::PrefixAutoTableWithDataset`` to add dataset names in auto-generated table names to prevent potential name clashes
	
1.3.1.5 [31-03-2022]
	- Conversion errors from string to int/double and int to binary are now passed on to the model instead of skipped.

1.3.1.3 [24-03-2022]
	- Sets in document mappings did ignore ``dex::FieldName`` annotations

1.3.1.2 [23-03-2022]
	- Labels were right trimmed, but not trimmed from the left.
	
1.3.1.1 [12-03-2022]
	- Prevent uninitialized warnings during ``dex::ReadAllMappings``

1.3.0.53 [07-02-2022]
	- Respect the ordering of ``name-binds-to`` index when writing.

1.3.0.51 [02-02-2022]
	- The maximum line length for CSV files is increased to 64KB.

1.3.0.50 [28-01-2022]
	- Runtime errors within a web service request handler would propagate to a controlling ``dex::api::Yield`` loop. 
	
1.3.0.49 [27-01-2022]
	- Limit Excel sheet names to 32 characters
	- Allow tables of scalars in AIMMS-generated data sets
	- Add support, through the ``dex::AutoTablePrefix``, for auto-generating tables names in AIMMS-generated data sets, based on index occurrence

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
	- Introduce ``alt-name`` and ``name-regex-from`` attributes for mapping files.
	
1.3.0.22 [02-01-2022]
	- Refresh token could exceed length of 1024 characters, leading to failed OAuth2 refresh token flow.
	- Added scope to token request.
	

1.3.0.19 [23-12-2021]
	- Add support for the OAuth2 Authorization Code and Client Credentials flows to the Data Exchange library. The Authorization Code flow will currently only function on AIMMS desktop sessions. The Client Credentials flow can be used both in desktop and cloud sessions.	
	
1.3.0.15 [22-12-2021]
	- Rows in a CSV and Excel files with an empty value for a binding column would produce duplicate values for the last bound element.	- Introduced the attribute ``binds-skip-non-existing`` that will determine whether to skip rows/objects with an non-existing (or empty) binding or to produce a runtime error. 
	
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

.. spelling:word-list::

		url
		FEFF
		DEX
	