AIMMS Cloud Portal Updates
==========================

Portal 26.12.1.0 (September 17, 2026)
-------------------------------------

**Improvements**

- **Active usage on the Usage page:** The Quotas table on the Usage page now shows your current usage against each quota (e.g. "1 / 5 requests (20.0%)"), with a progress bar and a refresh control, alongside the existing Feature and Exceed action columns.

Portal 26.11.1.0 (September 1, 2026)
------------------------------------

**Improvements**

- **Dark mode:** The Portal now supports dark mode, built on a unified MUI color palette. Toggle it from the quick bar (next to the SensAI icon), with **Light**, **Dark**, and **System** options. Dark mode is also available on the About page, before logging in.

- **Right-click context menus:** You can now right-click a row across the Groups, Group Users, Users, Tunnels, Service Overrides, Secret Access, User API Keys, Application Access (Groups/Users tabs), and User Application Access lists to open a context menu at the cursor with quick actions.

- **Sticky table headers:** Column headers in tables across the Portal now stay visible while scrolling, making it easier to read data in long lists.

- **App Stats removed from the app context menu:** The **App Stats** option has been removed from the app context menu on the Apps page. This data was already available under **Sessions > Stats**, from where it can be exported to other tools for visual reporting.

- **Sessions page quick filters:** The Sessions page now offers a **Latest** quick filter, and automatically loads your last-used filter (or lets you reapply it with one click) the next time you visit.

- **Sortable, filterable data grid columns:** Column headers in data grids are now clickable, letting you switch between ascending and descending sort. You can also hide columns and apply quick filters directly from the grid.

- **New Usage page:** All users can now view the features and quotas included in their Cloud Platform contract, if one is configured for their account, from the new **Usage** page in the left sidebar. It shows the features available under your contract (e.g. IDE AI Assistant, Portal AI Assistant, SENSAI Apps) along with any configured quotas and their limits. *Active usage against these quotas will be added to this page in an upcoming release*. See `Usage <https://documentation.aimms.com/cloud/newportal-usage.html>`_ for details.

**Resolved Issues**

-  Resolved an issue where CDM database credentials could be exposed in the session log file.

Portal 26.9.1.1 (July 22, 2026)
-------------------------------

**Improvements**

- **Enhanced search on the Apps page:** The search bar on the **Apps** page now supports filtering by **Tags**, **App name**, **App version**, **App description** and **Category**, making it easier to find a specific application when many apps are published.
- **Sessions page column rename:** The session category column on the **Sessions** page is now labeled **Type** instead of **Kind**, for clarity (values remain: ``webui``, ``verify``, ``solve``, ``external``).

Portal 26.8.5.0 (June 29, 2026)
-------------------------------

**Improvements**

- The column order on the Sessions page is now preserved across both the Data and Stats tabs.

Portal 26.8.4.0 (June 11, 2026)
-------------------------------

**Resolved Issues**

- **SAML User Group Membership** — Fixed an issue where editing a SAML user's group membership caused their SAML-linked group to be removed.

Portal 26.8.3.0 (June 8, 2026)
-------------------------------

**Improvements**

- The **Sessions > Stats** page now supports two aggregation types for session state metrics:

   - **Count** — shows the number of sessions per state value (e.g. queued, launching, running, finished). Each state gets its own column, giving you a clear breakdown of session distribution across all possible states.
   - **Count Unique** — shows the number of distinct state values present in the current result set. Useful for quickly understanding how many different states are active within a given bucket.

These aggregations can be combined with breakdowns for more granular insights.

**Resolved Issues**

- **Session Log Time Filtering** — Fixed an issue where setting a time range filter on the Session Log had no effect and the full log was always retrieved instead.

Portal 26.8.2.0 (June 2, 2026)
------------------------------

**Improvements**

- Long usernames and application tile text are now truncated when they don't fit, with the full text shown on hover via a tooltip.
- The Apps page now shows an empty-state banner when no apps are available, consistent with the Secrets page.
- The date picker now uses a compact dropdown that takes up less space and works better on mobile.

**Resolved Issues**

- The Secrets page tree view has been updated for consistency with the Account Configuration tree.
- Fixed alignment and line rendering issues in tree views across the portal.

Portal 26.8.1.1 (May 22, 2026)
------------------------------

**Improvements**

	- **Service Manager & Account Manager**: Internal improvements to improve reliability and maintainability of service and account management. No customer-facing changes.
	- **Sessions**: Minor visual improvements to the **Session Events** dialog, including adjusted sizing of the Events, Metrics and Logs sections.

Portal 26.7.1.0 (May 15, 2026)
------------------------------

**Improvements**

	- **Sessions**:
		- *Column Units in Manage Stats*: Column units are now displayed in the **Manage Stats** dropdown (e.g. ``[core·h]``, ``[m]``, ``[Mi]``), making it easier to identify the correct metric at a glance.
		- *Local Timezone in Session Events*: Event timestamps in the **Session Events** dialog are now displayed in the user's local timezone.

**Resolved Issues**

	- **Sessions**: Resolved a 500 error that occurred when selecting all columns under **Manage Stats**.
	- **Security**: Resolved a security response header misconfiguration in the login service.

Portal 26.6.2.3 (May 4, 2026)
-----------------------------

**New**

   - **User Management API** – New endpoints for listing and filtering environments and users are now available. See `Managing Environments, Groups and Users <https://documentation.aimms.com/cloud/managing-users.html>`_ for more information.
   - The portal now integrates with the updated User Manager API, bringing improved user and environment management capabilities.

**Improvements**

	- **Sessions** (requires AIMMS PRO 26.3.1): We have introduced several enhancements to improve session visibility and resource insight,
		- *Legacy Solver Sessions*: Solver sessions started from WinUI apps and solver sessions started from WebUI or WinUI apps published with AIMMS version lower than 4.88 are now also managed by the new Session Manager and will no longer appear under **Legacy Sessions > Solver**.
		- *Peak Resource Columns*: Added four new columns to the Sessions **Data** overview: **Peak Memory [Mi]**, **Peak CPU [m]**, **Peak Memory Utilization [%]** and **Peak CPU Utilization [%]**, providing better insight into resource consumption per session. Columns can be toggled via **Manage Columns**.
		- *Peak Resource Stats*: Added corresponding statistical aggregates for the above columns in the Sessions **Stats** tab: avg, min, max, p50 and p95 variants are available and can be toggled via **Manage Stats**.

**Resolved Issues**

	- **User Management**: Resolved an error (``get_all_user: runtime error``) encountered when searching for users in accounts with a large number of users.
	- **Sessions**: Resolved an internal server error that occurred when downloading large session logs.

Auth-server 26.2.1.0 (April 21, 2026)
-------------------------------------

**New**

	- **Login Protection**: The AIMMS PRO Portal authentication service now includes brute-force login protection. The authentication server monitors login attempts and applies progressive safeguards when repeated failures are detected from the same source. Users who sign in normally are not affected.

See `Portal Login Protection <https://documentation.aimms.com/cloud/newportal-login-protection.html>`_ for more information.

Portal 26.6.1.0 (April 10, 2026)
--------------------------------

**New**

	- **Redesigned Sessions Page**: The Sessions page has been completely redesigned with a unified session list, bringing all session types — WebUI, Solver, External, and Verify — together in a single table. The new page introduces additional data columns (including environment, app version, and timing metrics), GbHour consumption per session, improved filtering, column customization, bulk actions, and a dedicated Stats tab with breakdown support. Previously, sessions were split across separate WebUI, Solver, and Task tabs. See Sessions for more information.
	- **Session Events Timeline**: Each session now includes a Session events option in the context menu, providing a chronological timeline of events that occurred during the session's lifecycle. This makes it easier to trace and understand session behavior.
	- **Session Stats Tab**: A new Stats tab on the Sessions page provides aggregated metrics on session usage and performance, including queue and launch time statistics. Results can be broken down by Year, Month, Account, Environment, User, App Name, or App Version.
	- **GbHour Consumption**: GbHour resource usage is now visible per session directly in the Sessions table and Stats tab, giving you insight into the computational cost of your sessions without navigating to a separate report.
	- **Launch Details**: When launching an app, you can now click Details to view a live breakdown of Events, Metrics, and Logs as the session starts up — making it much easier to see exactly what's happening during launch.

See `Sessions documentation <https://documentation.aimms.com/cloud/newportal-sessions.html>`_ for more information.

**Improvements**

	- **Session log download**: Session logs are now directly streamed from the source during download, meaning there is no size limit when downloading logs on the log content you can retrieve.
	- **Tasks moved to a dedicated page**: Task sessions are no longer part of the Sessions page. They are now accessible from the Tasks page in the left sidebar. Task sessions will be integrated into the Sessions page in a future update.

Portal 26.5.1.1 (February 24, 2026)
-----------------------------------

**New**

	- **Dedicated User API Keys Page**: API Keys now have a dedicated page in the Cloud Portal, accessible from the left sidebar under User API Keys. Previously, API Keys were managed within the User Settings page. See `User api keys <https://documentation.aimms.com/cloud/newportal-user-api-keys.html>`_ for more information.
	- **New Secret Scope for API Keys**: A new **Secret** scope is now available when creating an API key, allowing programmatic management of Secrets stored in the Cloud Portal.
	- **API Key Management Endpoint**: API Key management has moved to the **User Manager API**. Both the previous and new endpoints are currently supported, however we recommend updating your integrations to use the new endpoint as the previous endpoint will be deprecated in a future release. See `Managing API Keys <https://documentation.aimms.com/cloud/managing-api-keys.html>`_ for more information.


Portal 26.4.1.0 (February 9, 2026)
----------------------------------

**Resolved Issue**

   - Fixed an unnecessary API error popup shown on the Secrets page for users with no access to secrets or directories.
   - Updated the Secrets page icon in the Portal menu to be consistent.

Portal 26.3.2.0 (February 3, 2026)
----------------------------------

**Resolved Issue**

	- Resolved an issue where starting a task via the Portal did not work when using .xls files as request data.

Portal 26.3.1.0 (February 2, 2026)
----------------------------------

**Improvements**

	- Minor UI improvements on Secrets page.

Portal 26.2.1.1 (January 29, 2026)
----------------------------------

**New**

	- Updated the navigation menu layout to improve clarity and accessibility, with a streamlined sidebar and easier access to core sections such as Apps, Sessions, Secrets, and Configuration.
	- Introduced a new **Secrets** page, a centralized interface in AIMMS PRO that allows authorized users to securely organize, store, and control access to directories and secrets required by applications.

	For more details, please see the `documentation <https://documentation.aimms.com/cloud/newportal-secrets.html>`__

Portal 25.12.1.1 (December 4, 2025)
-----------------------------------

**Improvements**

	- **User Management**: We have introduced several enhancements to improve navigation, clarity, and overall usability,
		- *Streamlined Creation Actions*: Create Environment, Create Group, and Create User buttons have been moved to the top of their respective pages for quicker access.
		- *Improved Search & Filtering*: Added search fields to both the Group and User lists, making it easier to locate specific entries.
		- *Optimized Data Loading*: Groups and users are now fetched only when you open their respective tabs within an environment. This removes the previous automatic prefetching, resulting in faster initial navigation and more intentional data loads.
	- **Updated User Roles Model**: We have replaced the Global Roles with a new, simplified Roles model,
		- User roles can no longer be assigned directly, the Roles column is read-only.
		- A user's role is assigned automatically based on their membership in one of the system-defined groups.
		- User roles are currently limited to two system-defined roles, *Admin* and *App Publisher*.

	For more details, please see the `documentation <https://documentation.aimms.com/cloud/newportal-configuration.html#multi-factor-authentication-mfa>`__

**Resolved Issues**

   - Fixed an issue that prevented users from entering a value in the **Schedule For** field when creating a task.

Portal 25.11.1.1 (November 11, 2025)
------------------------------------

**Improvements**

	- **Account-Level MFA Enforcement:**: Admin users can now enforce MFA for all users within a cloud account from the Configuration → Account Settings page. When enabled, all users are required to configure MFA upon their next login. For more details, please see the `documentation <https://documentation.aimms.com/cloud/newportal-configuration.html#multi-factor-authentication-mfa>`__

**Resolved Issues**

   - Fixed an issue where deleting a solver session from Sessions > Solves overview resulted in error.

Portal 25.10.1.4 (October 10, 2025)
-----------------------------------

**Improvements**

	- **Export Sessions Table**: Added an Export table option on the Sessions page, allowing users to download session data as a CSV file for offline analysis.
	- **Resource Profiles**: Introduced Resource Profiles to manage CPU and memory allocation for applications. Admins/App publishers can now select predefined resource configurations when publishing,updating or editing apps. The Resource Profiles feature can be enabled or disabled through database settings in the PRO Cloud Database. To enable this feature for your AIMMS Cloud Platform, please contact AIMMS User Support. For more details, please see the `documentation <https://documentation.aimms.com/cloud/newportal-apps.html#resource-profiles>`__

Portal 25.9.1.0 (September 9, 2025)
-----------------------------------

**Improvements**

	- **Session Logs**: Added support for time selection in the Begin and End filters, enabling more precise log searches.
	- **Documentation**: Added a direct link to SC Navigator documentation on the About page of New Portal (for SCNavigator accounts).
	- **User Groups**: It is now possible to add descriptions for user groups.

Portal 25.8.1.0 (September 4, 2025)
-----------------------------------

- We are excited to introduce Filter & Sort for  Sessions. You can now easily organize your session list using built-in filtering and sorting tools:
	- **Filter** sessions per column (e.g., Session ID, State, Application Name/Version, Created date) to quickly locate specific runs.
	- **Sort** sessions by any column in ascending or descending order.

For more details, please see the `documentation <https://documentation.aimms.com/cloud/newportal-sessions.html#filtering-and-sorting-sessions>`__

Portal 25.6.1.0 (July 24, 2025)
-------------------------------

- We are excited to introduce two new tools to help you better understand and troubleshoot your sessions:
	- **Session log**: You can now view detailed logs for each session directly from the session menu. Includes a new Download log option to save the log for offline analysis or sharing with support teams.
	- **App stats**: Display various performance metrics for an app related to WebUI, Solver and Task session executions. Please visit the detailed `documentation <https://documentation.aimms.com/cloud/newportal-stats.html>`__
	- These enhancements are available for all completed, failed, or terminated sessions and are accessible from the context menu in the session list.

Portal 25.3.1.0 (April 15, 2025)
--------------------------------

- Introduced a new **Sessions** page (formerly the Jobs page), now featuring:
	- **WebUI Sessions** (previously Active Data Sessions)
	- **Tasks**
	- **Solver Sessions** (previously Jobs)

- Added a new **Configuration** page, which includes:
	- **Account Settings** (portal customization and retention settings)
	- **Tunnels**

**Note**: The Configuration menu is accessible to admin users via the user menu.
