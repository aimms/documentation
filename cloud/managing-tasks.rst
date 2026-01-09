Managing Tasks
==============

The Data Exchange (DEX) library is capable of exposing procedures in an AIMMS model as a REST API. Invoking such
procedures via this (DEX-exposed) REST API creates ``tasks`` which run in the same AIMMS session as the DEX library
exposing them. Consuming and providing REST APIs using the DEX library is documented `here <../dataexchange/rest-server.html>`__.

The AIMMS PRO REST API allows users to perform operations on DEX-exposed tasks, supporting the following:

* ``POST /pro-api/v2/tasks/{appName}/{appVersion}/{serviceName}`` - To run a task inside an application.
* ``POST /pro-api/v2/tasks/{appName}/{serviceName}`` - To run a task inside the latest version of the application.
* ``GET /pro-api/v2/tasks`` - To get all tasks user has access to.
* ``GET /pro-api/v2/tasks/{id}`` - To get a single task.
* ``GET /pro-api/v2/tasks/{id}/response`` - To get task response.
* ``GET /pro-api/v2/tasks/{id}/logs`` - To get task logs.
* ``GET /pro-api/v2/tasks/{id}/logs/download`` - To download task logs.
* ``GET /pro-api/v2/tasks/stats`` - To get task stats.
* ``GET /pro-api/v2/tasks/stats/current`` - To get task current stats.
* ``PUT /pro-api/v2/tasks/{id}`` - To interrupt a task. This allows the task to complete earlier or terminate it.
* ``DELETE /pro-api/v2/tasks/{id}`` - To delete a task. It can delete 'QUEUED' or 'COMPLETED' tasks.

These Task operations supported by the AIMMS PRO REST API closely mirror the REST API exposed by DEX.

Tasks will be queued by PRO in the creation order. PRO will launch these tasks to run on Cloud infrastructure in the order they
are queued. PRO will attempt to parallelize task execution, potentially having multiple tasks running at the same time up to
a maximum degree of task parallelism (configurable per account).

A PRO account needs special configuration in order to use the Tasks REST API. Essentially, such configuration
will create a special license profile specifying the number of concurrent tasks a user may run via the API (by default this is zero).
To enable this special "REST" profile please contact the AIMMS Customer Support.

Once this "REST" profile has been enabled for an account, users for that account can start making task-related calls via the
PRO REST API. Such calls are authenticated via the same types of API keys as all the other PRO REST API calls. In order to be allowed to perform
task-related operations, a given API key needs to have the "Task" scope as explained `here <https://documentation.aimms.com/cloud/rest-api.html#api-keys-and-scopes>`_

Finally, authorization to perform task-related calls is linked to the permissions the user (for whom the API key is used for authentication)
has with respect to the AIMMS App that is exposing the DEX REST API:

1. Create/Interrupt/Delete operations require that user to have ``Read`` and ``Execute`` permissions on that app.
2. Retrieve operations require that user to have ``Read`` permissions on that app.

**REST Session Idle Time**

1. There is a "Max REST Session Idle Time" parameter at account level which will determine, per account, how much longer to keep a REST session in Idle state (e.g. waiting for potential new tasks for the same app/version so they can start right away for ). By default this will be 5min, so there will be no visible change compared to the current task execution behavior. (Please contact AIMMS Customer Support if you want to change this for your cloud account)
2. Model developers will be able to alter the behavior of their REST DEX sessions via the DEX API, for example specifying the maximum number of tasks that should be run on a given session, and potentially reducing this Idle running time, up to a minimum (set to the current default of 5 minutes) which is required to ensure we can always collect task status from a session before it terminates.
3. The REST Server will no longer automatically terminate Idle sessions, but rather let them run idle until they automatically terminate. The REST Server will pass the "Max REST Session Idle Time" value for the account to the DEX session via a special "X-Aimms-Max-Idle-Time" header each time a new task is launched.
4. As part of the task status response, the DEX session will include one additional field "Accept-More-Tasks" (true/false), which will determine if that session is willing to accept more task requests once the current task completes.

**Interrupting a task**
-----------------------

1. interrupt-solve: interrupting the solves that are running within the tasks. This can be achieved by sending ``"setstatus": "interrupt-solve"`` message to DEX in the body of the PUT request. As a result, task will be finished early and task status will be 'completed'.  
2. interrupt-execution: interrupting the task execution itself outside of the solve. This can be achieved by sending ``"setstatus": "interrupt-execution"`` message to DEX in the body of the PUT request. As a result, task execution will be interrupted and task status will be 'failed'.

Run a task from the 'latest' version of an app
----------------------------------------------

Tasks REST API V2 is now extended with 'latest' tag support for appVersion. It is possible to run a task from the 'latest' version of an application.

When the appVersion is not specified in create task request it look for the latest tag and if there is one, the task will be scheduled with that version, otherwise, an error is thrown. For example,

.. code-block:: php

        https://[account-name].aimms.cloud/pro-api/v2/tasks/Testapp/JobSchedule
		
For above request, it will find a 'latest' version of 'Testapp' and schedule a task. If there is no version tagged as 'latest' then it will throw an error i.e. App Testapp with latest tag doesn't exist.

When the appVersion is specified in create task request it schedule a task with that specific appVersion.

.. code-block:: php

        https://[account-name].aimms.cloud/pro-api/v2/tasks/Testapp/1.0/JobSchedule
		
For above request, it will schedule a task for TestApp version 1.0.

.. note::

   The `appName` and `appVersion` parameters in the ``GET /tasks`` endpoint are now **optional**. This allows more flexible queries when retrieving tasks owned by the user.

Tasks REST API V2
-----------------

The full OpenAPI specification of this service can be downloaded in YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro-api/v2/``.

Service Endpoint: ``https://[account-name].aimms.cloud/pro-api/v2/tasks``

.. note::

   The Tasks REST API **v2** is supported starting from AIMMS PRO **2.52**, AIMMS version 4.89 or higher with DEX library **2.1.2.48** or higher.

.. note::

   Some of the request/response parameters has been changed in v2 as listed below, please check and adapt your applications accordingly.
   
   **Task Status(v1):** queued, executing, solving, interrupted or finished
   
   **Task state(v2):** queued, assigned, running, solving, failed or completed

.. csv-table:: 
   :header: "v1", "v2"
   :widths: 10, 10

    projectName , appName 
	projectVersion , appVersion
	service , serviceName
	status , state 
	runtime , runTime 
	queuetime , queueTime 
	returncode , returnCode 
	errormessage , errorMessage 
	statuses , current_batch
	total_size , total_tasks
	
Request a task call back
------------------------

When users create tasks (POST), they can specify an optional HTTP header named *taskStateHook* specifying the hook URL which task service will call on any changes in the created task state starting from queued to completed or failed. The task scheduler will call this hook semi-passively, meaning there's a strict timeout, no retry, and no redirect. This is to reduce the load incurred to our service when a hook target is unavailable or not responsive.

The following query parameters are added to the hook URL which is called using the HTTP **PUT** method:
  
    - *task_uuid*: Identifies the task that its state is changed.
    - *task_state*: The new state of the task.
    - *at*: The time point that the hook is being invoked. This is to prevent potential replay attacks.
    - *hmac*: If the hook URL contains a query parameter with the name 'key', then an HMAC is calculated based the the value of it and the task's UUID. The hook receiver can use this HMAC to validate the authenticity of the call. The original 'key' query parameter will be removed from the call.
	
Schedule Task(s)
----------------

3 new query parameters are added to **create-task** endpoint:

	- *scheduleFor*: This optional parameter indicates the time point a task should run after it. The task won't start until after the time point is passed. The format of this parameter is YYYY-MM-DD hh:mm:ss.ms +/-HH:MM. After the minutes, everything else is optional. If the timezone offset is not specified, the time will be considered in UTC.
	- *scheduleIn*: This optional parameter indicates the interval a task should run after. The task won't start until after the interval is passed. The format of this parameter is either ISO8601 format like P1DT2H3M4S or human-readable format for example 1 day or 2 weeks.
	- *scheduleInterval*: This optional parameter indicates that the task should be repeated in the given intervals. For example, if it's set to 1 day, the task will be scheduled for the next day after the initial schedule. Also a new property called *groupIndex* is added to the task object indicating its index within the group starting from zero. The first task with *scheduleInterval* will have *groupIndex=0* and subsequent runs will have the next groupIndexes in order. To stop the automated scheduling, the last scheduled task should be deleted. See below for how to delete the latest task in the group.
  
A new query parameter is added to **get-task**, **interrupt-task**, **delete-task**, and **get-task-response** endpoints.

	*groupIndex*:
		- This optional parameter indicates which index within the group should be used.
		- For tasks without *scheduleInterval*, this parameter can be avoided, and the previous behavior will be kept.	
		- For tasks with *scheduleInterval*, this parameter can be used to point to a specific index. If *groupIndex* is not set then last index will be used. For example, to delete the last task in the group and stop the automated scheduling, simply call the delete-task endpoint without specifying *groupIndex*.
  
The task object is extended with following new properties:

	- *scheduleFor*: Indicates when the task is scheduled to run. For tasks without *scheduleFor*, this property is set to null.
	- *scheduleInterval*: Indicates at what interval task should be repeated. For tasks without *scheduleInterval*, this property is set to null.
	- *groupIndex*: Indicates the index of the task within its group. All tasks within a group have the same UUID but different indexes. For tasks without *scheduleInterval*, this property is set to null.







  
