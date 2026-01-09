AIMMS PRO REST API
==================

Currently we provide two APIs to PRO: the new PRO REST API service described here, released 2022, and the legacy `Java/C# API <../pro/api.html>`_. We recommend the use of the PRO REST API Server for all new applications, because it has more functionality and typically requires less time to implement. 

The AIMMS PRO REST API follows modern REST API design principles, and is designed following the `OpenAPI Specification <https://swagger.io/specification/>`_ such that you can automatically generate your client code. Our goal of this REST API Service is to give you ‘programmatic access’ to our AIMMS PRO Cloud Platform. The AIMMS PRO REST API allows users to securely interact with the AIMMS PRO Cloud Platform via a REST interface. 

.. note::

	The AIMMS PRO REST API is available only on our Azure Cloud Platform. It is *not* supported on on-premise PRO installations.

AIMMS PRO REST API also supports all the functionality provided by our existing AIMMS PRO Java/C# API. Please consider switching to the PRO REST API if you are already using our Azure Cloud Platform.

We support following services(functionality) through the AIMMS PRO REST API:


.. toctree::
   :maxdepth: 1

   managing-users
   managing-apps
   managing-sessions
   managing-tasks
   managing-secrets
   managing-api-keys
	
			
The full OpenAPI specification of the AIMMS PRO REST API itself can be downloaded in YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro-api/v1/``. 

API Keys and Scopes
-------------------

Requests made to the PRO REST API are authenticated/authorized by means of *API Keys*.
Users can generate *API Keys* from their PRO Portal's `User settings <https://documentation.aimms.com/cloud/newportal-usersettings.html>`_ page 

Managing AIMMS
--------------

This REST API Service allows you to retrieve all available AIMMS Versions on Cloud and retrieve the information about specific AIMMS Version. Please see the API specs (*Publishing* section) for the detailed usage.

	* ``GET /aimms-versions`` - returns official AIMMS versions
	* ``GET /aimms-versions?dev=true`` - returns all available AIMMS versions (development, feature, internal, integration_tests)

.. spelling:word-list::

    projectCategory
		isLatest
    isWebUI
    iconUrl
