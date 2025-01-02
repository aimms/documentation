Managing Sessions
=================

AIMMS PRO REST API is extended with a new API service called session-manager, which allows you to interact with WebUI and Task Sessions. Requests made to the session-manager are authenticated/authorized by API Key with *session* scope.

The full OpenAPI specification of this service can be downloaded in YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro/session-manager/v1/openapi.yaml``.

Service Endpoint: ``https://[account-name].aimms.cloud/pro/session-manager/v1``

Operations supported by session-manager REST API to interact with WebUI sessions,

* ``GET /pro/session-manager/v1/sessions/webui`` - To get the list of WebUI sessions. It accepts various filters and pagination.
* ``GET /pro/session-manager/v1/sessions/webui/{session-id}`` - To get the information of the specified WebUI session.
* ``GET /pro/session-manager/v1/sessions/logs/webui/{session-id}`` - To retrieve the WebUI session logs. It accepts various filters and pagination.
* ``DELETE /pro/session-manager/v1/sessions/webui/{session-id}`` - To terminate a running WebUI session.

.. note::

	There are some limitations when it comes to the support for the WebUI sessions. For example, those sessions only have two states (Running and Terminated). Furthermore, the ended_at field will always be null, and the message is always empty.

Operations supported by session-manager REST API to interact with Task sessions,

* ``GET /pro/session-manager/v1/sessions/task`` - To get the list of Task sessions. It accepts various filters and pagination.
* ``GET /pro/session-manager/v1/sessions/task/{session-id}`` - To get the information of the specified task session.
* ``GET /pro/session-manager/v1/sessions/logs/task/{session-id}`` - To retrieve the task session logs. It accepts various filters and pagination.
* ``DELETE /pro/session-manager/v1/sessions/webui/{session-id}`` - To terminate a running task session.

.. note::

	Deleting task sessions will force the task's job to terminate on the cluster. This makes the task's session unreachable, and it takes some time for the task scheduler to consider the session as dead. It is advised to use the task API interrupt endpoint to stop a task without forcefully killing the session.
	
Please use OpenAPI specs for the exhaustive list of endpoints and supported parameters.
