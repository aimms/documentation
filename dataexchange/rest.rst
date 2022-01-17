Consuming and providing REST APIs using the Data Exchange library
=================================================================

In addition to reading from and writing data to JSON, CSV, XML and Excel files, the Data Exchange library also supports sending HTTP client requests to an HTTP (REST) service, as well as exposing procedures in your model through a built-in HTTP service component. This makes it the one-stop solution for communicating JSON, CSV, XML and Excel data with external REST APIs, as well as exposing your model through a REST API, accepting JSON, CSV, XML or Excel data.

Consuming REST APIs
-------------------

The Data Exchange library contains a fully asynchronous HTTP client library, based on the well-known libCurl library (see the `libCurl documentation <https://curl.se/libcurl/c/>`_). Each request will be executed in parallel through a fixed number of concurrent connections, and upon each response a user-specified callback will be executed when the AIMMS engine is idle, or whenever the modeler has explicitly requested the Data Exchange library to execute the callbacks for all handled requests. This approach allows massive amounts of requests to be handled in parallel, tremendously decreasing the total time it takes to perform all requests when the service called is set up in a scalable manner.

.. note::
	
	The functions in the `dex::client` namespace offer an alternative for the `httpclient` library, fully integrated within the Data Exchange library which will most likely be necessary for API calls anyway to map request bodies and responses to identifiers in the model. Both offer similar functionality, although there are some differences, most notably
	
	* the `httpclient` library does automatic proxy discovery, while for `dex::client` requests proxy discovery must be performed manually via the :js:func:`dex::client::ProxyResolve` function and subsequently set via the curl `PROXY` option. The function :js:func:`dex::client::DetermineProxyServer` will do perform steps for you.
	* `dex::client` HTTP requests can make use of all libCurl functionality that is available via libCurl options but not in the `httpclient` library (e.g. SPNEGO authentication)
	* `dex::client` HTTP requests only support a fully asynchronous execution model, optimized for massive amounts of HTTP/API requests to be executed in parallel
	
	Although the `dex::client` HTTP requests more than the `httpclient` library forces you to e.g. adhere strictly to its asynchronous model, or invoke certain functionality by specifically enabling it through the available options, the tight integration with the Data Exchange mapping capabilities allows for more advanced features on the :ref:`Data Exchange roadmap` like automatic API client generation from an OpenAPI specification. 
	
To initiate a request, call the function :js:func:`dex::client::NewRequest`, where you specify the URL of the request, the callback to be called for the response, the HTTP method (:token:`GET`, :token:`POST`, ...), and, if 

.. code-block:: aimms
    
    dex::client::NewRequest("request-1", "https://www.aimms.com/", 'SimpleRequestCallback', httpMethod: 'GET', responseFile: "out/request-1.html");
    
This as an instruction to create a new HTTP request with a unique identifier :token:`request-1`, which will get the contents of :token:`https://www.aimms.com/`. After the Data Exchange library receives the response, it will be store in the file :token:`out/request-1.html`, after which a callback called :token:`SimpleRequestCallback`, will be called. The Data Exchange library will not come up with a unique identifier for the request itself, but will leave it up to you to come up with an appropriate scheme to identify your requests yourself.

The request will not be executed yet, however. Prior to this, you first have the opportunity to set additional headers for the request using the function :js:func:`dex::client::AddRequestHeaders`, or add additional Curl options using the function :js:func:`dex::client::AddRequestOptions`, for instance, to specify a proxy that is to be used to connect to the given server, or whether libCurl should follow any redirects it encounters.

To actually execute the request, you should call the function :js:func:`dex::client::PerformRequest`

.. code-block:: aimms

    dex::client::PerformRequest("request-1");
    
This will queue the request for execution on one of the concurrent connections maintained by the Data Exchange library for making HTTP requests. You can specify how many concurrent connections you want to be used to execute HTTP requests through the function :js:func:`dex::client::SetParallelConnections`. By default, the Data Exchange library will use up to 16 parallel connections. By increasing this maximum number of connections you may substantially decrease the total amount of time taken to execute a large number of requests, but you should also make sure that the server infrastructure handling these requests is comfortable handling the number of parallel connections you set. 

Upon completion of the request, your specified callback function will be called, with three arguments:

* :token:`theRequest`, the specific request identifier for which the callback is called.
* :token:`statusCode`, the HTTP status code of the response.
* :token:`errorCode`, the Curl error code for the response in case the request was not successful.

If there was a libCurl error, the HTTP status code will be 0, and you can use the function :js:func:`dex::client::GetErrorMessage`, to retrieve a description of the Curl error that occurred, based on the :token:`errorCode` argument. 

If the status code is 200 (:token:`OK`), then you can proceed to request the response headers using the function :js:func:`dex::client::GetResponseHeaders`, request additional info about the request from libCurl using the function :js:func:`dex::client::GetInfoItems` (e.g. the total request time, or the final destination of your request in case of redirects), or can use the function :js:func:`dex::ReadFromFile` to read the response data into identifiers in your model in case of REST call to some REST API. 

The Data Exchange library will automatically close a request as soon as the specified callback function has been called, not to leave any resources in use unnecessary. It will, however, not remove any request and/or response files or memory streams you specified, unless the memory stream names start with `##` (see :ref:`memory streams`).

The library has been tested to be able to call a very simple HTTP service (i.e., with an empty response) for 100,000 times over 256 parallel connections within 20 or so seconds, so should able to deal with a more realistic number of calls to a non-trivial service as well. Note that in this case, the time taken to deal with the response in the callback (e.g. reading the data in AIMMS identifiers) may substantially add to the overall time to make and handle all requests.

Using OAuth2 for API authorization
----------------------------------

The two most common ways to authorize the use of APIs is through the use of

* API keys that you must add to an API-specific header
* the `OAuth2 authorization protocol <https://oauth.net/2/>`_

While the use of API keys is fairly straightforward, and requires no additional support in AIMMS to use, the implementation of the OAuth2 protocol can be quite intricate, and some authorization flows require support in AIMMS to function at all. For this reason, the Data Exchange library provides all means necessary to effortlessly authorize the use of an API through the OAuth2 protocol.

With the OAuth2 protocol, a client application (i.e., your model) can be authorized to access an API. This authorization can take place at two levels:

* at the application level, where the application itself will be authorized to access the API (called the Client Credentials flow), or
* the application can get access to the API on behalf of the user operating the application through a UI (called the Authorization Code flow).

For both of these authorization flows, the result of a successful authorization through the OAuth2 protocol will be a `Bearer` token, which, when added to an API call, will authorize the application to access the API with a given level of access for a limited period of time. 

Every client application with access to an API is identified through a `client id` and a `client secret`, which are handed out by the administrator of the API. The level of access to the API is set via one or more `scopes`, which the API administrator also needs to provide to client applications.

To get OAuth2 to work, you further need some end points of the identity platform that is used by the API for authentication and authorization. For both authorization at the application and user level, you will need to know the `token endpoint`, where the application can retrieve the Bearer token. 

When requesting authorization on behalf of an end-user of an application, you further need to supply the `authorization endpoint` of the identity platform, where the end-user needs to authenticate herself with the identity platform, as well as a `redirect url` through which the identity platform can inform the application about the result of the end-user authentication. 

Using the Client Credentials flow
+++++++++++++++++++++++++++++++++

To use the OAuth2 Client Credentials flow, you need to specify the following information

* Identify your AIMMS model as a API client, by adding a client name to the set :token:`dex::oauth::APIClients`, 
* Provide the `client id`, `client secret` and `token endpoint` for the API client via the string parameter :token:`dex::oauth::APIClientStringData`, and
* Provide the requested access level through the `scope` provided by the API administrator.

With this information, you can now add a Bearer authorization token to any `dex::client` request :token:`theRequest`, by calling 

	.. code-block:: aimms

		dex::oauth::AddBearerToken(apiClient, theRequest);
		
prior to the actual call to :js:func:`dex::client::PerformRequest`. The function :js:func:`dex::oauth::AddBearerToken` will check whether there is still a Bearer token for the given `apiClient` valid up to an interval of :token:`dex::oauth::TokenValidityThreshold` seconds of the token's expiration time, and if not, request a new Bearer token. 

Using the Authorization Code flow
+++++++++++++++++++++++++++++++++

To use the OAuth2 Authorization Code flow, you need to provide, on top of the information you also need for the Client Credentials flow

* the `authorization endpoint` where the end-user needs to authenticate herself,
* the path part of the `redirect URL` where the used identity platform will need to forward the result of the end-user authorization step to the application.

The following example shows the Authorization Code flow specification required for a client application authorized through the Azure Active Directory identity platform.

  .. code-block:: aimms

	dex::oauth::APIClients := data { MS };

	dex::oauth::APIClientStringData('MS',dex::oauth::apidata) :=$ data { 
			authorizationEndpoint : "https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/authorize", 
			tokenEndpoint : "https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/token", 
			clientId : "<client-id>", 
			clientSecret : "*******************************", 
			scope: "offline_access https://graph.microsoft.com/User.Read https://graph.microsoft.com/Group.Read.All"
		};

.. note::

	To get a refresh token for Azure AD, you should add the :token:`offline_access` scope.
	
When running the AIMMS application locally on your desktop, AIMMS will instantiate a fixed redirect URL :token:`http://localhost/oauth2/`. For an on-premise PRO server, or for the AIMMS Cloud Platform, the redirect URL will be the fixed URL :token:`https://<pro-server-dns-name>/extensions/<app-name>/oauth2/`. You need to provide this redirect URL to the API administrator to allow the application to be authorized when run from the desktop. If the published name of your application on the on-premise PRO server or the AIMMS Cloud Platform contains spaces, you should `URL-encode <https://www.urlencoder.org/>`_ the application name before registering it with the identity platform. 

With these settings, you can again call the function :js:func:`dex::oauth::AddBearerToken` to add a Bearer token to your API request. In this case, however, the end-user will need to authenticate herself with the identity platform through a brower session that will be initiated by AIMMS on the first call, and optionally on additional calls when a previous Bearer token has expired and cannot be refreshed.

.. note::
	
	The OAuth2 Authorization Code flow support will work for AIMMS sessions running locally on the desktop for all AIMMS versions. For WebUI session running from an on-premise PRO server or from the AIMMS Cloud Platform, AIMMS version 4.84 and PRO version 2.41 are required to support the redirect URLs to be routed back to the AIMMS session backing your WebUI session. Also, the use of OAuth requires the use of HTTPS on your on-premise PRO server. 

Debugging client requests
-------------------------

When you experience trouble invoking a URL using `dex::client` requests, here are a number of guidelines that may help you tackle it:

* libcurl doesn't automatically follow redirects, and is pretty strict on checking revocation lists by default. This may cause HTTP requests to fail with sometimes hard to follow error messages. In addition, the HTTP client in the Data Exchange library does not perform automatic proxy discovery, which may cause HTTP requests to fail because the proper proxy is not used during the request. The following code will sensible defaults to prevent all of these issues:

	.. code-block:: aimms
		
		dex::client::ProxyResolve("https://www.aimms.com", proxyURL);	! determine proxy URL, assuming the same proxy result for any url
		stringOptions(dex::client::stropt) := { 'PROXY' : proxyURL };   ! instruct libcurl to use the given proxy
		intOptions(dex::client::intopt) := { 'HTTPPROXYTUNNEL' : 1, 'SSL_OPTIONS' : 2, 'FOLLOWLOCATION' : 1, 'MAXREDIRS' : 10 };
		dex::client::SetDefaultOptions(intOptions, stringOptions);

The procedure :js:func:`dex::client::DetermineProxyServer` will set these defaults options for you. 

* If your request contains a request body, the HTTP client will deduce the content type of the request body from the file extension containing the body, or if it cannot deduce it, set it to `application/octetstream`. You may need to set the `Content-Type` header to a proper value to make the request succeed, specifically when you do a POST request with url-encoded parameters, as follows

	.. code-block:: aimms
	
		dex::client::AddRequestHeader(reqId, "Content-Type", "application/x-www-form-urlencoded"); 

* A good way to debug HTTP requests is to enable request tracing by specifying a trace file in the :js:func:`dex::client::NewRequest` function. The resulting file will contain all available tracing information made available by libcurl, including all verbatim request and response headers and bodies.

Providing REST APIs
-------------------

The Data Exchange library is also capable of providing a REST API service that exposes procedures in your model, and will form the basis of exposing procedures in published AIMMS apps in our cloud platform in the future. 

With each procedure in your model, you can associate a :token:`dex::ServiceName` annotation, which will expose your procedure under the path :token:`/api/v1/tasks/{service-name}`, where :token:`{service-name}` is the value you entered in the :token:`dex::ServiceName` annotation. 

* :token:`/api/v1/tasks/{service-name}`
    
    * :token:`POST`: accepts any JSON/XML/CSV/Excel/... data as the request body. The REST API Service hander built into the Data Exchange library will queue the request, and call the procedure in your model corresponding to :token:`{service-name}`.
      Within the procedure handling the request, the string parameter :token:`dex::api::RequestAttribute` will provide you with access to the 

      * :token:`id`: the id assigned to the request by the Data Exchange library
      * :token:`request-data-path`: the file path containing the request body 
      * :token:`response-data-path`: the file path in which to store the final response body
      * :token:`status-data-path`: the file path in which to store any (regularly updated) intermediate model status you want to communicate to the caller while handling the request, prior to completion

      In addition, you can access the request headers via the string parameter :token:`dex::api::RequestHeader`, while the string parameter :token:`dex::api::RequestParameter` will hold any query parameters added to the request. 
      
      A :token:`POST` request to the URL will either return the status code :token:`403 Forbidden` if the service name cannot be found, or :token:`200 OK` if the request has been queued. In the latter case, the request will return a status response similar to:

      .. code-block:: json

         {"id":"74d538bc-0ae9-421f-aa6f-35d02e1cd226","service":"Test","starttime":"2021-05-17T12:18:02Z","status":"queued"}

      where :token:`status` can be any of :token:`queued`, :token:`executing`, :token:`solving`, :token:`interrupted` or :token:`finished`.
      
      The procedure body for handling such a request could look like:
      
      .. code-block:: aimms
      
         ! read data from request body
         dex::ReadFromFile(dex::api::RequestAttribute('request-data-path'), "GraphHopperMatrix", 1, 0, 1);

         ! do some manipulation of data
         GraphHopperMatrixResults(restp, from_point, to_point) *= 2;

         ! write response body
         dex::WriteToFile(dex::api::RequestAttribute('response-data-path'), "GraphHopperMatrix");
         
         ! the application-specific returncode that will be returned via the task status of the job
         return 1;

* :token:`/api/v1/tasks/`
    
    * :token:`GET`: will return :token:`200 OK` where the  response body will contain a array with the statuses of all submitted jobs, similar to:
      
      .. code-block:: json
                
         [
              {"id":"1b342050-74a8-4d46-b8e1-50bdf76fa172","service":"Test","starttime":"2021-05-17T11:03:15Z","status":"finished","queuetime":0.001,"runtime":0.004,"returncode":1},
              {"id":"23df6e25-de6c-4168-b2d4-691c0e742647","service":"Test","starttime":"2021-05-17T11:02:56Z","status":"finished","queuetime":0.011,"runtime":0.005,"returncode":1},
              {"id":"74d538bc-0ae9-421f-aa6f-35d02e1cd226","service":"Test","starttime":"2021-05-17T12:18:02Z","status":"finished","queuetime":0.003,"runtime":0.008,"returncode":1},
              {"id":"c692b9f9-d046-4aab-a015-47dcc7713fc6","service":"Test","starttime":"2021-05-17T11:02:56Z","status":"finished","queuetime":0.012,"runtime":0.004,"returncode":1}
         ]
              
* :token:`/api/v1/tasks/{id}`

    * :token:`GET`: will return a :token:`404 Not found` if there is no task with the given id, or :token:`200 OK` with a response body similar to:
    
      .. code-block:: json
    
         {"id":"74d538bc-0ae9-421f-aa6f-35d02e1cd226","service":"Test","starttime":"2021-05-17T12:18:02Z","status":"finished","queuetime":0.003,"runtime":0.008,"returncode":1}
         
    * :token:`PUT`: the request will accept a request body similar to:

      .. code-block:: json
    
         {"setstatus":"interrupt-execution"}
    
      where the :token:`setstatus` field can be either :token:`interrupt-execution` or :token:`interrupt-solve`. The request will return :token:`404 Not found` when there is no such request, :token:`405 Method not allowed` when the :token:`setstatus` field has an invalid value, or :token:`200 OK` with a status response body, with a :token:`setstatus` field added with a value of :token:`interrupt-execution`, :token:`interrupt-solve` or :token:`interrupt-processed` indicating whether the interrupt is scheduled, or already processed. 
      
    * :token:`DELETE`: the request will return a status code of :token:`405 Method not allowed` if the task is still running, or :token:`200 OK` if the task is still queued, interrupted, or already finished. When a task is deleted all associated resources, including all files containing the files contained request, response or intermediate status bodies will be deleted.
    
* :token:`/api/v1/tasks/{id}/response`
    
    * :token:`GET`: will return a :token:`404 Not found` if there is no taks with the given id, or :token:`200 OK` with the final response body stored as stored in the file :token:`dex::api::RequestAttribute('response-data-path')` by the service handler procedure.
    
* :token:`/api/v1/tasks/{id}/status`
    
    * :token:`GET`: will return a :token:`404 Not found` if there is no taks with the given id, or :token:`200 OK` with an intermediate status response body stored as stored in the file :token:`dex::api::RequestAttribute('status-data-path')` by the service handler procedure.
   
Activating the REST service
---------------------------

You can activate the REST service via the call

.. code-block:: aimms

	dex::api::StartAPIService
	
This will read all the service name annotations, and start the service listening to incoming requests. Via the configuration parameters `dex::api::ListenerPort` and `dex::api::MaxRequestSize` you can configure the port the service will be listening on (default port 8080), and the maximum request size of request and response bodies accepted by the REST service (default 128 MB). After starting the API service, you can reach it via the base URL `http://localhost:{listenerport}` followed by the path the specific REST service you want to call, as listed above.

Using the echo service
----------------------

Next to the REST API service described above, the API service also provides an *echo* service, that will simply echo all headers and (any) body you present to it, via either a GET, PUT, POST, or DELETE request. You can use the echo service to check whether there are any problems with requests that you would like to send to a real service. The echo service is available via the path `http://localhost:{listenerport}/api/v1/echo/`, and it supports a single optional query parameter, `delay`, indicating a delay in milliseconds before replying back to the caller.

Yielding time to the API service to handle requests
---------------------------------------------------

Within the execution of an AIMMS procedure, you can call the function `dex::api::Yield` to yield time to the API service to handle requests. You can use this functionality for instance, to implement tests in a project providing REST services using the `dex::client` functions to call the service endpoints exposed by your model. 

