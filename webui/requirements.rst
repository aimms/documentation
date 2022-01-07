Requirements 
=============

This section lists specific requirements for the various phases passed through by an AIMMS application with a Web-based User Interface (WebUI).

For general system requirements for running an AIMMS WebUI application under AIMMS PRO or AIMMS Cloud, please refer to the corresponding sections in the 
`PRO <../pro/system-requirements.html>`_ or `Cloud <../cloud/requirements.html>`_ documentation. 

.. note:: Please note that, in general, fast processing of JavaScript code (as the one used by the AIMMS WebUI) requires a powerful processor and enough workspace.
   In particular, a more powerful processor is expected to result in better performance. 
   
.. warning:: Your user's network should allow `websockets <https://en.wikipedia.org/wiki/WebSocket>`_ . To verify if it does, please go to https://livepersoninc.github.io/ws-test-page/ from your user's computer.

Developing a WebUI app
----------------------
 
In order to `develop <creating.html>`_ a web interface for an AIMMS application using the AIMMS WebUI, the app developer needs:

* a recent AIMMS 4 developer system, and
* to have one of the following browsers installed on the developer machine:

    * `Google Chrome <https://www.google.com/intl/en/chrome/browser/>`_, or
    * `Microsoft Edge <https://www.microsoft.com/en-us/edge>`_.

    .. important::

        For these browsers we support Current and Current-1 versions, where Current is the latest released browser version.
		
    .. important::

        Support for Microsoft Internet Explorer 11 has been deprecated. Internet Explorer 11 is a poorer browser for advanced applications like AIMMS WebUI when compared to Edge or Chrome (i.e., it is slower, less stable, crashes sooner, etc). Therefore, we strongly recommend our users to try and use Edge or Chrome, instead. Please be informed that we are no longer servicing issues related to Internet Explorer 11. 

    .. warning::

        The rendering of your WebUI is not guaranteed under all zoom levels of your browser. There are combinations of widget types and zoom levels, which give a slightly distorted end-result.  The WebUI was developed assuming a 100% zoom in your browser.


Publishing a WebUI app
----------------------

In order to `publish <publishing.html>`_ a web application on the `AIMMS PRO <../pro/index.html>`_ platform, the app publisher needs:

* access to a running AIMMS WebUI-enabled PRO 2.x server, available as a single installer. During development, you might also consider to install a PRO server on your local computer.
* a WebUI-enabled AIMMS PRO package matching the AIMMS version which was used to develop the WebUI app. The PRO package contains the AIMMS version that is used to run the WebUI application and should be `published on the PRO server <../pro/aimms-man.html>`_ before publishing the aimmspack containing the WebUI app.
 
 
Running a WebUI app
-------------------

In order to **run/use** a web application from the AIMMS PRO portal, the app user needs to have one of the following browsers on the end-user device:

* for iPad (iOS operating system): 

    * Safari

* for Windows machines:

    * `Google Chrome <https://www.google.com/intl/en/chrome/browser/>`_, or
    * `Microsoft Edge <https://www.microsoft.com/en-us/edge>`_.

    Please note that, currently, out of these browsers Google Chrome offers the best performance when running an app with WebUI.



