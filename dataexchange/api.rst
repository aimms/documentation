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
    
    :param dataFile: the relative path to the data file to be read
    :param mappingName: the name of the mapping to be used
    :param emptyIdentifiers: indicates whether all identifiers referred in the mapping should be emptied prior to reading the file
    :param emptySets: indicates whether all domain and range sets referred in the mapping should be emptied prior to reading the file
    :param resetCounters: indicates whether to reset all counters for :token:`iterative-binds-to` indices prior to reading the file

.. js:function::  dex::WriteToFile(dataFile,mappingName,pretty)

    Writes file :token:`dataFile` from data in model identifiers using mapping :token:`mappingName`. The function will return 1 on success, or 0 on failure.
    
    :param dataFile: the relative path to the data file to write to
    :param mappingName: the name of the mapping to be used for writing
    :param pretty: indicates whether to use a pretty writer (enhances readability at the cost of bigger file size)


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
    :param normalization: optional element parameter into :token:`dex::Normalizations` indicating the normalization to apply (either :token:`nfc` (default), :token:`nfd` or :token:`no-diacritics`)

.. js:function:: dex::NormalizeSet(aSet, normalization)

	Normalize all elements in the set :token:`aSet` using the normalization procedure indicated by :token:`normalization`. All elements that changed by the selected normalization will be renamed in the set.
    
    :param aSet: set argument indicating the set for which to normalize all elements
    :param normalization: optional element parameter into :token:`dex::Normalizations` indicating the normalization to apply (either :token:`nfc` (default), :token:`nfd` or :token:`no-diacritics`)


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

    Execute a previously created HTTP request :token:`theRequest`. Upon response, the Data Exchange library will call the specified :token:`callback` function asynchronously, as soon as the request has been completed and the AIMMS engine is idle. To force :token:callback`to be called synchronously within a procedure of your model, you can use the method :token:`dex::client::WaitForResponses`. The function will return 1 on success, or 0 on failure.
   
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
    
    :param timeout: the maximum time in milliseconds to wait for any incoming responses.

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

can also be a memory stream, i.e. a file stored in memory. Memory streams can help

* improve performance because they do not incur disk I/O, or delay because of virus scanning generated files on disk,
* reduce clutter in your project folder.

If the file name starts with a `#`, the Data Exchange library will assume that the specified file name is to be interpreted as a memory stream. Memory streams for the output file of the function :js:func:`dex::WriteToFile` and the response file of the function :js:func:`dex::client::NewRequest` will create a memory stream with the given file name as its key, while the input file of the function :js:func:`dex::ReadFromFile` and the request file of the function :js:func:`dex::client::NewRequest` will assume an existing memory stream with the given key. 

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

	Import the content of a string parameter into a new memory stream. The name of the stream should start with a `#`, to allow the stream to be used by other functions of the Data Exchange library. This function supports string parameters up to 8 KB of content. 
	
	:param streamName: name of memory stream to import content into
	:param content: input string parameter holding the string to import into the memory stream
	
.. js:function:: dex::ExportStreamContent

	Export the content of an existing memory stream into a string parameter. This function supports exporting memory streams up to 8KB.
	
	:param streamName: name of memory stream to export content from
	:param content: output string parameter to hold the content (up to 8KB) exported from the memory stream	
	
.. js:function:: dex::WriteStreamToFile

	Write the content of an existing memory stream to a file. 
	
	:param streamName: name of memory stream to write content from
	:param fileName: name of the to which the content of the stream needs to be written.
	
Generators
----------

For JSON schema and OpenAPI specifications, the Data Exchange library can generate a runtime library with collections of identifiers for all schema contained in these files, and, for all operations defined in an OpenAPI specification, a synchronous or asynchronous procedure that will make the corresponding API call and will take care of all handling of parameters, request and response bodies associated with the operation.

..  js:function:: dex::schema::ParseJSONSchema

	Generate a runtime library containing a collection of identifiers, along with a collection of mapping files that can read/write any JSON file that adheres to the schema into the identifiers in the runtime library. 
	
	:param schemaPath: absolute or relative path where to find the JSON schema file from which to generate the runtime library
	:param schemaName_: name of the schema for which to create a runtime library and mapping, will also serve as the name of the runtime library.
	:param schemaPrefix: prefix of the runtime library to generate
	:param explodeDefault: flag to indicate whether to add references to an instance of a subschema (0), to explode subschemas into a schema but still maintaining an `instance` index to allow multiple instances of the data (1, default),  or to explode without an additional `instance` index (2)
	:param externalBindsToPrefx_: string parameter holding an additional index to prefix to the index domain of every generated identifier in the runtime library
	:param externalBindingPrefix: string parameter holding the name of an element parameter to serve as the external binding for the `externalBindsToPrefix_` argument

..  js:function:: dex::schema::GenerateClientFromOpenAPISpec

	Generate a runtime library containing a collection procedures to call all operations defined in the OpenAPI specification, along with a collection of identifiers and their corresponding mappings, than are used to store the data of the request and response bodies associated with these operations. 

	The library will be stored to disk, along with all generated mappings, in a subfolder of the folder located to by the string parameter ``dex::schema::libprj::LibraryRootFolder``. The ``LibraryInitialization`` procedure from the generated library will read initialization data from a library-specific file in the folder located to by the string parameter ``dex::schema::libprj::ApiInitFolder``. In that file you can, for instance, initialize settings such as the server URL, the API key to be used, or the OAuth2 credentials to be used.

	:param schemaPath: absolute or relative path where to find the OpenAPI specification file from which to generate the runtime library
	:param schemaName_: name of the OpenAPI specification for which to create a runtime library and mapping, will also serve as the name of the runtime library.
	:param schemaPrefix: prefix of the runtime library to generate
	:param explodeDefault: flag to indicate whether to add references to an instance of a subschema (0), to explode subschemas into a schema but still maintaining an `instance` index to allow multiple instances of the data (1, default),  or to explode without an additional `instance` index (2). Values of 0 and 1 create asynchronous methods, that allow multiple API calls to be executed in parallel, while a value of 2 will generate a completely synchronous library, allowing only one API call to be executed at any time.
	:param generateXMLData: flag to indicate whether the API expects JSON request and response bodies (0, default), or XML request and response bodies (1)

.. spelling:word-list::

    uninitialize
		HMAC
		SHA256
		base64
		url
		AWS
		OAuth2