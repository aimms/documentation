Multi-Language Support
======================

WebUI offers multi-language support. Depending on the language settings of your browser, all strings that are displayed in the WebUI will be checked against a language specific translation table. If a translation is available, the translation is displayed. Otherwise, the original string is displayed.

Project-Specific Translations
-----------------------------

In addition to the built-in translations in WebUI, you can add your own translation files to your WebUI applications. Model identifier names can then be translated according to the browser's language.

Please note that you can translate not only from one language to another, but also from model abbreviations to strings that are more readable by the end-user, e.g.:

.. code-block:: js

   F_X_EGG = Egg

Translation files should be placed anywhere below your project's `resources <folder.html#resources>`_ folder, and must use the following naming-conventions:

* :token:`<anything>.properties`: Default translations, also used as fallbacks when a specific translation is unavailable in another language. These translations should not be duplicated in a separate language-specific file, but may be overridden to provide translations for a particular locale. If you supply more than one such file, these will be applied in alphabetical order. This means that if you specify the same identifier in more than one of these files, the translation that will eventually be used is the one specified in the file that comes alphabetically *last*.
* :token:`<anything>_xx.properties`: Translations for a specific language, using an `ISO 639 language-code <https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`_, e.g. :token:`xx` becomes :token:`nl` for Dutch.
* :token:`<anything>_xx-YY.properties`: Translations for a specific language-and-country combination, using an `ISO 639 language-code</a> and an <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166 country-code <https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`_, e.g. :token:`xx-YY` becomes :token:`pt-BR` for Brazilian Portuguese.

The WebUI will automatically use the language properties file for the language that is set as the default in your browser.

.. tip::

    Please note that you can create as many translation files as you like. This allows you to keep a clear topic/subject per file.

.. important::

    If you provide both a default translation file and a language-specific translation file, please make sure that they use the same *base name*. For example, if you have a default translation file :token:`abbreviations.properties` and you want to specify translations into Spanish for the abbreviations mentioned in this file, you should also provide a file called :token:`abbreviations_es.properties`. If, in addition, you want Dutch translations of them, you should create an additional :token:`abbreviations_nl.properties`.


To provide a default translation in English for your WebUI app, create a file :token:`<anything>.properties` with your translation pairs:

.. code-block:: js

    org_name = Organi***z***ation name

To provide a translation for another language, e.g. :token:`nl`, create a file :token:`<anything>_nl.properties` with your translation pairs:

.. code-block:: js    

    org_name = Organisatienaam

To provide a translation for a language-locale, e.g. :token:`en-GB`, create a file :token:`<anything>_en-GB.properties` with your translation pairs:

.. code-block:: js

    org_name = Organi***s***ation name

Element Text
------------

In addition to the project-specific translations, you can also use string parameters from your model to provide translations for set elements in your WebUI applications. You can specify these by using the so-called *annotations* in the AIMMS model. To do so, open the attribute form of a Set identifier and click on the 'Add Annotation' wizard button below the comment attribute:

.. image:: images/addannotation.jpg
    :align: center

Select the :token:`Webui::ElementTextIdentifier` annotation type and specify the name of the 1-dimensional string parameter which holds the translated element values:

.. image:: images/specifiedannotation.jpg
    :align: center

Please be aware that AIMMS does not provide syntax checking in the annotations field, so make sure you type the identifier name correctly. Furthermore, please also note that you should not add the index to the identifier name (so, in the example above, :token:`PlaneNames` is specified rather than :token:`PlaneNames(p)`).

The effect of this will be that wherever the element names would normally be displayed in your WebUI widgets, the corresponding string values will be displayed instead. This allows you to provide your users with clearer text than the 'raw' element names as they exist in your AIMMS model.

Please note that when you display elements of a subset in the WebUI, it will automatically use the element text as specified in its rootset. However, you are allowed to override the element text for each (sub) subset of a set. The WebUI will use the most specific text. So, if you have :token:`SetA`, :token:`SetB` and :token:`SetC`, where :token:`SetC` is a subset of :token:`SetB` and :token:`SetB` is a subset of :token:`SetA`, and you display elements from :token:`SetC`, the WebUI will use the translation specified for :token:`SetC`. If this is not available, it will use the translation specified for :token:`SetB`. If that is not available, it will use the translation specified for :token:`SetA`. 

.. important::

    The above mechanism is featured from AIMMS 4.46 onwards. If you are still using an older version of AIMMS, the following paragraph applies.

In older AIMMS versions the element text identifiers need(ed) to be specified in a project-specific JavaScript resource (located in the :token:`resources` subfolder) that lists the string parameter on a per-index level. For example, a project specific resource with the following contents

.. code-block:: js

    ElementTextMap = {
         "i" : "ItemDescription"
    };

will display :token:`ItemDescription` instead of the element :token:`i` in your widgets. Please note, that the string parameters that are specified in the *ElementTextMap* need to be declared as one-dimensional identifiers over the associated index in your AIMMS model.

.. important:: 

    In AIMMS versions lower than 4.46, this feature does not work properly when used in combination with the selectionbox widget.


