Workflow Panels
===============

.. |applicationsettings-icon| image:: images/applicationsettings-icon.png

.. |application-settings-open| image:: images/app_settings_open_new.png

.. |use-classic-theme-on| image:: images/use_classic_theme_on.png

.. |workflowicon| image:: images/workflowicon.png

.. |ApplicationExtension| image:: images/ApplicationExtensionIcon.png


This section describes various tasks related to application workflow panels.

.. important:: 

  - Workflow panels are available in software versions from AIMMS 4.68 onwards.
  - A Workflow panels tutorial is available in the `WebUI Advanced User Interactions <https://academy.aimms.com/course/view.php?id=57>`__ course on `the AIMMS Academy <https://academy.aimms.com/>`__.

Starting from AIMMS 4.68, it is possible to design and configure Workflows in the AIMMS WebUI. The Workflow Panel is used to represent and run any workflow which is designed and defined by the application developer in the model. AIMMS allows the application developer to configure multiple workflows in an application.

A Workflow Panel is a progression of steps (tasks, events, interactions) that comprise a work/business process and create or add value to the organization's activities. 

The Workflow Panel guides the user through the defined set of steps in a specific workflow. It also gives the user the flexibility to enter or leave a workflow at any step of the process. The user can also navigate between workflows, so there is no restriction to only one workflow at a time. 

The workflow has states for each step that indicate to a user which steps can or cannot be accessed. Data states help indicate which steps are complete, incomplete or in an error state, as illustrated below.

.. image:: images/Workflow_Demo.png
    :align: center

The Workflow Panel can also be collapsed and expanded:

.. image:: images/Workflow_ExpandedCollapsed.png
    :align: center
    :scale: 75

In the collapsed view, when the user hovers over a step the tooltip helps with identifying the purpose of that step:

.. image:: images/Workflow_CollapsedTooltips.png
    :align: center


Configuring the Workflow Panel
------------------------------

The Workflow Panel can be configured by the application developer via the AIMMS model. `Public Workflow Support Declarations <library.html#workflowspecification>`_ have been defined in the inside the `Pages and Dialog Support <library.html#pages-and-dialog-support-section>`_ section of the AIMMS WebUI system library. These pre-declared identifiers are  used to configure different workflows and their respective steps.

To create and configure the Workflow Panel in the application you will need to create two string parameters. The first string parameter will configure the number of workflows in the application, while the second string parameter will configure the steps of each workflow.

.. Note::

    When creating the string parameters to configure workflows and their steps, the first index for configuring Workflows, the first and second index for configuring Workflow Steps needs to be in a subset of integers. You can create your subset of integers and use the respective index as well. To make it convenient you can use the indices from the pre-declared set **ExtensionOrder** for this purpose i.e. ``indexWorkflowOrder`` and ``indexNoOfPages``.

Configuring Workflows
---------------------

For illustration, let's call the first sting parameter ``MyWorkflows(webui::indexWorkflowOrder,webui::indexWorkflowSpec)``. This string parameter is indexed by the `ExtensionOrder <library.html#extensionorder>`_ set with the index ``indexWorkflowOrder`` and the `WorkflowSpecification <library.html#workflowspecificationset>`_ set with the index ``indexWorkflowSpec``. This string parameter is used to define the number of workflows and their respective titles. The values of this string parameter may be initialized in the Initial Data attribute, in a procedure or manually, by right clicking the string parameter and clicking on the Data option in order to open its data page. There you can add the details for the Workflow and their titles (leave the style property empty for now):

.. image:: images/Workflow_MyWorkflowsParameter.png
    :align: center

The values in the example above indicate that there are 3 workflows in the application at hand.

Configuring Steps of Workflows
------------------------------

Create the second string parameter, let's call it ``MyWorkflowSteps(webui::indexWorkflowOrder,webui::indexNoOfPages,webui::indexWorkflowPageSpec)`` indexed over both indices of the `ExtensionOrder <library.html#extensionorder>`_ set and over the  index of the `WorkflowPageSpecification <library.html#workflowpagespecification>`_ set. This string parameter is used to define the steps for each workflow which has been defined in the MyWorkflows string parameter. In particular, each ``pageId`` which is configured becomes a step displayed in the Workflow Panel, see further below. 

.. Note::

    The indices must follow the same order as described in the string parameter ``MyWorkflowSteps(webui::indexWorkflowOrder,webui::indexNoOfPages,webui::indexWorkflowPageSpec)``

    ``pageId`` is a required field.

In order to inspect the values, right click on the MyWorkflowSteps string parameter and click on the Data option in order to open its Data page:

.. image:: images/Workflow_MyWorkflowStepsParameter_1.png
    :align: center

The data entered in the above illustration is for the 1st Workflow which was configured in "MyWorkflows" string parameter, that is, the Route Optimization workflow (with 10 steps defined).

There is no limit for the number of steps each workflow may have. As a guideline, AIMMS recommends no more than 10 steps per workflow. If more than 10 steps are required, then please try to breakdown the workflow into smaller workflows, if possible.

In order to configure the steps for the other workflows, one may just select the respective value for :any:`webui::indexWorkflowOrder` at the top in the Data page.

For instance, 3 steps may be configured for the 2\ :sup:`nd`\  workflow Inventory Management as follows:

.. image:: images/Workflow_MyWorkflowStepsParameter_2.png
    :align: center

Similarly, an example of configuring 4 steps for the 3rd workflow Quality Assurance is illustrated here:

.. image:: images/Workflow_MyWorkflowStepsParameter_3.png
    :align: center

.. Note::
    Please do not use a page configured with the Wizard in a Workflow, this will result in unwanted behaviour.

workflowPageState and pageDataState
-----------------------------------

The ``workflowPageState`` determines the state of a step in the workflow. A step can have an Active (displayed and clickable), Inactive (displayed and not clickable) or Hidden (not displayed) state. This state is used to control the flow of actions in the workflow. Some steps can be made accessible only when certain conditions are met. For example, in a sequential workflow the next step should be accessible only when the current step is considered done. 

.. image:: images/Workflow_ActiveInactiveState.png
    :align: center

The ``pageDataState`` determines the data state of a page. This state indicates if a step is Complete, Incomplete or in an Error state. There is a default (Empty) state as well when a certain step does not need a data state, for example an "Instruction" or an "Introduction" type of page.

.. image:: images/Workflow_PageDataStates.png
    :align: center

These two states are actually interdependent, hence the style of a displayed step may change accordingly as illustrated below:

.. image:: images/Workflow_Workflowanddatastatecombo.png
    :align: center

These states can be changed dynamically, as required, and as the user progresses in the workflow. This is achievable either by applying data changes made on a page or by using model procedures which are triggered based on certain actions in the front end.

.. Note:: 
    To make changes on the page please ensure the workflowPageState is Active. Or, before configuring the workflow steps, first make changes to the respective pages and then configure the workflow steps. When the workflowPageState is Inactive or Hidden you will not be able to access the respective page. 

``redirectPageId``
--------------------

In the case of an invalid ``pageId`` or when the ``workflowPageState`` for a certain step is Inactive or Hidden, the workflow will be redirected to the page indicated by the ``redirectPageId``. This is a fallback scenario for the situation in which a user tries to access a page in a workflow, via the Menu or by an OpenPage procedure defined somewhere in the application, but the page is not made available to the workflow yet. The ``redirectPageId`` is typically a page which is part of the same workflow. This ensures that the user stays in the workflow and learns that a previous step needs to be completed before accessing other steps of the workflow.

When the ``redirectPageId`` is also invalid or not defined, an error is generated and the workflow stays on the current step. There is also a possibility that the workflow steps enter a loop, in which case the redirection is applied 25 times, after which an error is generated and the workflow stays on the current step page.

Combinations and Scenarios
--------------------------

The below table represents the different combinations that can arise when creating a workflow and the result of each scenario.

+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
| S.No |``pageId``|``workflowPageState``|``redirectPageId``| Result                                                                      |
+======+==========+=====================+==================+=============================================================================+
|1     | Valid    |      Active         |      Valid       | Go to workflow step                                                         |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|2     | Valid    |      Active         |     Invalid      | Go to workflow step AND display ``redirectPageId`` warning                  |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|3     | Valid    |      Active         |    Undefined     | Go to workflow step                                                         |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|4     | Valid    |  Inactive/Hidden    |      Valid       | Redirect user to the ``redirectPageId``                                     |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|5     | Valid    |  Inactive/Hidden    |     Invalid      | Display Error 1 AND ``redirectPageId`` warning                              |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|6     | Valid    |  Inactive/Hidden    |    Undefined     | Display Error 1                                                             |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|7     | Invalid  |      Active         |      Valid       | Display Error 2                                                             |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|8     | Invalid  |      Active         |     Invalid      | Display Error 2 AND ``redirectPageId`` warning                              |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|9     |Undefined |      Active         |      Valid       | Display Error 2                                                             |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|10    | Invalid  |  Inactive/Hidden    |      Valid       | Display Error 3                                                             |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|11    | Invalid  |  Inactive/Hidden    |     Invalid      | Display Error 3                                                             |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|12    |Undefined |  Inactive/Hidden    |      Valid       | Display Error 3                                                             |
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+
|13    | Valid    |  Inactive/Hidden    |Invalid/Undefined |Redirect user to Main Project, Display Error 1 and ``redirectPageId`` warning|
+------+----------+---------------------+------------------+-----------------------------------------------------------------------------+

+----------------------------+--------------------------------------------------------------------------------------------+
| Error 1                    | Workflow: The page you tried to access is part of a workflow and currently not accessible. |
+----------------------------+--------------------------------------------------------------------------------------------+
| Error 2                    | Workflow: Page not found.                                                                  |
+----------------------------+--------------------------------------------------------------------------------------------+
| Error 3                    | Page: Page not found.                                                                      |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``redirectPageId`` warning | Workflow: The redirect page for the step is not found.                                     |
+----------------------------+--------------------------------------------------------------------------------------------+

Changing states
---------------

As mentioned earlier, the ``workflowPageState`` and ``pageDataState`` can be changed dynamically while the user performs actions in the workflow. The user can also be restricted from leaving a certain step if some data is incorrect or certain actions need to be performed before moving to any other step or page.

To change the ``workflowPageState`` of a step in a workflow, simply reference the workflow and the step number in the "MyWorkflowSteps" string parameter and assign the desired value. For example:

.. code:: 

    MyWorkflowSteps(1, 2, 'workflowPageState') := "Active";

The above illustration sets the ``workflowPageState`` for Step 2 i.e. Inventory Allocation in Workflow 1 i.e Route Optimization to "Active".

.. image:: images/Workflow_ChangeState.png
    :align: center


Similarly, to change ``pageDataState`` an assignment statement like the following may be used in a model procedure:  

.. code:: 

    MyWorkflowSteps(1, 2, 'pageDataState') := 'Complete';

If you need to validate some data or actions and maybe to retain the user on the same step, please follow the steps explained in `Procedure for Restricting Page Navigation. <page-settings.html#procedure-for-restricting-page-navigation>`_ .


Configuring Workflows in the Application Settings
-------------------------------------------------

To enable the Workflow Panel click on the Application Extensions icon |ApplicationExtension| of the Application Settings and add the configured string parameters to the respective fields as illustrated below:

.. image:: images/Workflow_ConfiguringStringParameters.png
    :align: center

Once the string parameters are added in their respective fields, the Workflow Panel functionality will become visible on the pages which are part of a workflow.

Configuring a ``pageId`` in multiple workflows
----------------------------------------------

Most of the times, configuring a page only in one workflow could suffice for the application at hand. However, the Workflow functionality is flexible enough such that one page may be configured in multiple workflows, if necessary. Although the page will be shown as a step in each of those workflow, there will be one workflow with the highest rank (i.e., the smallest order number) referencing the page and this workflow will be the one shown on the page when the page is opened. So, whenever you click on that step (in any workflow) you will be taken to the corresponding step in the first workflow where the ``pageId`` is referenced. Here "first workflow" is meant in the order of the workflows as defined by the MyWorkflows string parameter. 

For example, if a page 'Results' with ``pageId = results_1`` is configured for two workflows "Route Optimization" and "Inventory Management", then the page Results will appear in both workflows, but will redirect the user to step in Route Optimization workflow when accessed, as illustrated below.

The page Results is configured for two workflows:

.. image:: images/Workflow_Pagein2Workflows_1.png
    :align: center


The page Results is shown as a step in both workflows:

.. image:: images/Workflow_Pagein2Workflows_2.png
    :align: center

In this case, when the user is on the Inventory Management workflow and clicks on the Results step, the user will be redirected to the Results step in the Route Optimization workflow, because Route Optimization is the first workflow (referencing the page Results) in the order of the workflows as defined by the MyWorkflows string parameter.

When and How to use the Workflow Panel
--------------------------------------

When designing a workflow we recommend following some best practices which can make it consistent and easier to use. Below are some practices we would advise:

Background
++++++++++

The Workflow Panel can be used when it is important to maintain the user’s focus throughout the process of filling in data to the system. This is similar to the checkout process often found on e-commerce websites. The checkout process is the most critical part of the site, as this is the part that captures the customer’s money. The Workflow shows the user how far they are in the process, and provides a visible end to the process to aim for. 

*Below: example of a typical e-commerce workflow*

.. image:: images/Workflow_ecommerceflow.png
    :align: center


Branching logic
+++++++++++++++

Next to maintaining focus, the Workflow Panel allows developers to reflect a business process with a sequence of steps. As a user enters information, the model computes the appropriate path and guides the user accordingly. Workflows therefore often have some branching logic, but the perceived user experience is that of a linear flow. The app guides them from one screen after another, and they click “next” to proceed (though you may also give the option “back,” or “cancel.”)

Therefore, workflows can be used for processes where the next step depends on the information filled in the previous step(s) and it is critical that steps are completed before progressing to the next one.

An example case for this is an S&OP process. Users need to fill in sales data, refine the sales forecast, do a capacity review, decide on a scenario, and export plans. If these steps are not taken consecutively, the app will produce no result or unreliable results.

Flows and user groups
+++++++++++++++++++++

Some applications have multiple user types, which each have their own goal and functionalities. An application can facilitate this by having multiple workflows tailored to each user group. For users that do not use the app very often, a Workflow Panel can help to guide them through the process.

.. image:: images/Workflow_UserStepandFlow.png
    :align: center

*Above: steps in an S&OP process per user group.*

.. image:: images/Workflow_SOP.png
    :align: center

*Above: example of the Workflow panel in S&OP Navigator.*

Do's and do not's
-----------------

✅ Do  

Use the Workflow panel for a process that has related steps and are part of the same goal a user is trying to achieve. The steps may (or may not) need to be completed in a specific order.

For example, when doing a tax return, a use must enter data such as income details, property, savings, and family situation. These steps don’t always need to be done in a certain order, but all need to be filled out to achieve complete the tax return.

🚫 Don’t  

The Workflow steps are not tabs, meaning that if the steps are not directly related and are not part of the same goal, the Workflow panel is not the best choice. Using it in this way can be disruptive and confusing.

✅ Do  

Steps should be self sufficient, meaning that users don’t need to navigate to other pages to gather information in order to complete the step.

🚫 Don’t  

You should not require users to exit and re-enter the workflow in order to complete it.

.. spelling:word-list::

    workflowPageState
    pageDataState