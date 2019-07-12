Application Settings
====================

.. |applicationsettings-icon| image:: images/applicationsettings-icon.png

.. |application-settings-open| image:: images/app_settings_open_new.png

.. |use-classic-theme-on| image:: images/use_classic_theme_on.png

.. |workflowicon| image:: images/workflowicon.png

There are some settings that not only apply to a specific widget or page, but to the WebUI application as a whole. 
These settings can be accessed through the Application Settings menu, which you can open by clicking on the |applicationsettings-icon| icon:

.. image:: images/app_settings_open_new_workflow.png
    :align: center

Workflow Panel
--------------

From AIMMS 4.68 onwards, it is possible to design and configure Workflows. The Workflow Panel is used to represent and run any workflow which is designed and defined by the Application Developer in the model. AIMMS allows the application developer to configure multiple workflows in an application.

A Workflow is a progression of steps (tasks, events, interactions) that comprise a work/business process and create or add value to the organization's activities. 

The Workflow Panel guides the user through the defined set of steps in a specific workflow. It also gives the user the flexibility to enter or leave a workflow at any step of the process. The user can also navigate between workflows not restricting them to only one workflow at a given time. 

The workflow has states for each step that indicate to a user which steps can be accessed and which cannot. Data states help indicate which steps are complete, incomplete or in an error state. 

.. image:: images/Workflow_Demo.png
    :align: center

The Workflow Panel can also be collapsed and expanded.

.. image:: images/Workflow_ExpandedCollapsed.png
    :align: center
    :scale: 75

In the collapsed view when the user hovers over the steps the tooltip helps with identifying the step.

.. image:: images/Workflow_CollapsedTooltips.png
    :align: center


Configuring the Workflow Panel
++++++++++++++++++++++++++++++

The Workflow Panel can be configured by the application developer via the AIMMS model. Public Workflow Support Declarations have been defined in the inside the `Pages and Dialog Support <library.html#pages-and-dialog-support-section>`_ section, used to configure different workflows and their respective steps.

WorkflowSpecification - This set is used to configure the number of workflows and their respective titles. The properties of this set are:

* :token:`title` - The title for the workflow to be displayed on top of the Workflow Panel.
* :token:`style` - A defined style for the workflow (This property is not in use currently. We have made the provision to incorporate different styles that we expect will be available in the future.)

WorkflowPageSpecification - This set is used to configure the steps for each workflow. The properties of this set are:

* :token:`displayText` - The label you want to give the step.
* :token:`icon` - The icon you want to associate with the step. You can select from a list of 1600+ icons, the reference can be found in the `icon list <../_static/aimms-icons/icons-reference.html>`_. `Custom icons <folder.html#custom-icon-sets>`_ can also be used if required.
* :token:`pageId` - The pageId of the Page this step should be associated with. Ideally, every page in a workflow is a step in the Workflow Panel. The pageIds can be referred from the :token:`AllRegularPages` set.
* :token:`tooltip` - The text to be displayed when the user hovers over the step.
* :token:`workflowPageState` - The workflow state of the page. Active (displayed and clickable), Inactive (displayed and not clickable) and Hidden. If not defined, by default, the state is Hidden. 
* :token:`pageDataState` - The data state of the page. Complete, Incomplete or Error. This is optional. If not defined, by default it has an empty state.
* :token:`redirectPageId` - The pageId of the Page the user should be redirected to when the :token:`workflowPageState` is Inactive or Hidden. When the user tries to navigate to an Inactive or Hidden workflow step they are redirected to this Page. The pageIds can be referred from the :token:`AllRegularPages` set.

WorkflowNumbers - There are two indices in the set that the string parameters will be indexed over. The indices are used to reference the number of workflows (indexWorkflowOrder) and the no of pages or steps (indexNoOfPages) in each workflow. 

To create and configure the Workflow Panel in the application you will need to create two string parameters. The first to configure the number of workflows in the application and the second the steps of each workflow.

Configuring Workflows
+++++++++++++++++++++

For illustration, let's call the first sting parameter :token:`MyWorkflows(webui::indexWorkflowOrder,webui::indexWorkflowSpec)`. This string parameter is indexed by the WorkflowNumbers set with the index :token:`indexWorkflowOrder` and the WorkflowSpecification set. This string parameter is used to define the number of workflows and their respective Titles. Right click the string parameter and click on the Data option in order to open the data page. Add the details for the Workflow and their Titles. Leave the style property empty for now.

.. image:: images/Workflow_MyWorkflowsParameter.png
    :align: center

This definition indicates that there are 3 workflows in the application.

Configuring Steps of a Workflows
++++++++++++++++++++++++++++++++

Create the second string parameter, let's call it :token:`MyWorkflowSteps(webui::indexWorkflowOrder,webui::indexNoOfPages,webui::indexWorkflowPageSpec)` indexed over the WorkflowNumbers set with both indices and the WorkflowPageSpecification set. This string parameter is used to define the steps for each workflow that was defined in the MyWorkflows string parameter. Each :token:`pageId` configured is a step displayed in the Workflow Panel.

A page should be configured to only one workflow. If a page is configured to multiple workflows, although the page will be shown as a step in each workflow, when the user clicks on the step they will be taken to the step in the workflow where the :token:`pageId` appears first in the steps defined in the MyWorkflowSteps string parameter for workflows define in the MyWorkflows string parameter. For example, if a page 'Results' with :token:`pageId = results_1` is configured for two workflows "Route Optimization" and "Inventory Management", Results will appear in both workflows but will redirect the user to step in Route Optimization workflow when accessed, as illustrated below.

Results is configured for two workflows.

.. image:: images/Workflow_Pagein2Workflows_1.png
    :align: center


Results shows as a step in both workflows.

.. image:: images/Workflow_Pagein2Workflows_2.png
    :align: center
    :scale: 75

In this case, when the user is on the Inventory Management workflow and clicks on the Results step, they will be redirected to the Results step in the Route Optimization workflow since Route Optimization is the first workflow in the order in the MyWorkflows string parameter.

There is no limit to the number of steps each workflow can have. AIMMS recommends not more than 10 steps per workflow. If there are more than 10 steps try to breakdown the workflow into smaller workflows, if possible.

Right click the MyWorkflowSteps string parameter and click on the Data option in order to open the data page.

.. image:: images/Workflow_MyWorkflowStepsParameter_1.png
    :align: center

The data entered in the above illustration is for for 1st Workflow that was configured in "MyWorkflows" string parameter i.e. Route Optimization. There are 10 steps defined for that Workflow.

To configure steps for the other workflows just select the respective value for indexWorkflowOrder at the top.

Steps configured for the 2nd Workflow i.e. Inventory Management. We have defined 3 steps for this workflow.

.. image:: images/Workflow_MyWorkflowStepsParameter_2.png
    :align: center

Similarly, 4 steps defined for the 3rd Workflow i.e. Quality Assurance.

.. image:: images/Workflow_MyWorkflowStepsParameter_3.png
    :align: center

workflowPageState and pageDataState
+++++++++++++++++++++++++++++++++++

The :token:`workflowPageState` determines the state of a step in the workflow. A step can have an Active (Displayed and Accessible), Inactive (Displayed and Not Accessible) or Hidden (Not Displayed) state. This state is used to control the flow of the workflow. Some steps can be made accessible only when certain conditions are met. For example, in a sequential workflow the next step should be accessible only when the current step is considered done. 

.. image:: images/Workflow_ActiveInactiveState.png
    :align: center

The :token:`pageDataState` determines the data state of a page. This state indicates if a step is Complete, Incomplete or in an Error state. There is a default state as well when a certain step does not need a data state, for Example an Instruction Page or Introduction Page.

.. image:: images/Workflow_PageDataStates.png
    :align: center

These two states are interdependent in certain scenarios hence the  style of the step changes accordingly that is illustrated below:

.. image:: images/Workflow_Workflowanddatastatecombo.png
    :align: center

These states can be changed dynamically as required and as the user progresses in the workflow. This is achievable by either listening to data changes on the page or via procedures that are triggered based on certain actions. 

redirectPageId
++++++++++++++

In the case of an invalid :token:`pageId` or when the :token:`workflowPageState` for a certain step is Inactive or Hidden, the workflow will be redirected to the :token:`redirectPageId`. This is a fallback scenario when a user tries to access a page in a workflow, via the Menu or by an OpenPage procedure defined somewhere in the application, that is not made available to the workflow yet. The :token:`redirectPageId` typically is a page that is part of that workflow. This ensures the user is in the workflow and knows that they need to complete a previous step before accessing other steps of the workflow.

When the :token:`redirectPageId` is also invalid or not defined an error is generated and the workflow stays on the current step. There is also a possibility when the workflow steps can enter a loop, in which case we redirect 25 times and then generate and error and the workflow stays on the current step. Current page being the page the next step or any other step was attempted.

Changing states
+++++++++++++++

As mentioned earlier, the :token:`workflowPageState` and :token:`pageDataState` can be changed dynamically as and when the user performs actions on the workflow. The user can also be restricted from leaving a certain step if some data is incorrect or certain actions need to be performed before moving to any other step or page.

To change the :token:`workflowPageState` of a step in a workflow, simply reference the workflow and the step number in the "MyWorkflowSteps" string parameter and assign the desired value. For example:

.. code:: 

    MyWorkflowSteps(1, 2, 'workflowPageState') := 'Active';

The above illustration sets the :token:`workflowPageState` for Step 2 i.e. Inventory Allocation in Workflow 1 i.e Route Optimization to 'Active'.

.. image:: images/Workflow_ChangeState.png
    :align: center


Similarly, to change :token:`pageDataState`

.. code:: 

    MyWorkflowSteps(1, 2, 'pageDataState') := 'Complete';

If you need to validate data or actions and retain the user on the same step follow the steps explained in Procedure for Restricting Page Navigation.


Configuring the string parameters in the Application settings
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

To enable the Workflow Panel click on the Workflow Panel icon |workflowicon|. Add the configured string parameters to the respective fields as illustrated.

.. image:: images/Workflow_ConfiguringStringParameters.png
    :align: center

Once the string parameters are added in their respective fields, the Workflow Panel will be displayed on pages that are part of a workflow.


Use Classic Theme
-----------------

From AIMMS 4.59 onwards, the look and feel of the WebUI has been upgraded to a more modern look and a consistent styling. 
However, for app developers who need more time to make sure their customized application looks as required with this new theme, 
the WebUI will offer you the choice which theme you want to use. More specifically, if you open an entirely new WebUI application, 
you automatically get the new look and feel (because there cannot be any backward compatibility issues in that scenario). 
If you open an already existing WebUI, however, you are offered the choice to try the new theme or to keep the old one for the time being. 
Should you want to toggle between the two, after having made this choice, we offer the 'Use Classic Theme' option in the 'Miscellaneous' tab. 
Simply set the switch to 'on' for the old theme, or to 'off' for the new theme:

.. image:: images/use_classic_theme_on.png
    :align: center
	
Besides this, we offer a `ClassicTheme.css file <https://gitlab.aimms.com/public-repos/retain-classic-theme>`_, which you can use to adjust some settings when you choose to retain the classic theme. The comments in this file should provide pointers on what to change. When adjusted, the file should be copied into the resources/css folder of your WebUI project. Furthermore, make sure you do use the `new page navigation menu <https://aimms.com/english/developers/downloads/product-information/new-features/#UX20Menu>`_, as released with AIMMS 4.53.1. 


When opting to use the new theme, we offer `two .css files <https://gitlab.aimms.com/public-repos/adjust-new-theme>`_, which you can use to easily add a logo to the header bar of your WebUI pages and to change the color of the horizontal line below the header bar. The `ReadMe file <https://gitlab.aimms.com/public-repos/adjust-new-theme/blob/master/README.md>`_ offers guidance on how to do this. If you indeed start using the new theme, we strongly advice you to 'start from scratch', in case you are using lots of customized css for your model. If you want a more extensive change, we suggest to connect with our support team. Please also make sure to remove any 'ClassicTheme.css' file, as described in the previous paragraph, in case you have copied it to your css folder.

UI Editable
-----------

This is a logical condition which determines whether or not the user interface is editable when the application is run under the AIMMS PRO platform.

When this condition evaluates to "true" and the value of the "Limited Options Editor" (see also below) evaluates to "false", then all editing options available in developer mode 
are also made available to the end-user who runs the application in AIMMS PRO/Cloud. For example, the end-user can change the order of the widgets on a page in this case.

When the "UI Editable" condition evaluates to "false", then the end-user running the application in AIMMS PRO/Cloud is no longer allowed to edit the user interface, but only to use the pages 
and widgets as are, i.e. as provided by the app developer. More specifically, the Application Settings, Page Settings, and Widget Manager icons are no longer available in the Menu Bar. In particular, 
the order of the widgets on a page cannot be changed in this case.
The Page Manager icon may still be available, but the option for adding new pages (i.e., the "+" button) is removed. The page visibility and the page settings (including page name) are not
editable by the end-user. The page order may be temporarily modified for visualization, but as soon as a complete re-load take place the original page order is re-established. 
Moreover, the "cog wheel" Settings icon is no longer available for any of the widgets, so the widget options are no longer editable.

Limited Option Editor(1/0)
--------------------------

This is a logical condition which determines whether or not the PRO user of the app gets limited access to the options in the widget/page editor.

Please note that, when the "UI Editable" option value evaluates to "false", then the value of this "Limited Options Editor" is not relevant.

When the "UI Editable" option value evaluates to "true" and the value of the "Limited Options Editor" evaluates to "true" as well, then the editing options available
in developer mode are made available to the end-user who runs the application in AIMMS PRO/Cloud except from the following:

* The Application Settings are not available for editing

* The Miscellaneous and Advanced sections are not available for editing in the Settings of any widget

For example, the order of the widgets on a page in the Widget Manager can still be changed in this latter case.

Licenseinfo
-----------

This a string option for some text about the used license which may be placed on the top of the menu bar.

Sidebar Open by Default
-----------------------

This is a logical condition which determines whether or not the Page Manager window is opened by default on the left side of the pages.  

Page Manager Hidden
-------------------

This is a logical condition which determines whether or not the Page Manager button on the menu bar is visible or is hidden.