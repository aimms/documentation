WebUI Folder
************

An AIMMS WebUI-ready application is an AIMMS application which contains a *WebUI* subfolder in the *MainProject* folder (this folder is created automatically when `starting WebUI <publishing.html>`_ for the first time). 

.. image:: images/folderstructurewebui_v2.png
    :align: center

The entire application including *all pages and widgets* is stored in a single ``webui.json`` file. When opening your application in the IDE, the ``webui.json`` file will be automatically generated from your existing setup. During the conversion, only pages and their associated widgets that are actually referenced in the WebUI page manager will be included in the ``webui.json`` file. The conversion will *not* delete the contents of the existing pages, widgets and application folders on disk, allowing you to still use older AIMMS versions, which depend on the old format. If you make changes to the WebUI using older AIMMS versions, you can delete the webui.json file, in which case it will be automatically re-generated. Changes made with AIMMS 4.67 and higher will never be visible in older AIMMS versions.

If you are using version control on your WebUI project, please make sure to add the new webui.json file, and delete the pages, widgets and application folders from version control when you don't plan to use the project with AIMMS version 4.66 and lower any longer. The new format as a true json file will make the structure of the WebUI directly clear, allowing you to resolve merge conflicts in the WebUI much easier. It also makes searching where widgets are used in your WebUI application straightforward.

Via the `Widget Manager <widget-manager.html>`_ you can add widgets to your WebUI. You can add pages via the `Page Manager <page-manager.html#add-a-page>`_.

.. important::

	The information above is valid for AIMMS versions 4.67 and higher. For older AIMMS versions, the following applies:
	
	All WebUI `pages <page-manager.html>`_ and `widgets <widget-manager.html>`_ are/were stored (by the WebUI Server) respectively in the *pages* and *widgets* subfolders of the *WebUI* folder. 

The description of the various topics related to the WebUI folder can be accessed using the following navigation scheme:

.. toctree::

   resources-subfolder
   css-styling
   units-support
   multi-language

