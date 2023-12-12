Running Tasks
=============

The Data Exchange (DEX) library is capable of exposing procedures in an AIMMS model as a REST API. Invoking such
procedures via this (DEX-exposed) REST API creates ``tasks`` which run in the same AIMMS session as the DEX library
exposing them. Consuming and providing REST APIs using the DEX library is documented `here <../dataexchange/rest-server.html>`__.

The AIMMS PRO REST API allows users to perform operations on DEX-exposed tasks, supporting the following:

1. Creating tasks (POST). Once a task is created, it will eventually run on the PRO Cloud infrastructure.
2. Retrieving a task's status/results (GET).
3. Interrupting a task (PUT). This allows the task to complete earlier.
4. Deleting a task (DELETE). It can delete 'QUEUED' or 'COMPLETED' tasks.

These Task operations supported by the AIMMS PRO REST API closely mirror the REST API exposed by DEX, with the exception of
the PUT command: while DEX supports both ``interrupt-execution`` and ``interrupt-solve`` in the PUT body, the PRO REST
API only supports ``interrupt-solve``. The reason for this is that ``interrupt-execution`` terminates the AIMMS session
running the task, and on PRO Cloud such sessions are not controllable by the API user, but rather directly managed by PRO.

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

**Run a task from the 'latest' version of an app**

Tasks REST API V2 is now extended with 'latest' tag support for appVersion. It is possible to run a task from the 'latest' version of an application.

When the appVersion is not specified in create task request it look for the latest tag and if there is one, the task will be scheduled with that version, otherwise, an error is thrown. For example,

.. code-block:: php

        https://[account-name].aimms.cloud/pro-api/v2/tasks/Testapp/JobSchedule
		
For above request, it will find a 'latest' version of 'Testapp' and schedule a task. If there is no version tagged as 'latest' then it will throw an error i.e. App Testapp with latest tag doesn't exist.

When the appVersion is specified in create task request it schedule a task with that specific appVersion.

.. code-block:: php

        https://[account-name].aimms.cloud/pro-api/v2/tasks/Testapp/1.0/JobSchedule
		
For above request, it will schedule a task for TestApp version 1.0.

Tasks REST API V1 and V2
------------------------

Currently we have two REST APIs for Tasks: v1 and v2, where **v2** is the latest implementation with more reliable and robust design which supports all the functionality provided by v1. We recommend the use of v2 for all new applications or please consider switching to v2 if you are already using v1.

.. important::

   Tasks REST API **v1** is available only till **January 31, 2024**. Please consider migrating to **v2** as soon as possible.

The full OpenAPI specification of this service can be downloaded in YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro-api/v2/``.

Service Endpoint: ``https://[account-name].aimms.cloud/pro-api/v2/tasks``

.. note::

   The Tasks REST API **v2** is supported starting from AIMMS PRO **2.52**, AIMMS version 4.89 or higher with DEX library **2.1.2.48** or higher.

.. note::

   Some of the request/response parameters has been changed in v2 as listed below, please check and adapt your applications accordingly.

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








  
