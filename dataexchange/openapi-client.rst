Generating API client code from an OpenAPI specification
========================================================

Many REST service providers deliver an `OpenAPI specification <https://www.openapis.org/>`_ describing the service endpoints provided by their service and JSON schema for the requests and responses associated with each endpoint.

Auto-generating runtime libraries
---------------------------------

When an OpenAPI specification is available for a REST service, the Data Exchange library can automatically generate an easy-to-use runtime library for you that you can use to make API calls to the provided service.

The generator can actually perform two tasks:

- For a given `JSON schema <https://json-schema.org/>`_ file, it can generate a runtime library containing a collection of identifiers that can hold any data contained in a JSON file adhering to the given schema, and create DEX mapping files that can be used to read and write such files.
- For a given `OpenAPI specification <https://www.openapis.org/>`_ file, it can generate a runtime library that provides
	
		- support for reading and writing all JSON schema used in the OpenAPI specification (as above), and 
		- a collection of procedures for all REST API methods specified in the OpenAPI specification.
		
Generating support for reading from and writing to a JSON schema
----------------------------------------------------------------

Using the method :js:func:`dex::schema::ParseJSONSchema` you can let the Data Exchange library create a runtime library containing a collection of identifiers, together with a collection of mapping files, that will allow you to read and write data from JSON files adhering to the schema, into the identifiers contained in the runtime library. The Data Exchange library uses this method, among others, to generate a parser for OpenAPI specification files from the `JSON schema for the OpenAPI 3.1 specification <https://github.com/OAI/OpenAPI-Specification/>`_.

To call this method, you need to provide a number of arguments

- the schema name, which will also serve as the name of the runtime library
- a prefix for the runtime library to be created
- the path to the JSON schema file for which to generate the runtime library and mapping files
- whether or not to explode all subschema referenced in a schema
- an additional index to be prefixed to the domain of every generated identifier in the runtime library (optional)
- an external binding for this additional index

Exploding subschema
+++++++++++++++++++

A schema in the JSON schema file may contain a reference to a another schema in the JSON schema file. The generator can deal with this in one of two ways:

- explode the subschema at any location where it is referenced, starting with the dimensions already present at the location of the reference. This mode is convenient and very natural in most situations, but may lead to an excessive amount of duplicated identifiers at various nesting levels when the schema file contains a lot of schema referencing each other. Exploding subschema will not work when cyclic references are present.
- create a single collection of identifiers for each schema in the schema file, and add a reference identifier linking an instance of one schema to a (child) instance of a subschema

By default, the Data Exchange library will prefix the index domain of every identifier created in the runtime library with an additional *instance* index. Next to allowing to add reference identifiers linking an instance of one schema to a child instance of another schema, the additional *instance* index also allows the storage of data instance, e.g., when used in multiple API calls (in which case we will talk about call instances). 

Optionally, the Data Exchange library also allows the exploded generation of identifiers without the additional *instance* index. This mode can only support fully exploded schema, and, when used in API calls, only allows for fully synchronous API calls, as there is no possibility to store data of multiple API calls executed asynchronously.

Adding instructions to the JSON schema to steer the generator
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

You can influence the behavior of :js:func:`dex::schema::ParseJSONSchema` at a more granular level by adding additional `x-aimms-...` properties to any schema in the JSON schema file. The following properties are available: 

- `x-aimms-name`: use this name instead of the name of the schema in the JSON schema file when creating identifiers or sections in the runtime library. 
- `x-aimms-type-switch`: in some occasions a JSON schema can define a single property as multiple types depending on some conditions specified in the JSON schema. Normally, the Data Exchange library assumes a single type for a property. By setting this property to `true`, the Data Exchange library will create multiple identifiers, one for each type attainable.
- `x-aimms-ref`: use this reference instead of the `$ref` property in the schema file
- `x-aimms-enum`: when creating the range of an element parameter from a property with a string type, the possible enum values may come from various branches of the schema, from which the Data Exchange library will only use one. With this property you can concentrate all possible enum values in a single location.
- `x-aimms-namespace`: set to `true` to add a namespace in 5e runtime library
- `x-aimms-force-dense`: add a `force-dense` attribute to the mapping and create an associated identifier for a reference to a subschema
- `x-aimms-pattern`: override the regex pattern of a `patternProperty` in a JSON schema file
- `x-aimms-maps-to-range`: force a string type property to be mapped to an element parameter with the given range
- `x-aimms-explode`: override the default explode behavior of the JSON parser, by setting this property to `true` or `false` for specific schema. Thus, you may create a situation where most schema or exploded, but some are not, or vice versa.
- `x-aimms-ignore`: do not parse this schema, e.g., the Data Exchange library ignores the examples in an OpenAPI specification (which have free format), by setting the `x-aimms-ignore` property for the `examples` schema in the JSON schema of the OpenAPI specification.

.. note::

	For most schema the use of these AIMMS-specific properties is not necessary, and the default exploded view of the schema is sufficient. They can play a role to deal the with advanced nature of e.g. the JSON schema of the OpenAPI specification itself, to create a balanced approach between exploding subschema and adding references, or to add additional clarity by better naming and or structure to the generated library.
	
How the JSON Schema parser generates dimensions
+++++++++++++++++++++++++++++++++++++++++++++++

The JSON Schema parser in the Data Exchange library parse the entire schema tree contained in a JSON schema, and adds dimensions for the node in the tree as follows:

- if an `externalBindsToPrefix` is given, all identifiers associated with nodes throughout the JSON schema tree will start with the index specified through this argument
- unless the `explodeDefault` argument is 2, an additional `i_instance` index will be added to allow for multiple instances of each schema
- for every *property* of array type, the parser will create an integer set `<propertyName>_iter` to hold all array members, and add an index into this set for every identifier generated for properties underneath this node in the JSON schema tree
- for every *patternProperty* or *additionalProperties*, the parser will create a set `<subSchemaName>_patterns` to hold all patterns encountered, and add an index into this set for every identifier generated for properties underneath this node in the JSON schema tree
- for every subschema which is not exploded, the parser will create a reference parameter with an additional `i_childInstance` index pointing to the specific instance of the subschema to be associated with a specific property of another schema when reading a JSON file adhering to this schema.

How the JSON Schema parser generates identifiers and (sub-)modules
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The JSON schema parser generates identifiers in a top-level module within in the runtime library and creates a corresponding mapping file for 

- the collection of global properties contained in the JSON schema file, and
- all non-exploded (sub-)schema defined in the JSON schema file.

Within these top-level modules, the parser will create sub-modules for

- every exploded sub-schema
- every array, *patternProperty*, or *additionalProperties* nodes
- object properties with the `x-aimms-namespace` property specified

The parser will generate an identifier within the current module for

- every string, number, integer, boolean property
- references to non-exploded subschema
- properties with the `x-aimms-force-dense` properties set

Generating API clients from an OpenAPI specification
----------------------------------------------------

For any OpenAPI specification file in either JSON or YAML format, the function :js:func:`dex::schema::GenerateClientFromOpenAPISpec` will generate a runtime library
containing 

- for every non-exploded schema encountered in the OpenAPI specification file, a module with a collection of identifiers, along with a corresponding mapping, as outlined in the section above
- for every operation encountered in the OpenAPI specification, a module with an `apiCall` procedure, which takes care of handling all specified parameters and headers of the operation, creating the request body from its associated library identifiers, performing the HTTP request, and reading the response body into the associated library identifiers for various types of responses for the operation. 

While in principle it would be possible to implement such API calls manually using the basic functionality provided by the Data Exchange library, in practice creating all necessary identifiers and mappings to create request bodies, or to parse response bodies, and actually executing the API calls, is a very laborious and error-prone task. Generating such client code automatically based on the OpenAPI specification of a service, let's you integrate such services into your model with ease.

The generated runtime library is also saved to disk as regular library, containing both the source of the generated library as well as all the generated mappings. By default, this library is saved in the ``../libs`` folder. 

How the generated code deals with parameters
++++++++++++++++++++++++++++++++++++++++++++

Every operation defined in an OpenAPI specification of a service, can have four types of arguments

- *path* arguments, which will be substituted for a part of the URL path associated with the operation, e.g., in the path ``/evironments/{environment}/users/{user}``, both *environment* and *user* serve as path arguments, which will be substituted with real instances when an actual call is made. The Data Exchange library will present path arguments to you as arguments of the generated ``apiCall`` procedure.
- *query* arguments, which will be added to the URL being called as query parameters, e.g., in the URL ``/?apiFormat=JSON`` the query parameter ``apiFormat`` is added as the result of the operation having an argument of type query. The Data Exchange library will present query arguments to you as arguments of the generated ``apiCall`` procedure. The Data Exchange library supports query parameters of number, string or array type, and follows the *style* instructions in the specification to serialize arrays into a single string. The Data Exchange library does not support serializing of structures with a more complex schema (e.g. objects).
- *header* arguments, which will be added to the HTTP request as HTTP headers. The Data Exchange library assumes that all headers are strings, and allows you to set these via an predefined identifier ``<schemaName>::api::<operation>::RequestHeaderValue(reqheader)``, where ``reqHeader`` is an index into a set containing all request headers supported by the operation. For request headers, the generated code will not perform any type of serialization when the header arguments have schema other than string. Before making the API call, your code have to set the headers to be used during the call, and do any type of serialization necessary.
- *cookie* arguments, which will be collected and added to the HTTP request in the ``Cookie`` header. The Data Exchange library assumes that all headers are strings, and allows you to set these via an predefined identifier ``<schemaName>::api::<operation>::CookieValue(cookie)``, where ``cookie`` is an index into a set containing all cookies supported by the operation. Like header arguments, your code is responsible for setting all cookie values, and any serialization of cookie values with a complex schema.

How the generated code deals with requests and response bodies
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

When an operation in the OpenAPI specification expects a request body, the generated code will create the request body using the mapping generated for the specified schema of the request body, and expects the data to be available in the collection of identifiers associated with that schema in the runtime library. Alternatively, if you specify a file (or memory stream) name for the string parameter ``<schemaName>::api::<operation>::RequestFile('requestBody')``, the ``<schemaName>::api::<operation>::apiCall`` method will use the content of that file as request body. You can use this if you want to construct the request body from other data in your model, or if the operation expects a binary file as request body.

Similary the response body will be deserialized into the collection of identifiers associated with the schema of the response body. Depending on the HTTP status code, the schema of the response body may differ, so you may find the result of a valid call in a different module in the runtime library than an error message that is returned for a non-valid call.
If you set the parameter ````<schemaName>::api::<operation>::DeserializeResponse(<statusClass>)`` to 0 (default is 1) where ``<statusClass>`` is any of the HTTP status codes, or one of the aggregator status class ``'2xx'``, ``'3xx'``, the ``<schemaName>::api::<operation>::callback`` method will not try to deserialize the response body. In this case, the content of the request body is available in the file (or memory stream) specified in the string parameter ``<schemaName>::api::<operation>::ResponseFile('responseBody',<callInstance>)``. 
This allows you to deserialize the content into identifiers of your own choice, or to deal with binary content if the method returns a binary file. 

If the generated identifiers have an additional *instance* index, then the request data need to be, and the response data will be stored in the specific slice associated with the *instance* representing this particular call. In this situation, you must first call the procedure ``<schemaName>::api::NewCallInstance`` to create a new call instance that you can use to store request data or to retrieve the response data. 

In case you have the ``explodeDefault`` argument to 2, the *instance* index will not be present in any of the generated identifiers, and there will only be space to store the data for a single instance of a call. As a consequence, the generated code is automatically made completely synchronous, as this prevents two API calls to be made in parallel.

For `multipart` request bodies, the generated code will generate mime parts for object-type properties if the schema of the property has an associated mapping. This is the case if the type is provided through a reference to a sub-schema. If such a mapping is not available, or if the type is an array or an atomic type, you have to provide contents of the mime parts yourself through the ``<schemaName>::api::<operation>::RequestFile`` parameter, where the ``reqpart`` index points to the corresponding part of the multi-part body. For array-type properties, the parts are identified by request parts ``<part>-1 .. <part>-n`` where already 8 parts are predeclared in the set ``<schemaName>::api::<operation>::RequestParts``.  
 
.. note::

	The Data Exchange library does not yet handle services that work with XML request and response bodies.

Supplying model-specific hooks
++++++++++++++++++++++++++++++

The ``apiCall`` method will perform all generic functionality that is necessary to make the specific API request. Through the element parameter ``<schemaName>::api::<operation>::UserRequestHook`` you can set a procedure that will be call from within the ``apiCall`` method in which you can perform any model-specific actions necessary. Example of this are, for instance, HMAC hashing of request headers (e.g. for computing AWS signature v4 signatures).

Likewise you can set the element parameter ``<schemaName>::api::<operation>::UserResponseHook`` to a procedure that will be called after all response data has been set in the callback of the libCurl request.

Dealing the status, call time and response headers of calls
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The HTTP status code, libCurl error code, the total call time, and the response headers of any API call will be stored in the identifiers:

- ``<schemaName>::api::CallStatusCode``
- ``<schemaName>::api::CallErrorCode``
- ``<schemaName>::api::CallTime``
- ``<schemaName>::api::<operation>::ResponseHeaderValue``

Configuration parameters of the API client
++++++++++++++++++++++++++++++++++++++++++

The generated library has various configuration parameters that you may need to set prior to making any call to an API.

- ``<schemaName>::api::APIServer``: this is the base URL that is prefixed to the path of any operation specified in the OpenAPI specification. Typically this points to the server where the service is running, potentially with a path prefix that needs to be prepended to the path associated with every specified operation.

- ``<schemaName>::api::RequestResponseFilePrefix``: a prefix to every filenames being generated for every file being generated for request and response bodies. You can use this to store any such files in a particular subdirectory, or to instruct the Data Exchange library to use memory streams instead of real files.

    #.  The library initializes this parameter to "##" to make effective use of `memory streams <https://documentation.aimms.com/dataexchange/api.html#memory-streams>`_ thereby avoiding bottlenecks such as virus scans and disk storage.

    #.  When you want to inspect the contents of the generated files, you may want to set this parameter to an explicit folder.

Configuring API authorization data
++++++++++++++++++++++++++++++++++

The generated API client supports both API keys and OAuth2 for authorizing your API calls. You can specify these through the following parameters:

- ``<schemaName>::api::RequestTracing``: a flag to indicate whether you want to the actual API call generate a libCurl trace file, which you can use of debug the particular sequence of network calls being made by libCurl. 
- ``<schemaName>::api::APIKey``: a string parameter in which you can store the API key to be used in all API calls for this client. The API key will be transmitted through a security-scheme dependent header.
- ``<schemaName>::api::OAuth2APIClient``: If the service used OAuth2 for authorization, you can use this configuration parameter to point to an element of the set ``dex::oauth::APIClients`` (see section :ref:`Using OAuth2 for API authorization <OAuth2>`). The client will then automatically call the :js:func:`dex::oauth::AddBearerToken` before making any API call.

Setting libCurl-specific options
++++++++++++++++++++++++++++++++

Each generated API client allows you to set libCurl-specific options that will be applied to any API call made with the client through the parameters

- ``<schemaName>::api::IntOptions``
- ``<schemaName>::api::StringOptions``

In addition, if your API calls need to go through a proxy server, you should call the function :js:func:`dex::client::DeterminProxyServer` prior to making any API call. This will set additional libCurl options to enable the use of the proxy.

General flow of making an API call
++++++++++++++++++++++++++++++++++

To make an API call for a given operation using an API client generated by the Data Exchange library, you should generally do the following steps (if applicable):

- Call the procedure ``<schemaName>::api::NewCallInstance`` to create a new *callInstance*
- Fill the collection of identifiers for the schema of the request body for the given *callInstance*
- Set request headers for the call through the string parameter ``<schemaName>::api::<operation>::RequestHeaderValue``
- Set any cookies for the call through the string parameter ``<schemaName>::api::<operation>::CookieValue``
- Make the call to ``<schemaName>::api::<operation>::apiCall`` for *callInstance* and all further path and query parameters of the operation

This will execute the operation asynchronously. If you want to wait for one or more requests to complete, you can do so by calling the method :js:func:`dex::client::WaitForResponses`.

If you have set the ``explodeDefault`` argument to 2 during the generation of the API client, there will be no *instance* index in the schema-specific identifiers, nor will there by a *callInstance* argument to the ``apiCall`` procedures.

Cleaning up generated identifiers after a call
++++++++++++++++++++++++++++++++++++++++++++++

Every generated schema will have a method ``<schemaName>::<schema>::EmptyInstance`` which will remove all data for the instance specified as an argument. If sub-schemas are not exploded, the the ``EmptyInstance`` method will also be called for all referenced sub-schema. This will make it easy to delete all data associated with request and response bodies for your API calls.

Replacing the runtime library by a permanent library
----------------------------------------------------

Once you have generated a runtime library to integrate a third-party service into your model, and it works as intended, we advise you to replace the runtime library with the version saved to disk in the ``../libs`` folder, which contains both the generated source code and all generated mappings.

Not only will this save you time, as you don't have to generate the runtime library on every run of the model, but using identifiers and procedures from a regular library is much easier than using identifiers and procedures from a runtime library using the ``Uses runtime libs`` attribute. Especially, it is impossible to use indices from the runtime library in the index domain of identifiers in your model, or to use a set from the runtime library as the range of an element parameter in your model. By including the library saved to disk, this will be no problem any longer.

Data-driven generic API client
------------------------------

If an API does not provide an OpenAPI specification, the Data Exchange library also offers a completely data-driven generic REST API client in the ``dex::client::rest`` namespace. This generic client follows exactly the same flow as REST clients generated from an OpenAPI specification, but relies on you to provide mappings for request and response bodies, and the REST client uses identifiers in the ``dex::client::rest`` namespace to specify URLs and methods for API operations and which query, header and path arguments are avaliable, and to provide data for these parameters.

To use the generic REST client, please consult the ``dex::client::rest`` module in the Data Exchange library to find out which data needs to the specified. When all operations have been configured, and all argument data has been provided, you can call the methods ``dex::client::rest::GenericAPICallSync`` or ``dex::client::rest::GenericAPICallASync`` to make REST API calls in a synchronous or asynchronous manner.


.. spelling:word-list::

	AWS