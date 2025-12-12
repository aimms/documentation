Workflow for accessing cloud-hosted services
============================================

API Information
---------------

Getting a Service URI
^^^^^^^^^^^^^^^^^^^^^

* Endpoint: ``GET /pro/session-manager/v1/sessions/{session_id}/{service}/uri``
* session_id: The Session ID that can be retrieved inside AIMMS with ``pro::sessionmanager::GetSessionId(SessionId);``
* service: Can be either a port number or a predefined service.
* Port numbers: Can be any port numbers between 12000 and 12010 (inclusive).
* Predefined services: Webui (port 12002), Dex (port 12003)
* Response: ``https://example.aimms.cloud/session/12004@68ce8ce7c4a6fd1afa97672e7080d645``

Getting an Auth Token
^^^^^^^^^^^^^^^^^^^^^

Endpoint: ``POST /pro/auth/v1/token/exchange``

* Request Body: json

.. code-block:: php
    
	{
		"target_list": [
		{
		"path": "string",
		"type": "exact",
		"level": "read"
		}
	]
	}

* Path: The path to give authorization to i.e. `/session/12000@68ce8ce7c4a6fd1afa97672e7080d645`
* Type:
	* Exact: Only authorize the exact specified path
	* Prefix: Authorize all paths starting with the specified path
* Level:
	* read: Only authorize GET, HEAD, OPTIONS, TRACE HTTP methods
	* read_write: Authorize all HTTP methods
* Response: The bearer token is set in the Authorization header of the response as: `Bearer <token>`

Accessing a Service from within AIMMS Session or via API
--------------------------------------------------------

The AIMMS way
^^^^^^^^^^^^^

The `GetServiceAccess(service, serviceUri, bearerToken)` procedure provides all necessary information.

1. Run `GetServiceAccess('12004', serviceUri, bearerToken)`
2. serviceUri output: `https://example.aimms.cloud/session/12000@68ce8ce7c4a6fd1afa97672e7080d645`
3. bearerToken output: `Bearer anexamplebearertoken123`
4. Accessing the service: `curl -H 'Authorization: Bearer anexamplebearertoken123' https://example.aimms.cloud/session/12004@68ce8ce7c4a6fd1afa97672e7080d645`

The API way
^^^^^^^^^^^

1. Run ``GetSessionId(SessionId);``
2. sessionId output: ``68ce8ce7c4a6fd1afa97672e7080d645``
3. Get the service URI ``GET https://example.aimms.cloud/pro/session-manager/v1/sessions/68ce8ce7c4a6fd1afa97672e7080d645/12004/uri``
4. Response: ``https://example.aimms.cloud/session/12004@68ce8ce7c4a6fd1afa97672e7080d645``
5. Get the bearer token: ``POST https://example.aimms.cloud/pro/auth/v1/token/exchange`` with the following body

.. code-block:: php

	{
	"target_list": [
		{
		"path": "/session/12004@68ce8ce7c4a6fd1afa97672e7080d645",
		"type": "prefix",
		"level": "read_write"
		}
	]
	}

6. Response: ``Authorization: Bearer anexamplebearertoken123``
7. Accessing the service: ``curl -H 'Authorization: Bearer anexamplebearertoken123' https://example.aimms.cloud/session/12004@68ce8ce7c4a6fd1afa97672e7080d645``


AIMMS Implementation
--------------------

**Getting a Session ID**:

Procedure: ``pro::sessionmanager::GetSessionId(sessionId);``

* sessionId: The output string parameter, which will contain the id of the session.

**Getting a Service URI and Auth token**:

Procedure: ``pro::sessionmanager::GetServiceAccess(service, serviceUri, bearerToken)``

* service: An input string parameter, which holds either a port number or a predefined service
* Port numbers: Can be any port numbers between 12000 and 12010 (inclusive).
* Predefined services: Webui (port 12002), Dex (port 12003)
* serviceUri: An output string parameter, which will contain an URI to access the service
* bearerToken: An output string parameter, which will contain a bearer token to authorize access to the service