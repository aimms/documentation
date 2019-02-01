Adding PRO Libraries to your Project
====================================

When creating a new project in AIMMS 4.40 or higher, you will have the option to include or exclude the PRO libraries from your project. Note that if you include the WebUI library in your project, the PRO library will also be included as a prerequisite. For AIMMS versions lower than 4.40, read further. 

Install AIMMS PRO System libraries
----------------------------------

From AIMMS 4.4 onwards, the AIMMS PRO libraries are included as system libraries, which you can add to your project through the **File - Library Manager...** menu. If you are upgrading from AIMMS 4.3 or lower, you are strongly advised to replace any existing PRO libraries that are part of your project by the PRO system libraries, as the system library version may support features that are not supported by older AIMMS versions.

Downloading the AIMMS PRO Client library
----------------------------------------

For AIMMS 4.3 or lower you need to download the PRO libraries from the AIMMS PRO portal, and add them to your project manually. After logging on to the AIMMS PRO portal, you will find a link on the **Help** page to the AimmsPROLibrary.zip file containing the latest versions of the PRO Client and GUI libraries. The PRO Client library provides a fixed interface to the model, through which you have access to the functionalities offered by the PRO backend server. As the functionality of the back-end server may change over time, this library will be updated automatically during deployment of your model. The PRO GUI library offers standard PRO dialog boxes such as the PRO Request Manager and the PRO Progress Window and depends solely on the (fixed) modeling interface offered by the PRO client library. The PRO GUI library will therefore not be updated automatically, allowing you to make changes to it as required for your project.

Adding the Client Library
+++++++++++++++++++++++++

After unzipping the contents of this zip file to the AimmsPROLibrary folder within the project folder of the AIMMS project you want to PRO-enable, you can add this AIMMS library to your project via the Library Manager. Keep in mind that this library is created with AIMMS 3.11, which is the minimal required version to work with AIMMS PRO. You should never make any changes to the AIMMS PRO Client library, because, at runtime, the AIMMS PRO Framework will automatically update the client library to the latest available version, both client-side and server-side.

Adding the GUI Library
++++++++++++++++++++++

The *AimmsPROLibrary.zip* file also contains the AIMMS PRO GUI library, which unpacks into the *AimmsPROLibrary/AimmsProGUI* folder. If you want to make use of the PRO User Request Manager or the PRO Progress Window, you should add the PRO GUI library to your project as well. The PRO GUI library will never be updated by the AIMMS PRO Framework. This allows you to localize the windows contained in the PRO GUI library, or to modify and integrate them into your own application. Note that the AIMMS PRO GUI library is already prepared for localization through the localization support offered by AIMMS.