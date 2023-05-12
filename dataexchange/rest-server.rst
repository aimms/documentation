Providing REST APIs
===================

In addition to reading from and writing data to JSON, CSV, XML, Excel and Parquet files, the Data Exchange library also supports exposing your model through a REST API, accepting JSON, CSV, XML, Excel or Parquet data.

Specifying REST task types in your model
----------------------------------------

The Data Exchange library is also capable of providing a REST API service that exposes procedures in your model, and will form the basis of exposing procedures in published AIMMS apps in our cloud platform in the future. 

With each procedure in your model, you can associate a ``dex::ServiceName`` annotation, which will expose your procedure under the path ``/api/v1/tasks/{service-name}``, where ``{service-name}`` is the value you entered in the ``dex::ServiceName`` annotation. 

.. note::

	When deployed in the cloud the path is changed to ``/pro-api/v1/...``

Service end-points exposed
--------------------------

* ``/api/v1/tasks/{service-name}``
    
    * ``POST``: accepts any JSON/XML/CSV/Excel/... data as the request body. The REST API Service handler built into the Data Exchange library will queue the request, and call the procedure in your model corresponding to ``{service-name}``.
      Within the procedure handling the request, the string parameter ``dex::api::RequestAttribute`` will provide you with access to the 

      * ``id``: the id assigned to the request by the Data Exchange library
      * ``request-data-path``: the file path containing the request body 
      * ``response-data-path``: the file path in which to store the final response body
      * ``status-data-path``: the file path in which to store any (regularly updated) intermediate model status you want to communicate to the caller while handling the request, prior to completion

      In addition, you can access the request headers via the string parameter ``dex::api::RequestHeader``, while the string parameter ``dex::api::RequestParameter`` will hold any query parameters added to the request. 
      
      A ``POST`` request to the URL will either return the status code ``403 Forbidden`` if the service name cannot be found, or ``200 OK`` if the request has been queued. In the latter case, the request will return a status response similar to:

      .. code-block:: json

         {"id":"74d538bc-0ae9-421f-aa6f-35d02e1cd226","service":"Test","starttime":"2021-05-17T12:18:02Z","status":"queued"}

      where ``status`` can be any of ``queued``, ``executing``, ``solving``, ``interrupted`` or ``finished``.
      
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

* ``/api/v1/tasks/``
    
    * ``GET``: will return ``200 OK`` where the  response body will contain a array with the statuses of all submitted jobs, similar to:
      
      .. code-block:: json
                
         [
              {"id":"1b342050-74a8-4d46-b8e1-50bdf76fa172","service":"Test","starttime":"2021-05-17T11:03:15Z","status":"finished","queuetime":0.001,"runtime":0.004,"returncode":1},
              {"id":"23df6e25-de6c-4168-b2d4-691c0e742647","service":"Test","starttime":"2021-05-17T11:02:56Z","status":"finished","queuetime":0.011,"runtime":0.005,"returncode":1},
              {"id":"74d538bc-0ae9-421f-aa6f-35d02e1cd226","service":"Test","starttime":"2021-05-17T12:18:02Z","status":"finished","queuetime":0.003,"runtime":0.008,"returncode":1},
              {"id":"c692b9f9-d046-4aab-a015-47dcc7713fc6","service":"Test","starttime":"2021-05-17T11:02:56Z","status":"finished","queuetime":0.012,"runtime":0.004,"returncode":1}
         ]
              
* ``/api/v1/tasks/{id}``

    * ``GET``: will return a ``404 Not found`` if there is no task with the given id, or ``200 OK`` with a response body similar to:
    
      .. code-block:: json
    
         {"id":"74d538bc-0ae9-421f-aa6f-35d02e1cd226","service":"Test","starttime":"2021-05-17T12:18:02Z","status":"finished","queuetime":0.003,"runtime":0.008,"returncode":1}
         
    * ``PUT``: the request will accept a request body similar to:

      .. code-block:: json
    
         {"setstatus":"interrupt-execution"}
    
      where the ``setstatus`` field can be either ``interrupt-execution`` or ``interrupt-solve``. The request will return ``404 Not found`` when there is no such request, ``405 Method not allowed`` when the ``setstatus`` field has an invalid value, or ``200 OK`` with a status response body, with a ``setstatus`` field added with a value of ``interrupt-execution``, ``interrupt-solve`` or ``interrupt-processed`` indicating whether the interrupt is scheduled, or already processed. 
      
    * ``DELETE``: the request will return a status code of ``405 Method not allowed`` if the task is still running, or ``200 OK`` if the task is still queued, interrupted, or already finished. When a task is deleted all associated resources, including all files containing the files contained request, response or intermediate status bodies will be deleted.
    
* ``/api/v1/tasks/{id}/response``
    
    * ``GET``: will return a ``404 Not found`` if there is no task with the given id, or ``200 OK`` with the final response body stored as stored in the file ``dex::api::RequestAttribute('response-data-path')`` by the service handler procedure.
    
* ``/api/v1/tasks/{id}/status``
    
    * ``GET``: will return a ``404 Not found`` if there is no task with the given id, or ``200 OK`` with an intermediate status response body stored as stored in the file ``dex::api::RequestAttribute('status-data-path')`` by the service handler procedure.
   
Activating the REST service
---------------------------

You can activate the REST service via the call

.. code-block:: aimms

	dex::api::StartAPIService
	
This will read all the service name annotations, and start the service listening to incoming requests. Via the configuration parameters ``dex::api::ListenerPort`` and ``dex::api::MaxRequestSize`` you can configure the port the service will be listening on (default port 8080), and the maximum request size of request and response bodies accepted by the REST service (default 128 MB). After starting the API service, you can reach it via the base URL ``http://localhost:{listenerport}`` followed by the path the specific REST service you want to call, as listed above.

.. note::

	When deployed in the cloud, you should **not** call this function. The service is already running there for you.


Using the echo service
----------------------

Next to the REST API service described above, the API service also provides an *echo* service, that will simply echo all headers and (any) body you present to it, via either a GET, PUT, POST, or DELETE request. You can use the echo service to check whether there are any problems with requests that you would like to send to a real service. The echo service is available via the path ``http://localhost:{listenerport}/api/v1/echo/``, and it supports a single optional query parameter, ``delay``, indicating a delay in milliseconds before replying back to the caller.

Yielding time to the API service to handle requests
---------------------------------------------------

Within the execution of an AIMMS procedure, you can call the function ``dex::api::Yield`` to yield time to the API service to handle requests. You can use this functionality for instance, to implement tests in a project providing REST services using the ``dex::client`` functions to call the service endpoints exposed by your model. 

.. spelling:word-list::

    libCurl