AIMMS PRO Release Notes
=======================

PRO 24.8
########

AIMMS PRO 24.8.2 Release
------------------------

On August 1, 2024, we released AIMMS PRO 24.8.2(24.8.2.1)

**Improvements**

* **PRO REST API:Task Service**:
  * It is possible to get the TaskID inside AIMMS while the procedure called by the task is running.
  * The ``appVersion`` query parameter is now optional in the ``GET pro-api/v2/tasks`` endpoint.
    If 'appVersion' is not provided, the version with the latest tag will be used by default. However, if 'appVersion' is not provided and the latest tag is not set for the app, an error will occur.

**Resolved Issues**

- Fixed an issue where a session could stuck in a crash loop and fail due to intermittent network issues.

AIMMS PRO 24.8.1 Release
------------------------

On June 27, 2024, we released AIMMS PRO 24.8.1(24.8.1.1)

**Improvements**

   - Portal Customization (under configuration menu) is now available for SC Navigator accounts, which allows them to customize login page background and some other settings.

**Resolved Issues**

- **PRO REST API:Task Service**: Fixed an issue where task session could finish with an error when accessing data to/from dls (Data Lake Storage) storage.
- **PRO REST API:Task Service**: Added more information about the selected AIMMS version in logs.

PRO 24.7
########

AIMMS PRO 24.7.2 Release
------------------------

On June 18, 2024, we released AIMMS PRO 24.7.2(24.7.2.7)

**Resolved Issues**

   - The *GetObjectInfo* did not give an error when the file did not exist.
   - Fixed an issue where an update of the Spring Framework in AIMMS PRO 24.7.1 caused a too much load on Azure Service Bus.

AIMMS PRO 24.7.1 Release
------------------------

On June 11, 2024, we released AIMMS PRO 24.7.1(24.7.1.4)

**Improvements**

   - Several potential security exploits were found in 3rd party libraries used by AIMMS PRO. These libraries have been removed (log4j) or updated (ActiveMQ and the Spring framework) to newer versions thereby resolving this security issues.

PRO 24.6
########

AIMMS PRO 24.6.2 Release
------------------------

On May 24, 2024, we released AIMMS PRO 24.6.2(24.6.2.1)(Cloud only release)

**Resolved Issues**

   - Changed the wait for session start timeout from 1 minute to 3 minutes to fix session launch failures.


AIMMS PRO 24.6.1 Release
------------------------

On April 26, 2024, we released AIMMS PRO 24.6.1(24.6.1.2)

**Improvements**

   - Some internal technical improvements.

**Resolved Issues**

   - **On-Premise**: Under heavy load a backwards compatibility feature for older AIMMS versions would potentially cause a webui session not to start. Starting with the combination of **AIMMS PRO 24.6** and **AIMMS 24.4** this feature will no longer be needed and thereby resolve the occasional not starting webui session under heavy load.

PRO 24.5
########

AIMMS PRO 24.5.1 Release
------------------------

On April 5, 2024, we released AIMMS PRO 24.5.1(24.5.1.1)

**Improvements**

   - It is now possible to wait longer than the default 30 seconds for the Python service to start by specifying the *startWaitTime* argument of the LaunchService method. Please note that this does require **AIMMS Version 24.3** or higher.
   - **On-Premise**: AIMMS PRO Postgres database is upgraded to **Postgres 16.2** for Windows installation. This means upgrading to AIMMS PRO 24.5.1 will require a database migration of your AIMMS PRO database. Please contact AIMMS Customer Support to help you with this upgrade.

**Resolved Issues**

   - Fixed an issue where external Python service was not accessible within AIMMS session on AIMMS Cloud Platform.

PRO 24.4
########

AIMMS PRO 24.4.2 Release
------------------------

On March 26, 2024, we released AIMMS PRO 24.4.2(24.4.2.1)
 
**Resolved Issues**

   - **PRO REST API**: Publishing an app could fail when *publishBehavior = 0*

AIMMS PRO 24.4.1 Release
------------------------

On March 14, 2024, we released AIMMS PRO 24.4.1(24.4.1.2)
 
**Improvements**

   - AIMMS Cloud Platform `Privacy Statement <https://documentation.aimms.com/cloud/privacy.html>`__ and `Responsible Disclosure Policy <https://documentation.aimms.com/infosec/responsible-disclosure.html>`__ are available on PRO Portal.

**Resolved Issues**

   - Fixed a permission issue where an App could be available to all users in some specific scenario.

PRO 24.3
########

AIMMS PRO 24.3.1 Release
------------------------

On February 27, 2024, we released AIMMS PRO 24.3.1(24.3.1.1)
 
**Improvements**

   - Some internal improvement to handle AIMMS hotfix releases on cloud.

PRO 24.2
########

AIMMS PRO 24.2.2 Release
------------------------

On February 22, 2024, we released AIMMS PRO 24.2.2(24.2.2.1)
 
**Improvements**

   - **PRO REST API:Task Service**: Task REST API is extended with a call back feature which will allow you to request a call back that informs you when your task is completed, without polling all jobs continuously. Please see the `documentation <https://documentation.aimms.com/cloud/tasks.html#request-a-task-call-back>`__ for more details. 
   - **PRO REST API:Managing Apps**: We have made some changes in 'Managing Apps' API service,

       - Publish app(POST request) returns application json instead of an empty response when app is successfully published.
       - Update app(PATCH request) returns application json instead of an empty response when app is successfully updated.
       - Metadata for POST request (Publish an App) is extended with *publishBehavior*, which will allow you to publish a new version of an existing application. Please see the `documentation <https://documentation.aimms.com/cloud/rest-api.html#example-using-postman-to-publish-an-application-post>`__ for more details.

AIMMS PRO 24.2.1 Release
------------------------

On January 23, 2024, we released AIMMS PRO 24.2.1(24.2.1.11)
 
**Improvements**

   - **PRO REST API**: Starting with PRO 24.2.1, the latest version v2 of PRO REST API covers all the services(functionality) provided by version v1, this will allow you to generate single and complete OpenAPI interface and you do not have to worry about changing your client applications because a version is end-of-life.
   - Reduced start-up time for sessions on cloud.
   
**Resolved Issues**

   -  Better error message when App permissions limit has been reached.
  
PRO 24.1
########

AIMMS PRO 24.1.1 Release
------------------------

On January 9, 2024, we released AIMMS PRO 24.1.1(*Cloud build*: 24.1.1.4, *On-Premise build*: 24.1.1.7)
 
**Improvements**

   - | Support for Conan2 AIMMS Versions (AIMMS Versions with Conan2 support will be released soon with AIMMS 24.1).
     | (Note: If you are using an on-premise installation of AIMMS PRO then you will need to upgrade your AIMMS PRO to 24.1.1 such that you can use Conan2 AIMMS Versions)

PRO 2.52
########

AIMMS PRO 2.52.3 Release
------------------------

On December 22, 2023, we released AIMMS PRO 2.52.3(2.52.3.1).
 
**Resolved Issues**

   -  Fixed an issue where MFA could be bypassed when the WebUI app is launched using an app launch link.

AIMMS PRO 2.52.2 Release
------------------------

On December 1, 2023, we released AIMMS PRO 2.52.2(2.52.2.1).

**Improvements**

   - Tasks REST API v2 is extended with the 'latest' appVersion support. Please see the `documentation <https://documentation.aimms.com/cloud/tasks.html#run-a-task-from-the-latest-version-of-an-app>`__ for more details 
 
**Resolved Issues**

   -  Fixed an issue where session crashes or terminated sessions were incorrectly logged as out-of-memory crashes for data sessions.
   -  Task REST API v2: Fixed an issue where tasks could stuck in the queued state when it failed to schedule a REST session.

AIMMS PRO 2.52.1 Release
------------------------

On November 21, 2023, we released AIMMS PRO 2.52.1(2.52.1.1). 
 
**Improvements**

   - We have released a newly designed Tasks REST API Service(v2) with this PRO Version. Please see the `documentation <https://documentation.aimms.com/cloud/tasks.html#tasks-rest-api-v2>`__ for more details.  

PRO 2.51
########

AIMMS PRO 2.51.2 Release
------------------------

On September 26, 2023, we released AIMMS PRO 2.51.2(2.51.2.4). 
 
**Resolved Issues**

   - Fixed an issue with the rest-server when calling PRO REST API services could result into 30002 error. (by implementing an auto-restart of the rest-server when it gets into the problematic state)

AIMMS PRO 2.51.1 Release
------------------------

On September 5, 2023, we released AIMMS PRO 2.51.1(2.51.1.1). 
 
**Improvements**

   - Fast publishing/verify session to reduce the timeouts during publishing of an AIMMS app. (Also available for **On-Premise**)
   - More explicit logging when session crashes due to the out of memory.


PRO 2.50
########

AIMMS PRO 2.50.1 Release
------------------------

On July 25, 2023, we released AIMMS PRO 2.50.1(2.50.1.1). 
 
**Improvements**

   - Added support to access Azure Data Lake Storage within AIMMS sessions using DEX Library.
   - Added extra logging when data session could not launch. 
   
**Resolved Issues**

   - PRO REST API: Fixed an issue where a task could fail with an immediate response - HTTP code of 500 when passing a *.JSON* file of more than 100KB. (Please note that this fix will be fully available only when all cloud accounts are moved to AIMMS PRO 2.50.1 )


PRO 2.49
########

AIMMS PRO 2.49.2 Release
------------------------

On June 1, 2023, we released AIMMS PRO 2.49.2(2.49.2.3). 
 
**Resolved Issues**

   - Assigning/updating an app permissions could not be possible when an environment is deleted which had an access to the app.
   - Fixed an issue where Tunnel App could crash when data is being imported. (This does require an AIMMS 4.96 or higher)
   - PRO REST API: Improved error message when passing incorrect date to retrieve tasks list. 
   - PRO REST API: Fixed an issue where a task could fail with an immediate response - HTTP code of 500 when passing a *.parquet* file with a cell length of 60 or more characters per line. 
   - PRO REST API: Fixed an issue where it could not create a task with 5MB+ input/output. 

AIMMS PRO 2.49.1 Release
------------------------

On May 19, 2023, we released AIMMS PRO 2.49.1(2.49.1.1). 


**Improvements**

   - Starting with this PRO version each session recorded in the PRO Database will also record GBHour consumed (i.e memory consumed) per session.
   - PRO REST API: *projectVersionId* query parameter has been changed to *projectVersion* for GET Tasks.
   - PRO REST API: Starting with this version it is possible to configure *REST session idle time* at account level. Please see the `documentation <https://documentation.aimms.com/cloud/tasks.html#running-tasks>`__ for more details. (Please note that this feature can be avail fully only when all cloud accounts are moved to AIMMS PRO 2.49.1)
   
**Resolved Issues**

   - PRO REST API: Fixed an issue with listing tasks when offset query parameter is set to 0.
   - PRO REST API: AIMMS *authorizations* has been removed from GET application info. 
   - Fixed an issue where changing the permissions of previous version of an App could lead to *PROAuthenticationEnvironment '127' does not exist* error message. 


PRO 2.48
########

(We skipped PRO 2.47 because of internal technical reasons).

AIMMS PRO 2.48.2 Release
------------------------

On March 24, 2023, we released AIMMS PRO 2.48.2(2.48.2.1). 
 
**Resolved Issues**

   - Fixed an issue where you could no longer see some validation messages on Users page.
   - Fixed an issue where it was no longer possible to assign the permissions to the previous versions of an App.

AIMMS PRO 2.48.1 Release
------------------------

On March 16, 2023, we released AIMMS PRO 2.48.1(2.48.1.1). 

**New Features**

   - PRO REST API: Extended the REST API with the new service - Managing API Keys, which allows you to retrieve, create and delete API Keys on your cloud environment. Please see the `documentation <https://documentation.aimms.com/cloud/rest-api.html>`__ for more details.

**Improvements**

   - MFA(Multi-Factor Authentication) for AIMMS PRO Portal user account. Please see the `documentation <https://documentation.aimms.com/pro/mfa.html>`__ for more details.
   - Automatically getting the latest AIMMS Releases available on your cloud environment and always run your apps with the latest hotfix release of the major AIMMS release with which the app was published. Please see the `documentation <https://documentation.aimms.com/cloud/aimms-releases.html>`__ to get more details about this feature.
   - PRO REST API: The limits for REST session(Tasks) requests/responses have been increased from 32KB to 256MB.
   
**Resolved Issues**

   - PRO REST API: Fixed an issue where updating an app via REST API could result into 'Environment does not exist' error.

   
PRO 2.46
########

AIMMS PRO 2.46.1 Release
------------------------

On December 20, 2022, we released AIMMS PRO 2.46.1 (2.46.1.2). 

**Improvements**

   - PRO REST API: It is now possible to create, update and delete environments using REST API.
   - PRO REST API: Tasks are further separated from solver sessions such that Tasks will get their own CPU and memory limits, concurrent tasks limit and solver string (i.e. solvers that can be selected for Tasks). These can be configured at a account level by AIMMS Customer Support.

**Resolved Issues**

   - Fixed an issue introduced in PRO 2.45.1, where new Apps could erroneously published with the REST license profile and could no longer run the sessions from it.   
   

PRO 2.45
########

AIMMS PRO 2.45.3 Release
------------------------

On November 4, 2022, we released AIMMS PRO 2.45.3 (2.45.3.1). 

**Resolved Issues**

   - Cloud: Fixed an issue introduced in AIMMS PRO 2.44.3.1 where the text inside map widget displayed in various languages instead of English.

AIMMS PRO 2.45.2 Release
------------------------

On October 20, 2022, we released AIMMS PRO 2.45.2 (2.45.2.1). 

**Resolved Issues**

   - Cloud: Fixed an issue where solver session could fail when starting/running too many solver sessions.

AIMMS PRO 2.45.1 Release
------------------------

On October 13, 2022, we released AIMMS PRO 2.45.1 (2.45.1.5). 

**New Features**

   - CRUD on Tasks: An extension to the AIMMS PRO REST API which allows users to perform CRUD operations on DEX-exposed tasks.

**Improvements**

   - PRO REST API: Extended App Publishing API with the 'Latest App Version' tag support. 
   - PRO REST API: It is now possible to publish an App with the icon. 
   - Extended the maximum length of AIMMS PRO usernames to support the usernames with *long domain names* when logging-in via SAML/ActiveDirectory or directly to AIMMS PRO Portal.


PRO 2.44
########

AIMMS PRO 2.44.3 Release
------------------------

On September 22, 2022, we released AIMMS PRO 2.44.3 (*Azure cloud build*: 2.44.3.1, *On-Premise build*: 2.44.3.10). 

**Improvements**

   **Azure Cloud Platform:** 

   - Enabled ``EncryptedAssertions`` for SAML Authentication.
   - Extended the SAML Connections such that it supports another format for specifying the URL.

**Resolved Issues**

   **On-Premise:**

   - Fixed an issue where maps could not load in the WebUI Applications.

AIMMS PRO 2.44.1 Release
------------------------

On July 15, 2022, we released AIMMS PRO 2.44.1 (2.44.1.1). 

**Improvements**

   **Azure Cloud Platform:** 

   - Added category support to App Publishing REST API. It is now possible to assign or update App category using category name when publishing or updating an App via REST API.
   - *CPLEX Parallel Solve* is now available on the AIMMS Cloud Platform. For large-scale scenario comparisons this may offer big solve time savings. Please contact us for technical information and pricing details.
   - Support for CmakeConan AIMMS Versions (AIMMS Versions with CmakeConan support will be released with **AIMMS 4.88**).

   **AWS Cloud Platform:**

   - Support for CmakeConan AIMMS Versions (AIMMS Versions with CmakeConan support will be released with **AIMMS 4.88**).

   **On-Premise:**

   - Support for CmakeConan AIMMS Versions (If you are using an on-premise installation of AIMMS PRO then you will need to upgrade your AIMMS PRO to 2.44.1 such that you can use CmakeConan AIMMS Versions. AIMMS Versions with CmakeConan support will be released with **AIMMS 4.88**).



PRO 2.43
########

AIMMS PRO 2.43.2 Release
------------------------

On May 24, 2022, we released AIMMS PRO 2.43.2 (2.43.2.1). 

**Improvements**

-  **Cloud:** Some technical improvements for Azure Cloud Platform.

**Resolved Issues**

-  Fixed an issue where jobs scheduled in future could start before the scheduled date/time while there are queued jobs.
-  Added more clear error message in the session log when a AIMMS PRO User could not access/read a case file from the AIMMS PRO Storage. 

PRO 2.42
########

AIMMS PRO 2.42.1 Release
------------------------

On March 31, 2022, we released AIMMS PRO 2.42.1 (2.42.1.1). 

**Improvements**

-  **Cloud:** Some internal improvements for getting ready for Azure Cloud Migration.

**Resolved Issues**

- **Cloud:** Fixed an issue where user could no longer login to AIMMS PRO Portal via SAML Authentication when user's e-mail contained uppercase characters.

PRO 2.41
########

AIMMS PRO 2.41.2 Release
------------------------

On March 4, 2022, we released AIMMS PRO 2.41.2 (2.41.2.5). 

**Improvements**

-  **Cloud:** We added more clear and meaningful error message when there are no more licenses available and a user could no longer launch an application due to that.
-  **Cloud:** Some internal fixes for getting ready for Azure Cloud Migration.

AIMMS PRO 2.41.1 Release
------------------------

On February 8, 2022, we released AIMMS PRO 2.41.1 (2.41.1.1). 

**Improvements**

-  Added support for the OAuth Authorization Code flow for WebUI applications running on PRO.
-  **Cloud:** On AIMMS Cloud Platform we have stopped supporting the outdated TLS versions 1.0/1.1, henceforth we only support **TLS 1.2**. 
   
	 - If you are running WinUI PRO applications, you may need to download and install a new AimmsPROAppLauncher from the AIMMS PRO portal which supports TLS 1.2. 
	 - If you are using the .NET PRO API, please make sure that you are compiling your application using .NET 4.7+ which supports TLS 1.2. 

**Resolved Issues**

- Relaxed the domain names restrictions in user's e-mail when creating users in PRO such that it accepts domain name like *.one, .mail, .cloud* etc.

PRO 2.40
########

AIMMS PRO 2.40.1 Release
------------------------

On December 14, 2021, we released AIMMS PRO 2.40.1 (2.40.1.1). 

**Improvements**

-  **Cloud:** AIMMS PRO end user's App launch link will no longer result in 'cannot find the project' error when the new(latest) version of the App is available instead it will provide you with the link which points to the latest version.

PRO 2.39
########

AIMMS PRO 2.39.1 Release
------------------------

On September 28, 2021, we released AIMMS PRO 2.39.1 (2.39.1.1). 

**Improvements**

-  **Cloud:** Extended AIMMS PRO Library with ``pro::management::RetrieveAccountInfo`` which allows you to retrieve your AIMMS Cloud Platform Account characteristics (i.e. DNS_NAME, CONCURRENT_SOLVES, CONCURRENT_USERS, CUSTOMIZATION_PROFILE, SOLVER_LICENSES). Please note that this does require an **AIMMS Version 4.82** or higher.

**Resolved Issues**

- **Cloud:** Fixed an issue where WebUI sessions could not start when too many solver sessions are scheduled without having enough license capacity on AIMMS Cloud Platform.

PRO 2.38
########

AIMMS PRO 2.38.2 Release
------------------------

On July 8, 2021, we released AIMMS PRO 2.38.2 (2.38.2.1). 

**Resolved Issues**

- Fixed an issue where newly added user could not login to the Active Directory environment on AIMMS PRO.


AIMMS PRO 2.38.1 Release
------------------------

On June 10, 2021, we released AIMMS PRO 2.38.1 (2.38.1.1). 

**Improvements**

-  **Cloud:** Added support to use Gurobi on the AIMMS Cloud Platform through the new `Gurobi Web License Service <https://www.gurobi.com/web-license-service/>`__ offered by Gurobi Optimization. For details,
   please see the
   `documentation <https://documentation.aimms.com/cloud/gurobi-support.html>`__.
   (This does require an **AIMMS Version 4.81** or **higher**).

PRO 2.37
########

AIMMS PRO 2.37.2 Release
------------------------

On March 23, 2021, we released AIMMS PRO 2.37.2 (2.37.2.2). 

**Improvements**

-  Updated AIMMS PRO AppLauncher with the recent .NET version 4.7 such that it can support the servers which uses TLS 1.3.
-  **Cloud:** Added validation for a 'Company CIDR' such that it validates the specified network range while adding a VPN connection for a cloud application database.
-  **Cloud:** Added validation for a database 'Username' while creating a cloud application database.

**Resolved Issues**

-  **Cloud:** Fixed an issue where the CPU hard limit was misconfigured for the solver session which is started from a WebUI Application. 

AIMMS PRO 2.37.1 Release
------------------------

On January 15, 2021, we released AIMMS PRO 2.37.1 (2.37.1.1). 

**Improvements**

-  **Cloud:** Improved the way we schedule the sessions on AIMMS Cloud Platform and this will also enable the automatic up-scaling of session nodes when needed.
-  **Cloud:** Solver session could crash due to lack of resources (not enough CPU/Memory on AIMMS Cloud Platform). This has been changed such a way that solver session will get queued and re-scheduled once the resources are available.
-  **Cloud:** Some internal technical improvements.


PRO 2.36
########

AIMMS PRO 2.36.3 Release
------------------------

On January 7, 2021, we released AIMMS PRO 2.36.3 (build 2.36.3.5). 

**Resolved Issues**

- When the Applauncher fails to download a complete file this file will now be removed, causing next launch to re-attempt to download that file, instead of using the leftover corrupt file.
- Fixed an issue where it always require to authenticate again during SAML/ADFS authentication for the users who use Microsoft Azure AD as a SAML/ADFS identity provider.
-  **Cloud:** The update to TLS v1.3 caused incompatibilities with he MS SQL Server ODBC driver, resulting in crash. This has been fixed.
-  **Cloud:** Fixed a rare issue with computing the current license usage.

AIMMS PRO 2.36.2 Release
------------------------

On October 27, 2020, we released AIMMS PRO 2.36.2 (build 2.36.2.2 for On-premise, build 2.36.2.1 for AIMMS Cloud Platform). 

**Resolved Issues**

- The .NET PRO API now depends on a latest armi4net.dll that fixes an IPV6 issue running on Linux.
- Added support for connecting to servers that use TLS v1.3 HTTPS encryption. (This does require an **AIMMS Version 4.76.4** or **higher**)
-  **On-Premise:** Fixed an issue where PRO database backup could not be restored after a clean install of AIMMS PRO due to the table mismatch.
-  **On-Premise:** There was an issue where sessions got stuck in the queue when having too many queued sessions in some rare circumstances. 


AIMMS PRO 2.36.1 Release
------------------------

On September 15, 2020, we released AIMMS PRO 2.36.1 (2.36.1.1). 


**Improvements**

-  We have extended logging for AimmsPROAppLauncher with more information in the ``ProWebLink`` log file and the error dialog to the user.
-  When the AimmsPROAppLauncher.exe is installed using elevated rights, AimmsPROAppLauncher log file(``ProWebLink.log``) will be written to ``%HOMEDRIVE%%HOMEPATH%/ProWebLink.log`` allowing the normal users to write to the log file. (For normal installation it will still write to ``%LOCALAPPDATA%/AIMMS/PRO/AppLauncher/<version>/ProWebLink.log``)


**Resolved Issues**

-  There was an issue where WebUI app could crash or hang when having a long-running WebuiPageOpen procedure.
-  There was an issue with running concurrent solve sessions where only one session could run and rest of the sessions remained queued in some rare circumstances. (when license usage count is updated incorrectly in the AIMMS PRO database due to the race condition)


PRO 2.35
########

AIMMS PRO 2.35.5 Release
------------------------

On July 9, 2020, we released AIMMS PRO 2.35.5 (2.35.5.5). 


**Resolved Issues**

-  There was an issue with the closing of WebSocket SSL connections that occurs under rare circumstances, resulting in a non-responsive status.
-  There was an issue with executing a terminate request for a queued session that occurs under rare circumstances, resulting in that queued session to be started before that terminate request was processed and continue to hang for an hour while holding a license, thereby potentially not allowing other sessions to be started.


--------------

AIMMS PRO 2.35.1 Release
------------------------

On May 15, 2020, we released AIMMS PRO 2.35.1 (2.35.1.3). 



**Improvements**

-  **Cloud:** We made improvements in gathering statistics about the cloud resource availability and usage.


**Resolved Issues**

-  We fixed an issue in the PRO API for Java and .NET where it would fail to run remote procedure calls with non-scalar arguments. IMPORTANT: you need to download the PRO API again from the PRO server and rebuild your programs against that latest version of the API. Just running the new server will NOT result in this issue being fixed.
-  Sessions would always get the default priority when the matching rule specified to use a lower priority (higher number).


PRO 2.34
########

AIMMS PRO 2.34.3 Release
------------------------

On April 16, 2020, we released AIMMS PRO 2.34.3(2.34.3.1). 


**Resolved Issues**

-  We addressed a memory leak where over time SAML/ADFS logins would
   cause the server to crash due to out-of-memory.
-  There was an issue with improper encoded cookies, causing penetration
   tests to give false positives.


--------------

AIMMS PRO 2.34.2 Release
------------------------

On February 7, 2020, we released AIMMS PRO 2.34.2(2.34.2.1). 



**Improvements**

-  **On-Premise:** Meaningful naming for AIMMS PRO Session logs, which
   now includes AppName, AppVersion, startupMode and timeStamp in the
   log file name. (Please note that once you upgrade your PRO to 2.34.2,
   please do 'Restore all to defaults' and 'Save Settings' from Portal's
   Configuration >> Log Management Menu then only Session log file name
   can have these attributes)

**Resolved Issues**

-  **On-Premise:** Fixed an issue where AIMMS PRO Launcher could not
   installed on Windows Server 2016.
-  **Cloud:** Fixed an issue where AIMMS PRO Java API programme could
   not run as it was not able to find renewed certificate. Please make
   sure that you update your API and all relevant root certificates are
   available on the relevant machines meaning running the system updated
   regularly.
-  **Cloud:** Fixed an issue where scheduled sessions could not be
   handled(i.e. could fail to start) by AIMMS PRO Backend when your
   AIMMS PRO Cloud Platform is updated with new version.


PRO 2.33
########

AIMMS PRO 2.33.3 Release
------------------------

On December 20, 2019, we released AIMMS PRO 2.33.3(2.33.3.1). 



**Resolved Issues**

-  **On-Premise:** Fixed an issue where AIMMS PRO Server was saving
   storage objects (i.e. cases) in the local timezone of the machine,
   which caused offset in date/time of saved shared cases in the AIMMS
   Application. From this PRO Version **new** storage objects will be
   stored in UTC. Please note that it will **not** convert the date/time
   for the already existing objects.

--------------

AIMMS PRO 2.33.2 Release
------------------------

On October 18, 2019, we released AIMMS PRO 2.33.2(2.33.2.2). 



**Resolved Issues**

-  **On-Premise:** Fixed an issue where upon connection loss between
   solver session and the backend the solver session would run the
   optimization procedure a 2\ :sup:`nd`\  time.
-  **AIMMS Cloud Platform:** Space (' ') character is no longer allowed
   for passwords when creating the Cloud Application Database.
-  **AIMMS Cloud Platform:** On the Apps page, the tip to first
   publish/activate an AIMMS version before publishing an App contained
   incorrect link.
-  Fixed an issue where the AIMMS PRO Launcher dialog could disappear
   after the Application was not able to start successfully, not
   allowing the user to browse easily to the log file.
-  Fixed an issue where dialog to open AppLauncher could disappear
   before you can click it while launching a WinUI application.
-  The '+' sign in project names caused problems launching a WebUI
   application; the '+' sign is no longer allowed in project, user,
   group and environment names.
-  Added validation to user e-mail address for invalid characters and
   format.


--------------

AIMMS PRO 2.33.1 Release
------------------------

On September 24, 2019, we released AIMMS PRO 2.33.1(2.33.1.1). 



**Improvements**

-  Extended AIMMS PRO Library with ``pro::storage::ExistsBucket`` and
   ``pro::storage::ExistsObject`` which allows you to check whether
   Directories or Files exist in the AIMMS PRO Storage. For details,
   please see the
   `documentation <https://manual.aimms.com/pro/pro-data-man.html#checking-folders-or-files-exists-in-the-pro-storage>`__.
   (This does require an **AIMMS Version 4.69** or **higher**).

PRO 2.32
########

AIMMS PRO 2.32.2 Release
------------------------

On August 22, 2019, we released AIMMS PRO 2.32.2 (2.32.2.0). 



**Resolved Issues**

-  Fixed an issue where WinUI apps could fail to launch with Firefox 67
   or higher.
-  **On-Premise:** AIMMS PRO Server could go out-of-memory when running
   daily maintenance jobs to do cleaning operations on the database.

--------------

AIMMS PRO 2.32.1 Release
------------------------

On July 9, 2019, we released AIMMS PRO 2.32.1 (build 2.32.1.1 for
On-premise, build 2.32.1.3 for AIMMS Cloud Platform). Changes made in
this release are listed below.



**Improvements**

-  Technical improvements for AIMMS Cloud Platform.

**Resolved Issues**

-  **On-Premise:** Fixed an issue where starting two or more sessions at
   nearly the same time could lead to not being able to start new
   sessions due to a wrong count on licenses in use.
-  **AIMMS Cloud Platform:** Fixed an issue where iFrame could no longer
   display EMBED and image on the Cloud(AIMMS PRO will now no longer
   deny embedding iFrame when the source is from same origin).

PRO 2.31
########

AIMMS PRO 2.31.4 Release
------------------------

On June 6, 2019, we released AIMMS PRO 2.31.4 (2.31.4.1). 



**Resolved Issues**

-  Fixed an error message while publishing an existing WebUI project
   (created with AIMMS 4.66 or lower) using AIMMS Version 4.67.
-  **AIMMS Cloud Platform:** Fixed an issue with the SAML/ADFS
   authentication where some customers could not login to AIMMS PRO
   Portal.

--------------

AIMMS PRO 2.31.3 Release
------------------------

On May 21, 2019, we released AIMMS PRO 2.31.3 (2.31.3.3). 



**Improvements**

-  **DB Tunnel App**: Provides easy and occasional access to the AIMMS
   Cloud App database running in VPN. Please see the
   `documentation <https://manual.aimms.com/cloud/db-config.html>`__ for
   more details.

**Resolved Issues**

-  **On-Premise**: Fixed an issue where installation or upgrade to AIMMS
   PRO 2.30 or higher could fail on some Windows Servers due to the
   incorrect version detection check by AIMMS PRO.

--------------

AIMMS PRO 2.31.2 Release
------------------------

On May 7, 2019, we released AIMMS PRO 2.31.2 (2.31.2.1). Changes made in
this release are listed below.



**Resolved Issues**

-  **AIMMS Cloud Platform**: Removed unwanted error message from the
   Tunnel configuration when adding a tunnel to the Cloud Application
   Database.
-  **On-Premise:** Fixed possible vulnerability with the AIMMS PRO
   Configurator.

--------------

AIMMS PRO 2.31.1 Release
------------------------

On May 3, 2019, we released AIMMS PRO 2.31.1 (2.31.1.4). Changes made in
this release are listed below.



**Improvements**

-  AIMMS Cloud Platform is extended with the secure VPN access to your
   application databases running on the cloud, which allows more safe
   and secure database communication.
-  AIMMS Cloud Platform users can create/configure/migrate their
   application databases through the **'Database Configuration'** page
   under the 'Configuration' menu of the AIMMS PRO Portal. Please see
   the `documentation <https://manual.aimms.com/cloud/db-config.html>`__
   for more details.

**Resolved Issues**

-  **AIMMS Cloud Platform:** IP Ranges page is functioning again,
   meaning you can add/delete IP Ranges through the Portal by yourself.
-  Fixed the authorization of shared cases folder such that they will
   get r,w,x rights for every group/user when there is a access(any from
   r,w,x) for an App and will deny r,w,x rights for every group/user
   when the App access is denied.
-  **On-Premise:** Fixed an issue with the AIMMS PRO Desktop when
   validating the expired certificates.

PRO 2.30
########

AIMMS PRO 2.30.4 Release
------------------------

On April 5, 2019, we released AIMMS PRO 2.30.4 (2.30.4.0), which is
intended for AIMMS Cloud Platform only.



**Resolved Issues**

-  Fixed an issue where widgets could not load in the WebUI Applications
   when running on the AIMMS Cloud Platform.

--------------

AIMMS PRO 2.30.3 Release
------------------------

On March 28, 2019, we released AIMMS PRO 2.30.3 (2.30.3.0). 



**Resolved Issues**

-  Fixed an issue with the AimmsPROLauncher where it could stop and
   display an error when launched by a user with elevated rights who is
   not allowed to write to the Program Files folder. Now
   AimmsPROLauncher will be installed into the default AppData\Local
   folder of the user in such cases.
-  **On-Premise**: Disabled client-side certification by default in the
   AIMMS PRO Configurator for SSL configurations.

--------------

AIMMS PRO 2.30.2 Release
------------------------

On March 5, 2019, we released AIMMS PRO 2.30.2 (2.30.2.1). 



**Resolved Issues**

-  **AIMMS Cloud Platform:** Fixed an issue where long running solver
   session could stay in 'closing' state for a long time.
-  Fixed an issue where uploading files to AIMMS PRO using WebUI-Upload
   widget could fail when it takes more than 60 seconds to upload.

--------------

AIMMS PRO 2.30.1 Release
------------------------

On February 15, 2019, we released AIMMS PRO 2.30.1 (2.30.1.3). 



**Improvements**

-  Extended AIMMS PRO Library with
   ``pro::messaging::GetQueueAuthorization`` and
   ``pro::messaging::UpdateQueueAuthorization`` to have more control on
   the Queue Authorization. For details, please see the
   `documentation <https://manual.aimms.com/pro/pro-messaging.html>`__.
   (This does require an AIMMS Version 4.63 or higher).
-  Added '**Launch App**' button to quickly launch an app right after
   publishing. For details, please see the
   `documentation <https://manual.aimms.com/pro/appl-man.html#publishing-applications>`__. 

**Resolved Issues**

-  **AIMMS Cloud Platform:** Fixed an issue where solver or data session
   could no longer start.
-  **On-Premise:** Fixed an issue where installation or upgrade to AIMMS
   PRO 2.28 or higher could fail due to missing vcredist2010 dlls.
-  Fixed an issue where Desktop App could fail to launch with an
   'Unknown Error' being raised.

PRO 2.29
########

AIMMS PRO 2.29.2 Release
------------------------

On January 22, 2018, we released AIMMS PRO 2.29.2 (2.29.2.8).  Please note that we skipped
version 2.29.0 and 2.29.1 due to technical reasons.

**Improvements**

-  **AIMMS Cloud Platform:** AIMMS PRO 2.29 contains the functionality
   required to support our redesigned and rebuilt AIMMS Cloud Platform
   software. This redesigned version is easier to maintain and removes a
   number of information security vulnerabilities.
-  Several improvements on error messages.

**Resolved Issues**

-  Fixed an issue where sometimes AimmsPROLauncher could fail to launch
   a desktop application when using IE and Edge browsers.
-  Fixed an issue where sometimes launching an app using direct app URL
   could launch another instance(s) of the same app every 10 minutes.
-  Fixed an issue where older AIMMS versions (AIMMS 4.25 or lower) could
   no longer work with AIMMS PRO 2.27 or higher.
-  On-Premise: Fixed an issue with the configurator not accepting strong
   ciphers for SSL configurations.
-  On-Premise: Fixed an issue where uploading new certificate to PRO
   certificate store could fail.

PRO 2.28
########

AIMMS PRO 2.28.3 Release
------------------------

On November 29, 2018, we released AIMMS PRO 2.28.3 (2.28.3.1).  

**Improvements**

-  AIMMS PRO Portal will no longer show 'License profile' during App
   publish or App update when there is only single license profile for
   your AIMMS PRO.

**Resolved Issues**

-  **AIMMS Cloud Platform:** Fixed an issue where non-release:d/internal
   AIMMS Versions got listed on the AIMMS Cloud Platform.
-  Fixed an issue where AIMMS PRO Root/Administartor could no longer
   change his/her own password in some specific scenario.
-  Fixed an issue where incorrect error messages were logged in PRO
   session logs.

--------------

AIMMS PRO 2.28.2 Release
------------------------

On November 13, 2018, we released AIMMS PRO 2.28.2 (2.28.2.0).  

**Improvements**

-  **AIMMS Cloud Platform:** From now our development and customer
   support teams will be notified when maintenance (clean-up) jobs fails
   or hangs which caused some downtime recently on AIMMS Cloud Platform.
-  **AIMMS Cloud Platform:** Improved our code such that cloud users now
   do not experience 'no disk space' problem while publishing or opening
   an App.

**Resolved Issues**

-  Fixed an issue where AIMMS PRO upgrade could fail when 'General
   Users' group of ROOT environment is deleted.

--------------

AIMMS PRO 2.28.1 Release
------------------------

On November 8, 2018, we released AIMMS PRO 2.28.1 (2.28.1.0).  

**Resolved Issues**

-  Fixed an issue where AIMMS PRO desktop sessions could crash or close
   itself when there is no network connection.

--------------

AIMMS PRO 2.28.0 Release
------------------------

On October 18, 2018, we released AIMMS PRO 2.28.0 (2.28.0.7).  

**Improvements**

-  Extended security logging with more security events like App publish,
   App update, App edit and App delete.

**Resolved Issues**

-  Fixed an issue where Jobs page could list the jobs which already
   exceeded the job retention time.
-  **AIMMS Cloud Platform:** Fixed an issue where scheduled job could
   fail to start when the new AIMMS PRO Version is deployed to the AIMMS
   Cloud Platform.
-  Fixed an issue where sometimes two data sessions could be started
   with the same id when user double clicks the application.

PRO 2.27
########

AIMMS PRO 2.27.0 Release
------------------------

On September 25, 2018, we released AIMMS PRO 2.27.0 (2.27.0.4).  

**Improvements**

-  Metering service (which stores memory and CPU usage of the PRO
   session to database) is refactored for internal improvement.
-  Increased default timeout for WinUI session from 1 minute to 15
   minutes.

**Resolved Issues**

-  Fixed an issue where it allowed user to add 'Other' in app
   categories, which is also the default app category and it resulted
   into duplicate categories.
-  Fixed an issue where WebUI app could fail to launch when app name
   contained square brackets.

PRO 2.26
########

AIMMS PRO 2.26.1 Release
------------------------

On August 21, 2018, we released AIMMS PRO 2.26.1 (2.26.1.0). 

**Resolved Issues**

-  Fixed an issue introduced in AIMMS PRO 2.26.0 which caused the WebUI
   to no longer show stored case files.
-  The .NET PRO API now depends on a newer version (9.0.1.19813)
   of Newtonsoft.Json.dll.

--------------

AIMMS PRO 2.26.0 Release
------------------------

On August 17, 2018, we released AIMMS PRO 2.26.0 (2.26.0.4).  Please note that, although the
.26 number suggests otherwise, this is a bug fix release instead of a
Feature Release.

**Resolved Issues**

-  Fixed an issue with the ControlPanel app where closing 'Attributes'
   or 'Security' window in the 'Application details' of the selected
   Project could lead to a crash.
-  Fixed an issue with the AIMMS PRO API where it displayed incorrect
   fatal log message immediately after closing the server connection
   without any actual error.
-  Fixed an issue with the AIMMS PRO API where
   ``server.downloadStorageFileToLocalFile`` could not create the file in
   specified directory and could create 0 kb file when downloading
   non-existing file from storage.
-  Fixed an issue with the PRO Case Manager where it could take long
   time to list all case files from PRO Storage.
-  Fixed an issue where launching a WebUI app could fail when the
   'customer text' from the license server contains space.

PRO 2.25
########

AIMMS PRO 2.25 Release
----------------------

On July 20, 2018, we released AIMMS PRO 2.25.0 (2.25.0.476). 

**Improvements**

-  **Categories:** AIMMS PRO Portal allows you to group your Apps into
   categories. For details, see the
   `documentation <https://manual.aimms.com/pro/appl-man.html#manage-categories>`__.
-  Added option to change App description and logo after publication.
   For details, see the
   `documentation <https://manual.aimms.com/pro/appl-man.html#edit-applications>`__.
-  **AIMMS Cloud Platform:** Small solves (which takes 2 or 3 seconds)
   can be much faster on the AIMMS Cloud using Solver Lease instead of
   DelegateToServer. For details, see the
   `documentation <https://manual.aimms.com/pro/solver-lease.html>`__.
   This does require an AIMMS Version 4.57 or higher.
-  AIMMS PRO Sessions are now logged to a separate file per session
   under log/Sessions folder of the Server. This also fixes the issue
   where session could fail when two sessions writing to Session.log at
   the same time.

**Resolved Issues**

-  AIMMS Cloud Platform: Fixed an issue where new users cannot login to
   AIMMS Cloud using SAML environments.
-  Fixed an issue where tunnel could not reconnect after connection
   loss.

PRO 2.24
########

AIMMS PRO 2.24.3 Release
------------------------

On July 12, 2018, we released AIMMS PRO 2.24.3 (2.24.3.462). 

**Resolved Issues**

-  **AIMMS PRO API**: the API call to *JobInteractor.waitForEvent* will
   now return an error when the connection with the server has been
   severed.

--------------

AIMMS PRO 2.24.2 Release
------------------------

On July 5, 2018, we released AIMMS PRO 2.24.2 (2.24.2.449). 

**Resolved Issues**

-  Fixed an issue where connection to AIMMS License Server could fail
   while running concurrent solver sessions.
-  Fixed an issue with AIMMS PRO API where migration of Java API could
   fail as it required elevated privileges.

--------------

AIMMS PRO 2.24.1 Release
------------------------

On July 3, 2018, we released AIMMS PRO 2.24.1 (2.24.1.446). 

**Improvements**

-  Improved UI and visuals for 'Tag App as latest' and 'Default
   Environment' features.

--------------

AIMMS PRO 2.24.0 Release
------------------------

On June 26, 2018, we released AIMMS PRO 2.24.0 (2.24.0.437). 

**New Features**

-  **Default Environment:** AIMMS PRO Administartors can set the
   'Default' environment for login to the AIMMS PRO Portal, meaning end
   users now no longer need to select the Environment on the login page
   (of course user can still select the other environment from the
   list). For details, see the
   `documentation <https://manual.aimms.com/pro/user-man.html#default-environment-for-login>`__.
-  **Direct App Launch:** Now it is possible to directly launch
   desktop/WebUI app without first going to the Apps(applications) page
   after successful authentication to your AIMMS PRO portal. For
   details, see the
   `documentation <https://manual.aimms.com/pro/appl-man.html#direct-app-launch>`__.
-  **Tag App as latest:** App developers/publishers can assign 'latest'
   tag to the App when they have a newer version of the App published
   and make the latest version available to all end users. For details,
   see the
   `documentation <https://manual.aimms.com/pro/appl-man.html#tag-as-latest>`__. 
-  **Security logging** has been enabled for AIMMS PRO security events
   like user logon, logoff, logon failure, user group and user details
   changes, changes in the user management. Please note that this log is
   already configured for new on-premise AIMMS PRO installations and for
   existing installations it need to be configured manually. For
   details, see
   the `documentation. <https://manual.aimms.com/pro/logging.html#log-files>`__

**Resolved Issues**

-  Improved error message when user cannot access the AIMMS PRO data
   folder while opening WinUI app.
-  **On-premise**: Metering service (which stores memory and CPU usage
   of the PRO session to database) is adjusted such that it no longer
   submits telemetry by default.

PRO 2.23
########

AIMMS PRO 2.23.3 Release
------------------------

On June 12, 2018, we released AIMMS PRO 2.23.3 (build 2.23.3.425).
Changes made in this release are listed below.

**Resolved Issues**

-  Fixed an issue where Active Data Sessions page could crash after
   deleting the App with running session.
-  Fixed an issue where App could not be launched when it has a same
   name and version as some existing App which is deleted.

--------------

AIMMS PRO 2.23.2 Release
------------------------

On June 5, 2018, we released AIMMS PRO 2.23.2 (build 2.23.2.421 for
On-premise, build 2.23.2.422 for AIMMS Cloud Platform). Changes made in
this release are listed below.

**Improvements**

-  Hittting the maximum cardinality limit(1000) for each argument in a
   DelegateToServer call will no longer result in an error for on
   premise installations. In the cloud environment this will still
   result in an error being raised.

**Resolved Issues**

-  Fixed an issue where retrieving PRO environments/users could fail
   within AIMMS PRO API.
-  Fixed an issue where data could not be loaded in WebUI session when
   you interrupt/cancel solve.
-  AIMMS Cloud Platform: Fixed an issue where it was no longer possible
   to add 'IP Ranges' for more than 5 cloud accounts in US region.
-  AIMMS Cloud Platform: Fixed an issue where AIMMS PRO portal could not
   be available due to the lost connection to PRO back-end.

--------------

AIMMS PRO 2.23.1 Release
------------------------

On May 11, 2018, we released AIMMS PRO 2.23.1 (build 2.23.1.412).
Changes made in this release are listed below.

**Improvements**

-  **AIMMS Cloud Platform:** AIMMS PRO users will be blocked for 5
   minutes after 3 unsuccessful login attempts.

**Resolved Issues**

-  Fixed an issue where AIMMS PRO portal could not be available due to
   the lost connection to PRO back-end.

--------------

AIMMS PRO 2.23.0 Release
------------------------

On April 26, 2018, we released AIMMS PRO 2.23.0 (build 2.23.0.393 for
On-premise, build 2.23.0.410 for AIMMS Cloud Platform). Changes made in
this release are listed below.

**Improvements**

-  Strong passwords are enforced for AIMMS PRO Users. Please note that
   this is not applied to your current passwords. It is applicable only
   when you change the current password or create new user.
-  Starting with AIMMS PRO 2.23, AIMMS PRO users will be blocked for 5
   minutes after 3 unsuccessful login attempts. (Please note that this
   functionality is not yet available on AIMMS Cloud Platform, it will
   be available in next release)
-  'Seat Management' page is back to the Portal. Please see the
   `documentation <https://documentation.aimms.com/pro/admin-config-3.html#seats-management>`__
   for more details.

**Resolved Issues**

-  Fixed an issue that caused the ‘interrupt solve’ command issued to
   the solver session to be executed with a long delay.
-  Fixed an issue where AIMMS PRO API jobs were listed on 'Jobs' page
   for all users.

PRO 2.22
########

AIMMS PRO 2.22.1. Release
-------------------------

On March 29, 2018, we released AIMMS PRO 2.22.1 (2.22.1.360). 

**Improvements**

-  AIMMS PRO API now supports Java 7.

**Resolved Issues**

-  **AIMMS Cloud Platform:** Fixed an issue where sometimes WebUI
   sessions could terminate after being idle or busy for 30 seconds.
-  **AIMMS Cloud Platform:** Fixed an issue where AIMMS PRO Portal
   failed to load 'apps'(now applications) page when using bookmark or
   shortcut to this page.

--------------

AIMMS PRO 2.22.0 Release
------------------------

On March 13, 2018, we released AIMMS PRO 2.22.0 (2.22.0.344). 

**Improvements**

-  **AIMMS Cloud Platform**: It is no longer required to publish an
   AIMMS Versions in the cloud. All released (>=AIMMS 4.37) AIMMS
   Versions are made available in the cloud and Administrators/AIMMS
   Publishers just need to activate the AIMMS Version into their AIMMS
   Cloud Platform. Please see the
   `documentation <https://documentation.aimms.com/cloud/activation.html>`__
   for more details.
-  **AIMMS Cloud Platform**: Faster start-up of WebUI Applications.
-  **AIMMS Cloud Platform**: Added 'Description' and 'Created' fields to
   the IP Range and DB IP Range pages.
-  **AIMMS Cloud Platform**: For Application Database, added support for
   more subnet masks.
-  Added 'process id' for sessions on Portal's 'Jobs' and 'Active Data
   Sessions' page which can be used to report issues about failed
   sessions.

PRO 2.21
########

AIMMS PRO 2.21.1 Release
------------------------

On March 2, 2018, we released AIMMS PRO 2.21.1 (2.21.1.339). 

**Resolved Issues**

-  Fixed an issue where App deletion could fail in some specific
   scenarios.
-  Fixed an issue where sometimes WebUI applications could not be
   started due to the database error.
-  Fixed the default configuration for one of the AIMMS PRO Server
   component where it could not be reached from other server in AIMMS
   PRO Cluster setup.

--------------

AIMMS PRO 2.21.0 Release
------------------------

On February 16, 2018, we released AIMMS PRO 2.21.0 (2.21.0.325). 

**Improvements**

-  Improved support for SAML Authentication.
-  AIMMS Versions are sorted in descending order while App
   publishing/Updating.
-  Improved logging for AIMMS Cloud Platform.

**Resolved Issues**

-  Fixed an issue where ``pro::PROUserFullname`` and ``pro::PROUserEmail`` could
   be blank when used in Desktop/WebUI Applications. This does require a
   new AIMMS version >= 4.50.

PRO 2.20
########

AIMMS PRO 2.20.0 Release
------------------------

On January 16, 2018, we released AIMMS PRO 2.20.0 (2.20.0.311). 

**Improvements**

-  AIMMS PRO now supports SAML Authentication meaning AIMMS PRO
   framework allows you to link any environment to a SAML identity
   provider (e.g. AD FS) so that your users may be authenticated using
   your own user management system. Please see the
   `documentation <https://documentation.aimms.com/pro/saml.html>`__
   for more details.

**Resolved Issues**

-  Fixed an issue where solver session could crash after running for 24
   hours.
-  Fixed an issue where where app publishing could fail when an
   aimmspack file is exactly a multiple of 1 MB( 1024*1024 bytes).
-  Cloud: Fixed an issue with 'DB IP Ranges' page when there is no
   application DB configured.

PRO 2.19
########

AIMMS PRO 2.19.0 Release
------------------------

On January 3, 2018, we released AIMMS PRO 2.19.0 (2.19.0.303). 

**Improvements**

-  'DB IP Range Blocking' is added to the AIMMS Cloud Platform. It
   enables customers to enhance the security of their AIMMS PRO
   Application Databse by limiting the access to only specific
   IP-ranges. Admin users can specify one or more IP-ranges through the
   'DB IP Ranges' page under the 'Configuration' menu of the AIMMS PRO
   Portal.

**Resolved Issues**

-  The AIMMS PRO Configurator no longer contains the Migration tab. If
   you need to migrate from PRO 1 to PRO 2, please migrate first to
   AIMMS PRO 2.0 and then upgrade to the latest version.
-  Fixed an issue where an AIMMS project with ‘+’ symbols in its name
   could not be deleted.
-  Fixed an issue where an AIMMS project with dots in its version (e.g.
   ‘1.a’) could not be deleted.
-  Fixed the ordering on the Apps page, such that published projects are
   now ordered by name.
-  Fixed an issue with the occupied seats counting being incorrect.
-  Overall stability improvements.

PRO 2.18
########

AIMMS PRO 2.18.1 Release
------------------------

On December 7, 2017, we released AIMMS PRO 2.18.1 (2.18.1.270). 

**Resolved Issues**

-  Improved memory consumption for AIMMS Cloud Platform.
-  Fixed an issue where solver session could crash after running for 24
   hours.
-  Fixed an issue that could cause the PRO server to become unresponsive
   when a large number of messages is coming in.

--------------

AIMMS PRO 2.18.0 Release
------------------------

On November 21, 2017, we released AIMMS PRO 2.18.0 (2.18.0.241). 

**Improvements**

-  Stability improvements for AIMMS Cloud Platform.
-  'IP Range Blocking' is added to the AIMMS Cloud Platform. It enables
   customers to enhance the security of their AIMMS PRO environment by
   limiting the access to only specific IP-ranges. Admin users can
   specify one or more IP-ranges through the 'IP Ranges' page under the
   'Configuration' menu of the AIMMS PRO Portal. For more details please
   see the
   `documentation <https://documentation.aimms.com/cloud/admin-config-2.html>`__.
-  AIMMS PRO APIs are now version independent, so that AIMMS PRO API
   users would not need to compile their API Programmes with every AIMMS
   PRO Upgrade.

**Resolved Issues**

-  Fixed an issue where queued sessions could not be started when having
   multiple worker(license) profiles in AIMMS PRO Configurator.
-  Fixed an issued introduced with PRO 2.16 concerning PRO user/group
   management from within the AimmsPROLibrary.

PRO 2.17
########

AIMMS PRO 2.17.2 Release
------------------------

On November 2, 2017, we released AIMMS PRO 2.17.2 (2.17.2.230). 

**Improvements**

-  Moved the 'Queue Priorities Settings' section from AIMMS PRO
   Configurator to the Configuration menu of the AIMMS PRO Portal in
   order to make it available for AIMMS Cloud Platform.

**Resolved Issues**

-  Fixed an issue that caused AIMMS to crash (under certain rare
   circumstances) when the connection to the PRO server was lost.
-  Fixed an issue where launching a WebUI app could fail when the
   'customer text' from the license server contains space.
-  Added support for SSL and TCP tunnels from within AIMMS PRO sessions
   to any location. This does require a new AIMMS version >= 4.44.

--------------

AIMMS PRO 2.17.1 Release
------------------------

On October 19, 2017, we released AIMMS PRO 2.17.1 (2.17.1.214). 

**Improvements**

-  New functionality for the AIMMS Cloud Platform internal workings.
-  Improvements in the AIMMS PRO Cluster, now it is more fail-proof and
   decentralized.
-  Added 'Active Data Sessions' page under the Configuration menu of the
   AIMMS PRO Portal. For more details please see the
   `documentation <https://documentation.aimms.com/pro/admin-config-3.html>`__.
-  Removed 'Monitoring' pages and menu from the AIMMS PRO Portal which
   was mainly used by AIMMS PRO Developers.


PRO 2.16
########

AIMMS PRO 2.16.5.193 Release
----------------------------

On September 7, 2017, we released AIMMS PRO 2.16.5.193. Changes made in
this release are listed below.

**Important:** If you want to use AIMMS 4.40 and higher, you should use
this PRO version or higher.

**Resolved Issues**

-  Fixed an issue where AIMMS PRO Desktop session could crash when the
   physical connection to the AIMMS PRO server has fallen away, while
   the desktop client has not yet fully become aware of this.

--------------

AIMMS PRO 2.16.4.182 Release
----------------------------

On August 17, 2017, we released AIMMS PRO 2.16.4.182. Changes made in
this release are listed below.

**Improvements**

-  Added date of publish and improved architecture details of the AIMMS
   PRO Packages on the AIMMS Versions page.

**Resolved Issues**

-  Fixed an issue where user could delete case files from 'PRO Shared
   Cases' without having write permission.
-  Cloud: Fixed an issue where listing case files under PRO storage
   could very slow using the AIMMS case manager for desktop Apps.

--------------

AIMMS PRO 2.16.3.155 Release
----------------------------

On July 19, 2017, we released AIMMS PRO 2.16.3.155. Changes made in this
release are listed below.

**Resolved Issues**

-  Fixed an issue where changing any widget options in WebUI apps could
   fail and result in the red dialog messages in the case of clean
   install of AIMMS PRO 2.16.

--------------

AIMMS PRO 2.16.3.149 Release
----------------------------

On July 13, 2017, we released AIMMS PRO 2.16.3.149. Changes made in this
release are listed below.

**Improvements**

-  The AIMMS PRO App Launcher will now display a dialog box when it is
   transferring WinUI applications (after clicking 'Launch App' for
   WinUI apps).
-  Memory footprints of the AIMMS PRO services are now reduced.



   **Resolved Issues**

   -  Fixed an issue where the PRO upgrade could cause validation errors
      in the AIMMS PRO Configurator when a hostname under server node
      was in uppercase.
   -  Fixed an issue where WebUI apps could not be launched when the
      full name of the AIMMS PRO user contained spaces.

.. _aimms-pro-2.16.2-release:

--------------

AIMMS PRO 2.16.2 Release
----------------------------


   On June 23, 2017, we released AIMMS PRO 2.16.2 (2.16.2.106). Changes
   made in this release are listed below.

   **Improvements**

   -  Improved logging in the AIMMS PRO Launcher.
   -  Removed spurious logging statements for expected exceptions.
   -  The AIMMS PRO Launcher will immediately become responsive again
      and let the user know that the application could not be started
      when it is failed to launch the AIMMS application.

   

      **Resolved Issues**

      -  Fixed an issue where the PRO server could get into infinite
         loop after renaming the hostname, resulting into low
         performance.
      -  Fixed an issue where relaying of PRO messages potentially could
         lead to delays due to connections not being available.
      -  Added more logging when saving/loading a case in PRO such that
         when it fails, it is more clear what the reason was.
      -  The AIMMS PRO services on Windows are now depending on the
         'TCP/IP NetBIOS Helper', 'Remote Procedure Call (RPC)' and
         'Server' stock Windows-services to be operational before
         starting. This solves an issue in which after a long Windows
         Update sequence the AIMMS PRO services did not start up
         correctly.
      -  PRO API: Fixed an issue in the PRO API that caused injecting of
         procedure calls into running sessions to fail.
      -  PRO API: Added a queue method to the JobInteractor that allows
         to queue another ProcedureCall after the current one is
         finished.
      -  Cloud: Fixed an issue which caused the App icons and login
         background to disappear when upgrading from 2.16.0. to 2.16.1.

.. _aimms-pro-2.16.1-release:

--------------

AIMMS PRO 2.16.1 Release
----------------------------


      On June 13, 2017, we released AIMMS PRO 2.16.1 (2.16.1.91).
      Changes made in this release are listed below.

      **Improvements**

      -  Stability improvements for AIMMS Cloud Platform.

.. _aimms-pro-2.16.0-release:

--------------

AIMMS PRO 2.16.0 Release
----------------------------


      On April 25, 2017, we released AIMMS PRO 2.16.0 (2.16.0.54).
      Changes made in this release are listed below.

      **Improvements**

      -  Ability to delete multiple Apps and unused Aimms Versions.
      -  Added new menu 'Configuration' for PRO Administrators which
         contains the configuration settings for Active Directory,
         Retention Time, Portal Customization, Tunnels. For more
         details, please see `AIMMS PRO
         Manual <https://documentation.aimms.com/pro/admin-config.html>`__
      -  Moved some of the configuration settings like Active Directory,
         Retention Time, Portal Customization, Tunnels from AIMMS PRO
         Configurator to AIMMS PRO Portal's new menu 'Configuration' in
         order to make these features available for AIMMS Cloud
         Platform.

      

         **Resolved Issues**

         -  Stability fixes for AIMMS Cloud Platform.
         -  A problem was addressed with lost connections with the
            WebUI.

PRO 2.15
########

.. _aimms-pro-2.15.1-release:

--------------

AIMMS PRO 2.15.1 Release
----------------------------


         On April 7, 2017, we released AIMMS PRO 2.15.1 (2.15.1.36).
         Changes made in this release are listed below.

         **Improvements**

         -  Stability improvements for WebUI applications by changing
            the way in which the WebUI widgets are served. They now run
            as a separate process.

         

            **Resolved Issues**

            -  Fixed an issue with WebUI applications where zooming in
               or out in a Map widget or having an upload/download
               widget in the application could result in some incorrect
               messages.
            -  Fixed an issue where the AIMMS PRO server could become
               unresponsive for several minutes due to the high load of
               incoming messages sent by a solver session.

PRO 2.14
########

.. _aimms-pro-2.14.1-release:

--------------

AIMMS PRO 2.14.1 Release
----------------------------


            On February 20, 2017, we released AIMMS PRO 2.14.1
            (2.14.1.1042). Changes made in this release are listed
            below.

            **Resolved Issues**

            -  Fixed an issue where older AIMMS versions (i.e.AIMMS
               3.13,4.0) could no longer work with AIMMS PRO 2.13 or
               higher.

.. _aimms-pro-2.14-release:

--------------

AIMMS PRO 2.14 Release
----------------------------


            On February 16, 2017, we released AIMMS PRO 2.14
            (2.14.0.1031). Changes made in this release are listed
            below.

            **Improvements**

            -  Security improvements for AIMMS PRO Configurator and
               portal.
            -  Added some system characteristics information in client
               session logs.
            -  Refactored session queue time/run time calculation by
               adding 'initialising' state between 'queued' and
               'running' state, where the time between initialising and
               finished is the time spent in AIMMS, and the time between
               queued and initialising is the actual queued time.
            -  WebUI sessions are killed immediately and seat is
               released when user logs out from the AIMMS PRO portal.

            

               **Resolved Issues**

               -  Fixed an issue where AIMMS PRO configurator displayed
                  improper error message when AIMMS PRO License is
                  expired.
               -  Fixed an issue where incorrect details displayed on
                  seat monitoring page when logged into non-ROOT
                  environments.

PRO 2.13
########

.. _aimms-pro-2.13.4-release:

--------------

AIMMS PRO 2.13.4 Release
----------------------------


               On January 12, 2017, we released AIMMS PRO 2.13.4
               (2.13.4.1003). Changes made in this release are listed
               below.

               **Improvements**

               -  Improved stability of networking code (connections
                  between running apps and PRO backend).

               

                  **Resolved Issues**

                  -  Fixed an issue with displaying non-Latin characters
                     in WebUI applications.
                  -  Fixed an issue with presence of non-Latin
                     characters in resources of WebUI applications.
                  -  Fixed an issue with upload files functionality in
                     WebUI applications.

                  

                     **IMPORTANT**: AIMMS PRO API users need to
                     recompile their Java or C# programme after
                     upgrading to AIMMS PRO 2.13 with the latest AIMMS
                     PRO API library. No changes in the code are
                     required, all that's needed is to recompile the
                     project and supply the new version with the latest
                     library included.

                  

                       
.. _aimms-pro-2.13.3-release:

--------------

AIMMS PRO 2.13.3 Release
----------------------------


                  On December 23, 2016, we released AIMMS PRO 2.13.3
                  (2.13.3.986). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  License sessions are now counted per user/device
                     combination, instead of per session. This means
                     that one user can now run multiple apps whilst only
                     occupying one session. Please note that this
                     requires a version of the license server version
                     4.0.0.50 or higher. Click
                     `Download Network License Server <https://www.aimms.com/support/downloads/#aimms-other-download>`_.

                  

                     **IMPORTANT**: AIMMS PRO API users need to
                     recompile their Java or C# programme after
                     upgrading to AIMMS PRO 2.13 with the latest AIMMS
                     PRO API library. No changes in the code are
                     required, all that's needed is to recompile the
                     project and supply the new version with the latest
                     library included.

                  

                       
.. _aimms-pro-2.13-release:

--------------

AIMMS PRO 2.13 Release
----------------------------


                  On November 30, 2016, we released AIMMS PRO 2.13
                  (2.13.0.931). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  AIMMS PRO now provides support for proxy-servers
                     that require NTLM authentication.
                  -  Technical improvement in order to support different
                     compilers.

                  

                     **IMPORTANT**: AIMMS PRO API users need to
                     recompile their Java or C# programme after
                     upgrading to AIMMS PRO 2.13 with the latest AIMMS
                     PRO API library. No changes in the code are
                     required, all that's needed is to recompile the
                     project and supply the new version with the latest
                     library included.

                  

                       

                  **Resolved Issues**

                  -  Fixed an UI issue on Permissions page where long
                     environment and user group names could be
                     truncated.
                  -  Fixed an issue where AIMMS PRO Logs zip archive
                     downloaded from ‘Log Management’ menu could not
                     extract correctly.

PRO 2.12
########

.. _aimms-pro-2.12.7-release:

--------------

AIMMS PRO 2.12.7 Release
----------------------------


                  On November 1, 2016, we released AIMMS PRO 2.12.7
                  (2.12.7.873). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Further improvement in authenticating certain
                     proxies.

.. _aimms-pro-2.12.6-release:

--------------

AIMMS PRO 2.12.6 Release
----------------------------


                  On October 27, 2016, we released AIMMS PRO 2.12.6
                  (2.12.6.861). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where AIMMS PRO could not
                     authenticate certain proxies.
                  -  Fixed an issue where the AppLauncher would wrongly
                     display the progress in the progress bar when
                     transferring larger (>20 MB) AIMMS applications.

.. _aimms-pro-2.12.5-release:

--------------

AIMMS PRO 2.12.5 Release
----------------------------


                  On October 21, 2016, we released AIMMS PRO 2.12.5
                  (2.12.5.849). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where AIMMS PRO request manager
                     could not respond on client side after the time is
                     changed due to the automatic configuration of
                     daylight savings.

.. _aimms-pro-2.12.4-release:

--------------

AIMMS PRO 2.12.4 Release
----------------------------


                  On October 18, 2016, we released AIMMS PRO 2.12.4
                  (2.12.4.841). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where AIMMS PRO processes could
                     cause memory leak over time, per connection to the
                     AIMMS PRO Server.

.. _aimms-pro-2.12.3-release:

--------------

AIMMS PRO 2.12.3 Release
----------------------------


                  On October 13, 2016, we released AIMMS PRO 2.12.3
                  (2.12.3.833). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Added more detailed logging and error message in
                     AimmsPROLauncher while launching AIMMS desktop
                     applications when no of concurrent connections
                     exceeds the limit (by default limit is up to 50
                     connections).

.. _aimms-pro-2.12.2-release:

--------------

AIMMS PRO 2.12.2 Release
----------------------------


                  On September 15, 2016, we released AIMMS PRO 2.12.2
                  (2.12.2.816). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where
                     ``pro::RetrieveFileFromCentralStorage`` did not return
                     1 on a successful file retrieval.
                  -  Fixed an issue where uploading a file through
                     UploadWidget in WebUI applications resulted in
                     error.

.. _aimms-pro-2.12.1-release:

--------------

AIMMS PRO 2.12.1 Release
----------------------------


                  On September 6, 2016, we released AIMMS PRO 2.12
                  (2.12.1.799). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  Added new parameter 'ReconnectToRunningSessions'
                     under ``pro::session`` in AIMMS PRO Library, which will
                     allow not to reconnect to status updates when set
                     to 0.

                  

                     **Resolved Issues**

                     -  Added ``pro::NormalizeStoragePath`` and
                        ``pro::SplitStoragePath`` to the interface of the
                        AIMMS PRO Library, hence it’s available from
                        outside the PRO Library.
                     -  Fixed an issue where ``licenseName`` argument of
                        ``pro::DelegatetoServer`` was not taken into
                        account.

.. _aimms-pro-2.12-release:

--------------

AIMMS PRO 2.12 Release
----------------------------


                  On August 25, 2016, we released AIMMS PRO 2.12
                  (2.12.0.777). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  Extended **AIMMS PRO API** with a new method
                     ``Server.deleteFileFromStorage`` which deletes a file
                     from AIMMS PRO storage. For details, see `the
                     documentation <https://documentation.aimms.com/pro/api.html>`__.

PRO 2.11
########

.. _aimms-pro-2.11-release:

--------------

AIMMS PRO 2.11 Release
----------------------------


                  On August 9, 2016, we released AIMMS PRO 2.11
                  (2.11.0.760). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  Extended AIMMS PRO ‘Administrative Tools’ menu with
                     ‘Log Management’ page, through which

                     -  Admin user can download AIMMS PRO log files from
                        AIMMS PRO Portal in a single zip archive so that
                        they can be easily submitted to the client
                        support in case of any issues.
                     -  Admin user has ability to change AIMMS PRO log
                        settings from AIMMS PRO Portal so that it's
                        easier to change the log level to track down an
                        issue and then put it back to the default
                        value. For more details, please see `AIMMS PRO
                        Manual <https://documentation.aimms.com/pro/admin-config-2.html>`__.

                  -  AIMMS PRO now provides support for proxy-servers
                     that require Kerberos authentication.

                  **Resolved Issues**

                  -  Fixed an issue which caused the SQL error while
                     setting user level permissions for the apps in some
                     specific scenario.
                  -  Fixed an issue where the PRO launcher did not
                     comply fully with IETF standards for communicating
                     with proxy-servers.

PRO 2.10
########

.. _aimms-pro-2.10.6-release:

--------------

AIMMS PRO 2.10.6 Release
----------------------------


                  On July 22, 2016, we released AIMMS PRO 2.10.6
                  (2.10.6.739). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where Launcher could not work when
                     the windows login name contained spaces.
                  -  In combination with newer (>= 4.23) AIMMS version:

                     -  When a fatal application error occurs on a
                        solver or data session a dump file is now
                        generated in ``%AIMMSPRO_DATADIR%\ErrorReports``.
                     -  Fixed an issue with saving the last WebUI
                        data-session state (case file) when large
                        amounts of data were involved.

.. _aimms-pro-2.10-release:

--------------

AIMMS PRO 2.10 Release
----------------------------


                  On July 8, 2016, we released AIMMS PRO 2.10
                  (2.10.5.725). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  Admin user has ability to delete seat for WebUI
                     apps and WinUI apps (for WinUI apps only 'reserved'
                     seats can be deleted) through Administrative Tools
                     – Seats Monitoring menu.
                  -  Added support for connections through web ports to
                     AIMMS PRO API.

                  **Resolved Issues**

                  -  Fixed an issue with connecting to certain proxy
                     servers that would cause the initial handshake to
                     fail while the connection was actually accepted
                     correctly.
                  -  Fixed an issue where user group cannot be deleted
                     when it has a very long name with character ‘_’
                     (underscore).
                  -  Fixed an issue where user could be redirected to
                     adLogin login page due to browser’s ad-blocker
                     setting of users.
                  -  Fixed an issue where AIMMS PRO was creating many
                     JVM mini dump files on the PRO server.
                  -  Fixed an issue where case or data files could get
                     corrupted due to the failed uploads which were not
                     remove from PRO Storage.

PRO 2.9
########

.. _aimms-pro-2.9.10-release:

--------------

AIMMS PRO 2.9.10 Release
----------------------------


                  On June 17, 2016, we released AIMMS PRO 2.9.10 (build
                  2.9.10.642). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue which was causing memory leaks on a
                     rare configuration of certain solvers.

.. _aimms-pro-2.9.9-release:

--------------

AIMMS PRO 2.9.9 Release
----------------------------


                  On June 7, 2016, we released AIMMS PRO 2.9.9 (build
                  2.9.9.633). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue with the API that caused not
                     releasing resources when possible at the server.
                  -  Added logging of server-side resource consumption.

.. _aimms-pro-2.9.8-release:

 AIMMS PRO 2.9.8 Release
----------------------------


                  On May 27, 2016, we released AIMMS PRO 2.9.8 (build
                  2.9.8.618). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where AIMMS Desktop launcher could
                     not connect directly when a connection through
                     proxy-server fails and could not launch the app.
                  -  Fixed an issue where Licence took long to be free
                     in some scenarios.
                  -  Proper error message will be displayed when the
                     tunnel endpoint is not reachable.

.. _aimms-pro-2.9.7-release:

--------------

AIMMS PRO 2.9.7 Release
----------------------------


                  On May 4, 2016, we released AIMMS PRO 2.9.7 (build
                  2.9.7.604). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed an issue where some Apps could not launch
                     through IE.
                  -  Decreased the time from 4-5 minutes to 25 seconds
                     for License to be free when client lost a physical
                     connection (when client is not reachable).

.. _aimms-pro-2.9.6-release:

--------------

AIMMS PRO 2.9.6 Release
----------------------------


                  On April 22, 2016, we released AIMMS PRO 2.9.6 (Build
                  2.9.6.598). Changes made in this release are listed
                  below.

                  **Improvements**

                  -  Increased default timeout for JobConfig from 5
                     minute to 1 hour in AIMMS PRO API.
                  -  AIMMS PRO Portal now gives message when files are
                     not downloaded correctly to the client and it
                     deletes files from ``%localappdata%\Aimms\PRO\\``
                     folder so that it can be downloaded again
                     successfully.

                  **Resolved Issues**

                  -  Fixed an issue with launching WebUI applications
                     that appeared with some HTTPS certificates.
                  -  Fixed an issue where Upload widget in WebUI
                     applications could stop working after running data
                     session for some time.
                  -  Fixed an issue where admin user could not see jobs
                     submitted by all other users via ListAllJobs in
                     AIMMS PRO API.

.. _aimms-pro-2.9.5-release:

--------------

AIMMS PRO 2.9.5 Release
----------------------------


                  On April 14, 2016, we released AIMMS PRO 2.9.5.584.
                  Changes made in this release are listed below.

                  **Improvements**

                  -  We have set the memory limits for AIMMS PRO Java
                     processes in order to limit the memory usage of the
                     server during solver sessions.

.. _aimms-pro-2.9.4.573-release:

--------------

AIMMS PRO 2.9.4.573 Release
----------------------------


                  On April 5, 2016, we released AIMMS PRO 2.9.4.573.
                  Changes made in this release are listed below.

                  **Resolved Issues**

                  -  Fixed an issue where it was still able to accept
                     SSL RC4 ciphers.

.. _aimms-pro-2.9.4-release:

--------------

AIMMS PRO 2.9.4 Release
----------------------------


                  On April 1, 2016, we released AIMMS PRO 2.9.4 (build
                  2.9.4.568). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Upgraded internal web server component to patch a
                     security issue.
                  -  Disabled various deprecated SSL ciphers to make the
                     SSL connection more secure.
                  -  Changed AIMMS PRO API so that it can allow multiple
                     invocation of the same JobConfig/ProcedureCall
                     instance.
                  -  Fixed an issue where launcher failed to launch the
                     desktop apps (which contained spaces in App name)
                     on some versions of Internet Explorer.

.. _aimms-pro-2.9.3-release:

--------------

AIMMS PRO 2.9.3 Release
----------------------------


                  On March 24, 2016, we released AIMMS PRO 2.9.3 (build
                  2.9.3.546). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Fixed a web socket tunnel issue which caused the
                     connection lost after 5 minutes ideal time.
                  -  Fixed an issue where starting an application from
                     PRO portal could result in errors in some
                     scenarios.
                  -  Fixed an issue where PRO portal was not removing
                     temporary files from C:\Windows\Temp.
                  -  Fixed an issue where sometimes PRO portal could not
                     accept new HTTPS connections.

.. _aimms-pro-2.9.2-release:

--------------

AIMMS PRO 2.9.2 Release
----------------------------


                  On March 11, 2016, we released a bug fix on AIMMS PRO
                  2.9 (build 2.9.2.524). Changes made in this release
                  are listed below.

                  **Resolved Issues**

                  -  Fixed an issue where incoming websocket traffic
                     could be intermittently truncated due to which
                     multiselect widget in WebUI apps remained empty.

.. _aimms-pro-2.9.1-release:

--------------

AIMMS PRO 2.9.1 Release
----------------------------


                  On March 10, 2016, we released a bug fix on AIMMS PRO
                  2.9 (build 2.9.1.518). Changes made in this release
                  are listed below.

                  **Resolved Issues**

                  -  Fixed an issue where Active Directory users which
                     belongs to many user groups were not able to login
                     to PRO.

.. _aimms-pro-2.9-release:

--------------

AIMMS PRO 2.9 Release
----------------------------


                  On February 25, 2016, we released AIMMS PRO 2.9 (build
                  2.9.0.505). Changes made in this release are listed
                  below.

                  **Resolved Issues**

                  -  Improved logging and more specific error messages
                     for Active directory.
                  -  Fixed an issue where publishing a WebUI app under a
                     same name that has been used before was messing up
                     the WebUI layout.
                  -  Fixed an UI issue on account settings page.
                  -  Fixed an issue where AIMMS WebUI upload widget
                     could fail due to incomplete AIMMS PRO
                     configuration in the case of clean install.
                  -  Added proxy support which allows web sockets used
                     in AIMMS to connect over a proxy.

                  
PRO 2.8
########
                   

.. _aimms-pro-2.8-release:

--------------

AIMMS PRO 2.8 Release
----------------------------


                  On February 5, 2016, we released AIMMS PRO 2.8 (build
                  2.8.1.475). Changes made in this release are listed
                  below.

                  **New Feature**

                  -  Extended **AIMMS PRO API** with two new methods
                     ``Server.downloadStorageFileToLocalFile`` and
                     ``Server.uploadLocalFileToStorage`` which allows to
                     put and get files in/from the AIMMS PRO Storage so
                     that the AIMMS models can work get data from
                     externally generated input files and output results
                     to the files that can be used externally. For
                     details, see `the
                     documentation <http://download.aimms.com/aimms/PROAPI/frames.html?frmname=topic&frmfile=%21%21MEMBERVISIBLITY_public_com_aimms_pro_api_Server.html>`__.

                  **Resolved Issues**

                  -  User was not able to update an App when do not have
                     ‘execute’ permission.
                  -  Double click on App icon did not launch correct app
                     when having more than 12 apps on Apps page.
                  -  Active directory users were not able to re-login to
                     PRO using Internet explorer unless they restart the
                     browser.
                  -  PRO services were able to start with an expired PRO
                     license, where it should not.
                  -  Fixed an issue that caused the desktop client to no
                     longer handle update messages from the
                     solver/server session.

                  

PRO 2.7
########                   

.. _aimms-pro-2.7-release:

--------------

AIMMS PRO 2.7 Release
----------------------------


                  On January 28, 2016, we released AIMMS PRO 2.7 (build
                  2.7.0.450). Changes made in this release are listed
                  below.

                  **New Feature**

                  -  The main feature of AIMMS PRO 2.7 is that it now
                     also supports AIMMS PRO on a **Linux** server (of
                     course, PRO 2.7 still runs just fine on Windows).
                     Running AIMMS PRO on a Linux Server is somewhat
                     different from running AIMMS PRO on a Windows
                     Server. The main difference lies in the field of
                     AIMMS PRO installation.
                     The Windows installation process remains unaltered.

                  **Resolved Issues**

                  -  Fixed an issue causing the AIMMS PRO desktop client
                     not to start for users that have
                     non-UTF7-characters in their Windows login name
                     (i.e. äbc, ééms).
                  -  Fixed an issue causing message-processing to stop
                     under certain conditions when invoking
                     ``pro::messaging::WaitForMessages``.
                  -  Fixed an issue where AIMMS PRO Desktop client was
                     not able to reconnect to active solver session by
                     using request manager’s progress window option when
                     application is launched again.

PRO 2.6
########                

.. _aimms-pro-2.6.4-release:

--------------

AIMMS PRO 2.6.4 Release
----------------------------


                  On January 8, 2016, we released AIMMS PRO 2.6.4 (build
                  2.6.4.384). The following improvement has been made in
                  this release:

                  -  Fixed tunnel issue where websocket proxy was always
                     picking up the very first tunnel as destination, in
                     scenario when more than one tunnels are configured.

                  

                   

.. _aimms-pro-2.6.3-release:

--------------

AIMMS PRO 2.6.3 Release
----------------------------


                  On December 24, 2015, we released AIMMS PRO 2.6.3
                  (build 2.6.3.335). The following improvement has been
                  made in this release:

                  -  Fixed support for IE-8. Now AIMMS PRO portal
                     functionally works on IE 8.

                  

                   

.. _aimms-pro-2.6.2.324-release:

--------------

AIMMS PRO 2.6.2.324 Release
----------------------------


                  On December 15, 2015, we released AIMMS PRO 2.6.2.324.
                  The following improvements have been made in this
                  release:

                  -  Improved stability for HTTPS connections.
                  -  Changed authorization check so that admin can view
                     users from another environments that belong to a
                     group from his/her group.
                  -  Fixed an issue that caused the AIMMS PRO Desktop
                     client not to start correctly when the ``solvers.slv``
                     file was present inside the published aimmspack.
                  -  AIMMS PRO portal now supports ``.gif``  for Login page
                     background image and for Company logo.

                  

                   

.. _aimms-pro-2.6.2-release:

--------------

AIMMS PRO 2.6.2 Release
----------------------------


                  On December 4, 2015, we released AIMMS PRO
                  2.6.2 (build 2.6.2.308). The following improvements
                  have been made in this release:

                  -  Improve performance of HTTP and especially HTTPS
                     connections to PRO server, especially in medium- to
                     high-latency scenarios. HTTPS and HTTP now exhibit
                     the same speed.
                  -  Solved stability issues of websocket connections
                     over HTTPS from the PRO desktop client to the PRO
                     backend services. In scenarios where multiple
                     messages were exchanged in relatively high
                     frequency, the connection could be dropped, and the
                     PRO desktop client could crash or hang.
                  -  Fixed a configurator issue leading to null-pointer
                     exceptions when certain configuration fields were
                     left empty.
                  -  Fixed an issue where downloading a case from the
                     request manager could fail.
                  -  Fixed an issue where permissions set on
                     environments would not propagate to groups and
                     users within such environments
                  -  User permissions set for a user from one
                     environment will now also be shown when the user is
                     displayed as a group member in another environment.

                  

                   

.. _aimms-pro-2.6-release:

--------------

AIMMS PRO 2.6 Release
----------------------------


                  On November 4, 2015, we released AIMMS PRO 2.6 (build
                  2.6.1.247). The following improvements have been made
                  in this release:

                  -  **Branding:** We have redesigned the look and feel
                     of the AIMMS PRO portal to match our updated AIMMS
                     branding. In addition, we introduced a
                     customization feature that lets you add your own
                     branding and in-house support contact details. For
                     details, see `the
                     documentation <https://documentation.aimms.com/pro/admin-config-1.html#portal-customization>`__.
                  -  Improved the navigation in the AIMMS PRO
                     Configurator.
                  -  Improved the ability to diagnose problems by
                     improving the log outputs.
                  -  Improved tunnel functionality.

                     -  Multiple connections over same tunnel.
                     -  Authorizations errors are now emitted during
                        starting of tunnel instead of upon accessing the
                        tunnel by e.g. the ODBC driver.

                  -  Improved stability for central storage operations.

                  
PRO 2.5
########
                   

.. _aimms-pro-2.5-release:

--------------

AIMMS PRO 2.5 Release
----------------------------


                  On September 25, 2015, we released AIMMS PRO 2.5
                  (build 2.5.1.219). The following improvements have
                  been made in this release:

                  -  **API:** The new AIMMS PRO API allows you to build
                     custom Apps in Java or C# code using the AIMMS PRO
                     platform e.g. submit ‘solve jobs’ from these Apps.
                     Next to AIMMS Windows and WebApps, this means you
                     can now deploy AIMMS inside Apps; ideal for e.g.
                     closed loop optimization. In addition, the AIMMS
                     PRO API allows you to perform most tasks supported
                     by the AIMMS PRO job request manager. For details,
                     see `the
                     documentation <https://download.aimms.com/aimms/PROAPI/>`__.
                  -  **Backup-and-restore function:** This extension to
                     AIMMS PRO allows administrators to recover from
                     e.g. equipment failure and database corruption, and
                     to return to an earlier configuration of the AIMMS
                     PRO Setup. Backups can be scheduled and/or
                     manually-triggered. Having this in place will also
                     help our Client Support team to better support you,
                     as the created back-up files allow us (when shared)
                     to more easily reproduce your AIMMS PRO
                     configuration in case of questions. For details,
                     see `the
                     documentation <https://documentation.aimms.com/pro/config-sections.html#backup-management>`__.

                  

PRO 2.4
########                   

.. _aimms-pro-2.4.2-release:

--------------

AIMMS PRO 2.4.2 Release
----------------------------


                  On September 9, 2015, we released a bug fix on AIMMS
                  PRO 2.4 (build 2.4.2.190). The following improvements
                  have been made in this release:

                  -  Fixed an issue with opening a model with the
                     ‘&’-sign in the ``namesolved``.
                  -  Fixed an issue with deleting some apps that were
                     published in earlier versions of AIMMS PRO.
                  -  Fixed an issue with migration from PRO 1.0
                     resulting in the broken configuration.

                  

                   

.. _aimms-pro-2.4.1-release:

--------------

AIMMS PRO 2.4.1 Release
----------------------------


                  On August 10, 2015, we released AIMMS PRO 2.4 (build
                  2.4.1.160). The following improvement has been made in
                  this release:

                  -  We added tunneling functionality – see the `manual
                     topic on
                     this <https://documentation.aimms.com/pro/tunneling.html>`__.
                  -  The PRO Configurator is now a Windows service. It
                     is now a web page and can be accessed by going to
                     http://your-server-name:9191. It will require
                     authentication; please provide the Admin user
                     credentials.
                  -  The dispatcher Windows service no longer exists.
                  -  Minor user experience improvements:

                     -  For clients using a non-Windows OS (e.g. iOS,
                        Android, OS X), Active Directory environments
                        are no longer visible in the environments list
                        on the PRO login page.
                     -  For clients using a non-Windows OS (e.g. iOS,
                        Android, OS X), AIMMS Desktop Applications are
                        no longer visible in the applications list on
                        the PRO Apps page.

                  -  Various stability fixes.

                  

PRO 2.3
########                   

.. _aimms-pro-2.3.2.142-release:

--------------

AIMMS PRO 2.3.2.142 Release
----------------------------


                  On August 5, 2015, we released a bug fix on AIMMS PRO
                  2.3 (build 2.3.2.142). The following improvement has
                  been made in this release:

                  -  An error that occurred when trying to delete a
                     storage bucket with several layers of child buckets
                     has been resolved.

                

.. _aimms-pro-2.3.2.136-release:

--------------

AIMMS PRO 2.3.2.136 Release
----------------------------


                  On July 20, 2015, we released a bug fix on AIMMS PRO
                  2.3 (build 2.3.2.136). The following improvements have
                  been made in this release:

                  -  When removing an app, PRO now also deletes the data
                     in the storage at the server. From now on:
                     – If you delete a project/AIMMS versions, all files
                     that belong to it, are removed both from both the
                     storage folder
                     (C:\ProgramData\AimmsPRO\Data\storage\) and the
                     publishing folder
                     (C:\ProgramData\AimmsPRO\Data\publishing\).
                     – After installing this Hotfix your publishing
                     folder will be automatically cleaned up from all
                     obsolete data
                     – If you upgrade from AimmsPRO-2.3.1.108 or lower,
                     then the storage folder will be automatically
                     cleaned up from all deleted projects/AIMMS
                     versions.
                     – If you upgrade from AimmsPRO-2.3.1.121, then the
                     files in the storage folder will remain, but you
                     would be able to remove them from there using the
                     Control Panel app.
                  -  In the PRO 2.3 version, changes made to the
                     networking code contained a bug that would
                     occasionally (depending on network/computer load)
                     manifest itself by failing case-uploads/solves.

                

.. _aimms-pro-2.3.1.121-release:

--------------

AIMMS PRO 2.3.1.121 Release
----------------------------


                  On July 8, 2015, we released a bug fix on AIMMS PRO 2.3
                  (build 2.3.1.121). The following improvements have
                  been made in this release:

                  -  The PRO server did not start when there were still
                     jobs queued for an already deleted project.
                  -  The AIMMS PRO Desktop (and Launcher) now also loads
                     certificates from the “Intermediate Certification
                     Authorities”, allowing them to verify certificates
                     issued by certain Certificate Providers.
                  -  The overall stability of the communication library
                     has been improved.

                  

                   

.. _aimms-pro-2.3.1-release:

--------------

AIMMS PRO 2.3.1 Release
----------------------------


                  On June 25, 2015, we released a bug fix on AIMMS PRO
                  2.3 (build 2.3.1.108). The following improvements have
                  been made in this release:

                  -  There were some problems with the
                     ``pro::authentication::GetEntityList`` function.
                  -  The ‘revert to user default layout ‘ functionality
                     for WebUI applications didn’t always work
                     correctly.
                  -  Improved overall stability for WebUI applications.
                  -  A stability fix was done for the PRO desktop
                     client.

                

.. _aimms-pro-2.3-release:

--------------

AIMMS PRO 2.3 Release
----------------------------


                   

                     AIMMS PRO 2.3 allows AIMMS WebUI apps to run on any
                     node in a PRO cluster. Previously, the WebUI app
                     would only run on the node on which it was
                     published. Therefore we added the following
                     features:

                     -  Publishing a WebUI application makes it
                        available to all the nodes in a PRO cluster.
                     -  Additionally, running WebUI applications are now
                        distributed evenly across all the nodes in the
                        cluster (upon clicking Launch).
                     -  AIMMS PRO 2.3 allows the PRO administrator to
                        understand how the cluster is configured and how
                        the license profiles are used: the administrator
                        has access to a set of monitoring pages. For
                        more information, `click
                        here <https://documentation.aimms.com/pro/monitoring.html>`__.
                     -  When upgrading from a previous version of PRO to
                        2.3, you should run the PRO configurator and
                        start the PRO services from there.
                     -  If you want to use this version of PRO with
                        WebUI apps, you should at least use AIMMS 4.6
                        for that. If you already have WebUI apps
                        published with an earlier AIMMS version, please
                        republish these with AIMMS 4.6.
                     -  Due to missing .dll’s, sometimes the services
                        could not start.
                     -  Sometimes, a ‘data connection lost’ message was
                        displayed when using WebUI apps.
                     -  There was a problem that would leave WebUI Data
                        Sessions processes running upon stopping the
                        service; upon stopping or restarting all active
                        sessions are now killed.

                     

PRO 2.2
########                      

.. _aimms-pro-2.2.1.86-release:

--------------

AIMMS PRO 2.2.1.86 Release
----------------------------


                     On April 22, 2015, we released a bug fix on AIMMS
                     PRO 2.2 (build 2.2.1.86).

                     -  This release enables you to use up to 255
                        characters for the group names in your user
                        setup.

                     

                      

.. _aimms-pro-2.2.1-release:

--------------

AIMMS PRO 2.2.1 Release
----------------------------


                     The AIMMS PRO 2.2 Release was released on April 15,
                     2015 (build 2.2.1.85).

                     AIMMS PRO 2.2 offers better integration between
                     AIMMS PRO desktop apps and AIMMS WebUI apps.
                     Therefore we added the following feature:

                     -  All available client licenses will now be
                        distributed between AIMMS PRO desktop and WebUI
                        apps in a coordinated manner.
                     -  The client licenses for WebUI sessions that are
                        idle will be reclaimed after a configurable
                        amount of time.

                     

PRO 2.1
########                      

.. _aimms-pro-2.1-release:

--------------

AIMMS PRO 2.1 Release
----------------------------


                     The AIMMS PRO 2.1 Release was released on March 30,
                     2015 (build 2.1.1.54).

                     The purpose of PRO 2.1 is to make the IT
                     installation and roll-out to end-users easier.
                     Therefore we added the following features:

                     -  In case you have setup AIMMS PRO to use Active
                        Directory for user management, users no longer
                        need to explicitly log into the PRO portal. When
                        opening up the portal, users will automatically
                        be routed to the overview of AIMMS apps assigned
                        to them.
                     -  As browsers are dropping the plug-in support, we
                        developed an ‘App Launcher’ as a replacement.
                        Users only need to download and install this
                        once.
                     -  To remove the need to open several firewalls
                        ports to be able to run AIMMS apps over PRO, we
                        have condensed all network traffic to one port.
                        Using this feature requires AIMMS 4.4 or higher.
                     -  We now offer encrypted data transfer (SSL/https)
                        for WebUI users.
                     -  Please note that when using WebUI with PRO 2.1
                        you do need AIMMS 4.4 or higher. Also, you need
                        to republish all existing WebUI apps under PRO
                        2.1 to use AIMMS 4.4. You need to republish all
                        existing PRO desktop apps if you want to benefit
                        from the ‘one firewall port’ feature.

.. spelling:word-list::

    startupMode
    timeStamp
    iFrame
    vcredist
    dlls
    adLogin
    äbc
    ééms
    refactored
    kb
    usernames
    hotfix
    appVersion
