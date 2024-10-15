Providing REST APIs
===================

In addition to reading from and writing data to JSON, CSV, XML, Excel and Parquet files, the Data Exchange library also supports exposing your model through a REST API, accepting JSON, CSV, XML, Excel or Parquet data.

Specifying REST task types in your model
----------------------------------------

The Data Exchange library is also capable of providing a REST API service that exposes procedures in your model, and will form the basis of exposing procedures in published AIMMS apps in our cloud platform in the future. 

With each procedure in your model, you can associate a ``dex::ServiceName`` annotation, which will expose your procedure under the path ``/api/v2/tasks/{service-name}``, where ``{service-name}`` is the value you entered in the ``dex::ServiceName`` annotation. 

.. note::

	When deployed in the cloud the path is changed to ``/pro-api/v2/...``

Service end-points exposed
--------------------------

* ``/api/v2/tasks/{service-name}``
    
    * ``POST``: accepts any JSON/XML/CSV/Excel/... data as the request body. The REST API Service handler built into the Data Exchange library will queue the request, and call the procedure in your model corresponding to ``{service-name}``.
      Within the procedure handling the request, the string parameter ``dex::api::RequestAttribute`` will provide you with access to the 

      * ``id``: the id assigned to the request by the Data Exchange library
      * ``request-data-path``: the file path containing the request body 
      * ``response-data-path``: the file path in which to store the final response body
      * ``status-data-path``: the file path in which to store any (regularly updated) intermediate model status you want to communicate to the caller while handling the request, prior to completion

      In addition, you can access the request headers via the string parameter ``dex::api::RequestHeader``, while the string parameter ``dex::api::RequestParameter`` will hold any query parameters added to the request. 
      
      A ``POST`` request to the URL will either return the status code ``403 Forbidden`` if the service name cannot be found, or ``200 OK`` if the request has been queued. In the latter case, the request will return a status response similar to:

      .. code-block:: json

					{"id": "efa680a0-748e-43d0-9099-cf40937b13f4","appName": "Test","appVersion": "1.0","serviceName": "JobSchedule","state": "completed","createdAt": "2023-11-23 15:16:38.000000","assignedAt": "2023-11-23 15:16:57.000000","runningAt": "2023-11-23 15:16:57.000000","endedAt": "2023-11-23 15:17:01.000000","queueTime": 19.000000,"runTime": 4.000000,"returnCode": 1,"errorMessage": null}

      where ``state`` can be any of ``queued``, ``assigned``, ``running``, ``solving``, ``failed`` or ``completed``.
      
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

* ``/api/v2/tasks``
    
    * ``GET``: will return ``200 OK`` where the  response body will contain a array with the statuses of all submitted jobs, similar to:
      
      .. code-block:: json
                
         [
              {"id": "a70c3321-3d74-49f1-bc03-75c5dc4f72d8","appName": "Test","appVersion": "1.0","serviceName": "JobSchedule","state": "completed","createdAt": "2023-11-16 09:13:29.000000","assignedAt": "2023-11-16 09:13:48.000000","runningAt": "2023-11-16 09:13:48.000000","endedAt": "2023-11-16 09:14:15.000000","queueTime": 19.000000,"runTime": 27.000000,"returnCode": 1,"errorMessage": null},
              {"id": "e27a131a-58fc-4a69-bdab-9661e0ac89fa","appName": "Test","appVersion": "1.0","serviceName": "JobSchedule","state": "completed","createdAt": "2023-11-16 09:13:29.000000","assignedAt": "2023-11-16 09:13:49.000000","runningAt": "2023-11-16 09:13:49.000000","endedAt": "2023-11-16 09:14:17.000000","queueTime": 20.000000,"runTime": 28.000000,"returnCode": 1,"errorMessage": null},
              {"id": "f2e1f06d-c428-4f5b-aa99-d3cd1cd8e462","appName": "Test","appVersion": "1.0","serviceName": "JobSchedule","state": "completed","createdAt": "2023-11-16 09:13:30.000000","assignedAt": "2023-11-16 09:13:50.000000","runningAt": "2023-11-16 09:13:50.000000","endedAt": "2023-11-16 09:14:20.000000","queueTime": 20.000000,"runTime": 30.000002,"returnCode": 1,"errorMessage": null},
              {"id": "0b9baab0-df82-48d8-a8c9-7b67c8e5b7a3","appName": "Test","appVersion": "1.0","serviceName": "JobSchedule","state": "completed","createdAt": "2023-11-16 09:13:30.000000","assignedAt": "2023-11-16 09:13:51.000000","runningAt": "2023-11-16 09:13:51.000000","endedAt": "2023-11-16 09:14:16.000000","queueTime": 21.000000,"runTime": 25.000000,"returnCode": 1,"errorMessage": null}
         ]
              
* ``/api/v2/tasks/{id}``

    * ``GET``: will return a ``404 Not found`` if there is no task with the given id, or ``200 OK`` with a response body similar to:
    
      .. code-block:: json
    
         {"id": "d1bd173e-d4df-4ff9-ab81-d2aa0c5185a1","appName": "Test","appVersion": "1.0","serviceName": "JobSchedule","state": "completed","createdAt": "2023-11-16 09:13:30.000000","assignedAt": "2023-11-16 09:13:55.000000","runningAt": "2023-11-16 09:13:55.000000","endedAt": "2023-11-16 09:14:20.000000","queueTime": 25.000000,"runTime": 25.000000,"returnCode": 1,"errorMessage": null}
         
    * ``PUT``: the request will accept a request body similar to:

      .. code-block:: json
    
         {"setstatus":"interrupt-execution"}
    
      where the ``setstatus`` field can be either ``interrupt-execution`` or ``interrupt-solve``. The request will return ``404 Not found`` when there is no such request, ``405 Method not allowed`` when the ``setstatus`` field has an invalid value, or ``200 OK`` with a status response body, with a ``setstatus`` field added with a value of ``interrupt-execution``, ``interrupt-solve`` or ``interrupt-processed`` indicating whether the interrupt is scheduled, or already processed. 
      
    * ``DELETE``: the request will return a status code of ``405 Method not allowed`` if the task is still running, or ``200 OK`` if the task is still queued, interrupted, or already finished. When a task is deleted all associated resources, including all files containing the files contained request, response or intermediate status bodies will be deleted.
    
* ``/api/v2/tasks/{id}/response``
    
    * ``GET``: will return a ``404 Not found`` if there is no task with the given id, or ``200 OK`` with the final response body stored as stored in the file ``dex::api::RequestAttribute('response-data-path')`` by the service handler procedure.
    
* ``/api/v2/tasks/{id}/status``
    
    * ``GET``: will return a ``404 Not found`` if there is no task with the given id, or ``200 OK`` with an intermediate status response body stored as stored in the file ``dex::api::RequestAttribute('status-data-path')`` by the service handler procedure.
	
	
Standard REST Task Service
--------------------------

The Data Exchange library will come with a standardized REST service called ``StandardTaskService`` pre-configured, which you can use to handle request whose request and response bodies consists merely of a list of string key-value pairs. This will allow you, for instance, to specify an (authenticated) URL where the input data for the request can be found, authentication tokens to retrieve from other databases and services, and names of datasets and scenarios. Thus, it will enable a range of services to be implemented in a very convenient manner. You can link your own model procedures to this standardized REST service through the ``dex::TaskName`` annotation that you can use to name tasks you want to be executed through the ``StandardTaskService`` service. When calling the ``StandardTaskService`` service, the request body needs to be of the form

.. code-block:: json
	
	{
		"task-name" : "<name-of-task>",
		"properties" : {
			"key-1" : "value-1", 
			"..."  : "..."
			"key-m" : "value-m"
		}
	}
	
where `<name-of-task>` is the value of the ``dex::TaskName`` annotation of the procedure inside your model that needs to be run to execute the request. If the specified task name is not present, the call to the ``StandardTaskService`` service will fail.

If successful, the response of the service request is a key-value list of the form
 
.. code-block:: json
	
	{

		"key-1" : "value-1", 
		"..."  : "..."
		"key-n" : "value-n"
	}

The procedure implementing the task should have two one-dimensional string parameter arguments defined over the set ``dex::api::TaskProperties`` with index ``dex::api::taskProp``, an input argument for the request properties, and an output argument for the response properties.

You can use the empty procedure ``dex::api::StandardTaskHandlerPrototype`` as a template for implementing the task handlers you wish to implement using the ``StandardTaskService`` REST service.

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

Next to the REST API service described above, the API service also provides an *echo* service, that will simply echo all headers and (any) body you present to it, via either a GET, PUT, POST, or DELETE request. You can use the echo service to check whether there are any problems with requests that you would like to send to a real service. The echo service is available via the path ``http://localhost:{listenerport}/api/v2/echo``, and it supports a single optional query parameter, ``delay``, indicating a delay in milliseconds before replying back to the caller.

Yielding time to the API service to handle requests
---------------------------------------------------

Within the execution of an AIMMS procedure, you can call the function ``dex::api::Yield`` to yield time to the API service to handle requests. You can use this functionality for instance, to implement tests in a project providing REST services using the ``dex::client`` functions to call the service endpoints exposed by your model. 

.. spelling:word-list::

    libCurl