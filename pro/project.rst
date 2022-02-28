Project Setup
*************

To prepare a project to be used with the AIMMS PRO platform in its most basic Outline
form, you should perform the following steps:
 
* Add the AIMMS PRO Client and GUI libraries to your project,
* Modify the procedures that need to be executed at the server,
* Add an action to your GUI that opens the Request Manager page,
* Create a ``.aimmspack`` file and publish this to the server via the PRO portal as described in `AIMMS Application Management <appl-man.html>`_.


We will describe each of these steps. In addition, we describe the additional features offered by the AIMMS PRO framework that will allow you to create customized workflows between your client application and a server-side session executing your (optimization) requests.

.. toctree::

    library
    basic-workflow
    conversion-to-pro
    pro-data-man
    advanced-workflows
    debugging-pro