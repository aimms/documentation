AIMMS PRO REST API
==================

The AIMMS PRO REST API allows users to securely interact with the AIMMS PRO cloud
platform via a REST interface. This API is designed following the
`OpenAPI Specification <https://swagger.io/specification/>`_ . The API itself can be downloaded in
YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro-api/v1/``. The PRO REST API is
only available for the PRO Platform running in the Azure Cloud.

Security
--------

Requests made to the PRO REST API are authenticated/authorized by means of *API Keys*.
Users can generate *API Keys* from their PRO Portal *Account settings* page by clicking
the *Add API Key* button:

.. image:: images/api-keys1.jpg
    :align: center

Pressing this button will open a new *API Key* editor, where the user can fill in
details regarding the key they want to create. The user should specify a key name,
an expiration date, as well as the *Scopes* for that key. Scopes are the
mechanism by which the user can restrict privileges for a given API key to
subsets of the PRO REST API:

1. The *Authentication* scope allows CRUD operations on Users/Groups
2. The *PublishAIMMS* scope allows operations on AIMMS Versions.
3. The *PublishApp* scope allows CRUD operations on AIMMS apps.

.. image:: images/api-keys2.jpg
    :align: center

Pressing the *Save* button will generate a new API key with the properties selected by the user.
The new key is shown to the user in a pop-up window:

.. image:: images/api-keys3.jpg
    :align: center

The key will only be shown in plain text once (for security reasons) - so the user
is advised to copy it ans store it securely. This key should be sent in the *apikey*
header for every REST call the user want to make using this key for
authentication/authorization.

Setting up Postman for REST API CALLS
----------------------------------------
This is an example on how to use `Postman <https://www.postman.com/>`_ in order
to perform CRUD operations an AIMMS applications using the PRO REST API:

1. Start in the Postman request view:

.. image:: images/RequestView.PNG
    :align: center

2. Based on the API method to be tested, select the GET/PATCH/POST/DELETE
command from the drop down menu.

3. The request URL depends on the API spec. In some cases, request parameters are present in the URL.
Examples of the URL:

.. code-block:: php

        https://[account-name].aimms.cloud/pro-api/v1/applications

        https://[account-name].aimms.cloud/pro-api/v1/applications/{projectName}/{projectVersionId}

To know what URL should be used, check the corresponding API spec.

4. Within the scope of CRUD on applications, add an "apikey" header with the api key value.
Note that the header name must correspond to what is defined in the api spec. Make sure to tick the checkbox
after adding the "apikey" field. The rest of the header fields remain unchanged.

.. image:: images/HeadersView.PNG
    :align: center


Application Upload (POST)
--------------------------

1. When publishing an application it is necessary to provide two fields: ``metadata`` and ``file``.
The field ``metadata`` needs to be provided in json format. The ``file`` field is a file upload that
requires to point to a specific location. Example: ``(C:\Users\UserName\Postman\files)``.
Insert the desired *.aimmspack* in files directory and point to this directory when uploading a ``file``.
Dont forget to select ``form-data`` format. Also note that both ``metadata`` and ``file`` names correspond
to ones defined in the API spec.

.. image:: images/PostView.PNG
    :align: center


The ``metadata`` example is provided below:

.. code-block:: php

        {
            "name": "project7003",
            "description": "my_project",
            "projectVersionId": "3.0",
            "aimmsVersionId": "4.84.1.5-linux64-x64-vc141",
            "attributes": {
                "additionalProp1": "prop_1",
                "additionalProp2": "prop_2",
                "additionalProp3": "prop_3",
                "isWebUI": "false",
                "iconUrl": "/icons/my_logo"
            },
            "projectCategory": "cat_1"
        }  


Application Update (PATCH)
--------------------------

1. When updating an application, it is necessary to provide the body in JSON. Do not forget to select
the "raw" format.

.. image:: images/PatchView.PNG
    :align: center

2. For an application update, the following arguments can be used (if an argument is not provided, then it wont be changed):

* **Project description** ("description")

* **Project category** ("projectCategory")

* **Latest app tag** ("isLatest"): latest app tag cannot be explicitly disabled for the selected app. When assigning the latest tag to an app ("isLatest": true), it will be automatically removed from all other app with the same name.  

* **Project attributes** ("attributes"): project attributes represent a list of key-value pairs that allow to store additional information about the project. There are two reserved keywords: 
   1) "isWebUI" key shows if a project is a web UI ("isWebUI": "true") or a win UI project ("isWebUI": "false")

   2) "iconUrl" key points to the location of the application icon to uploaded. Note that "/icons/" is a fixed path prefix and that the app icon must first be uploaded to the PRO storage under a given label (e.g. "my_logo"). Once the icon is placed in the PRO storage, it can be used for app publishing. 

* **Project authorizations** ("authorizations"): project authorizations represent a list of entries, where each entry consists of three fields. See an example of an authorization entry below:

.. code-block:: php

        {
            "authorization": 1,
            "deny": false,
            "entity": 16777095
        }

The "entity" field is a unique ID of either environment, group or user which can be retrieved using the authentication rest API. The "authorization" value varies from 1 to 7 is directly related to read ("authorization": 4), write ("authorization": 2) and execute ("authorization": 1) access. In order to enable multiple authorizations, add up the respective numbers. For example, ""authorization": 5" corresponds to read and execute access. The "deny" field is "true" or "false" when authorization is not, or is permitted.
It is also possible to grand the read permission and restrict the write permission for the same entity ID. This would look like the following:

.. code-block:: php

        {
            "authorization": 4,
            "deny": false,
            "entity": 16777095
        }

        {
            "authorization": 2,
            "deny": true,
            "entity": 16777095
        }

In order to completely remove permissions from an app, assign permissions to an empty list. This can be done as follows:

.. code-block:: php

        "authorizations": []
     

Example: Using Postman to Activate an AIMMS Version
---------------------------------------------------
Postman can also be used to activate an AIMMS version via the REST API. The same basic one to four steps should be
followed as in the previous example. The last step is to perform the actual activation. This is done by performing
a ``PATCH`` operation on the ``https://[account-name].aimms.cloud/pro-api/v1/aimms-versions`` endpoint using the
body described in ``AimmsVersion.yaml`` in the API schema:

.. code-block:: aimms

        {
            "activated": true,
            "authorization": [],
            "id": "4.82.9.1-linux64-x86-vc141"
        }

CRUD on Tasks
--------------------------
The Data Exchange (DEX) library is capable of exposing procedures in an AIMMS model as a REST API. Invoking such
procedures via this (DEX-exposed) REST API creates ``tasks`` which run in the same AIMMS session as the DEX library
exposing them. Consuming and providing REST APIs using the DEX library is documented `here <../dataexchange/rest-server.html>`__.

The AIMMS PRO REST API allows users to perform CRUD operations on DEX-exposed tasks, supporting the following:

1. Creating tasks (POST). Once a task is created, it will eventually run on the PRO Cloud infrastructure.
2. Retrieving a task's status/results (GET).
3. Interrupting a task (PUT). This allows the task to complete earlier.
4. Deleting a task (DELETE). It can delete 'QUEUED' or 'COMPLETED' tasks.

The CRUD Task operations supported by the AIMMS PRO REST API closely mirror the REST API exposed by DEX, with the exception of
the PUT command: while DEX supports both ``interrupt-execution`` and ``interrupt-solve`` in the PUT body, the PRO REST
API only supports ``interrupt-solve``. The reason for this is that ``interrupt-execution`` terminates the AIMMS session
running the task, and on PRO Cloud such sessions are not controllable by the API user, but rather directly managed by PRO.

Tasks will be queued by PRO in the creation order. PRO will launch these tasks to run on Cloud infrastructure in the order they
are queued. PRO will attempt to parallelize task execution, potentially having multiple tasks running at the same time up to
a maximum degree of task parallelism (configurable per account).

A PRO account needs special configuration in order to use CRUD on Tasks via the PRO REST API. Essentially, such configuration
will create a special license profile specifying the number of concurrent tasks a user may run via the API (by default this is zero).
To enable this special "REST" profile please contact the AIMMS Customer Support.

Once this "REST" profile has been enabled for an account, users for that account can start making task-related calls via the
PRO REST API. Such calls are authenticated via the same types of API keys as all the other PRO REST API calls. In order to be allowed to perform
task-related operations, a given API key needs to have the "Task" scope.

Finally, authorization to perform task-related calls is linked to the permissions the user (for whom the API key is used for authentication)
has with respect to the AIMMS App that is exposing the DEX REST API:

1. Create/Interrupt/Delete operations require that user to have ``Read`` and ``Execute`` permissions on that app.
2. Retrieve operations require that user to have ``Read`` permissions on that app.

CRUD on tasks is only supported starting from PRO Release 2.45, and will work only for AIMMS apps published with
AIMMS version 4.89 and higher, and using the DEX library 1.3.2.71 or higher.


.. spelling::

    projectCategory
	isLatest
    isWebUI
    iconUrl
