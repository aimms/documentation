WebUI JSON
==========

.. important::

	The information below applies to the AIMMS versions starting from 4.67 onwards. 
	
	In the older AIMMS versions up to 4.66, the WebUI `pages <page-manager.html>`_ and the `widgets <widget-manager.html>`_ are/were stored (by the WebUI Server) in the *pages* and *widgets* subfolders of the *WebUI* folder, respectively. 

AIMMS WebUI uses JSON (see https://www.json.org/json-en.html) as the format to store the specification of your WebUI. JSON is a commonly used, very simple, text-based format to transfer data over the web. The 'webui.json' file can be found in the *MainProject/WebUI* subfolder of your project directory and contains the specifications of all pages and widgets which toghether make up your WebUI app.

When opening your application in the AIMMS IDE, the *webui.json* file will be automatically generated from your existing setup. During the conversion, only pages and their associated widgets which are actually referenced in the WebUI page manager will be included in the *webui.json* file. The conversion will *not* delete the contents of the existing pages, widgets and application folders on disk, allowing you to still use older AIMMS versions, which depend on the old format. If you make changes to the WebUI using older AIMMS versions, you may delete the *webui.json* file, in which case it will be automatically re-generated upon opening the project with AIMMS 4.67 and higher. However, the changes made with AIMMS 4.67 and higher will never be visible in older AIMMS versions.

If you are using version control on your AIMMS project, please make sure to add the new *webui.json* file, and delete the pages, widgets and application folders from version control when you don't plan to use the project with AIMMS versions 4.66 or lower any longer. The new format as a true JSON file will make the structure of the WebUI directly clear, allowing you to resolve merge conflicts in the WebUI much easier. It also makes straightforward the searching on where widgets are used in your WebUI application.

WebUI JSON validation schema
----------------------------

AIMMS WebUI uses JSON schema validation (see https://json-schema.org/) to impose additional structure to the contents of the 'webui.json' file. The schema validation file *webui-schema.json* is located in the *Bin* subfolder of your AIMMS installation directory. Among others, this schema validation file requires that every widget has a 'type' property, that the 'type' of a page is a known type, that the zoom level of a map widget is a fixed number, or a reference to an AIMMS identifier, etc. 

A JSON syntax error will lead to an nonfunctional WebUI. If your *webui.json* contains a JSON syntax error, you may check the syntax using one of the many JSON parsers that are available online (e.g. https://jsonformatter.org/). For example, we have seen missing comma's as a result of a faulty merge conflict resolution.

Before writing the *webui.json* (e.g. whenever you make a change to a widget), the JSON is validated against the *webui-schema.json* file. If the JSON does not comply with the schema an error is shown and the WebUI will refuse to write the changes to the webui.json. Instead, the invalid contents is written to the file *webui.json.invalid*. You are adviced to look into the cause of the validation error. If the error itself is too cryptic for you, you might consider to use some stand-alone tool like 'Another JSON Schema Validator' (see https://ajv.js.org/) to help you understand the cause of the problem.

In rare situations, it might happen that AIMMS WebUI has support for a certain feature, while it is not reflected in the *webui-schema.json* file. In this case, you will not be able to make any changes to your WebUI app, while still having a functional (and valid) *webui.json* file. In such situations, please reach out to the AIMMS user Support for help and send along a copy of your *webui.json.invalid* file together with the version number of the AIMMS version that you are using.

In order to allow you to continue your work when you are facing an incorrect validation error, you could temporarily disable the validation using the *webui-schema.json* file in one of the following ways:

	- create a file 'MainProject/WebUI/settings/webui-options.conf' with the line 'webui.validate.webui-json 0' (or add a line to this file if the configuration file already exists), or

	- remove the *webui-schema.json* file from the *Bin* subfolder of your AIMMS installation. However, this is not recommended as it will disable the validation for all your projects.



