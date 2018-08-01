AIMMS Version Management
========================

.. note::

    This section of the AIMMS PRO documentation does *not* apply to the `AIMMS Cloud Platform <../cloud/index.html>`_. See `here <../cloud/activation.html>`_ for AIMMS Cloud Platform specific instructions for activating AIMMS versions.

As part of every AIMMS release, so-called AIMMS PRO Server packages will be made available. Through the AIMMS PRO portal, all users with global administrative privileges and users who are member of the AIMMSPublishers group can publish AIMMS PRO Server packages to AIMMS PRO. You can use published AIMMS PRO Server packages to deploy AIMMS applications that are developed and tested using the corresponding AIMMS developer releases. Each AIMMS PRO Server package contains:

* an installation-free AIMMS PRO Client without solvers, which will run the client part of the application on the computer of the end-user, and
* an AIMMS component with all solvers included, to run the server-side optimization sessions.


All published AIMMS versions are available for deployment of end-user applications to all users from all environments.

.. topic:: How to publish a new AIMMS version on PRO on premise?

    #. Go to the AIMMS download page https://aimms.com/english/developers/downloads/download-aimms/
    #. In the application column, choose "PRO package", and the relevant settings for your PRO platform. Click on the URL link, and download the AIMMS PRO Package.
    #. In your PRO platform, go to the menu tab "AIMMS Version" and click on "Publish AIMMS Version"
    #. Browse to your just downloaded AIMMS PRO Package.
    #. You should see the new AIMMS version published when getting back to the "AIMMS Versions" menu tab
    
.. note::

    On AIMMS Cloud, you only need to "Activate" a new AIMMS version, going to the AIMMS Versions menu tab.

Deletion
--------

On the AIMMS Versions section of the PRO Portal, you can also delete AIMMS PRO Server packages that you don't need anymore. In case the version that you want to delete it still in use by one or more apps, an error message will tell you so, and the version is not deleted.

Starting from PRO 2.16, Portal allows you to delete all unused AIMMS Versions in one go by using 'Delete unused AIMMS Version' button. This will check if there are any unused AIMMS Versions and if so then it will delete all such AIMMS versions.
