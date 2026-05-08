Managing Environments, Groups and Users
=======================================

The AIMMS PRO REST API is extended with the User Manager API service, which provides APIs for managing
environments, groups and users within your AIMMS Cloud account.

The full OpenAPI specification of this service can be downloaded in YAML/JSON format from the link
``https://[account-name].aimms.cloud/pro/user-manager/v1/openapi.yaml``.

Service Endpoint: ``https://[account-name].aimms.cloud/pro/user-manager/v1``

Environments
------------

An environment groups users within an account. Operations supported by the User Manager API to manage environments:

- ``GET /pro/user-manager/v1/environment`` - List environments, with optional query filters:

  - ``account_name_equal_cs`` / ``account_name_equal_ci`` - exact match on account name (case-sensitive / case-insensitive)
  - ``account_name_contain_cs`` / ``account_name_contain_ci`` - substring match on account name
  - ``account_name_in`` / ``account_name_not_in`` - include or exclude a comma-separated list of account names
  - ``environment_name_equal_cs`` / ``environment_name_equal_ci`` - exact match on environment name
  - ``environment_name_contain_cs`` / ``environment_name_contain_ci`` - substring match on environment name
  - ``environment_name_in`` / ``environment_name_not_in`` - include or exclude a comma-separated list of environment names
  - ``sort`` - sort by fields, prefix with ``-`` for descending order (e.g. ``-account_name,environment_name``)
  - ``offset`` / ``limit`` - pagination (default limit: 100)

- ``GET /pro/user-manager/v1/environment/{account_name}/{environment_name}/info`` - Get a specific environment by account and environment name

- ``GET /pro/user-manager/v1/environment/@current/info`` - Get the environment of the currently authenticated user

Each environment has the following properties:

- ``account_name`` - The name of the account the environment belongs to
- ``environment_name`` - The unique name of the environment within the account
- ``description`` - A human-readable description of the environment

Groups
------

A group belongs to an environment within an account. Operations supported by the User Manager API to manage groups:

- ``GET /pro/user-manager/v1/group`` - List groups, with optional query filters:

  - ``account_name_equal_cs`` / ``account_name_equal_ci`` - exact match on account name (case-sensitive / case-insensitive)
  - ``account_name_contain_cs`` / ``account_name_contain_ci`` - substring match on account name
  - ``account_name_in`` / ``account_name_not_in`` - include or exclude a comma-separated list of account names
  - ``environment_name_equal_cs`` / ``environment_name_equal_ci`` - exact match on environment name
  - ``environment_name_contain_cs`` / ``environment_name_contain_ci`` - substring match on environment name
  - ``environment_name_in`` / ``environment_name_not_in`` - include or exclude a comma-separated list of environment names
  - ``group_name_equal_cs`` / ``group_name_equal_ci`` - exact match on group name
  - ``group_name_contain_cs`` / ``group_name_contain_ci`` - substring match on group name
  - ``group_name_in`` / ``group_name_not_in`` - include or exclude a comma-separated list of group names
  - ``sort`` - sort by fields, prefix with ``-`` for descending order (e.g. ``-account_name,group_name``)
  - ``offset`` / ``limit`` - pagination (default limit: 100)

- ``GET /pro/user-manager/v1/group/{account_name}/{environment_name}/{group_name}/info`` - Get a specific group by account, environment and group name

Each group has the following properties:

- ``account_name`` - The name of the account the group belongs to
- ``environment_name`` - The name of the environment the group belongs to
- ``group_name`` - The unique name of the group within the environment
- ``description`` - A human-readable description of the group

Users
-----

A user belongs to an environment within an account. Operations supported by the User Manager API to manage users:

- ``GET /pro/user-manager/v1/user`` - List users, with optional query filters:

  - ``account_name_equal_cs`` / ``account_name_equal_ci`` - exact match on account name (case-sensitive / case-insensitive)
  - ``account_name_contain_cs`` / ``account_name_contain_ci`` - substring match on account name
  - ``account_name_in`` / ``account_name_not_in`` - include or exclude a comma-separated list of account names
  - ``environment_name_equal_cs`` / ``environment_name_equal_ci`` - exact match on environment name
  - ``environment_name_contain_cs`` / ``environment_name_contain_ci`` - substring match on environment name
  - ``environment_name_in`` / ``environment_name_not_in`` - include or exclude a comma-separated list of environment names
  - ``user_name_equal_cs`` / ``user_name_equal_ci`` - exact match on user login name
  - ``user_name_contain_cs`` / ``user_name_contain_ci`` - substring match on user login name
  - ``user_name_in`` / ``user_name_not_in`` - include or exclude a comma-separated list of user login names
  - ``sort`` - sort by fields, prefix with ``-`` for descending order (e.g. ``-account_name,user_name``)
  - ``offset`` / ``limit`` - pagination (default limit: 100)

- ``GET /pro/user-manager/v1/user/{account_name}/{environment_name}/{user_name}/info`` - Get a specific user by account, environment and user name

- ``GET /pro/user-manager/v1/user/@current/info`` - Get the profile of the currently authenticated user

.. note::

   Using filters on ``GET /pro/user-manager/v1/user`` is recommended for accounts with a large number of users
   to reduce response size and improve performance.

Each user has the following properties:

- ``account_name`` - The name of the account the user belongs to
- ``environment_name`` - The name of the environment the user belongs to
- ``user_name`` - The login name of the user
- ``email`` - The email address of the user
- ``full_name`` - The full name of the user
- ``groups`` - The list of groups the user belongs to
 
