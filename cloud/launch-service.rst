Launching Python, R and other services
======================================


Starting with AIMMS version 24.1 and PRO version 24.1 it is possible to launch Python, R and other services on the AIMMS PRO platform. This allows you to run Python and R scripts on the AIMMS PRO platform, and to use the results in your AIMMS models. This document describes how to set up and use these services.


Create the Python service
-------------------------

When you want to expose eg. a Python script as a REST service such that it can be called from AIMMS, we recommend using Fast API (https://fastapi.tiangolo.com/). Fast API is a Python framework for building APIs. It is easy to use, and it is very fast. It also has a built-in Swagger UI, which makes it easy to test your API.

Below is an example of a Python script that can be called from AIMMS. It takes a list of numbers as input, and returns a list of the squares of these numbers as output.

.. code-block:: python

    from typing import List

    import uvicorn
    from fastapi import FastAPI
    from pydantic import BaseModel

    app = FastAPI()


    class MultiplyInput(BaseModel):
        p: List[float] = []


    class MultiplyOutput(BaseModel):
        q: List[float] = []


    @app.post("/compute", response_model=MultiplyOutput)
    async def compute(inp: MultiplyInput) -> MultiplyOutput:
        out = MultiplyOutput()
        for pp in inp.p:
            out.q.append(pp * pp)

        return out


    if __name__ == "__main__":
        uvicorn.run("main:app", host="", port=8000, log_level="info")

When you run this server, you can navigate to <http://localhost:8000/docs> to get a swagger UI to test your python rest server. Additional navigating to <http://localhost:8000/openapi.json> will result in the OpenAPI json specification that can be used together with AIMMS DEX to generate an AIMMS runtime library that will facilitate calling and retrieving the results of your HTTP REST service.


Integrating with an AIMMS model
-------------------------------

You can use the following AIMMS code snippet to generate the AIMMS runtime library:

.. code-block:: aimms

    dex::schema::GenerateClientFromOpenAPISpec(
        schemaFile      :  "mulpy/openapi.json", 
        schemaName      :  "MultiplyPython", 
        schemaPrefix    :  "mulpy", 
        explodeDefault  :  2, ! do not generate instance index
        generateXMLData :  0);


Here we chose to set explodeDefault to 2 which means that we do not need to generate separate requests for each time we call the service, please refer to the AIMMS DEX documentation for more information.
In our example we copy over the set S and parameter P into the generated input structure and retrieve the result into the parameter Q, as shown below:

.. code-block:: aimms

    mulpy::_MultiplyInput::_p::p_iter := S;
    mulpy::_MultiplyInput::_p::p( i ) := P( i );

    mulpy::api::compute_compute_post::apiCall();

    Q( i ) := mulpy::_MultiplyOutput::_q::q( i );


Starting the service in the AIMMS Cloud
---------------------------------------

For your application to become available in our cloud, you can upload to PRO storage. 

.. code-block:: aimms

    appStoragePath := "PublicData/ServiceApp/mulpy.zip";
	localApp := "mulpy/mulpy.zip";
	! if the app does not exist, upload it first
	appExists := 0;
	pro::management::LocalLogInfo("Checking if '" + appStoragePath + "' exists on PRO storage");
	pro::storage::ExistsObject(appStoragePath, appExists);
	if (appExists <> 1) then
		pro::management::LocalLogInfo("'" + appStoragePath + "' does not exist, uploading '"+localApp+"'");
		pro::SaveFileToCentralStorage(localApp, appStoragePath);
	else
		pro::management::LocalLogInfo("'" + appStoragePath + "' exists");
	endif;

When that has been done you now can ask our PRO platform to start the service. This is done by calling the PRO procedure:

.. code-block:: aimms

    pro::service::LaunchService(
        connectionURI      :  remoteURL, 
        serviceId          :  "MultiplicationService", 
        imageName          :  "services/aimms-anaconda-service", 
        imageTag           :  "2023.07-1", 
        listenPort         :  8000, 
        storedApp          :  "pro://" + appStoragePath, 
        cmdLine            :  "python3 main.py"
    )

The parameters are:
 
* connectionURI: output parameter which will store the URL of service on which it will be reachable on the PRO platform
* serviceId: the unique name of the service, when you multiple applications or session use the same serviceId they will get directed to the same service instance
* imageName: the name of the docker image to use, this is a preconfigured image that contains the Python runtime and some additional libraries
* imageTag: the tag of the docker image to use, this represent the version of the above image, see below for available images
* listenPort: the port on which the service accept incoming requests, this is the same port number as specified in the Python script `uvicorn.run("main:app", host="", port=8000, log_level="info")`
* storedApp: the location of where the zip file can be retrieved. This can be in PRO storage, a general URL or an image-local file. The zip file should contain the Python script and any additional files that are needed to run the service
* cmdLine: the command line to start the service, note that this is a space separated list of arguments, if you need to pass arguments that contain spaces you need to use the more advanced LaunchServiceJson.

Function Reference:
-------------------

LaunchService
^^^^^^^^^^^^^

.. code-block:: aimms

    pro::service::LaunchService(
        connectionURI,
        serviceId,
        imageName,
        imageTag,
        listenPort,
        storedApp,
        cmdLine,
        envVars,
        maxRuntime, 
        maxIdle,
        performanceProfile
    )

The parameters are:

* connectionURI: output scalar string parameter which will store the URL of service on which it will be reachable on the PRO platform
* serviceId: scalar string parameter that represents the unique name of the service, when you multiple applications or session use the same serviceId they will get directed to the same service instance
* imageName: scalar string parameter that represents the name of the docker image to use 
* imageTag: scalar string parameter that represents the tag of the docker image to use
* listenPort: scalar integer parameter that represents the port on which the service accept incoming requests
* storedApp: scalar string parameter that represents the location of where the zip file can be retrieved. This can be in PRO storage, a general URL or an image-local file. The zip file should contain the Python script and any additional files that are needed to run the service
* cmdLine: scalar string parameter that represents the command line to start the service, note that this is a space separated list of arguments, if you need to pass arguments that contain spaces you need to use the more advanced LaunchServiceJson.
* envVars: scalar string parameter that represents a space separated set of environment variable name value pairs, like 'RUNLEVEL=3,CONFIGURL=http://google.com'
* maxRuntime: scalar integer parameter that represents the maximum runtime of the service in seconds, after this time the service will be terminated.
* maxIdle: scalar integer parameter that represents the maximum idle time of the service in seconds, after this time the service will be terminated.
* performanceProfile: scalar string parameter that represents the performance profile to use; currently this is not used yet, but future versions might use this performance profile to determine the amount of resources (CPU and memory) to allocate to the service

LaunchServiceJson
^^^^^^^^^^^^^^^^^

.. code-block:: aimms

    pro::service::LaunchServiceJson(
	connectionURI,
	jsonSpec,
	storedApp,
	maxRuntime,
	maxIdle, 
	performanceProfile)

The parameters are:

* connectionURI: output scalar string parameter which will store the URL of service on which it will be reachable on the PRO platform
* jsonSpec: scalar string parameter that represents the JSON specification of the service to launch, this is a JSON object that should have the following format:

.. code-block:: json

    {
        "serviceId": "MultiplicationService",
        "image" : {
            "name": "services/aimms-anaconda-service",
            "tag" : "2023.07-1"
        },
        "appConfig": {
            "argv" : [ "python3", "main.py" ],
            "env"  : [ 
                {"name": "RUNLEVEL", "value": "3"}, 
                {"name": " CONFIGURL", "value": "http://google.com"} 
            ],
            "listenPort" : 8000
        }
    }


* storedApp: scalar string parameter that represents the location of where the zip file can be retrieved. This can be in PRO storage, a general URL or an image-local file. The zip file should contain the Python script and any additional files that are needed to run the service
* maxRuntime: scalar integer parameter that represents the maximum runtime of the service in seconds, after this time the service will be terminated.
* maxIdle: scalar integer parameter that represents the maximum idle time of the service in seconds, after this time the service will be terminated.
* performanceProfile: scalar string parameter that represents the performance profile to use; currently this is not used yet, but future versions might use this performance profile to determine the amount of resources (CPU and memory) to allocate to the service




Available images:
-----------------
* python: 
    - services/aimms-anaconda-service 2023.07-1
* R: 
    - services/aimms-r-service 4.3.1



.. spelling:word-list::

    explodeDefault
    connectionURI
    serviceId
    imageName
    preconfigured
    imageTag
    listenPort
    storedApp
    cmdLine
    envVars
    maxRuntime
    maxIdle
    performanceProfile
    jsonSpec
    aimms
    projectCategory
		isLatest
    isWebUI
    iconUrl
