AIMMS PRO REST API Updates
==========================

The AIMMS PRO REST API is available only on the AIMMS Cloud Platform; it is not supported on on-premise PRO installations.

Task Scheduler (Version 26.2.1.0 - September 1, 2026)
-----------------------------------------------------

- **Resolved Issue**

   - Task sessions now use the correct account-specific ``pro-aimms-session`` bootstrap artifact, matching the one used by the Session Manager for interactive sessions, instead of a single static default. This ensures accounts pinned to a specific session artifact (e.g. one with a custom injected DLL) get consistent behavior across task and interactive sessions.

Task Scheduler (Version 26.1.3.0 - June 29, 2026)
--------------------------------------------------

- **Resolved Issue**

   - Task Scheduler now downloads the bootstrapper from the correct regional CDN.

Task Scheduler (Version 26.1.2.0 - March 24, 2026)
--------------------------------------------------

- **Resolved Issue**

   - Fixed an issue where recurring tasks could fail with error - *Downloading request blob failed with a 403 status and 0 error code* due to an expired request SAS URI. The Task Scheduler now automatically renews the SAS URI on each scheduled run, which resolves the issue.

Task Scheduler (Version 26.1.1.0 - February 3, 2026)
----------------------------------------------------

- **Improvements**

   - Added support for binary input in task requests.
   - Increased the bearer token time-to-live (TTL) to 3 minutes to improve request reliability.

Secret Manager (Version 26.2.1.0 - January 29, 2026)
----------------------------------------------------

**Improvements**

   -  Added support for sorting items and introduced additional item metadata.

Secret Manager (Version 26.1.1.1 - January 9, 2026)
---------------------------------------------------

The AIMMS PRO REST API is extended with the secret-manager service, enabling secure management of customer and user secrets within the PRO environment.

Please see the `documentation <https://documentation.aimms.com/cloud/managing-secrets.html>`__ and API Specs for more details.

Session Manager (Version 25.6.1.0 - December 12, 2025)
------------------------------------------------------

**New**

   -  **Session ID retrieval**: New procedure ``pro::sessionmanager::GetSessionId`` allows programmatic access to the active AIMMS session ID.
   -  **Unified service access**: ``pro::sessionmanager::GetServiceAccess`` now provides both the service URI and bearer token in a single call.
   -  **Service URI API**: New endpoint ``GET /pro/session-manager/v1/sessions/{session_id}/{service}/uri`` to retrieve service endpoints via REST.
   -  **Token exchange API**: New endpoint ``POST /pro/auth/v1/token/exchange`` for obtaining scoped bearer tokens with configurable path and access level.

**Improvements**

   -  Streamlined, consistent workflow for accessing cloud-hosted services (session → URI → token → access).
   -  Support for predefined services such as WebUI and Dex.

   Please refer to the detailed `documentation <https://documentation.aimms.com/cloud/accessing-cloud-hosted-services.html>`__ for usage instructions.

**Use Case**

   - These enhancements directly support MCP, which relies on the new session-based access flow to securely obtain service URIs and bearer tokens. MCP can now interact with AIMMS cloud services using the standardized and fully supported API workflow. A key example of this is the upcoming release of SENSAI Pro in AIMMS SCNavigator, where these improvements enable seamless and secure integration.


Session Manager (Version 25.2.1.0 - April 15, 2025)
---------------------------------------------------

- **Solve Sessions Support**
   - The Session Manager REST API now supports Solve sessions, extending its capabilities beyond WebUI and Task sessions.
- **Endpoint Enhancements**
   - The ``DELETE`` endpoint is now split into two distinct actions: ``terminate`` and ``delete``, allowing for more granular session control.
   - Endpoints for retrieving session logs have been updated for improved clarity and consistency.

Please see the `documentation <https://documentation.aimms.com/cloud/session-manager.html>`__ and API Specs for more details.

Task Scheduler (Version 25.1.1.0 - April 15, 2025)
--------------------------------------------------

- **Endpoint Update**
   - The `appName` and `appVersion` parameters in the ``GET /tasks`` endpoint are now **optional**. This allows more flexible queries when retrieving tasks owned by the user.
   - ``GET`` and ``POST`` endpoints now include two new response fields: `userName`, `userEnvironment`

Task Scheduler (Version 25.2.1.0 - May 15, 2025)
------------------------------------------------

- **New Endpoint**
   - ``GET /tasks/{id}/logs``: Introduced a new endpoint to retrieve task logs.

.. spelling:word-list::

    appVersion
