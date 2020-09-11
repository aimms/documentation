WebUI Folder
************

An AIMMS WebUI-ready application is an AIMMS application which contains a *WebUI* subfolder in the *MainProject* folder (this folder is created automatically when `starting WebUI <publishing.html>`_ for the first time). 

.. image:: images/folderstructurewebui_v2.png
    :align: center

AIMMS WebUI uses JSON (see https://www.json.org/json-en.html) as the format to store the specification of your WebUI. JSON is a commonly used, very simple text-based format to transfer data over the web.

The file webui.json (that you can find in the MainProject/WebUI folder of your project) folder) contains the specifications of all pages and widgets that make up your WebUI app.

AIMMS WebUI uses JSON schema validation (see https://json-schema.org/) to impose additional structure to the contents of the 'webui.json' file. Among others, we require that every widget has a 'type' property, that a the 'type' of a page is a known type, that the zoom level of a map widget is a fixed number or a reference to an AIMMS identifier, etc. The schema validation file webui-schema.json is located in the Bin folder of your AIMMS installation folder.

A JSON syntax error will for sure lead to an nonfunctional WebUI. If your webui.json contains a JSON syntax error, you may check the syntax using on of the many JSON parsers that are available online (e.g. https://jsonformatter.org/). For example, we have seen missing comma's as a result of a faulty merge conflict resolution.

Before writing the webui.json (e.g. whenever you make a change to a widget), the JSON is validated against the webui-schema.json file. If the JSON does not comply with the schema an error is shown and the WebUI will refuse to write the changes to the webui.json. Instead, the invalid contents is written to the file webui.json.invalid. You are adviced to look into the cause of the validation error. If the error itself is too cryptic for you, you might consider to use some stand-alone tool like 'Another JSON Schema Validator' (see https://ajv.js.org/) to help you understand what is going on.

In rare situations, it might happen that AIMMS WebUI has support for a certain feature while it is not reflected in the webui-schema.json file. In this case, you will not be able to make any changes to your WebUI app, while still having a functional (and valid) webui.json. In this situation we would like to ask you to send a copy of your webui.json.invalid file together with the version number of the AIMMS version that you are using to <insert support contact details>.

To allow you to proceed working when you are facing an incorrect validation error, you could temporarily disable the validation using the webui-schema.json file in one of the following ways:

	- create a file 'MainProject/WebUI/setting/webui-options.conf' with the line webui.validate.webui-json 0 (or add a line to this file if the configuration file already exists), or

	- remove the webui-schema.json file from the Bin folder of your AIMMS installation. This is not advised as it will disable validation for all projects.


So the entire WebUI application including *all pages and widgets* is stored in a single ``webui.json`` file. When opening your application in the IDE, the ``webui.json`` file will be automatically generated from your existing setup. During the conversion, only pages and their associated widgets that are actually referenced in the WebUI page manager will be included in the ``webui.json`` file. The conversion will *not* delete the contents of the existing pages, widgets and application folders on disk, allowing you to still use older AIMMS versions, which depend on the old format. If you make changes to the WebUI using older AIMMS versions, you can delete the webui.json file, in which case it will be automatically re-generated. Changes made with AIMMS 4.67 and higher will never be visible in older AIMMS versions.

If you are using version control on your WebUI project, please make sure to add the new webui.json file, and delete the pages, widgets and application folders from version control when you don't plan to use the project with AIMMS version 4.66 and lower any longer. The new format as a true json file will make the structure of the WebUI directly clear, allowing you to resolve merge conflicts in the WebUI much easier. It also makes searching where widgets are used in your WebUI application straightforward.



.. important::

	The information above applies to the AIMMS versions starting from 4.67 on. 
	
	In the older AIMMS versions up to 4.66, the WebUI `pages <page-manager.html>`_ and the `widgets <widget-manager.html>`_ are/were stored (by the WebUI Server) in the *pages* and *widgets* subfolders of the *WebUI* folder, respectively. 

The description of the various topics related to the WebUI folder can be accessed using the following navigation scheme:

.. toctree::

   resources-subfolder
   css-styling
   units-support
   multi-language

