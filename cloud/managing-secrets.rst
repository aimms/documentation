Managing Secrets
================

The AIMMS PRO REST API is extended with a new API service called secret-manager, which provides APIs for secure storage and management of customer and user secrets within the PRO environment.

The full OpenAPI specification of this service can be downloaded in YAML/JSON format from the link ``https://[account-name].aimms.cloud/pro/secret-manager/v1/openapi.yaml``.

Service Endpoint: ``https://[account-name].aimms.cloud/pro/secret-manager/v1``

Items are the primary resources managed by the service and are of two types,

* **Directory**: A container that can hold directories and secrets
* **Secret**: A leaf resource that stores sensitive content

Operations supported by secret-manager REST API to manage items,

* ``GET /pro/secret-manager/v1/item/{path}`` - To get an item
* ``POST /pro/secret-manager/v1/item/{path}`` - To create an item 
* ``PATCH /pro/secret-manager/v1/item/{path}`` - To modify an item
* ``DELETE /pro/secret-manager/v1/item/{path}`` - To delete an item

.. note::

	By default root directory(/) is already created and available to all Admin users. Non-admin user has access to nothing, so access must be given to the root directory first of all.

Items can be accessed by AIMMS PRO users and groups. Only **Admin** users are allowed to manage access of any item using following operations,

* ``GET /pro/secret-manager/v1/access/{path}`` - To get entities with access to an item
* ``PUT /pro/secret-manager/v1/access/{path}`` - To create/modify an access entity
* ``DELETE /pro/secret-manager/v1/access/{path}`` - To delete an access entity
	
Item Access Management
----------------------

* Only **Admin** users can manage access for any item.
* Item access can be configured at either the group level or the user level.
* When an item is created, it inherits access permissions from its parent directory. Parent permissions are used only at creation time and do not grant implicit access afterward.
* Access is always evaluated on the resource itself, not on parent directories.


**Access Types for directory**:
	* read access: Allows listing items under the directory only
	* read_write access: Allows listing items, creating new items under the directory and deleting empty directory
**Access Types for secrets**:
	* read access: Allows reading the secret content only
	* read_write access: Allows reading, modifying and deleting the secret




 



 
