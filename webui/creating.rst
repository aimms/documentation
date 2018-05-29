Creating a WebUI
================

Here you can find a summary of the steps to be taken for creating a WebUI for your AIMMS app:

#. Check the `Requirements <requirements.html>`_ section.
#. `Download <https://aimms.com/english/developers/downloads/download-aimms/>`_ (the latest version of) the AIMMS development system.
#. Make sure you have a recent version of the `Chrome <https://www.google.com/intl/en/chrome/browser/>`_ browser (the support for Microsoft Internet Explorer 11 and Microsoft Edge is currently in the so-called "beta" phase).
#. In the AIMMS development system, open an existing application or create a new one. 
#. New application projects contain the :token:`AimmsPROLibrary` and the :token:`AimmsWebUI` system libraries by default. If you already have an older project, it might not contain these libraries, yet. In that case, you need to extend your model with these libraries. To add AIMMS libraries to your model: go to the *Library Manager* of AIMMS (in the *File* menu) and select *Add System Library*. 
#. Start WebUI by clicking on *WebUI* in the AIMMS toolbar, or by using the *WebUI* (sub)menu in the AIMMS *Tools* menu. The first time, this will create a     `WebUI folder <folder.html>`_ in your *Main Project* subfolder. When using *Start WebUI*, the WebUI is started without opening a browser. When you select one of the browsers, WebUI is started and the browser is opened at the home page of your app.
#. Now you can start `adding widgets <add-a-widget>`_ and `adding pages <add-a-page>`_ to your WebUI. Once you are done, you can `publish your app on AIMMS PRO <publishing.html>`_.

.. tip::

    There is a known problem with Internet Explorer 11: if you face a blue screen after starting your WebUI app in the browser, you should verify that the setting "Display Intranet Sites in Compatibility View" is set to unchecked. You can find this option under "Compatibility View Options" in the main menu of IE11.

Public Identifiers
==================

To be able to control what identifiers are visible to the WebUI (e.g. when selecting the contents for a widget), you can extend your AIMMS model with a set called :token:`AllPublicIdentifiers` (in the global Main namespace of your app). This set should be a subset of the predefined set :token:`AllIdentifiers` and should be initialized with those identifiers which you want to make public to the WebUI.

When running in development mode, the contents of this set is ignored. This means that you can simply see all identifiers declared in your model from within the WebUI which you are building. When deploying your finished WebUI application on AIMMS PRO, only the identifiers which are in the set :token:`AllPublicIdentifiers` are available to end users who try to add or modify contents of the existing widgets in the app. However, if you, as an app developer, have created widgets containing identifiers not present in the :token:`AllPublicIdentifiers` set, the end-user is, of course, still able to see the data of these identifiers through these widgets.

As a result of the way of working described above, if the set :token:`AllPublicIdentifiers` has not been declared in your model, then all identifiers are available to the WebUI app developer when in developer mode, but no identifiers are available to the end user when running the WebUI app on the PRO platform (i.e. if the end user tries to add or modify contents in existing widgets). In such a case, the end user may only use the existing widgets with the content identifiers set initially by the app developer. 

Identifiers in a Library
------------------------

To be able to show data for identifiers that are declared in an AIMMS library, you need to make those identifiers public by putting them in the *Interface* attribute of the library. The corresponding index domain sets need to be present in the library interface too. Please remember to add them to the set :token:`AllPublicIdentifiers`, if you have specified this set in your model.

One may wonder why should the corresponding index domain sets be present in the library interface? The reason is that these index domain sets are used to display aggregated values (by pivoting/moving indices to the *Aggregated* group) in a widget. More precisely, AIMMS creates runtime identifiers in order to calculate these aggregated values (such as totals). To be able to evaluate the definitions of these runtime identifiers, the domain indices of the identifier need to be accessible too.

When adding `project-specific translations <project-specific-translations>`_ to your WebUI project and (some of) the translation identifiers are located in a library, please make sure to include the library prefixes to the .properties translation file.
