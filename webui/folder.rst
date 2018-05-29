WebUI Folder
************

An AIMMS WebUI-ready application is an ordinary AIMMS application that contains a *WebUI* subfolder in the *MainProject* folder (this folder is created automatically when `starting WebUI <publishing.html>`_ for the first time). 

.. image:: images/folderstructurewebui_v2.png
    :align: center

All WebUI `pages <page-manager.html>`_ and `widgets <widget-manager.html>`_ will be stored (by the WebUI Server) in the *pages* and *widgets* subfolder of the *WebUI* folder. In addition, it is possible to store application-specific *resources* in the resources subfolder (of the *WebUI* folder). 

Pages
=====

All WebUI pages are stored (by the WebUI Server) in the *pages* subfolder of the WebUI folder. You can add pages via the `Page Manager <page-manager.html#add-a-page>`_.

Widgets
=======

Via the `Widget Manager <widget-manager.html>`_ you can add widgets to your WebUI. All widgets will be stored (by the WebUI Server) in the *widgets* subfolder of the *WebUI* folder.

Resources
=========

It is possible to store application-specific *resources* in the resources subfolder of the WebUI folder:

.. image:: images/folderstructureresources.png
    :align: center

Images
-------

Application-specific images should be stored in the *resources/images* subfolder. This folder is not created by default, so you need to create it yourself the very first time that you need it.

Load ordering
-------------

By default, resources are loaded in alphabetical order. You can influence this loading order by putting a :token:`package.json` file in the folder alongside the resources to be loaded and specify a specific loading order in it.

An example package.json could be:

.. code::

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

CSS styling
-----------

It is possible to (re)style your web application by providing a custom CSS. The home page in the "MealsRUsWebApp":{TOPIC-LINK+example-project} example shows a small dropdown button in the upper right corner of the page that lets you switch between several example styles. Please note that the class names that are referred to in the CSS might change in the future. Application-specific CSS files should be stored in the *resources/css* subfolder of the *WebUI* subfolder of your project folder. As an example of application-specific styling, the *MealsRUsWebApp* has been extended with a *theme-switch-addon* that consists of some JavaScript and CSS that result in the theme switch drop-down button being shown in the upper right corner of your web application.

For more details on this addon, please check `this thread <https://groups.google.com/forum/#!category-topic/aimms/aimms-webui/wWXT91QVNBQ>`_ on our Google Group.

For more info on CSS in general, see `this Wikipedia article <https://en.wikipedia.org/wiki/Cascading_Style_Sheets>`_.

Data-Dependent Styling
++++++++++++++++++++++

You can define user-annotations in your AIMMS model that will be used to style corresponding so-called `DOM <https://en.wikipedia.org/wiki/Document_Object_Model>`_ elements in the WebUI page. To define user annotations for an identifier :token:`X(i,j,k)` that is being displayed in a widget, you can define a string parameter defined over a valid subdomain of the original identifier. This string parameter should be a space-separated string of class-names (that will be used to decorate the DOM elements with). In the attribute form of the identifier for which you are specifying the annotations, you should add a :token:`webui::AnnotationsIdentifier` annotation and fill in the string parameter containing the annotation(s) there.

In combination with an additional project-specific `CSS <#css-styling>`_ file, you can then specify the styling on, for example, a per-table-cell basis.

.. tip:: 

    In AIMMS versions prior to 4.49.1, you had to define a string parameter called :token:`X_annotations(i,k)` (with the domain of this 'annotations' identifier being a valid subdomain of the original identifier) in order to achieve the same. This had the disadvantage that when you renamed the original identifier, the '_annotations identifier' was not automatically renamed with it, leading to unexpected effects in your WebUI widgets.

For example, the following 'user annotation'

.. code::

    StringParameter DangerValuesOfX {
        IndexDomain: (i,k);	
        Definition: "invalid-value danger" onlyif ( Y(i,k)  >= Y_UB(i,k) );
    }

In combination with the following CSS rule

.. code::

    .aimms-widget td.annotation-invalid-value {
        background-color : red;
    }

will show all cells in tables (because of the :token:`.td` class), where the annotation has the value :token:`invalid-value` with a red background color. The :token:`DangerValuesOfX` shows a combination of two annotations: :token:`invalid-value` as well as :token:`danger`.

By default, all core WebUI plugins (including widgets) will prefix user annotations with :token:`annotation-` and replace whitespace characters, like spaces or tabs, with a hyphen (-). It is recommended that app developers use this as well. For more information: see `AWF.Util.getAsCSSClasses <#applying- annotations-or-flags>`_.

The WebUI uses flags to indicate whether a certain DOM element corresponds to a *readOnly* value or not. DOM elements that correspond to editable values are annotated with a :token:`flag-editable` CSS class while read-only DOM elements are annotated with a :token:`flag-readOnly` class. You can make data that is editable from a model perspective appear as read-only in the WebUI by using user-flags by defining by a new string parameter in your model :token:`X_flags(i,j)` and set its value to "readOnly" for the (updatable) values that you want to appear as read-only.

Annotations or Flags in Custom Plugins
++++++++++++++++++++++++++++++++++++++

Applying annotations or flags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Core plugins (widgets, addons, etc.) now prefix all model annotations and flags with e.g. :token:`annotation-` or :token:`flag-` when these are used in HTML element attributes. Additionally, to ensure valid values, all sequences of whitespace are converted into single hyphens: for example, the annotation :token:`some model    info` becomes :token:`annotation-some-model-info`.

Core styling has also been updated to adopt this pattern.

To properly prefix annotations or flags, use the :token:`AWF.Util.getAsCSSClasses` utility-method:

.. code::

    // More usually, these would be requested from the datasource's
    // annotations and flags layers.
    const annotations = ["foo", "bar baz"];
    const flags = ["readOnly"];

    // Generate an array of prefixed, escaped versions of the original
    // model annotations.
    const annotationsAsClasses = AWF.Util.getAsCSSClasses(annotations);

    // The default prefix is "annotation" plus a hyphen, but the second
    // argument allows alternative prefixes.
    const flagsAsClasses = AWF.Util.getAsCSSClasses(flags, "flag");

    // somePluginElQ would be defined elsewhere, and is a jQuery element.
    // This concatenates the prefixed flags and annotations arrays, joins the
    // array items with spaces, then adds them as classes to somePluginElQ.
    somePluginElQ.addClass(annotationsAsClasses.concat(flagsAsClasses).join(" "));

This will result in an element with the following :token:`class` attribute:

.. code::

    ... class="annotation-foo annotation-bar-baz flag-readOnly" ...

Manipulating and selecting elements by annotations or flags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Once an annotation or flag has been applied to an HTML element in a plugin, that element can be selected programmatically, or styled, with CSS selectors.

To achieve this, the prefixed annotation or flag should always be CSS-escaped using the standards-track `CSS.escape <https://drafts.csswg.org/cssom/#utility-apis>`_ method. A substitute for this method is provided by the WebUI runtime when the user's browser does not yet support it.

Example 1: Programmatically selecting and manipulating HTML elements by annotation or flag
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Example JavaScript:

.. code::

    // This selects all widgets with the class "annotation-bar-baz", and adds the
    // class "my-widget" to them.
    $(".aimms-widget." + CSS.escape(annotationsAsClasses[1]))
        .addClass("my-widget")
    ;

Example 2: Using the annotation or flag in a stylesheet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


The prefixed annotation or flag should still be properly escaped for use in a selector (see `CSS.escape <https://drafts.csswg.org/cssom/#utility-apis>`_), although in these examples it is not strictly necessary. Example CSS:

.. code:: 

    /* This styles all text in widgets with the classes "my-widget" and "flag-readOnly" in gray. */
    .my-widget.flag-readOnly {
        color: #808080;
    }

Switching The Color Palette
+++++++++++++++++++++++++++

In order to check the color palette of your WebUI project, please read this `thread <https://groups.google.com/forum/#!category-topic/aimms/aimms-webui/RvM8E_9QIVg>`_ on our Google Group for details on how to accomplish this.

JavaScript
----------

Application-specific JavaScript files (e.g. `widget [addons] <own-widgets.html>`_ or Unit Support files should be stored in the *resources/javascript* subfolder.

Unit Support
++++++++++++

In the WebUI, units from your AIMMS model will per default be displayed in the Table, Scalar and Slider widgets. These widgets have an option 'Show Units' in the 'Miscellaneous' tab of their options editor where you can overrule this. For all widget types, the units will be displayed in the tooltips as well.

The units that are displayed follow the Convention identifier in your model that is specified in the Convention attribute of you Main model.

.. tip:: 

    In AIMMS 4.50 and lower versions, unit support was handled in the manner described below. When opening your WebUI in AIMMS 4.51 or higher, you will automatically get a warning dialog if this 'old-style' unit support is detected. You are encouraged to adapt your model to the new standard.

.. code::

    IdentifierUnitMap = {
		"Distance" : "km"
	};

will display the distance values in 'km'. Input for the 'Distance' identifier will also be interpreted in terms of 'km'. Please note that you can only specify display units for which there exists a valid conversion to the base unit of the identifier in your model.

Multi-Language Support
----------------------

WebUI offers multi-language support. Depending on the language settings of your browser, all strings that are displayed in the WebUI will be checked against a language specific translation table. If a translation is available, the translation is displayed. Otherwise, the original string is displayed.

Project-Specific Translations
+++++++++++++++++++++++++++++

In addition to the built-in translations in WebUI, you can add your own translation files to your WebUI applications. Model identifier names can then be translated according to the browser's language.

Please note that you can translate not only from one language to another, but also from model abbreviations to strings that are more readable by the end-user, e.g.:

.. code::

   F_X_EGG = Egg

Translation files should be placed anywhere below your project's `resources <folder.html#resources>`_ folder, and must use the following naming-conventions:

* :token:`<anything>.properties`: Default translations, also used as fallbacks when a specific translation is unavailable in another language. These translations should not be duplicated in a separate language-specific file, but may be overridden to provide translations for a particular locale.
* :token:`<anything>_xx.properties`: Translations for a specific language, using an `ISO 639 language-code <https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`_, e.g. :token:`xx` becomes :token:`nl` for Dutch.
* :token:`<anything>_xx-YY.properties`: Translations for a specific language-and-country combination, using an `ISO 639 language-code</a> and an <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166 country-code <https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`_, e.g. :token:`xx-YY` becomes :token:`pt-BR` for Brazilian Portuguese.

.. tip::

    Please note that you can create as many translation files as you like. This allows you to keep a clear topic/subject per file.

To provide a default translation in English for your WebUI app, create a file :token:`<anything>.properties` with your translation pairs:

.. code::

    org_name = Organi***z***ation name

To provide a translation for another language, e.g. :token:`nl`, create a file :token:`<anything>_nl.properties` with your translation pairs:

bc.    org_name = Organisatienaam

To provide a translation for a language-locale, e.g. :token:`en-GB`, create a file :token:`<anything>_en-GB.properties` with your translation pairs:

.. code::

    org_name = Organi***s***ation name

Element Text
++++++++++++

In addition to the project-specific translations, you can also use string parameters from your model to provide translations for set elements in your WebUI applications. You have to specify these through so-called _annotations_ in AIMMS. To do so, open the attribute form of a Set identifier and click on the 'Add Annotation' wizard button below the comment attribute:

.. image:: images/addannotation.jpg
    :align: center

Select the :token:`Webui::ElementTextIdentifier` annotation type and specify the name of the 1-dimensional string parameter which holds the translated element values:

.. image:: images/specifiedannotation.jpg
    :align: center

Please be aware that AIMMS does not provide syntax checking in the annotations field, so make sure you type the identifier name correctly. Furthermore, please also note that you should not add the index to the identifier name (so, in the example above, :token:`PlaneNames` is specified rather than :token:`PlaneNames(p)`).

The effect of this will be that wherever the element names would normally be displayed in your WebUI widgets, the corresponding string values will be displayed instead. This allows you to provide your users with clearer text than the 'raw' element names as they exist in your AIMMS model.

Please note that when you display elements of a subset in the WebUI, it will automatically use the element text as specified in its rootset. However, you are allowed to override the element text for each (sub) subset of a set. The WebUI will use the most specific text. So, if you have :token:`SetA`, :token:`SetB` and :token:`SetC`, where :token:`SetC` is a subset of :token:`SetB` and :token:`SetB` is a subset of :token:`SetA`, and you display elements from :token:`SetC`, the WebUI will use the translation specified for :token:`SetC`. If this is not available, it will use the translation specified for :token:`SetB`. If that is not available, it will use the translation specified for :token:`SetA`. 

.. important::

    The above mechanism is featured in AIMMS 4.46 and later. If you are still using an older version of AIMMS, the following applies:

For now, the element text identifiers need to be specified in a project-specific JavaScript resource (located in the :token:`resources` subfolder) that lists the string parameter on a per-index level. For example, a project specific resource with the following contents

.. code::

    ElementTextMap = {
         "i" : "ItemDescription"
    };

will display :token:`ItemDescription` instead of the element :token:`i` in your widgets. Please note, that the string parameters that are specified in the *ElementTextMap* need to be declared as one-dimensional identifiers over the associated index in your AIMMS model.

.. important:: 

    In AIMMS versions lower than 4.46, this feature does not work properly when used in combination with the selectionbox widget.


