Project Setup
*************

To prepare an AIMMS project for use on the AIMMS Cloud Platform, perform the following steps:

* Add the AIMMS PRO Client and GUI libraries to your project.
* Modify the procedures that need to be executed on the server side.
* Add an action to your GUI that opens the Request Manager page.
* Create a ``.aimmspack`` file and publish it to the Cloud via the Portal, as described in `Apps (AIMMS Application Management) <newportal-apps.html>`_.

Each of these steps is described in the sections below. In addition, we describe the additional features offered by the AIMMS PRO framework that allow you to create customized workflows between your client application and a server-side session executing your (optimization) requests.

.. toctree::

    library
    basic-workflow
    pro-data-man
    advanced-workflows
    debugging-pro
