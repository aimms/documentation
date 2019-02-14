Creating a WebUI
================

Here you can find a summary of the steps to be taken for creating a WebUI for your AIMMS app:

#. Check the `Requirements <requirements.html>`_ section.
#. `Download <https://aimms.com/english/developers/downloads/download-aimms/>`_ (the latest version of) the AIMMS development system.
#. Make sure you have the latest version of preferably the `Chrome <https://www.google.com/intl/en/chrome/browser/>`_ browser (as it performs the best), or Microsoft's Internet Explorer 11 or Edge.
#. In the AIMMS development system, open an existing application or create a new one. 
#. New application projects contain the :token:`AimmsPROLibrary` and the :token:`AimmsWebUI` system libraries by default. If you already have an older project, it might not contain these libraries, yet. In that case, you need to extend your model with these libraries. To add AIMMS libraries to your model: go to the *Library Manager* of AIMMS (in the *File* menu) and select *Add System Library*. 
#. Start WebUI by clicking on *WebUI* in the AIMMS toolbar, or by using the *WebUI* (sub)menu in the AIMMS *Tools* menu. The first time, this will create a     `WebUI folder <folder.html>`_ in your *Main Project* subfolder. When using *Start WebUI*, the WebUI is started without opening a browser. When you select one of the browsers, WebUI is started and the browser is opened at the home page of your app.
#. Now you can start `adding widgets <add-a-widget>`_ and `adding pages <add-a-page>`_ to your WebUI. Once you are done, you can `publish your app on AIMMS PRO <publishing.html>`_.

.. note::

    There is a known problem with Internet Explorer 11: if you face a blue screen after starting your WebUI app in the browser, you should verify that the setting "Display Intranet Sites in Compatibility View" is set to unchecked. You can find this option under "Compatibility View Options" in the main menu of IE11.

    
Authorizing model content for use in the WebUI
==============================================
    
By default, the WebUI is configured to allow any AIMMS identifier in your model to be displayed in the WebUI, and any applicable procedure to be run from within the WebUI. When your WebUI application has more secure authorization requirements, e.g. that certain data in your model should not be writable by, or even visible to, particular users of your app, then the WebUI can support you in imposing such restrictions upon certain users. For this purpose, the `WebUI System Library <library.html>`_ contains a section called "Authorization Support". This section provides the following identifiers which
can be used to introduce authorization into your WebUI app:

* :token:`webui::IdentifierAuthorization` defined over the set :token:`AllIdentifiers`. Through this identifier you can set permissions on *specific* identifiers in your model.
* :token:`webui::LibraryAuthorization` defined over the set :token:`webui::AllLibraryPrefixes`. Through this identifier you can set permissions on all identifiers in *specific* libraries in your model. Typically, this comes in handy when you need to set permissions on runtime libraries that *may not even exist* when you are setting up the WebUI authorizations for the user who is running the app. The set :token:`webui::AllIndexLibraryPrefix` should contain library prefixes of library included in your project. You can prefill it through the procedure :token:`webui::FindAllLibraryPrefixes`. Library-level authorization will only be applied if no specific identifier authorization has been specified.
* :token:`webui::DefaultAuthorization` sets a default authorization, which will apply when no authorization can be determined for a specific identifier, or for the library (if any) in which the identifier is contained.

When deploying your AIMMS via AIMMS PRO or AIMMS Cloud, you can use the PRO group membership when setting up the proper authorizations for a particular user.

Available permissions
---------------------

Authorizations can be applied to identifiers that hold data, but also to procedures. The available permissions that can be assigned are:

* :token:`webui::AuthNone`: no access granted. No data will be shown in the WebUI, even if identifier is specified in a widget in the WebUI. Procedures will not be executed.
* :token:`webui::AuthR`: only read access granted. Data will be displayed in the WebUI, but will be shown as read-only data. Data changes via the WebUI are prohibited. Procedures will not be executed.
* :token:`webui::AuthRX`: read and execute access granted. Data will be displayed in the WebUI, but will be shown as read-only data. Data changes via the WebUI are prohibited. Procedures with this permission can be executed from within the WebUI.
* :token:`webui::AuthRW`: read and write access granted. Data will be displayed in the WebUI, and are displayed as editable if no other restrictions prohibit editing the data (e.g. defined identifiers). Data changes via the WebUI are not prohibited. Procedures will not be executed.
* :token:`webui::AuthRWX`: full access granted. Data will be displayed in the WebUI, and are displayed as editable if no other restrictions prohibit editing the data (e.g. defined identifiers). Procedures with this permission can be executed from within the WebUI.

By default, the value of :token:`webui::DefaultAuthorization` is set to :token:`webui::AuthRWX`, so full access will be granted to all identifiers.

Preset authorizations
---------------------

The authorizations of some WebUI-related identifiers, that are critical to the correct functioning of the WebUI, will have a fixed value that cannot be changed through the above identifiers. For instance, all access to the above authorization identifiers is completely prohibited from within the WebUI, making it impossible for end-users of your app to circumvent the imposed authorizations.

Updating the values of authorization identifiers  
------------------------------------------------

Authorizations are applied when the data for a widget in your WebUI is prepared by your AIMMS session. Widgets in the WebUI is not automatically refreshed when you change the authorizations during your sessions to reflect the updated authorizations. Thus, you should set the authorizations during the initialization of your project. When you change the permissions during an existing session, they will only be applied when the user opens a new page or by updating the page (e.g. through pressing F5) or by switching from single- to multi-case mode.
    
Public Identifiers
==================

To be able to control which identifiers are visible when adding content to WebUI pages(e.g. when selecting the contents for a widget), you can extend your AIMMS model with a set called :token:`AllPublicIdentifiers` (in the global Main namespace of your app). This set should be a subset of the predefined set :token:`AllIdentifiers` and should be initialized with those identifiers which you want to make public to the WebUI.

When running in development mode, the contents of this set is ignored. This means that you can simply see all identifiers declared in your model from within the WebUI which you are building. When deploying your finished WebUI application on AIMMS PRO, only the identifiers which are in the set :token:`AllPublicIdentifiers` are available to end users who try to add or modify contents of the existing widgets in the app. However, if you, as an app developer, have created widgets containing identifiers not present in the :token:`AllPublicIdentifiers` set, the end-user is, of course, still able to see the data of these identifiers through these widgets, taking into account whether the WebUI is authorized to display the data of such identifiers.

As a result of the way of working described above, if the set :token:`AllPublicIdentifiers` is declared in your model but is empty, then all identifiers are available to the WebUI app developer when in developer mode, but no identifiers are available to the end user when running the WebUI app on the PRO platform (i.e. if the end user tries to add or modify contents in existing widgets). In such a case, the end user may only use the existing widgets with the content identifiers set up initially by the app developer. 

If the set :token:`AllPublicIdentifiers` is not declared, then all the identifiers in your model are available in both developer mode and the app published on PRO. 

Identifiers in a Library
------------------------

To be able to show data for identifiers that are declared in an AIMMS library, you need to make those identifiers public by putting them in the *Interface* attribute of the library. The corresponding index domain sets need to be present in the library interface too. Please remember to add them to the set :token:`AllPublicIdentifiers`, if you have specified this set in your model.

One may wonder why should the corresponding index domain sets be present in the library interface? The reason is that these index domain sets are used to display aggregated values (by pivoting/moving indices to the *Aggregated* group) in a widget. More precisely, AIMMS creates runtime identifiers in order to calculate these aggregated values (such as totals). To be able to evaluate the definitions of these runtime identifiers, the domain indices of the identifier need to be accessible too.

When adding `project-specific translations <project-specific-translations>`_ to your WebUI project and (some of) the translation identifiers are located in a library, please make sure to include the library prefixes to the .properties translation file.
