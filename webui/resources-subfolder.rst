WebUI Resources
================

This section describes the various application specific resources (ASR) for an AIMMS WebUI app. 

.. note:: Before going into each specific resource, please note that it is a best practice to store only those resources which are actually needed/used by the project. In particular, you should not store in your final project version any files which have a "test" substring in their name, ie, which are intended for intermediate testing purposes for your app. Storing the needed resources only may contribute to a more efficient delivery of the WebUI components of your application.  

Adding the **resources** folder
-------------------------------

In order to use any of the following listed features, you will need to create a new folder called **resources** (case sensitive), located in:

*<.aimms Root folder> > MainProject > WebUI > resources*. 

This folder is loaded each time the WebUI starts up or at every reload (F5) of your WebUI browser page.

.. image:: images/folderstructureresources.png
    :align: center

Images
------

Application-specific images should be stored in the *resources/images* subfolder. This folder is not created by default, so you need to create it yourself the very first time that you need it.

JavaScript
----------

Application-specific JavaScript files (e.g. `widget [addons] <own-widgets.html>`_ ) or Unit Support files should be stored in the *resources/javascript* subfolder.

.. note:: Please note that in your final project version you should not include in this folder any file with a "test" addition to its name, for example, like "theme-switch-addon.test.integration.js". Such files may have a negative impact on the performance of delivering the WebUI components en therefore, they should be removed when the application is being deployed. Currently, AIMMS does not skip any files; it just wraps those files with some try/catch checks in order to avoid JS errors. Please note that AIMMS may skip such files which use the word "test" in the future. 

CSS
---

It is possible to (re)style your web application by providing custom Cascading Style Sheets (CSS). Application-specific CSS files should be stored in the *resources/css* subfolder of the *WebUI* subfolder of your project folder. 

For more info on CSS in general, see `this Wikipedia article <https://en.wikipedia.org/wiki/Cascading_Style_Sheets>`_.

Load ordering
-------------

.. important:: The feature described in this section was available in AIMMS versions up to 4.77. Starting from AIMMS 4.78 this feature is no longer supported.

By default, resources are loaded in alphabetical order. You can influence this loading order by putting a :token:`package.json` file in the folder alongside the resources to be loaded and specify a specific loading order in it.

An example package.json could be:

.. code-block:: JSON

    {
       "name": "my-application-specific-resource",
       "version": "0.0.1",
       "config": {
         "aimms:asr": {
           "files": [
             "b.js",
             "a.js",
             "c.css",
           ]
         }
       }
    }

.. note::

    * Your project can have multiple :token:`package.json` files.
    * All resources loaded explicitly by a :token:`package.json` file will no longer be loaded through alphabetical order.
    * The loading order of the same file specified in multiple :token:`package.json` files is undefined and is best avoided.
