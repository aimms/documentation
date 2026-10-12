Adding PRO Libraries to your Project
====================================

When creating a new project in AIMMS 4.40 or higher, you have the option to include the PRO libraries at project creation time. Note that if you include the WebUI library in your project, the PRO library will also be included automatically as a prerequisite.

Install AIMMS PRO System libraries
----------------------------------

From AIMMS 4.4 onwards, the AIMMS PRO libraries are included as system libraries, which you can add to your project through the **File - Library Manager...** menu. If you are upgrading from AIMMS 4.3 or lower, replace any existing PRO libraries in your project with the PRO system libraries, as the system library version may support features not available in older versions.

Downloading the AIMMS PRO Client library
----------------------------------------

For AIMMS 4.3 or lower, download the PRO libraries from the AIMMS Cloud Portal and add them to your project manually. After logging on to the Portal, you will find a link on the **Help** page to the AimmsPROLibrary.zip file containing the latest versions of the PRO Client and GUI libraries.

The PRO Client library provides a fixed interface to the model, through which you can access the functionality offered by the Cloud backend. The library is updated automatically during deployment of your model. The PRO GUI library offers standard PRO dialog boxes such as the PRO Request Manager and the PRO Progress Window. The PRO GUI library is not updated automatically, allowing you to make changes to it as required for your project.

Adding the Client Library
+++++++++++++++++++++++++

After unzipping the contents of this zip file into the AimmsPROLibrary folder within your project folder, add this AIMMS library to your project via the Library Manager. You should never make changes to the AIMMS PRO Client library, because the AIMMS Cloud Platform will automatically update the client library to the latest available version at runtime, both client-side and server-side.

Adding the GUI Library
++++++++++++++++++++++

The *AimmsPROLibrary.zip* file also contains the AIMMS PRO GUI library, which unpacks into the *AimmsPROLibrary/AimmsProGUI* folder. If you want to use the PRO User Request Manager or the PRO Progress Window, add the PRO GUI library to your project as well. The PRO GUI library is never updated automatically by the platform, allowing you to localize, modify, and integrate its windows into your own application.
