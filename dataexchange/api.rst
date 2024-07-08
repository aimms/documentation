Methods provided by the Data Exchange library
=============================================

The following functions you can use within your model, are exposed by the Data Exchange library.

Methods for reading and writing data
------------------------------------

.. js:function::  dex::AddMapping(mappingName,mappingFile)

    Parses :token:`mappingFile` to create a mapping called :token:`mappingName`. The function will return 1 on success, or 0 on failure.
    
    :param mappingName: the name of the mapping to be created
    :param mappingFile: the relative path to the mapping file to be parsed.

.. js:function::  dex::DeleteMapping(mappingName)

    Deletes an existing mapping :token:`mappingName`. The function will return 1 on success, or 0 on failure. Mappings referring to runtime identifiers, must be deleted prior to deleting the corresponding runtime library.
    
    :param mappingName: the name of the mapping to be created
  
.. js:function::  dex::ResetMappingData(mappingName,emptyIdentifiers,emptySets,resetCounters)

    Reset data associated with the mapping :token:`mappingName`. The function can empty identifiers and sets associated with the mapping, and reset any iterative counters used in it. The function will return 1 on success, or 0 on failure.
    
    :param mappingName: the name of the mapping to be reset
    :param emptyIdentifiers: indicates whether all identifiers referred in the mapping should be emptied 
    :param emptySets: indicates whether all domain and range sets referred in the mapping should be emptied 
    :param resetCounters: indicates whether to reset all counters for :token:`iterative-binds-to` indices used in the mapping should be reset
	
.. js:function::  dex::ReadFromFile(dataFile,mappingName,emptyIdentifiers,emptySets,resetCounters)

    Reads data from file :token:`dataFile` into model identifiers using mapping :token:`mappingName`. Note that the identifiers used in the :token:`included-mapping` and :token:`write-filter` will also be emptied, depending on the :token:`emptyIdentifiers` argument. When the mapping contains an the :token:`included-mapping` or the :token:`iterative-existing` attributes, emptying sets is likely to cause problems, unless the domain sets referred in these attributes are defined. In that case it is better to call :js:func:`dex::ResetMappingData` for selected mappings, or reset counters selectively using the :token:`iterative-reset` attribute. The function will return 1 on success, or 0 on failure.
    
    :param dataFile: the relative path to the data file/folder to be read
    :param mappingName: the name of the mapping to be used
    :param emptyIdentifiers: indicates whether all identifiers referred in the mapping should be emptied prior to reading the file
    :param emptySets: indicates whether all domain and range sets referred in the mapping should be emptied prior to reading the file
    :param resetCounters: indicates whether to reset all counters for :token:`iterative-binds-to` indices prior to reading the file

.. js:function::  dex::WriteToFile(dataFile,mappingName,pretty)

    Writes file :token:`dataFile` from data in model identifiers using mapping :token:`mappingName`. The function will return 1 on success, or 0 on failure.
    
    :param dataFile: the relative path to the data file/folder to write to
    :param mappingName: the name of the mapping to be used for writing
    :param pretty: indicates whether to use a pretty writer (enhances readability at the cost of bigger file size)

.. js:function::  dex::ReadFromDataSource(dexconFile,mappingName,emptyIdentifiers,emptySets,resetCounters,version)

    Reads from the database defined in DexConnect file :token:`dexconFile` into model identifiers using mapping :token:`mappingName`. Note that the identifiers used in the :token:`included-mapping` and :token:`write-filter` will also be emptied, depending on the :token:`emptyIdentifiers` argument. When the mapping contains an the :token:`included-mapping` or the :token:`iterative-existing` attributes, emptying sets is likely to cause problems, unless the domain sets referred in these attributes are defined. In that case it is better to call :js:func:`dex::ResetMappingData` for selected mappings, or reset counters selectively using the :token:`iterative-reset` attribute. The function will return 1 on success, or 0 on failure.
    
    :param dexconFile: the relative path to the DexConnect file defining the database configuration
    :param mappingName: the name of the mapping to be used
    :param emptyIdentifiers: indicates whether all identifiers referred in the mapping should be emptied prior to reading the file
    :param emptySets: indicates whether all domain and range sets referred in the mapping should be emptied prior to reading the file
    :param resetCounters: indicates whether to reset all counters for :token:`iterative-binds-to` indices prior to reading the file
    :param version: The version name of the dataset to be read. If this string is empty or omitted, the last version will be selected.

.. js:function::  dex::WriteToDataSource(dexconFile,mappingName,version)

    Writes to the database defined in DexConnect file :token:`dexconFile` from data in model identifiers using mapping :token:`mappingName`. The function will return 1 on success, or 0 on failure. It will try to create the database if it does not exist.
    
    :param dexconFile: the relative path to the DexConnect file defining the database configuration
    :param mappingName: the name of the mapping to be used for writing
    :param version: The version name of the data set to be written. If left empty or empty string, DataExchange will create a name like "v\_123", where 123 is the primary key number.

.. js:function::  dex::CreateOrModifyDataSource(dexconFile,mappingName)

    Create a database as define by :token:`dexconFile` and mapping :token:`mappingName`. If the database exist it will check if the table can and needs to be modified. Currently it only allows to add ``maps-to`` columns. The function will return 1 on success, or 0 on failure.
    
    :param dexconFile: the relative path to the DexConnect file defining the database configuration
    :param mappingName: the name of the mapping defining the (new) schema of the tables 
    
.. js:function::  dex::ReadAllMappings

    Read all mappings contained in the folder :token:`Mappings` and store all successfully read mappings in the set :token:`dex::Mappings`. The function will return 1 on success, or 0 on failure.
    
.. js:function::  dex::ReadMappings(startPath, recursive)

    Read all mappings contained in the folder :token:`Mappings` contained in :token:`startPath`, and store all successfully read mappings in the set :token:`dex::Mappings`. The function will return 1 on success, or 0 on failure.
	
    :param startPath: optional string argument indicating the folder containing mapping folder (default "", indicating the project folder)
    :param recursive: optional argument indicating whether or not to search for mapping files recursively in the :token:`Mappings` folder
	
	
.. js:function::  dex::ReadAnnotations

    Read all :token:`dex::Dataset`, :token:`dex::TableName`, and :token:`dex::ColumnName` annotations specified in the model, and use these annotations to fill the identifiers 
    
    * :token:`dex::Datasets` 
    * :token:`dex::Tables`
    * :token:`dex::Columns`
    * :token:`dex::DatasetTableMapping`
    * :token:`dex::ColumnName`
    * :token:`dex::DatasetTableColumnName`
    * :token:`dex::DatasetTableColumnIndex`
    * :token:`dex::DatasetTableColumnIdentifier`
    
    When every table can needs to be included in just a single dataset, you can uniquely specify the dataset-table mapping using annotations only. If tables need to be included in multiple datasets, you can manually modify the identifier :token:`dex::DatasetTableMapping` to add any table to the datasets you wish to include them in. 
    
.. js:function::  dex::GenerateDatasetMappings

    Generate standardized table and Excel sheet mappings based on the :token:`dex::Dataset`, :token:`dex::TableName`, and :token:`dex::ColumnName` annotations. The generated mappings will be stored in the :token:`Mappings/Generated` subfolder of the project folder. All generated mappings will automatically be added to the set of available mappings, and can be directly used to read and write the standardized JSON, XML, CSV or Excel data sources based on the data exchange annotations. The function will return 1 on success, or 0 on failure. Through the global option ``dex::PrefixAutoTableWithDataset`` you can prefix the generated table names with the specified dataset name, to prevent potential name clashes when the same table name is generated for multiple data categories. Through the global parameter ``dex::DatasetGeneratorFilter`` you can restrict the formats for which mappings will be generated, the default will be to generate mappings for all available formats.
    
    You can use the generated mappings directly with the functions :js:func:`dex::WriteToFile` and :js:func:`dex::ReadFromFile` as with any manually created mapping.
	
Changing encodings and normalizations
-------------------------------------

The Data Exchange library only accepts UTF-8 JSON, XML and CSV files. Through the following functions you can change the encoding of a file prior to reading or after writing its contents.
The library also contains a number of functions to normalize composed Unicode characters in strings and sets in your model to either the NFC or NFD normalization.

.. js:function:: dex::ConvertFileToEncoding(inputFile, inputEncoding, ouputFile, outputEncoding, noBOM)

	Converts file :token:`inputFile` with encoding :token:`inputEncoding` to file :token:`outputFile` with :token:`outputEncoding`, optionally with a BOM. 
    
    :param inputFile: file path of the input file
    :param inputEncoding: encoding of the input file from the predefined set :token:`AllCharacterEncodings`
    :param outputFile: file path of the output file
    :param outputEncoding: encoding of the output file from the predefined set :token:`AllCharacterEncodings`
    :param noBOM: optional argument indicating whether or not the output file should start with a BOM (default 1)
  
.. js:function:: dex::NormalizeString(inStr, outStr, normalization)

	Normalize :token:`inStr` to :token:`outStr` using the normalization procedure indicated by :token:`normalization`.
    
    :param inStr: scalar input string parameter to hold the string value to normalize
    :param outStr: scalar output string parameter that will hold the normalized string
    :param normalization: optional element parameter into :token:`dex::Normalizations` indicating the normalization to apply (either :token:`nfc` (default), :token:`nfd`, :token:`no-diacritics`, :token:`trim`, :token:`nfc-trim`, :token:`nfd-trim` or :token:`no-diacritics-trim`)

.. js:function:: dex::NormalizeSet(aSet, normalization)

	Normalize all elements in the set :token:`aSet` using the normalization procedure indicated by :token:`normalization`. All elements that changed by the selected normalization will be renamed in the set.
    
    :param aSet: set argument indicating the set for which to normalize all elements
    :param normalization: optional element parameter into :token:`dex::Normalizations` indicating the normalization to apply (either :token:`nfc` (default), :token:`nfd`, :token:`no-diacritics`, :token:`trim`, :token:`nfc-trim`, :token:`nfd-trim` or :token:`no-diacritics-trim`)

.. js:function:: dex::GetOptionValues(optVal)

	AIMMS supports reading arbitrary command line options of the form ``--<name-space>::<option-name>`` followed by the value of the option. This feature allows, for instance, libraries to define its own set of command line options. You can read the values of the command line options through this function. 
	
		:param optVal: one-dimensional string parameter over a set holding the command line options you want to retrieve the values for. The elements should be of the for ``<any-name-space>::<option-name>``.

HTTP Client methods
-------------------

The Data Exchange library contains collection of functions implemented using ``libCurl`` (see the `libCurl documentation <https://curl.se/libcurl/c/>`_). The following methods are exposed by the Data Exchange library to send HTTP client requests and to handle their responses. 

.. js:function::  dex::client::NewRequest

    Create a new HTTP request with (unique) identification :token:`theRequest` to the URL :token:`url`, with method :token:`httpMethod` (optional, default :token:`GET`). Upon response from the web server, the callback method :token:`callback` will be called. The prototype of :token:`callback` should be the same as the function :token:`dex::client::EmptyCallback`. 
		
    For :token:`POST` and :token:`PUT` methods, you can specify the file :token:`requestFile` from which to take the request body of the request. If you specify the optional :token:`responseFile` argument, the response body will be captured in the specified file. If omitted the response body will be silently discarded. The function will return 1 on success, or 0 on failure.
		
    If a :token:`traceFile` is being specified, tracing for the request will be enabled, and the detail trace output from ``libCurl`` will be stored in the specified file. Be aware that the trace file will expose all headers, potentially including those that contain API keys or credentials necessary to access a web service. In such case, you are advised to carefully delete trace files directly after use. You should never create trace files in production.
    
    :param theRequest: string parameter holding the unique identification of the request.
    :param url: string parameter holding the URL of the request, including any query parameters you want to add to the request.
    :param callback: element parameter into :token:`AllProcedures`, holding the callback to be called asynchronously after the response to the HTTP request has been received
    :param httpMethod: (optional) element parameter into :token:`dex::client::HTTPMethods`, specifying the HTTP method to use for the request (default :token:`GET`)
    :param requestFile: (optional) string parameter holding the filename from which to take the request body
    :param responseFile: (optional) string parameter holding the filename in which  to store the response body
    :param traceFile: (optional) string parameter holding the filename in which all trace information about the request is being stored. 

.. js:function::  dex::client::CloseRequest
    
    Close the request :token:`theRequest` and all resources held by the Data Exchange library for the request. If the request has been executed, but Data Exchange library is still listening for a response to the request, it will stop doing so. By default, the Data Exchange library will close the request directly after its callback method has been called to free its resources as soon as possible (e.g. when a large number of request is being executed). Notice that closing a request will *not* remove any request or response files specified in :token:`dex::client::NewRequest`. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request to close
    
.. js:function::  dex::client::CloseAllRequests

    Close any outstanding HTTP requests, that have been created and may still be executing. The function will return 1 on success, or 0 on failure.
    
.. js:function::  dex::client::PerformRequest

    Execute a previously created HTTP request `theRequest`. Upon response, the Data Exchange library will call the specified `callback` function asynchronously, as soon as the request has been completed and the AIMMS engine is idle. To force `callback`to be called synchronously within a procedure of your model, you can use the method `dex::client::WaitForResponses`. The function will return 1 on success, or 0 on failure.
   
    :param theRequest: string parameter holding the unique identification of the request to execute

.. js:function::  dex::client::SetDefaultOptions
   
    Using the function :token:`dex::client::SetDefaultOptions` you can specify multiple string and integer-valued Curl options that will be applied to all requests, to modify the behavior of ``libCurl``. All available Curl options can be found in the sets :token:`dex::client::StringOptions` and :token:`dex::client::IntOptions`. For the interpretation of these options please refer to the `Curl options documentation <https://curl.se/libcurl/c/curl_easy_setopt.html>`_. The function will return 1 on success, or 0 on failure. 
    
    :param intOptions: integer parameter over the set :token:`dex::client::intOptions` holding the default integer Curl options to set
    :param stringOptions: string parameter over the set :token:`dex::client::StringOptions` holding the default string Curl options to set

.. js:function::  dex::client::AddRequestOptions
   
    Using the function :token:`dex::client::AddRequestOptions` you can specify multiple string and integer-valued Curl options to request :token:`theRequest`, to modify the behavior of ``libCurl``. All available Curl options can be found in the sets :token:`dex::client::StringOptions` and :token:`dex::client::IntOptions`. For the interpretation of these options please refer to the `Curl options documentation <https://curl.se/libcurl/c/curl_easy_setopt.html>`_. The function will return 1 on success, or 0 on failure. 
    
    :param theRequest: string parameter holding the unique identification of the request to add request options to.
    :param intOptions: integer parameter over the set :token:`dex::client::intOptions` holding the integer Curl options to set
    :param stringOptions: string parameter over the set :token:`dex::client::StringOptions` holding the string Curl options to set

.. js:function::  dex::client::AddStringOption

    Low-level method to set a single string-valued Curl option for request :token:`theRequest`. The argument :token:`stringOptionId` should be the id corresponding to the option taken from the parameter :token:`dex::client:CurlOptionId`. The function will return 1 on success, or 0 on failure.
   
    :param theRequest: string parameter holding the unique identification of the request to add the string-valued request option to.
    :param stringOptionId: parameter holding the Curl id for the option (taken from :token:`dex::client:CurlOptionId`).
    :param optionValue: string parameter holding the option value.

.. js:function::  dex::client::AddIntOption

    Low-level method to set a single integer-valued Curl option for request :token:`theRequest`. The argument :token:`intOptionId` should be the id corresponding to the option taken from the parameter :token:`dex::client:CurlOptionId`. The function will return 1 on success, or 0 on failure.
   
    :param theRequest: string parameter holding the unique identification of the request to add the integer-valued request option to.
    :param intOptionId: parameter holding the Curl id for the option (taken from :token:`dex::client:CurlOptionId`).
    :param optionValue: parameter holding the option value.

.. js:function::  dex::client::SetDefaultHeaders

    Using the function :token:`dex::client::AddRequestHeaders` you can specify any HTTP headers you want to add to subsequent request. Notice that some Curl options will also result in the addition of HTTP headers to the request. The function will return 1 on success, or 0 on failure.
    
    :param headers: string parameter over a (user-defined) set of header names holding the corresponding header values to add to all subsequent requests.

.. js:function::  dex::client::AddRequestHeaders

    Using the function :token:`dex::client::AddRequestHeaders` you can specify any HTTP headers you want to add to request :token:`theRequest`. Notice that some Curl options will also result in the addition of HTTP headers to the request. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request to add request headers to.
    :param headers: string parameter over a (user-defined) set of header names holding the corresponding header values to add

.. js:function::  dex::client::AddRequestHeader

    Using the function :token:`dex::client::AddRequestHeader` you can specify a single HTTP header you want to add to request :token:`theRequest`. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request to add a request header to.
    :param headers: string parameter holding the header name to add
    :param headerValue: string parameter holding the header value to add

.. js:function::  dex::client::AddRequestTag

    Using the function :token:`dex::client::AddRequestTag` you can add a tag to request :token:`theRequest`, which can be used to more selectively wait for responses. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request to add a request header to.
    :param tag: string parameter holding the tag to add

.. js:function::  dex::client::AddMimePart

    Using the function :token:`dex::client::AddMimePart` you can create a multi-part MIME body for a :token:`POST` request. The function will return 1 on success, or 0 on failure.

    :param theRequest: string parameter holding the unique identification of the request for which to create a multi-part MIME body.
    :param partname: string parameter holding the name of the part
    :param partfile: string parameter holding the name of the file containing the contents of the part.
    :param headers: string parameter holding the headers that should be added to the part
    :param asfile: parameter indicating whether part is to be treated as a file part, in which case the base name of :token:`partfile` is transferred as the remote file name
    :param encoding: the encoding to be used for the part (can be ``binary``,``8bit``,``7bit``,``base64``, or ``quoted-printable``).

.. js:function::  dex::client::EmptyCallback

    Prototype function for any callback to be added as the :token:`callback` parameter of the function :token:`dex::client::NewRequest`. 
    Inside the callback you can retrieve info items provided by ``libCurl`` and any response headers regarding the executed request, or handle the response file associated with the request. To free resources, the Data Exchange library will delete a request directly after its callback has been called. At such point, you will not be able to retrieve any info items for the request any longer, but, you as a caller will remain responsible for deleting any request and response files you may have specified.
    
    :param theRequest: string parameter holding the unique identification of the request for which the callback is called.
    :param statusCode: HTTP status code of the response.
    :param errorCode: Curl error code for the response in case the request was not successful.

.. js:function::  dex::client::GetInfoItems

    Using the function :token:`dex::client::GetInfoItems` you can retrieve string- and integer-valued info items provided by ``libCurl`` regarding the executed request inside the :token:`callback` function specified in the :token:`dex::client::NewRequest` method. For the interpretation of the available info items, see the `Curl info documentation <https://curl.se/libcurl/c/curl_easy_getinfo.html>`_. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request for you want to retrieve info items
    :param infoItems: subset of :token:`dex::client::CurlInfoItems` holding the collection of string- or integer-valued info items you want to retrieve.
    :param intInfoItems: output parameter holding the integer-valued info item values.
    :param stringInfoItems: output string parameter holding the string-value info item values.

.. js:function::  dex::client::GetStringInfoItem

    Using the function :token:`dex::client::GetStringInfoItem` you can retrieve a single string-valued info item provided by ``libCurl`` regarding the executed request inside the :token:`callback` function specified in the :token:`dex::client::NewRequest` method. The parameter :token:`stringinfoId` should hold the id corresponding to the info item taken from the parameter :token:`dex::client:CurlInfoId`. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request for you want to retrieve info items
    :param stringinfoId: parameter holding the id of the string-valued info item
    :param infoValue: output string parameter holding the value of the requested string info item.

.. js:function::  dex::client::GetIntInfoItem

    Using the function :token:`dex::client::GetStringInfoItem` you can retrieve a single integer-valued info item provided by ``libCurl`` regarding the executed request inside the :token:`callback` function specified in the :token:`dex::client::NewRequest` method. The parameter :token:`intinfoId` should hold the id corresponding to the info item taken from the parameter :token:`dex::client:CurlInfoId`. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request for you want to retrieve info items
    :param intinfoId: parameter holding the id of the integer-valued info item
    :param infoValue: output parameter holding the value of the requested integer info item.

.. js:function::  dex::client::GetResponseHeaders

    Using the function you can retrieve the HTTP headers of the response of :token:`theRequest`. The function will return 1 on success, or 0 on failure.
    
    :param theRequest: string parameter holding the unique identification of the request for you want to retrieve the response headers
    :param headers: output string parameter over a (user-defined) header set, holding the values of all headers in response, which will be added to the header set.

.. js:function::  dex::client::GetErrorMessage

    With this function you can retrieve the Curl error message associated with the error code passed back via a request callback. The function will return 1 on success, or 0 on failure.
    
    :param errorCode: parameter holding the error code passed back via a request callback
    :param errorMessage: output string parameter holding the associated error message

.. js:function::  dex::client::WaitForResponses

    Using this function you can block the execution of the calling procedure for a maximum of :token:`timeout` milliseconds to wait for incoming responses of any outstanding HTTP requests.
    As soon as a first response is available for any of the outstanding requests within the given timeout, its associated callback will be called, as well as for any other available responses. If there are no further responses, the function will return. The function will return 1 if one or more responses came in within the given timeout, or 0 on timeout.
	
	By specifying a `tag` you can limit the responses for which the method will wait to those requests that have been tagged through the function :token:`dex::client::AddRequestTag` with the specfied tag. You can use this, for instance, to make sure that callbacks for different HTTP requests that are executed asynchronously are called in the right order. 
    
    :param timeout: the maximum time in milliseconds to wait for any incoming responses.
	:param tag: optional tag to indicate to only wait for responses of requests tagged with this tag.

.. js:function::  dex::client::SetParallelConnections

    With this function you can set the maximum number of client connections that will be used concurrently. Any HTTP request submitted using :token:`dex::client::PerformRequest` will be executed using one of these concurrent connections. If the number of non-processed requests exceeds the maximum number of concurrent connections, the request will be queued until a connection becomes available.
    
    :param nrconn: the desired maximum number of concurrent client connections allowed (default 16).

.. js:function::  dex::client::QueryMapEncode

    Using this function you can construct a URL-encoded list of query parameters that you want to add to a URL. All query parameters are separated by an :token:`&`, and you can add it to a URL by appending it with a :token:`?` token to the URL. 
    
    :param queryMap: an indexed string parameter over a set of query parameters, holding the associated query parameter values
    :param queryString: a scalar output string parameter holding the URL-encoded query parameter string that you can append to the URL.
    
.. js:function::  dex::client::StopClient

    This function close all outstanding requests, and uninitialize ``libCurl`` to handle any incoming responses. The function will return 1 on success, or 0 on failure.
    
.. js:function:: dex::client::ProxyResolve

	Use the OS proxy configuration to discover a proxy for the given URL. Whenever a proxy is found it can be added to a HTTP request via the `CURLOP_PROXY` option. This function is only implemented for the Windows OS. 
	
	:param url: the URL for which to determine a proxy 
	:param proxyUrl: output string argument to hold the proxy URL for the given URL.
	
.. js:function:: dex::client::DetermineProxyServer

	This function sets common default options for all subsequent `dex::client` requests, in case a HTTP proxy is discovered on the network. 
	
.. js:function:: dex::client::Poll

	Convenience function to poll for certain events by executing a procedure at a given interval. This can for instance by used to regularly check the status of a long-running REST call. Only one function can poll at any given moment.
	
	:param pollingProcedure: element parameter into `AllProcedures` holding the procedure to be executed regularly. The procedure should have no arguments. Polling will be stopped whenever the procedure returns a value of 0, in all other cases polling will continue.
	:param interval: fixed interval in milliseconds in between calls to the polling procedure.
	
.. js:function:: dex::client::StopPolling

	Alterative method to externally stop the sequence of calls to a polling procedure added via :js:func:`dex::client::Poll`.
	
Support for OAuth2 authorization
--------------------------------

.. js:function:: dex::oauth::AddBearerToken

	Add a Bearer token to a given `dex::client` request :token:`theRequest`, after optionally authorizing the client application :token:`apiClient` with the identity platform configured as described in this `section <rest.html#using-oauth2-for-api-authorization>`_. The function will return a return value of 1 on success, or 0 if the authorization failed. In the latter case, the string parameter :token:`dex::oauth::APIClientErrors` contains the error messages returned by the identity platform.
	
	:param apiClient: element parameter into :token:`dex::oath::APIClients`, for which the string parameter :token:`dex::oauth::APIClientStringData` holds the client configuration.
	:param theRequest: `dex`::client` request name to which the Bearer authorization token should be added via the Authorization header.

Support functions for hashing and encoding 
------------------------------------------

The Data Exchange library supports methods for computing HMAC and SHA256 digests in support of, for instance, AWS and Azure libraries that require signature headers or query parameters for method authentication. In addition, there are some functions to perform base64 encoding/decoding, and to URL encode a string.

.. js:function:: dex::client::HMAC

	Compute the HMAC for a ``data_`` string and a given ``key``. The key can be provided as-is, hex-encoded, base64-encoded or base64-url-encoded, while the resulting digest can be hex-, base64- or base64-url-encoded.
	
	:param key: the key used to compute the HMAC digest with
	:param data_: the data string to compute the HMAC digest for
	:param keyEncoding: Optional argument to indicate how the key is encoded, possible values 0 (default) indicates that key is used as-is, 1 key is hex-encoded, 2 key is base64-encoded, 3 key is base64-url-encoded
	:param digestEncoding: Optional argument to indicate how the HMAC digest is encoded, possible values 1 (default) key is hex-encoded, 2 key is base64-encoded, 3 key is base64-url-encoded
	
.. js:function:: dex::client::SHA256

	Compute the SHA256 digest for a ``data_`` string. The resulting digest can be hex-, base64- or base64-url-encoded.
	
	:param data_: the data string to compute the SHA256 digest for
	:param digestEncoding: Optional argument to indicate how the SHA256 digest is encoded, possible values 1 (default) key is hex-encoded, 2 key is base64-encoded, 3 key is base64-url-encoded
	
.. js:function:: dex::client::Base64Encode

	Base64 encode a ``data_`` string. Depending on the flag ``urlEncoding``, the result will be base64-encoded or base64-url-encoded.
	
	:param data_: the data string to base64 encode.
	:param base64Data: the resulting encoded string.
	:param urlEncoding: Optional argument to indicate whether the result should be base64-encoded, or base64-url-encoded

.. js:function:: dex::client::Base64Decode

	Base64 decode a ``base64Data`` string. Depending on the flag ``urlEncoding``, the string is assumed to be base64-encoded or base64-url-encoded.
	
	:param base64Data: the encoded string to base64 decode.
	:param data_: the resulting decoded string.
	:param urlEncoding: Optional argument to indicate whether the input is base64-encoded, or base64-url-encoded

.. js:function:: dex::client::URLEncode

	URL encode a ``data_`` string. 
	
	:param data_: the data string to URL encode.
	:param urlEncodedData: the resulting encoded string.

HTTP Server methods
-------------------

The Data Exchange library supports exposing procedures in your model as endpoints of an HTTP REST service. You can configure and use this service via the methods below.

.. js:function::  dex::api::StartAPIService

    This function will collect all procedures with a :token:`dex::ServiceName` annotation, and will start the HTTP service listener, to listen to, and handle incoming service requests. Prior to calling :token:`dex::api::StartAPIService`, you can configure the listen port and maximum accepted request size in MB, through the configuration parameters:
    
    * :token:`dex::api::ListenerPort` (default 8080)
    * :token:`dex::api::MaxRequestSize` (default 128 MB)
	
.. note::

	When deployed in the cloud, you should **not** call this function. The service is already running there for you.
	


.. js:function::  dex::api::StopAPIService

    This function will stop the HTTP service listener waiting for incoming requests.

.. js:function::  dex::api::Yield
    
    You can use this function yield control for a maximum of :token:`timeout` milliseconds to the HTTP server component of the Data Exchange library to handle incoming requests synchronously. The function will return 1 if one or more requests were handled within the given timeout, or 0 on timeout.
    
    :param timeout: the maximum time in milliseconds to wait for, and handle, any incoming requests.

.. _memory streams:

Memory streams
--------------

Any file 

* generated by :js:func:`dex::WriteToFile`,
* read by :js:func:`dex::ReadFromFile`, 
* serving as a request or response file to :js:func:`dex::client::NewRequest` 

can also be a memory stream, i.e. a file stored in memory. Memory streams can have arbitrary length. Memory streams can help

* improve performance because they do not incur disk I/O, or delay because of virus scanning generated files on disk,
* reduce clutter in your project folder.

If the file name starts with a `#`, the Data Exchange library will assume that the specified file name is to be interpreted as a memory stream. Memory streams for the output file of the function :js:func:`dex::WriteToFile` and the response file of the function :js:func:`dex::client::NewRequest` will create a memory stream with the given file name as its key, while the input file of the function :js:func:`dex::ReadFromFile` and the request file of the function :js:func:`dex::client::NewRequest` will assume an existing memory stream with the given key. 

In addition, when a mapping contains a string parameter, and the value of the string starts with `#`, then the Data Exchange library will verify whether the entire string is the name of an existing memory stream, and if so, output the content of that memory stream. If the string does not denote the name of an existing memory stream, just the content of the string parameter will be output.

Memory streams with keys starting with `##` used as request or response files will be *automatically deleted* when the corresponding `dex::client` request is closed. 

The following functions are available for management of the memory streams.

.. js:function::  dex::DeleteStream

    Delete the memory stream corresponding to key `streamName`.
	
    :param streamName: name of the stream key to delete (including the `#`)
	
.. js:function::  dex::DeleteAllStreams

    This function will delete all streams created via :js:func:`dex::WriteToFile` and :js:func:`dex::client::NewRequest`.

.. js:function::  dex::SetDefaultStreamSize
    
    Every stream created will hold space for `streamSize` bytes. When more bytes are written to a memory stream it will automatically double the available amount of memory but at the expense of copying the existing content. The initial default stream size is 64 KB.
    
    :param streamSize: the default stream size (in bytes) to use.

.. js:function:: dex::ImportStreamContent

	Import the content of a string parameter into a new memory stream. The name of the stream should start with a `#`, to allow the stream to be used by other functions of the Data Exchange library. This function supports string parameters up to 1 MB of content. 
	
	:param streamName: name of memory stream to import content into
	:param content: input string parameter holding the string to import into the memory stream
	
.. js:function:: dex::AppendStream

	Append the content of a string parameter into an existing memory stream.  This function supports string parameters up to 16 KB of content. 

	:param streamName: name of memory stream to append content to
	:param content: input string parameter holding the string to append to the memory stream

.. js:function:: dex::ExportStreamContent

	Export the content of an existing memory stream into a string parameter. This function supports exporting memory streams up to 16 KB.
	
	:param streamName: name of memory stream to export content from
	:param content: output string parameter to hold the content (up to 16 KB) exported from the memory stream	
	:param base64: (optional) argument indicating whether the content of the memory stream should be base64-decoded
	
.. js:function:: dex::WriteStreamToFile

	Write the content of an existing memory stream to a file. 
	
	:param streamName: name of memory stream to write content from
	:param fileName: name of the file to which the content of the stream needs to be written.
	:param base64: (optional) argument indicating whether the content of the memory stream should be base64-decoded
	
.. js::function:: dex::ReadStreamFromFile

	Read the content of a file into a memory stream. 
	
	:param streamName: name of memory stream to write content to
	:param fileName: name of the file from which the content of the stream needs to be read.
	:param base64: (optional) argument indicating whether the content of the memory stream should be base64-encoded


Generators
----------

For JSON schema and OpenAPI specifications, the Data Exchange library can generate a runtime library with collections of identifiers for all schema contained in these files, and, for all operations defined in an OpenAPI specification, a synchronous or asynchronous procedure that will make the corresponding API call and will take care of all handling of parameters, request and response bodies associated with the operation.

..  js:function:: dex::schema::ParseJSONSchema

	Generate a runtime library containing a collection of identifiers, along with a collection of mapping files that can read/write any JSON file that adheres to the schema into the identifiers in the runtime library. The function expects a JSON schema following the JSON meta schema ``https://json-schema.org/draft/2020-12/schema``.
	
	:param schemaPath: absolute or relative path where to find the JSON schema file from which to generate the runtime library
	:param schemaName_: name of the schema for which to create a runtime library and mapping, will also serve as the name of the runtime library.
	:param schemaPrefix: prefix of the runtime library to generate
	:param explodeDefault: flag to indicate whether to add references to an instance of a subschema (0), to explode subschemas into a schema but still maintaining an `instance` index to allow multiple instances of the data (1, default),  or to explode without an additional `instance` index (2)
	:param externalBindsToPrefx_: string parameter holding an additional index to prefix to the index domain of every generated identifier in the runtime library
	:param externalBindingPrefix: string parameter holding the name of an element parameter to serve as the external binding for the `externalBindsToPrefix_` argument

..  js:function:: dex::schema::GenerateClientFromOpenAPISpec

	Generate a runtime library containing a collection procedures to call all operations defined in the OpenAPI specification, along with a collection of identifiers and their corresponding mappings, than are used to store the data of the request and response bodies associated with these operations. The function expects a OpenAPI 3.1 specification. 

	The library will be stored to disk, along with all generated mappings, in a subfolder of the folder located to by the string parameter ``dex::schema::libprj::LibraryRootFolder``. The ``LibraryInitialization`` procedure from the generated library will read initialization data from a library-specific file in the folder located to by the string parameter ``dex::schema::libprj::ApiInitFolder``. In that file you can, for instance, initialize settings such as the server URL, the API key to be used, or the OAuth2 credentials to be used.

	:param schemaPath: absolute or relative path where to find the OpenAPI specification file from which to generate the runtime library. The OpenAPI specification file can either be in JSON or YAML format.
	:param schemaName_: name of the OpenAPI specification for which to create a runtime library and mapping, will also serve as the name of the runtime library.
	:param schemaPrefix: prefix of the runtime library to generate
	:param explodeDefault: flag to indicate whether to add references to an instance of a subschema (0), to explode subschemas into a schema but still maintaining an `instance` index to allow multiple instances of the data (1, default),  or to explode without an additional `instance` index (2). Values of 0 and 1 create asynchronous methods, that allow multiple API calls to be executed in parallel, while a value of 2 will generate a completely synchronous library, allowing only one API call to be executed at any time.
	:param generateXMLData: flag to indicate whether the API expects JSON request and response bodies (0, default), XML request and response bodies (1), or both JSON and XML request and response bodies.

File transfer functions
-----------------------

The following functions in the Data Exchange library, allow you to upload, download, or delete files from a HTTP service like Azure Blob Storage, or AWS S3. 
For uploading and downloading files there are both synchronous as asynchronous variants. In the latter case, you can use the function ``dex::client::WaitForOutstandingFileRequests`` to wait for any outstanding asynchronous file request operations.

.. js:function:: dex::client::GetFileAsync

	Download a file from a given URL asynchronously. The function will return 1 if the HTTP request could be submitted successfully.
	This function can be used, for instance, to retrieve files from Azure Blob Storage via a SAS URL. 
	If necessary, additional headers for the HTTP request can be added via the string parameter ``dex::client::FileGetHeader``.
	
	Via the function :js:func:`dex::client::WaitForOutstandingFileRequests` you can wait for the download request to be completed. 	
	Via the parameter ``dex::client::LatestFileRequest`` you can retrieve the id of the file request submitted.
	
	:param url: the URL of the file to be downloaded
	:param filePath: the file path where to store the downloaded file

.. js:function:: dex::client::GetFile

	Download a file from a given URL synchronously. The function will return 1 if the file was successfully downloaded, or 0 otherwise.
	If necessary, additional headers for the HTTP request can be added via the string parameter ``dex::client::FileGetHeader``.
	
	If the function does not complete within the given timeout, you can use the function :js:func:`dex::client::WaitForOutstandingFileRequests` to wait for the download request to complete. 	
	
	:param url: the URL of the file to be downloaded
	:param filePath: the file path where to store the downloaded file
	:param timeout: optional parameter indicating the time to wait for the request to complete (default 30 seconds)
	
.. js:function:: dex::client::PutFileAsync

	Upload a file to a given URL asynchronously. The function will return 1 if the HTTP request could be submitted successfully.
	This function can be used, for instance, to upload files to Azure Blob Storage via a SAS URL. 
	Via the `offset` and `requestSize` arguments, files can be partially uploaded. 
	If necessary, additional headers for the HTTP request can be added via the string parameter ``dex::client::FilePutHeader``.
	
	Via the function :js:func:`dex::client::WaitForOutstandingFileRequests` you can wait for the upload request to be completed. 	
	Via the parameter ``dex::client::LatestFileRequest`` you can retrieve the id of the file request submitted.
	
	:param filePath: the file path of the file to upload
	:param url: the URL where to upload the file to
	:param offset: (optional) offset in `filePath` where to start the upload (default 0)
	:param requestSize: (optional) size of content to upload (default 0, from offset to end-of-file)

.. js:function:: dex::client::PutFile

	Upload a file to a given URL synchronously. The function will return 1 if the file was successfully uploaded, or 0 otherwise.
	If necessary, additional headers for the HTTP request can be added via the string parameter ``dex::client::FilePutHeader``.
	Via the `offset` and `requestSize` arguments, files can be partially uploaded. 

	If the function does not complete within the given timeout, you can use the function :js:func:`dex::client::WaitForOutstandingFileRequests` to wait for the upload request to complete. 	
	
	:param filePath: the file path of the file to upload
	:param url: the URL where to upload the file to
	:param timeout: optional parameter indicating the time to wait for the request to complete (default 30 seconds)
	:param offset: (optional) offset in `filePath` where to start the upload (default 0)
	:param requestSize: (optional) size of content to upload (default 0, from offset to end-of-file)

.. js:function:: dex::client::DeleteFile

	Issue a DELETE request for a given URL synchronously. The function will return 1 if the file was successfully deleted, or 0 otherwise.
	If necessary, additional headers for the HTTP request can be added via the string parameter ``dex::client::FileDeleteHeader``.
	
	If the function does not complete within the given timeout, you can use the function :js:func:`dex::client::WaitForOutstandingFileRequests` to wait for the upload request to complete. 	
	
	:param url: the URL to delete
	:param timeout: optional parameter indicating the time to wait for the request to complete (default 30 seconds)

.. js:function:: dex::client::WaitForOutstandingFileRequests

	Wait for any outstanding file requests for a given timeout. The function returns 1 if all outstanding requests have been completed, or 0 otherwise.
	
	You can check the status of individual file requests via the parameters ``dex::client::FileRequestStatusCode`` and ``dex::client::FileRequestErrorCode``.
		
	:param timeout: optional parameter indicating the time to wait for any outstanding requests to complete (default 30 seconds)

Managing JWT Tokens
-------------------

Normally, when using OAuth, you don't need to worry about manipulating `JWT tokens <https://jwt.io>`_ directly. However, some services, like for instance the Snowflake SQL API, support authentication through JWT tokens you sign yourself using your own private RSA key. To support this, the Data Exchange library supports the following functions for manipulating JWT tokens directly.

.. js:function:: dex::jwt::Encode

	Generate a JWT token for a given payload, signed using a given private RSA key. The contents of the payload can be constructed using the pre-defined ``JWT`` mapping, and the identifiers in the ``dex::jwt`` section of the Data Exchange library. This mapping supports string, integer and boolean claims, as well as claims consisting of arrays of string or integers. If you need to specify other claims, you can obviously construct the JWT payload using mappings constructed specifically for that purpose.

	:param payLoad: the JWT payload used to create the JWT token. 
	:param rsaPrivateKey: the private RSA key used to sign the JWT token.
	:param token: output string argument holding the signed JWT token.
	
.. js:function:: dex::jwt::Decode

	Reconstruct the JWT payload contained in a given JWT token, but do not verify the token
	
	:param token: the given JWT token to decode
	:param payLoad: output string argument holding the decoded JWT payload. 

.. js:function:: dex::jwt::Verify

	Verify the validity of a given JWT token. The function will verify the token signature using the given public RSA key, and check the ``iat``, ``nbf`` and ``exp`` fields of the given token and verify that is used in the given time range. The function will return 
	
	:param token: the given JWT token to verify
	:param rsaPublicKey: the public RSA key to verify the signature with

.. js:function:: dex::jwt::EpochTime

	Return the time in seconds since Unix epoch. You can use this function to construct the ``iat``, ``nbf`` and ``exp`` fields of a JWT payload.

Creating SAS URL query strings
------------------------------

SAS tokens can be used to authorize Azure Blob Storage access. The Data Exchange library supports the following functions for generating SAS tokens. 

.. js:function:: dex::client::az::AccountSASQueryString

	Generate an Account SAS query string, to pre-authenticate, for instance, a request to Azure Blob Storage. For details about the allowed values for the various arguments, please refer to `Create an account SAS <https://learn.microsoft.com/en-us/rest/api/storageservices/create-account-sas>`_.
	
	:param accessKey: the account access key to use for signing the SAS query string
	:param accountName: the account name for which to create the SAS query string
	:param services: the services to which the SAS query string can be applied
	:param resourceTypes: the resource types to which the SAS query string can be applied
	:param permissions: the permissions to apply
	:param expiryDate: the expiry date until which the SAS query string can be used to authorize requests. You can use the function :js:func:`dex::client::az::ÈxpiryDateFromNow` to generate this argument
	:param ip: the IP range from which requests can be made
	:param queryString: the value of the generated SAS query string

.. js:function:: dex::client::az::ContainerSASQueryString

	Generate a Service SAS query string, to pre-authenticate request to a specific container in Azure Blob Storage. For details about the allowed values for the various arguments, please refer to `Create a service SAS <https://learn.microsoft.com/en-us/rest/api/storageservices/create-service-sas>`_.
	
	:param queryString: the value of the generated SAS query string
	:param accessKey: the account access key to use for signing the SAS query string
	:param accountName: the account name for which to create the SAS query string
	:param container: the container name to which you want to limit access
	:param permissions: the permissions to apply to the container
	:param expiryDate: the expiry date until which the SAS query string can be used to authorize requests. You can use the function :js:func:`dex::client::az::ÈxpiryDateFromNow` to generate this argument
	:param ip: optional argument providing the IP range from which requests can be made
	:param storedAccessPolicy: optional argument providing the name of a stored Access Policy you want to apply to the created SAS token
	:param encryptionScope: optional argument specifying the encryption scope that the client application can use.
	
.. js:function:: dex::client::az::DirectorySASQueryString

	Generate a Service SAS query string, to pre-authenticate request to a specific directory within a container in Azure Blob Storage. For details about the allowed values for the various arguments, please refer to `Create a service SAS <https://learn.microsoft.com/en-us/rest/api/storageservices/create-service-sas>`_.
	
	:param queryString: the value of the generated SAS query string
	:param accessKey: the account access key to use for signing the SAS query string
	:param accountName: the account name for which to create the SAS query string
	:param container: the container name to which you want to limit access
	:param path: path prefix representing the directory within the container to which you want to limit access
	:param permissions: the permissions to apply to the container
	:param expiryDate: the expiry date until which the SAS query string can be used to authorize requests. You can use the function :js:func:`dex::client::az::ÈxpiryDateFromNow` to generate this argument
	:param ip: optional argument providing the IP range from which requests can be made
	:param directoryDepth: optional argument to indicate the number of subdirectories under the root directory 
	:param storedAccessPolicy: optional argument providing the name of a stored Access Policy you want to apply to the created SAS token
	:param encryptionScope: optional argument specifying the encryption scope that the client application can use.
	
.. js:function:: dex::client::az::ExpiryDateFromNow

	Generate an expiry date for a SAS query string, ending at a given amount of seconds from now.
	
	:param expiry: the amount of seconds from now, at which time the SAS query string should expire
	
Data Lake Storage file systems
------------------------------

The following functions are available for managing Azure Data Lake Storage file systems (also known as containers), and for listing their contents.

These functions all require that the `dex::dls::StorageAccount` and `dex::dls::StorageAccessKey` parameters have been set. This happens automatically in the AIMMS Cloud, on your desktop you can set these parameters manually via the file `api-init/Data_Lake_Storage.txt`.

.. js:function:: dex::dls::ListFileSystems

	List all file systems within an Azure Data Lake Storage account. The function will return 1 upon success, or an error on failure.

	:param FileSystems: output set argument holding the file systems present in the storage account.
	
.. js:function:: dex::dls::CreateFileSystem

	Create a new file system within an Azure Data Lake Storage account. The function will return 1 upon success, or an error on failure.

	:param fileSystem: string parameter holding the name of the file systems to create.
	
.. js:function:: dex::dls::DeleteFileSystem

	Delete an existing file system within an Azure Data Lake Storage account. The function will return 1 upon success, or an error on failure.

	:param fileSystem: string parameter holding the name of the file systems to delete.
	
.. js:function:: dex::dls::ListFiles

	List the files within a certain path prefix of a given file system.  The function will return 1 upon success, or an error on failure.

	:param fileSystem: string parameter holding the name of the file systems.
	:param pathPrefix: string parameter holding the prefix of the path of all files to be listed. This prefix must correspond to a complete directory within the file system, and may, but need not, end with a `/`.
	:param Paths: output set arguments used to enumerate all listed files and directories. The set must be a subset of the predefined set `Integers`.
	:param pathName: output string parameter over `Paths` holding the names of all files and directories found.
	:param fileSize: output numeric parameter over `Paths` holding the file size of all files found.
	:param isDirectory: output binary parameter over `Paths` indicating whether a given path is a directory and not a file.
	:param recursive: optional parameter indicating whether only files within the given path prefix should be listed, or recursively.

.. js:function:: dex::dls::DeletePath

	Delete a single file in a file system, or a complete directory. The function will return 1 upon success, or an error on failure.

	:param fileSystem: string parameter holding the name of the file systems.
	:param path: string parameter holding the name of the file or directory within the file system to be deleted.

.. js:function:: dex::dls::SetAccessPolicy

	Define up to 5 stored access policies that can be used to create container SAS query strings that can modified on the fly by adapting the stored access policy.
	Every call to `dex::dls::SetAccessPolicy` will override the previous values of all stored access policies.
	
	:param fileSystem: the Azure Blob Storage container for which to create stored access policies
	:param Ids: set containing the names of all stored access policies to be defined
	:param Start_: 1-dimensional string parameter holding the start dates of all stored access policies
	:param Expiry: 1-dimensional string parameter holding the expiry dates of all stored access policies
	:param Permission: 1-dimensional string parameter holding the permissions of all stored access policies
	
.. js:function:: dex::dls::GetAccessPolicy

	Get the list of stored access policies defined for a specific Azure Blob Storage container.
	
	:param fileSystem: the Azure Blob Storage container for which to retrieve the stored access policies
	:param Ids: set containing the names of all stored access policies to be retrieved
	:param Start_: 1-dimensional string parameter holding the start dates of all stored access policies
	:param Expiry: 1-dimensional string parameter holding the expiry dates of all stored access policies
	:param Permission: 1-dimensional string parameter holding the permissions of all stored access policies

Data Lake Storage file transfer
-------------------------------

The following functions are available in the Data Exchange library to upload file to or download files from Azure Data Lake Storage. 

These functions all require that the `dex::dls::StorageAccount` and `dex::dls::StorageAccessKey` parameters have been set. This happens automatically in the AIMMS Cloud, on your desktop you can set these parameters manually via the file `api-init/Data_Lake_Storage.txt`.

.. js:function:: dex::dls::GetAccountSASQueryString

	Create an account SAS query string for the storage account associated with an AIMMS cloud account.
	
	:param queryString: output string parameter holding the generated SAS query string
	:param permissions: the permission string used in creating the SAS query string
	:param expiry: the expiry in seconds from now for the generated SAS query string

.. js:function:: dex::dls::GetContainerSASQueryString

	Create a container SAS query string for a container in the storage account associated with an AIMMS cloud account.

	:param queryString: output string parameter holding the generated SAS query string
	:param fileSystem: the container for which the SAS query string is generated
	:param permissions: the permissions of the SAS query string
	:param expiry: the expiry in seconds from now for the generated SAS query string	
	:param storedAccessPolicy: the name of a stored access policy on the container to use in generating the SAS query string. If a stored access policy is used, the `permissions` and `expiry` arguments will be ignored
	
.. js:function:: dex::dls::UploadFile

	Upload a single file to a path within a file system. The function will return 1 upon success, or an error on failure. The method will wait for the upload to succeed for `dex::dls::WaitRetries` seconds, with a default of 500 seconds. In case of a slow internet connection, you can increase this value to make the upload succeed. 

	:param fileSystem: string parameter holding the name of the file systems.
	:param _file: local file path of the file to upload
	:param pathPrefix: string parameter holding the path prefix of the directory within the file system to which the file must be uploaded

.. js:function:: dex::dls::UploadFiles

	(Recursively) upload the files within a local directory to a path within a file system. The function will return 1 upon success, or an error on failure. The method will wait for the upload to succeed for `dex::dls::WaitRetries` seconds, with a default of 500 seconds. In case of a slow internet connection, you can increase this value to make the upload succeed. 

	:param fileSystem: string parameter holding the name of the file systems.
	:param directory: local directory from which to upload files
	:param pathPrefix: string parameter holding the path prefix of the directory within the file system to which the file must be uploaded.
	:param recursive: optional parameter indicating whether only files within the given directory should be uploaded, or recursively.

.. js:function:: dex::dls::DownloadFile

	Download a single file from a file system to a local directory. The function will return 1 upon success, or an error on failure. The method will wait for the download to succeed for `dex::dls::WaitRetries` seconds, with a default of 500 seconds. In case of a slow internet connection, you can increase this value to make the download succeed. 

	:param fileSystem: string parameter holding the name of the file systems.
	:param urlPath: path of the file within the file system to download.
	:param directory: string parameter holding the local directory to which the file must be downloaded.

.. js:function:: dex::dls::DownloadFiles

	(Recursively) download the files within a path within a file system to a local directory. The function will return 1 upon success, or an error on failure. The method will wait for the download to succeed for `dex::dls::WaitRetries` seconds, with a default of 500 seconds. In case of a slow internet connection, you can increase this value to make the download succeed. 

	:param fileSystem: string parameter holding the name of the file systems.
	:param pathPrefix: string parameter holding the path prefix of the directory within the file system from which to download files.
	:param directory: local directory to which to download files
	:param recursive: optional parameter indicating whether only files within the given path prefix should be downloaded, or recursively.

.. js:function:: dex::dls::WriteDatasetInstanceByTable

	For a given generated dataset `dataset` generate Parquet files for all tables in the dataset, and store these Parquet files in the container in the configured Azure Data Lake Storage account in the container pointed to by ``dex::dls::DatasetsByTableContainer``. 	Within the container the Parquet files are stored using the pattern `<dataset>/<table>/<instance>.parquet`, where `<instance>` is the given `instance`.

	:param dataset: element parameter holding the name of the dataset to write.
	:param instance: string parameter holding instance name of the dataset to write.

.. js:function:: dex::dls::ReadDatasetInstanceByTable

	For a given generated dataset `dataset` and dataset instance, transfer Parquet files from the container in the configured Azure Data Lake Storage account in the container pointed to by ``dex::dls::DatasetsByTableContainer`` from the location `<dataset>/<table>/<instance>.parquet`, where `<instance>` is the given `instance`, to the current session and read the content of the Parquet files into the model.

	:param dataset: element parameter holding the name of the dataset to read.
	:param instance: string parameter holding instance name of the dataset to read.

.. js:function:: dex::dls::WriteDatasetInstanceByInstance

	For a given generated dataset `dataset` generate Parquet files for all tables in the dataset, and store these Parquet files in the container in the configured Azure Data Lake Storage account in the container pointed to by ``dex::dls::DatasetsByTableContainer``. 	Within the container the Parquet files are stored using the pattern `<dataset>/<instance>/<table>.parquet`, where `<instance>` is the given `instance`.

	:param dataset: element parameter holding the name of the dataset to write.
	:param instance: string parameter holding instance name of the dataset to write.

.. js:function:: dex::dls::ReadDatasetInstanceByInstance

	For a given generated dataset `dataset` and dataset instance, transfer Parquet files from the container in the configured Azure Data Lake Storage account in the container pointed to by ``dex::dls::DatasetsByTableContainer`` from the location `<dataset>/<instance>/<table>.parquet`, where `<instance>` is the given `instance`, to the current session and read the content of the Parquet files into the model.

	:param dataset: element parameter holding the name of the dataset to read.
	:param instance: string parameter holding instance name of the dataset to read.

Snowflake functions
-------------------

.. js:function::  dex::sf::ExecuteSQLStatement(stmt,timeout)

    Execute a SQL statement `stmt` in the configured schema of the configured Snowflake instance. By default, the function will wait for a maximum of 50 seconds for the execution of the statement to complete. If the execution is completed, the function will return a code of 200, if the execution is still in progress, the function will return 202. In case of any failure the function will return 0. If the execution is still in progress, you can call the function `dex::sf::WaitForSQLStatements` to wait for any SQL statements still in progress. When `timeout` is 0, the function returns immediately, and you can execute other SQL statements in parallel and use `dex::sf::WaitForSQLStatement` for all SQL statements to complete.
    
    :param stmt: SQL statement to be executed (up to 64KB characters)
    :param timeout: time to wait for the statement execution to complete (default 50 seconds)

.. js:function::  dex::sf::WaitForSQLStatements(timeout)

    Wait for `timeout` seconds for all outstanding SQL statements that are still in progress to complete. The function returns 1 if all statements have completed, or 0 otherwise.
        
    :param timeout: time in seconds to wait for all outstanding statements still in progress to complete

.. js:function::  dex::sf::StatementsAllExecutedSuccessfully

    Return whether all executed SQL statement that have completed where successful.
        
.. js:function::  dex::sf::ClearExecutionState

    Reset the execution state of all submitted SQL statements. You should call this statement prior to executing a batch of SQL statements that you want to execute in parallel, or parallel calls to `dex::sf::GenerateAndLoadParquetIntoTable` or `dex::sf::GenerateAndLoadParquetFromTable``.  
        
.. js:function::  dex::sf::GenerateAndLoadParquetIntoTable(mappingName,tableName,timeout,sqlString)

    The function will generate an intermediate Parquet file using the DEX mapping `mappingName`, store the Parquet file in the Azure Data Lake Storage account that comes with every AIMMS cloud account, and insert the data contained in the table `tableName` in the configured schema of the Snowflake instance connected to. The default `sqlString` executed will assume that the table will just have all the fields contained in the Parquet file, but you can specify any Snowflake SQL statement to provide a customized insert statement. The function will wait `timeout` seconds for the execution of the SQL statement to complete. If the statement is still in progress on return (202 return code), you can call `dex::sf::WaitForSQLStatements` to wait for the completion of the insert statement. When `timeout` is 0, the function will return immediately, and you can call the function multiple times to load multiple files into Snowflake in parallel. 
    
    :param mappingName: name of a DEX mapping used to generate a Parquet file to upload from the current model data
    :param tableName: name of the table in the configured Snowflake schema to insert the data in the generated Parquet file to
    :param timeout: time to wait for the Snowflake insert statement to complete (default 50 seconds)
    :param sqlString: optional string argument containing the SQL statement to execute.
   
.. js:function::  dex::sf::GenerateAndLoadParquetFromTable(mappingName,tableName,timeout,sqlString,emptyIdentifiers,emptySets)

    The function will execute the `sqlString` statement to generate a Parquet file from Snowflake select statement. The default statement will generate a Parquet file from all fields in the Snowflake table `tableName`. The function will wait `timeout` seconds for the execution of the SQL statement to complete. If the statement is still in progress on return (202 return code), you can call `dex::sf::WaitForSQLStatements` to wait for the completion of the insert statement. After the statement has completed, the data in the generated Parquet file will be read into the current model data using the DEX mapping `mappingName`. When `timeout` is 0, the function will return immediately, and you can call the function multiple times to load multiple files into Snowflake in parallel.
    
    :param mappingName: name of a DEX mapping used to read the generated Parquet file into the current model data
    :param tableName: name of the table in the configured Snowflake schema the contents of which will be used to generate the intermediate Parquet file
    :param timeout: time to wait for the Snowflake select statement to complete (default 50 seconds)
    :param sqlString: optional string argument containing the SQL select statement to execute.
    :param emptyIdentifiers: optional 0/1 argument indicating whether all identifiers in the mapping should be emptied prior to reading the Parquet file
    :param emptySets: optional 0/1 argument indicating whether all sets used in the mapping should be emptied prior to reading the Parquet file
    
.. js:function::  dex::sf::GenerateTableCreateStatements

    When you are using DEX model annotations to create the Parquet mapping, then you can use this function to generate a Snowflake create table statement that exactly matches the generated Parquet file mapping. The generated statements are stored in the string parameter `dex::sf::TableCreateStatements`.
	

Reading, writing and iterating arbitrary JSON or YAML documents
---------------------------------------------------------------

The Data Exchange library offers programmatic support for reading, writing and iterating any JSON or YAML file using a pre-defined generic `JSONAny/JSONAny` mapping. The following functions are available. 

.. js:function:: dex::json::ReadInstance

	Read an arbitrary JSON or YAML file using the pre-defined `JSONAny/JSONAny` mapping into identifiers within the `dex::json` namespace.

	:param instName: string parameter holding the name of the element within the set `dex::json::JSONInstances`.
	:param instFile: string parameter holding the file name of the JSON or YAML document to read.

.. js:function:: dex::json::WriteInstance

	Write an arbitrary JSON or YAML file using the pre-defined `JSONAny/JSONAny` mapping using the content of the identifiers within the `dex::json` namespace, for the slice corresponding to the `_inst` argument. 

	:param _inst: element parameter holding the element within the set `dex::json::JSONInstances` for which to write a JSON file.
	:param instFile: string parameter holding the file name of the JSON or YAML document to write.
	:param pretty: optional parameter indicating whether the generated JSON/YAML file should be pretty-printed.

.. js:function:: dex::json::EmptyInstance

	Empty the content of the identifiers within the `dex::json` namespace, for the slice corresponding to the `_inst` argument. 

	:param _inst: element parameter holding the element within the set `dex::json::JSONInstances` for which to empty the identifiers within the `dex::json` namespace.

.. js:function:: dex::json::CreateInstance

	Create a new JSON/YAML instance in the set `dex::json::JSONInstances`, and prepare the identifiers in the `dex::json` namespace to programmatically create a new JSON/YAML document. The function returns the element in the set `dex::json::Nodes` representing the root node of the newly created JSON/YAML document.
	
	:param instName: string parameter holding the name of JSON/YAML instance to create.

.. js:function:: dex::json::SetBool

	Assign a boolean value to either the JSON/YAML root node of a JSON/YAML document or an array member of an array value in the JSON/YAML document.
	
	:param _nde: element parameter holding the node in the JSON/YAML document for which to set the value.
	:param bool: boolean value to assign to the `_nde`

.. js:function:: dex::json::SetInt

	Assign an integer value to either the JSON/YAML root node of a JSON/YAML document or an array member of an array value in the JSON/YAML document.
	
	:param _nde: element parameter holding the node in the JSON/YAML document for which to set the value.
	:param int: integer value to assign to the `_nde`

.. js:function:: dex::json::SetNumber

	Assign a double value to either the JSON/YAML root node of a JSON/YAML document or an array member of an array value in the JSON/YAML document.
	
	:param _nde: element parameter holding the node in the JSON/YAML document for which to set the value.
	:param number: double value to assign to the `_nde`

.. js:function:: dex::json::SetString

	Assign a string value to either the JSON/YAML root node of a JSON/YAML document or an array member of an array value in the JSON/YAML document.
	
	:param _nde: element parameter holding the node in the JSON/YAML document for which to set the value.
	:param _string: double value to assign to the `_nde`, the assigned value can be up to 256 KB in size.

.. js:function:: dex::json::SetObject

	Assign an object value to either the JSON/YAML root node of a JSON/YAML document or an array member of an array value in the JSON/YAML document. The function returns the element in the set `dex::json::Nodes` representing the added object.
	
	:param _nde: element parameter holding the node in the JSON/YAML document for which to set the value.

.. js:function:: dex::json::SetArray

	Assign an array value to either the JSON/YAML root node of a JSON/YAML document or an array member of an array value in the JSON/YAML document. The function returns the element in the set `dex::json::Nodes` representing the added array.
	
	:param _nde: element parameter holding the node in the JSON/YAML document for which to set the value.

.. js:function:: dex::json::AddArrayMember

	Assign a new member to a `_nde` representing an array value. The function will return the element of `dex::json::Nodes` representing the array member.
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the array value.

.. js:function:: dex::json::AddBoolProperty

	Add a new boolean property to a `_nde` representing an object in the JSON/YAML document. 
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the object to which to add the property.
	:param prop: string parameter holding the name of the property to add to the object
	:param bool: parameter holding the boolean value of the property to add.
	
.. js:function:: dex::json::AddIntProperty

	Add a new integer property to a `_nde` representing an object in the JSON/YAML document. 
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the object to which to add the property.
	:param prop: string parameter holding the name of the property to add to the object
	:param int: parameter holding the integer value of the property to add.
	
.. js:function:: dex::json::AddNumberProperty

	Add a new double property to a `_nde` representing an object in the JSON/YAML document. 
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the object to which to add the property.
	:param prop: string parameter holding the name of the property to add to the object
	:param number: parameter holding the double value of the property to add.
	
.. js:function:: dex::json::AddStringProperty

	Add a new string property to a `_nde` representing an object in the JSON/YAML document. 
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the object to which to add the property.
	:param prop: string parameter holding the name of the property to add to the object
	:param _string: parameter holding the string value of the property to add.
	
.. js:function:: dex::json::AddObjectProperty

	Add a new object property to a `_nde` representing an object in the JSON/YAML document. The function will return the element in the set `dex::json::Nodes` representing the newly added object.
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the object to which to add the property.
	:param prop: string parameter holding the name of the property to add to the object
	
.. js:function:: dex::json::AddArrayProperty

	Add a new array property to a `_nde` representing an object in the JSON/YAML document. The function will return the element in the set `dex::json::Nodes` representing the newly added array. You can use the function :js:func:`dex::json::AddArrayMember` to add new members to the array.
	
	:param _nde: element parameter holding the node in the JSON/YAML document representing the object to which to add the property.
	:param prop: string parameter holding the name of the property to add to the object
	
.. js:function:: dex::json::RootNode

	Return the root node of the last JSON/YAML document read using :js:func:`dex::json::ReadInstance`. If the root node is an object or array, you can directly access the object properties or array members.
	
.. js:function: dex::json::BoolVal

	Return the bool value of the root node of a JSON/YAML document, or of an array item within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document from which to retrieve the property.

.. js:function: dex::json::IntVal

	Return the integer value of the root node of a JSON/YAML document, or of an array item within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML documentfrom which to retrieve the property.
	
.. js:function: dex::json::NumberVal

	Return the double value of the root node of a JSON/YAML document, or of an array item within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document from which to retrieve the property.

.. js:function: dex::json::StringVal

	Return the string value of the root node of a JSON/YAML document, or of an array item within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document from which to retrieve the property.
	
.. js:function: dex::json::BoolProperty

	Return the bool value of a property of an object node within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	
	
.. js:function: dex::json::IntProperty

	Return the integer value of  a property of an object node within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	
.. js:function: dex::json::NumberProperty

	Return the double value of a property of an object node within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	
.. js:function: dex::json::StringProperty

	Return the string value of a property of an object node within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	
.. js:function: dex::json::ObjectProperty

	Return the node representing the object value of a property of an object node within the JSON/YAML document.

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	
.. js:function: dex::json::ArrayProperty

	Return the node representing the array value of a property of an object node within the JSON/YAML document. You can use the function :js:func:`dex::json::ArrayItem` to retrieve a specific member of the array.

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	
.. js:function: dex::json::ArrayItem

	Return the node representing the `n`-th item from a node representing an array within the JSON/YAML document. 

	:param _nde: element parameter holding the node in the JSON/YAML document representing the object from which to retrieve the property.
	:param n: the  (1-based) number of the item to retrieve from the array.

.. spelling:word-list::

    uninitialize
		HMAC
		SHA256
		base64
		url
		AWS
		OAuth2
		IP
		JWT
		RSA
		
	