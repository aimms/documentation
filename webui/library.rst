WebUI System Library
********************

When preparing your AIMMS model for use with the WebUI, you have to add the WebUI system library (as described in the `Getting Started <getting-started.html>`_ section). This library offers functionality that you can call yourself from your AIMMS model. This library uses the prefix :token:`webui`.

Pages and Dialog Support section
================================

Pages and Dialog Support has been added to the AimmsWebUI library to be able to configure `Sidepanels <page-manager.html#id6>`_ and Dialog pages in AIMMS. This section can be used to identify the different page types and their PageId's and Paths.

.. image:: images/pagesupportlib.png
			:align: center

There are 2 sub sections Declarations and Procedures: 

The Public Pages Support Declarations include: 

* AllPageIDs - This set includes all the page ID for all page types added to the `Page Manager <page-manager.html>`_ (page tree). 
* AllPageTypes - This set includes the different page types, currently page, sidepanel and dialog. 
* AllSidePanelPages - This set includes all the sidepanel pages added to the Page Manager. 
* AllDialogpage - This set includes all the dialog pages added to the Page Manager. 
* SidePanelSpecification - This set is the specification for the sidepanel pages. The sting parameters used to `configure the sidepanels <page-manager.html#configuring-sidepanels>`_ on pages are indexed on this set as well. 
* PageType(indexPageId) - This string parameter indexed on AllPageIds set maps which page type applies to which page id.
* PagePath(indexPageId) - This string parameter indexed on AllPageIds set maps the path for each page created.
* PageName(indexPageId) - This string parameter indexed on AllPageIds set maps the path for each page created.

The Public Pages Support Procedures has one procedure "GetAllPages" that runs when AIMMS is started. This procedure populates the data for the sets and string parameters in the declarations section.

Authorization Support
=====================

The WebUI System Library includes a section called "Authorization Support" containing identifier declarations which can be used to introduce authorization into your WebUI app:

.. image:: images/AuthorizationSupportSection.png
    :align: center

The usage of these identifiers is discussed in the `Authorizing model content for use in the WebUI <creating.html>`_ section of this documentation.

requestPerformWebUIDialog
=========================

You can call the procedure :token:`webui::requestPerformWebUIDialog` to display a message dialog in a WebUI page. Along with the message you can also display buttons which you can bind to custom actions.

Arguments
---------

This procedure has the following aguments:

* :token:`title`: A string parameter which contains the text to be displayed as the title of the dialog box.
* :token:`message`: A string parameter which contains the message to be displayed in the dialog box.
* :token:`actions`: A set containing custom actions. The elements of this set are represented as buttons in the message dialog and their text is the same as the action names. When an action is selected (i.e. its corresponding button is clicked), it invokes the :token:`onDone` procedure with the corresponding action as an argument.
* :token:`onDone`: A reference to a procedure in the predeclared set AllProcedures. The procedure should have a single input string parameter as argument. When a user selects an action, the onDone procedure is invoked with the action name as its argument.

Example
-------

As an example, the following code will display the dialog in the picture below it and will call the procedure :token:`PerformAction(TheAction)` upon clicking one of its buttons (with :token:`TheAction` being an input string parameter argument):

.. code::

    MyActions := data { Yes, No, Cancel };
    webui::requestPerformWebUIDialog("Save", "Do you want to save your data?", MyActions, 'PerformAction');

.. image:: images/savedialog.jpg
    :align: center

Remarks
-------

* When you just want to send a message to the user, you should provide a single action (e.g. :token:`Actions := {'OK'}`) and you can use :token:`''` for the :token:`onDone` argument. In this case, no procedure is called, and the user can just close the 'dialog' by pressing the single action (or pressing the return/space key, which will press the default (last, highlighted) button).
* You can use a translation file (e.g. ‘WebUI/resources/languages/<dialog_actions>.properties’) to provide translations for the various internal action names, containing, for example: :token:`discard-and-continue = Discard and continue`.