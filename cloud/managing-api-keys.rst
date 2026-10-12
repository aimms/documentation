Managing API Keys
=================

This REST API Service allows you to retrieve all API Keys, create and delete an API Key on your cloud environment. Please see the API specs (Authentication section) for the detailed usage.

API Key management has moved from the PRO REST API to the **User Manager API Service**. Both endpoints are currently supported, however we recommend updating your integrations to use the new service endpoint as the previous endpoint will be deprecated in a future release.

Previous Service Endpoint: ``https://[account-name].aimms.cloud/pro-api/v1/api-keys``

New Service Endpoint: ``https://[account-name].aimms.cloud/pro/user-manager/v1``

API Keys are the primary resources managed by this service. An API Key has the following properties,

* **name** - A unique identifier for the key
* **expiration_date** - Expiry date of the key (maximum 1 year from creation date)
* **scopes** - One or more scopes defining the key's permissions
* **value** - The actual API key value, returned only once at creation time

Operations supported by the User Manager REST API to manage API Keys,

* ``GET /pro/user-manager/v1/user/@current/api-key`` - To retrieve all API keys for the current user
* ``POST /pro/user-manager/v1/user/@current/api-key`` - To create a new API key
* ``DELETE /pro/user-manager/v1/user/@current/api-key/{name}`` - To delete an API key by name
* ``GET /pro/user-manager/v1/user/@current/authorization-scopes`` - To retrieve all available authorization scopes

Available scopes that can be assigned to an API key,

* **Authentication** - Allows operations on Environments, Groups, and Users
* **PublishApp** - Allows management of AIMMS applications (e.g., publishing, updating, editing, and deleting apps)
* **PublishAimms** - Allows publishing of AIMMS versions to the Cloud Portal
* **Tasks** - Allows management of Tasks
* **APIKey** - Permits operations on API keys themselves (e.g., creating and deleting keys)
* **Session** - Enables operations related to WebUI, Solve, and Task sessions (e.g., retrieving session information, logs, terminating, or deleting a session)
* **Secret** - Allows management of Secrets stored in the Cloud Portal
* **User** - Allows user specific operations. Reserved for future use.
* **Account** - Allows operations related to account-level management and configuration



 
