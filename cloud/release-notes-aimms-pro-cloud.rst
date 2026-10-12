AIMMS PRO Cloud Updates
=======================

PRO Cloud build release notes for the AIMMS Cloud Platform pipeline, starting from the point where AIMMS PRO Cloud and on-premise builds diverged. For releases before that split, see the :doc:`AIMMS PRO Release Notes Archive </pro-release-notes>`.

PRO 26.6
########

AIMMS PRO 26.6.3 Release
-------------------------

On October 1, 2026 we released AIMMS PRO 26.6.3(*build*: 26.6.3.4)

**Resolved Issues**

- **Publishing an application under a previously used name**: Publishing a new application with the same name as an existing application
  could cause problems with the folder permissions in PRO Storage. PRO now
  blocks this and shows an error message. To continue, publish the
  application as a new version of the existing application, or choose a
  different name. If the earlier application has been deleted, you can
  publish a new application with that name.

- **WebUI sessions failing to start because of unavailable libraries**: Since the release of **AIMMS 26.3**, some WebUI sessions failed to start when the application required a library
  version that was not available for the application's AIMMS version. PRO now
  checks for this when you publish the application. If a required library is
  not available, publishing fails with an error message naming the missing
  library. To resolve this, update the library to a version that works with
  your application's AIMMS version, then publish again.

AIMMS PRO 26.6.2 Release
-------------------------

On August 13, 2026 we released AIMMS PRO 26.6.2(*Cloud build*: 26.6.2.2)

**Improvements**

   -  Faster app startup when using authentication functions: Calls to *pro::authentication::* functions during app startup could take up to 15 seconds, causing a noticeable delay before the app became usable. This has been fixed by introducing a more efficient method for listing group, user, and environment relations. Authentication calls are now significantly faster, resulting in quicker startup times.

**Resolved Issues**

   -  Apps that display past runs or sessions could time out when loading that list, especially for heavily used apps. This is now fixed — session lists load significantly faster.
   -  Fixed an issue where WinUI apps published with AIMMS 4.98 or lower cannot launch on Cloud.
   

AIMMS PRO 26.6.1 Release
------------------------

On July 23, 2026 we released AIMMS PRO 26.6.1(*Cloud build*: 26.6.1.1)

**Improvements**

- **New toolset support:** Added support for a new compiler toolset, in preparation for upcoming AIMMS and AutoLib releases that will use it.
- **Frozen binaries updated for the old toolset:** The frozen binaries used for the old toolset have been updated.
