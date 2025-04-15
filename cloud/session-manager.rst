Managing Sessions
=================

AIMMS PRO REST API is extended with a new API service called session-manager, which allows you to interact with WebUI, Solve and Task Sessions. Requests made to the session-manager are authenticated/authorized by API Key with *session* scope.

The full OpenAPI specification of this service can be downloaded in YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro/session-manager/v1/openapi.yaml``.

Service Endpoint: ``https://[account-name].aimms.cloud/pro/session-manager/v1``

Operations supported by session-manager REST API to interact with WebUI sessions,

* ``GET /pro/session-manager/v1/sessions/webui`` - To get the list of WebUI sessions. It accepts various filters and pagination.
* ``GET /pro/session-manager/v1/sessions/webui/{session-id}`` - To get the information of the specified WebUI session.
* ``GET /pro/session-manager/v1/sessions/webui/{session_id}/logs`` - To retrieve the WebUI session logs. It accepts various filters and pagination.
* ``PATCH /pro/session-manager/v1/sessions/webui/{session_id}/terminate`` - To terminate a running WebUI session.
* ``DELETE /pro/session-manager/v1/sessions/webui/{session-id}`` - To delete the WebUI session.

.. note::

	There are some limitations when it comes to the support for the WebUI sessions. For example, those sessions only have two states (Running and Terminated). Furthermore, the ended_at field will always be null, and the message is always empty.

Operations supported by session-manager REST API to interact with Task sessions,

* ``GET /pro/session-manager/v1/sessions/task`` - To get the list of Task sessions. It accepts various filters and pagination.
* ``GET /pro/session-manager/v1/sessions/task/{session-id}`` - To get the information of the specified task session.
* ``GET /pro/session-manager/v1/sessions/task/{session-id}/logs`` - To retrieve the task session logs. It accepts various filters and pagination.
* ``PATCH /pro/session-manager/v1/sessions/task/{session-id}/terminate`` - To terminate a running task session.
* ``DELETE /pro/session-manager/v1/sessions/task/{session-id}`` - To delete the task session.

.. note::

	Deleting task sessions will force the task's job to terminate on the cluster. This makes the task's session unreachable, and it takes some time for the task scheduler to consider the session as dead. It is advised to use the task API interrupt endpoint to stop a task without forcefully killing the session.
	
Operations supported by session-manager REST API to interact with Solve sessions,

* ``GET /pro/session-manager/v1/sessions/solve`` - To get the list of solve sessions. It accepts various filters and pagination.
* ``GET /pro/session-manager/v1/sessions/solve/{session-id}`` - To get the information of the specified solve session.
* ``GET /pro/session-manager/v1/sessions/solve/{session-id}/logs`` - To retrieve the solve session logs. It accepts various filters and pagination.
* ``PATCH /pro/session-manager/v1/sessions/solve/{session-id}/terminate`` - To terminate a running solve session.
* ``DELETE /pro/session-manager/v1/sessions/solve/{session-id}`` - To delete the solve session.
	
Please use OpenAPI specs for the exhaustive list of endpoints and supported parameters.

.. note::

   Some of the enpoints are deprecated with the recent release of session-manager, please check and adapt your applications accordingly.
   
	* ``GET /sessions/logs/task/{session_id}``
	* ``GET /sessions/logs/webui/{session_id}``
	* ``DELETE  /sessions/task/{session_id}``
	* ``DELETE /sessions/webui/{session_id}``
 



 
