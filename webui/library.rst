WebUI System Library
********************

When preparing your AIMMS model for use with the WebUI, you have to add the WebUI system library (as described in the `Getting Started <getting-started.html>`_ section). This library offers functionality that you can call yourself from your AIMMS model. This library uses the prefix :token:`webui`.

Pages and Dialog Support section
================================

Pages and Dialog Support has been added to the AimmsWebUI library to be able to configure `Side panels <page-manager.html#sidepanels>`_ , `Dialog pages <page-manager.html#dialog-pages>`_ and some useful procedures in AIMMS. This section can also be used to identify the different page types, their PageId's and Paths. 

.. image:: images/pageanddialogsupportsection.png
			:align: center

Public Pages Support Declarations: 

* ``AllPageIDs`` - This set includes all the page ID for all page types added to the `Page Manager <page-manager.html>`_ (page tree). 
* ``AllPageTypes`` - This set includes the different page types, currently page, side panel and dialog. 
* ``AllSidePanelPages`` - This set includes all the side panel pages added to the Page Manager. 
* ``AllDialogpages`` - This set includes all the dialog pages added to the Page Manager. 
* ``PageType(indexPageId)`` - This string parameter indexed on ``AllPageIDs`` set maps which page type applies to which page id.
* ``PagePath(indexPageId)`` - This string parameter indexed on ``AllPageIDs`` set maps the path for each page created.
* ``PageName(indexPageId)`` - This string parameter indexed on ``AllPageIDs`` set maps the path for each page created.

Public Page and Widget Specification Declarations:

* ``SidePanelSpecification`` - This set is the specification for the side panel pages. The string parameters used to `configure the side panels <page-manager.html#configuring-side-panels>`_ on pages are indexed on this set. 
* ``WidgetActionSpecification`` - This set is the specification for adding `widget actions <widget-options.html#widget-actions>`_ . The string parameters used to configure the widget actions on certain widgets are indexed on this set.
* ``PageActionSpecification`` - This set is the specification for adding `page actions <page-settings.html#page-actions>`_. The string parameters used to configure the primary action and secondary actions on certain pages are indexed on this set.

Public WebUI Frontend State Support Declarations: 

(note: this section was introduced with AIMMS 4.72, as an experimental feature.)

* ``AllOpenWebUITabs`` - This set contains one element for each WebUI tab currently open. The element has the form of a UUID. 
* ``LastActiveWebUITab`` - An element parameter in ``AllOpenWebUITabs``, which contains the UUID of the currently open WebUI tab in the browser (if any, it is empty otherwise).
* ``CurrentPageId`` - This string parameter contains the currently loaded page ID for all open tabs.
* ``CurrentSidePanelPageId`` - This string parameter contains the page ID for all open currently loaded side panels.

.. _workflowspecification:


Public Workflow Support Declarations:

.. _workflowspecificationset: 

:token:`WorkflowSpecification` - This set is used to configure the number of `Workflows <application-settings.html#workflow-panel>`_ and their respective titles. The string parameter used to `configure Workflows <application-settings.html#configuring-workflows>`_ are indexed on this set. The elements of this set (defining workflow properties) are the following:

* :token:`title` - The title for the workflow to be displayed on top of the Workflow Panel
* :token:`style` - A defined style for the workflow (This property is not in use currently. We have made the provision to incorporate different styles that we expect will be available in the future.)

.. _workflowpagespecification:

:token:`WorkflowPageSpecification` - This set is used to `configure the steps for each workflow <application-settings.html#configuring-steps-of-a-workflows>`_. The string parameter used to configure Workflow's steps are indexed on this set. The elements of this set (defining workflow properties) are as follows:

* :token:`displayText` - The label you want to give to the workflow step
* :token:`icon` - The icon you want to associate with the step. You can select from a list of 1600+ icons, the reference can be found in the `icon list <../_static/aimms-icons/icons-reference.html>`_. `Custom icons <folder.html#custom-icon-sets>`_ can also be used if required.
* :token:`pageId` - The pageId of the Page this step should be associated with. Ideally, every page in a workflow is a step in the Workflow Panel. The pageIds can be referred from the pre-declared :token:`AllRegularPages` set. Using pageIds of Side Panel or Dialog page will result in unwanted behaviour.
* :token:`tooltip` - The text to be displayed when the user hovers over the step
* :token:`workflowPageState` - The workflow state of the page, which may be Active (displayed and clickable), Inactive (displayed and not clickable) or Hidden (not visible). If not defined, by default the state is Hidden. 
* :token:`pageDataState` - The data state of the page, which may be Complete, Incomplete or Error. The specification of this state is optional. If not defined, by default it has an Empty state.
* :token:`redirectPageId` - The pageId of the page the user should be redirected to when the :token:`workflowPageState` is Inactive or Hidden. When the user tries to navigate to an Inactive or Hidden workflow step they are redirected to this page. The pageId's can be referred from the elements of the pre-declared set :token:`AllRegularPages`.

.. _extensionorder:

:token:`ExtensionOrder` - This is a sub-set of the pre-declared set of Integers, which has several pre-declared indices. This set was created to make it easier to create and configure string parameters and also differentiate them for Workflows, Page and Application Extensions. The pre-declared indices:

* :token:`indexWorkflowOrder` and :token:`indexNoOfPages` are used as dimensions of the string parameters which will configure the Workflows and the steps of the Workflows in the application.
* :token:`indexPageExtension` is used as a dimension of the string parameter which will configure the Page Actions(Primary and Secondary), Side Panels and Widget Actions on pages and widgets respectively.
* :token:`indexApplicationExtension` is used as a dimension of the string parameter which will configure the Status Bar messages in the application. 

Public StatusBar Support Declarations:

:token:`StatusBarSpecification` - This set is the specification used to configure Status Messages on the `Status Bar <application-settings.html#status-bar>`_ that appears on the footer. You will need to create string parameters indexed over this set.

Request Queue Declarations is used to manage the number of requests from WebUI. 

Public Pages Support Procedures:

* ``GetAllPages`` - This procedure is runs every time a page, side panel or dialog page is added to the page manager, which in turn updates the sets and identifiers in the Public Pages Support Declarations.
* ``OpenSidePanel(pageId)`` - This procedure is used to open side panels via the model with respective pageIds as the argument. 
* ``OpenPage(pageId)`` - This procedure is used to open/navigate to other pages in the application via the model, by passing the respective ``pageId`` as the argument. 
* ``OpenExternalLink(url)`` - This procedure is used to open external links, by passing the URL as the argument. These links will open in a new tab in the browser.
* ``ResetRequestQueue`` - This procedure empties the RequestQueue and the Requests set in the Request Queue Declarations.
* `SetProgressMessage(message) <#setprogressmessage>`_ - This procedure allows one to overwrite the "Busy" message in the top left corner of the Menu bar by a customized message, which can better inform the user in case the AIMMS session is in "working/busy" state (ie, some code execution is going on in the background). 

Public Dialog Support Procedures:  

* `RequestPerformWebUIDialog(title,message,actions,onDone) <#requestperformwebuidialog>`_ - This procedure is used to display dialog message, such as alerts or warnings.
* `OpenDialogPage(pageId,title,actions,onDone) <#opendialogpage>`_ - This procedure is used to open `dialog pages <page-manager.html#dialog-pages>`_ via the model, either by clicking on a button or some interaction in the model.

.. note::

    The procedures ``OpenSidePanel``, ``OpenPage``, ``OpenExternalLink`` and ``OpenDialogPage`` currently do not work as expected when called on a page load procedure. This issue will be expected to be fixed in the coming releases.

SetProgressMessage
==================

In case that some longer code execution is going on in the background, your AIMMS WebUI session may be in "working/busy" state and the top left corner of the Menu bar may display the "Busy" message (instead of the application name
shown normally): 

.. image:: images/Busy_message.png
    :align: center
	
In order to inform the user better on what is going on in such a situation, you can call the procedure :token:`webui::SetProgressMessage` and overwrite the "Busy" message by a customized message depending on the current phase of the underlying code execution. 

Argument
--------

The :token:`message` argument of this procedure is a constant string or a string parameter which may be adjusted programmatically during the code execution.

Example
-------

In case the application uses several procedures for executing first some initialization steps, then reading a substantial amount of data from a database and finally processing the data and computing some derived data, the procedure :token:`webui::SetProgressMessage` may be called several times displaying in turn some customized messages such as:

.. image:: images/SetProgressMessage_Example.png
    :align: center

Remark
------

Note that when the procedure :token:`webui::SetProgressMessage` is called with an empty string argument, then the displayed message will be set back to the default "Busy" message.

RequestPerformWebUIDialog
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

* :token:`pageId`: An element parameter(with range ``webui::AllDialogPages``) which should contain the ``pageId`` of the dialog page you want to open. When a dialog page is created, an entry is added to the set ``webui::AllDialogPages`` under the ``Public Pages Support Declarations`` with a unique ``pageId`` in the `Pages and Dialog Support section <library.html#pages-and-dialog-support-section>`_.   
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