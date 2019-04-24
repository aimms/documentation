WebUI System Library
********************

When preparing your AIMMS model for use with the WebUI, you have to add the WebUI system library (as described in the `Getting Started <getting-started.html>`_ section). This library offers functionality that you can call yourself from your AIMMS model. This library uses the prefix :token:`webui`.

Pages and Dialog Support section
================================

Pages and Dialog Support has been added to the AimmsWebUI library to be able to configure `Side panels <page-manager.html#id6>`_ , `Dialog pages <page-manager.html#dialog-pages>`_ and some useful procedures in AIMMS. This section can also be used to identify the different page types, their PageId's and Paths. 

.. image:: images/pageanddialogsupportsection.png
			:align: center

Public Pages Support Declarations: 

* AllPageIDs - This set includes all the page ID for all page types added to the `Page Manager <page-manager.html>`_ (page tree). 
* AllPageTypes - This set includes the different page types, currently page, side panel and dialog. 
* AllSidePanelPages - This set includes all the side panel pages added to the Page Manager. 
* AllDialogpage - This set includes all the dialog pages added to the Page Manager. 
* PageType(indexPageId) - This string parameter indexed on AllPageIds set maps which page type applies to which page id.
* PagePath(indexPageId) - This string parameter indexed on AllPageIds set maps the path for each page created.
* PageName(indexPageId) - This string parameter indexed on AllPageIds set maps the path for each page created.

Public Page and Widget Specification Declarations:

* SidePanelSpecification - This set is the specification for the side panel pages. The sting parameters used to `configure the side panels <page-manager.html#configuring-side-panels>`_ on pages are indexed on this set. 
* WidgetActionSpecification - This set is the specification for adding widget actions. The sting parameters used to configure the widget actions on certain widgets are indexed on this set.

Request Queue Declarations is used to manage the number of requests from WebUI. 

Public Pages Support Procedures:

* GetAllPages - This procedure is runs every time a page, side panel or dialog page is added to the page manager, which in turn updates the sets and identifiers in the Public Pages Support Declarations.
* OpenSidePanel(pageId) - This procedure is used to open side panels via the model with respective pageIds as the argument. 
* OpenPage(pageId) - This procedure is used to open/navigate to other pages in the application via the model, by passing the respecive pageId as the argument. 
* OpenExternalLink(url) - This procedure is used to open external links, by passing the URL as the argument. These links will open in a new tab in the browser.
* ResetRequestQueue - This procedure empties the RequestQueue and the Requests set in the Request Queue Declarations.

Public Dialog Support Procedures:  

* `RequestPerformWebUIDialog(title,message,actions,onDone) <#requestperformwebuidialog>`_ - This procedure is used to display dialog message, such as alerts or warnings.
* `OpenDialogPage(pageId,title,actions,onDone) <#opendialogpage>`_ - This procedure is used to open `dialog pages <page-manager.html#dialog-pages>`_ via the model, either by clicking on a button or some interaction in the model.

.. note::

    The procedures OpenSidePanel, OpenPage, OpenExternalLink and OpenDialogPage currently do not work as expected when called on a page load procedure. This issue will be expected to be fixed in the coming releases.


requestPerformWebUIDialog
=========================

You can call the procedure :token:`webui::requestPerformWebUIDialog` to display a message dialog in a WebUI page. Along with the message you can also display buttons which you can bind to custom actions.

Arguments
---------

This procedure has the following arguments:

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


OpenDialogPage
==============

You can call the procedure :token:`webui::OpenDialogPage` to invoke a `dialog page <page-manager.html#dialog-pages>`_ in a WebUI page. Along with opening the dialog page you can also configure the title and the buttons with a specific callback.

Arguments
---------

This procedure has the following arguments:

* :token:`pageId`: When a dialog page is created it is has a unique pageId. You can find all the dialog pageIds in the set AllDialogPages under the Public Pages Support Declarations in the `Pages and Dialog Support section <library.html#pages-and-dialog-support-section>`_.   
* :token:`title`: A string parameter which contains the text to be displayed as the title of the dialog box. If this is left blank, i.e "", it will display the dialog page name given during creation by default.
* :token:`actions`: A set of custom actions. The elements of this set are represented as buttons in the message dialog and their text is the same as the action names. When an action is selected (button is clicked), it invokes the onDone procedure with the corresponding action as an argument. If this set is empty, the buttons will have "Cancel" and "OK" by default respectively. 
* :token:`onDone`: A reference to a procedure in the set AllProcedures. The procedure should have a single input string parameter as argument. When a user selects an action, the onDone procedure is invoked with the action name as its argument.


Example
-------

As an example, the following code will display the dialog in the picture below it and will call the procedure :token:`Procedure_Actions(TheAction)` upon clicking one of its buttons (with :token:`TheAction` being an input string parameter argument):

.. code::

	MyActions:= data { Decline, Accept };
	pageId := 'dialog_page';
	webui::OpenDialogPage(pageId, "Dialog Page Title", MyActions, 'Procedure_Actions');


.. image:: images/dialog_procedurecall.png
			:align: center
			:scale: 50

The declaration of the procedure Procedure_Actions in the example is 

.. image:: images/dialog_procedure_action_declaration.png
			:align: center

When the user clicks either button, the callback sends the respective button's text back to the string parameter. In the example we use the response to set a Flag to true or false based on which button is clicked. 

Authorization Support
=====================

The WebUI System Library includes a section called "Authorization Support" containing identifier declarations which can be used to introduce authorization into your WebUI app:

.. image:: images/AuthorizationSupportSection.png
    :align: center

The usage of these identifiers is discussed in the `Authorizing model content for use in the WebUI <creating.html>`_ section of this documentation.