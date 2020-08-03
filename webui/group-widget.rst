Group Widget
============

The Group widget allows you to group a number of widgets together. This way you can easily create form-like structures or simply keep two or more widgets together. It is not intended to be a replacement for page layout.

To add and remove widgets, the Group widget has the concept of “edit mode”. When you press the “edit group” button, the available areas will get a darker background and will show a “plus” sign. By clicking on one of these areas, you can add a widget, just like on a page.

The Group widget comes with a number of templates. These provide you with various options with secondary content aligned to the left, right, top or bottom of your main widget. These templates provide different areas in which you can add widgets. Each template has a main area and one or more secondary areas. These secondary areas always have a fixed width or height, while the main area sizes to the available space. The ideal configuration for a Group widget is thus to have your main widget, such as a chart or table, in the main area, and secondary widgets, such as selection widgets or buttons, in the secondary areas.

When in edit mode, you can add widgets, or remove them by dragging them onto the top bar (where it says “drag widgets here to delete”). Currently, you cannot drag widgets from one area to another, or outside of/into the Group widget. This might change in the future. You can get out of edit mode by clicking the “edit group” button again, or by pressing the “x” in the top right corner of the edit bar. Not all widgets are suitable to be placed in all template areas. For now, the Group widget does not take this into account (note: in the future we will prevent the Group widget from showing widgets in areas that do not support them).

Form Input
----------

As a WebUI app developer, you can now let your users change or add new input data into your models by means of forms. Instead of directly manipulating the data in your model, the form will act as a staged commit. The advantage of a staged commit over direct manipulation is that while the information is in the form, before it is applied, you can perform input validation. Only if all the form fields pass validation, the data on the form can be committed back to your model. Normally, implementing a staged commit with validation support requires a lot of logic to be written by the developer. For example, when you want to call a validation routine or prevent accidental loss of information. This could happen when there are uncommitted changes and the user requests to change the form contents by changing the selection. However, we have put all form logic in the AIMMS WebUI Library, allowing you to create a staged commit form for your end users.

As a WebUI app developer, adding a form to your application requires the following steps, as demonstrated in the following example: we provide a working demonstration in the `AddressBook <https://github.com/aimms/WebUI-Examples/tree/master/AddressBook/>`_ application. The steps needed to create a form, are described below. You can also read our extensive explanation in the following how-to article: `Using AIMMS WebUI Forms to Create and Edit Data <https://how-to.aimms.com/Articles/123/123-WebUI-FORMS.html>`_.

Example
---------

On the AIMMS model side, you have:

1. A *Declaration section*, with

    * :token:`Persons` - the set of which the index, :token:`p`, is used in the other identifiers
    * :token:`SelectedPersons(p)` - provides the selection parameter (its default is -1 and existing elements in the set :token:`Persons` initially have value 0)
    * :token:`PersonName(p)`, :token:`PhoneNumber(p)`, :token:`PersonAge(p)` - the indexed parameters that will be manipulated through the form;

2. Two procedures

    * :token:`MyValidateForm(formData, validationErrors)` - the form validation procedure. It has two arguments: an input argument (must have argument property Input) which contains the strings entered by the user, and an output argument (must have argument property Output) which contains the corresponding error messages, if any, about these strings. This procedure goes through the form data and updates the :token:`validationErrors` output parameter by assigning :token:`webui::CreateValidationError(“validation-error-Some-kind-of-error”)` in case of an error. Only when no error messages are created the data is accepted.
    * :token:`CreateNewPerson(formData, newPersonName)` - creates a new person in the :token:`Persons` set and returns the :token:`newPersonName` as an output parameter.

    Please note that the procedure arguments should be declared as follows:

    .. code::

        StringParameter formData {
            IndexDomain: webui::ffn;
            Property: Input;
        }

        StringParameter validationErrors {
            IndexDomain: webui::ffn;
            Property: Output;
        }

    .. important::

        Please note that, if the argument :token:`validationErrors` is declared with property InOut (instead of only Output), then a previously generated error may stay visible even when a valid value has been newly entered. This situation can be easily avoided by making sure that the argument :token:`validationErrors` is properly declared with property Output.

3. :token:`SetupPersonForm` - the procedure that sets up the form by calling:

    .. code::

        FormFields :=  {'PersonName', 'PhoneNumber', 'PersonAge'};

        webui::SetupForm(
              "myform",
              'SelectedPersons',
              FormFields,
              'MyValidateForm',
              'CreateNewPerson'
           );

    .. important:: 

        Please note that the third argument FormFields of the internal procedure "webui::SetupForm" must be an explicit identifier denoting a set which is a subset of :any:`AllIdentifiers`.

On the WebUI side, you have:

4. Widgets:

    * A legend widget called 'SelectedPersons' that will act as a means of selecting an existing person; its content is set to 'SelectedPersons'
    * A scalar widget called 'theForm' that will be used as a form. Here the user can edit the details for the selected (or new) person. Its content is set to (the generated):

        * :token:`webui_runtime::myform_PersonName`
        * :token:`webui_runtime::myform_PhoneNumber`
        * :token:`webui_runtime::myform_PersonAge`
        
    * Three buttons 'Create', 'Save', and 'Delete' set to (resp.):

        * :token:`webui_runtime::myform_NewEntry`
        * :token:`webui_runtime::myform_SaveForm`
        * :token:`webui_runtime::myform_DeleteEntry`
        
    * A `translation file <folder.html#project-specific-translations>`_ ``WebUI/resources/languages/person-form-messages.properties`` which provides English translations for various form-specific internal names, containing, for example:

    .. code-block:: none

        validation-error-name-already-exists = A person with this name already exists

    .. important::

        Please note: when clicking on the 'Save' button, this only means that the data which you entered in your WebUI form is transferred to the underlying AIMMS model. It does **not** mean that your current AIMMS case is saved as well, so please make sure that you also `save your AIMMS data <data-manager.html>`_ before exiting. Otherwise, you'll lose your forms data.

    .. tip::

        Add the form related widgets to a Group widget to make sure that the widgets remain grouped together when the browser window resizes.