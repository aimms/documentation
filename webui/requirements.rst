Requirements
============

This section lists requirements for various phases passed through by an AIMMS WebUI app

Developing a WebUI app
----------------------
 
In order to `develop <creating.html>`_ a web interface for an AIMMS application using the AIMMS WebUI, the app developer needs:

* a recent AIMMS 4 developer system, and
* to have the latest version of one of the following browsers installed on the developer machine:
    * `Chrome <https://www.google.com/intl/en/chrome/browser/>`_, or
    * Microsoft Edge, or
    * Microsoft Internet Explorer 11.

    .. tip::

        There is a known problem with Internet Explorer 11: if you face a blue screen after starting your WebUI app in the browser, you should verify that the setting "Display Intranet Sites in Compatibility View" is set to unchecked. You can find this option under "Compatibility View Options" in the main menu of IE11.

    .. tip::

        The rendering of your WebUI is not guaranteed under all zoom levels of your browser. There are combinations of widget types and zoom levels, which give a slightly distorted end-result.


Publishing a WebUI app
----------------------

In order to `publish <publishing.html>`_ a web application on the `AIMMS PRO <../pro/index.html>`_ platform, the app publisher needs:

* access to a running AIMMS WebUI-enabled PRO 2.x server, available as a single installer. During development, you might also consider to install a PRO server on your local computer.
* a WebUI-enabled AIMMS PRO package matching the AIMMS version which was used to develop the WebUI app. The PRO package contains the AIMMS version that is used to run the WebUI application and should be `published on the PRO server <../pro/aimms-man.html>`_ before publishing the aimmpack containing the WebUI app.
 
 
Running a WebUI app
-------------------

In order to **run/use** a web application from the AIMMS PRO portal, the app user needs to have one of the following browsers on the end-user device:

* for iPad and iPhone (iOS devices): 
    * Safari

* for Windows machines:
    * `Chrome <https://www.google.com/intl/en/chrome/browser/>`_, or
    * Microsoft Edge, or
    * Microsoft Internet Explorer 11.

    As mentioned above in the context of app development, the AIMMS WebUI support for the latter two browsers is currently in the so-called "beta" phase.

    Please note that, out of all these browsers Google Chrome offers the best performance when running an app with WebUI.
