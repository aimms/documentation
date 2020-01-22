Technical Background
********************

When you run the executable of the AIMMS development system for the first time, it unpacks AIMMS into the *C:\\Users\\MyUserName\\AppData\\Local\\AIMMS\\IFA\\Aimms* folder on your machine. The *WebUIDev* subfolder of the AIMMS installation contains WebUI support files, such as:

* The Cube Server: a collection of DLLs, responsible for communicating data between AIMMS and the WebUI (available in the Win32 and x64 subfolders).
* The WebUI Server: a Java server responsible for storing (and retrieving) the pages and widgets that are developed.
* The AIMMS WebUI runtime: a collection of JavaScript and other resource files.
* A version of the Java Runtime Library (JRE7).
* Some logging configuration files that allow you to control the destination and amount of logging information that is created by the Cube Server and WebUI Server.


When AIMMS is started, the *Tools* menu will contain a *WebUI - Start* and a *WebUI - Stop* command. Starting the WebUI will start the Cube Server and launch a WebUI Server on your local machine. Amongst others, the WebUI Server serves files with *WebUIDev\www* as the document root. In addition, the WebUI Server stores widget content in the *WebUI* subfolder of your AIMMS project.

Current Limitations
===================

Currently, there are some limitations on the usage of the AIMMS WebUI:

* The AIMMS WebUI requires a recent version of the `Chrome <http://www.google.com/chrome/>`_ browser (latest version, or one release before the latest), Microsoft Edge or Microsoft Internet Explorer 11. Please note that the WebUI support for the latter two browsers is currently in the "beta" phase. On iPhone and iPad devices the Safari browser is supported for the end-users. Eventually, we will also add support for other HTML5 browsers. 
* Changing the index domain of an identifier which is used by the WebUI while the WebUI (achieved by *Start WebUI*) is running, is not supported. Changes are propagated when *Stop WebUI*  is selected and subsequently *Start WebUI* is selected from the AIMMS menu. This limitation only applies to working in developer mode (i.e. not to end-user running apps from AIMMS PRO).

.. tip::

    There is a known problem with Internet Explorer 11: if you face a blue screen after starting your WebUI app in the browser, you should verify that the setting "Display Intranet Sites in Compatibility View" is set to unchecked. You can find this option under "Compatibility View Options" in the main menu of IE11.
 
    
.. warning::
    
    Use of zooming in WebUI may lead to visual aberrations. The WebUI was developed assuming a 100% zoom in your browser.
    
 
Project Conversion
==================

Due to changed and new functionality in the AIMMS 4.40 release (Page Manager, Page Menu, Wizards), AIMMS projects which have been created with older AIMMS versions, need to be converted in order to run in AIMMS 4.40 (or higher) version. The conversion is done automatically. During this conversion the following changes are performed:

* the WebUI subfolder is transferred to the MainProject folder of your project, and
* the pages are re-saved in a different format.

When opening the WebUI of your ('old') project with AIMMS 4.40 (or higher), you are automatically asked whether you want to convert your project. Pressing the *do not convert* button allows you to create a backup first.

.. important::

    Please create a backup of your project before converting it with the new AIMMS version.
