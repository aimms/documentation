AIMMS PRO Cloud Updates
=======================

PRO Cloud build release notes for the AIMMS Cloud Platform pipeline, starting from the point where AIMMS PRO Cloud and on-premise builds diverged. For releases before that split, see the :doc:`AIMMS PRO Release Notes Archive </pro-release-notes>`.

PRO 26.6
########

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
