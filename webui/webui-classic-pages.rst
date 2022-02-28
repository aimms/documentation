WebUI Classic Pages 
===================

.. |page-manager| image:: images/PageManager_snap1.png

.. |dots| image:: images/PageManager_snap3.png

.. |pencil| image:: images/PageManager_snap3_1.png

.. |eye| image:: images/PageManager_snap3_2.png

.. |hidden| image:: images/PageManager_snap3_3.png

.. |bin| image:: images/PageManager_snap3_4.png

.. |home| image:: images/PageManager_snap3_5.png

.. |wizard| image:: images/PageManager_snap3_6.png

.. |plus| image:: images/plus.png

.. |kebab|  image:: images/kebab.png

.. |addpage|  image:: images/addpage.png

.. |sidepanel|  image:: images/sidepanel.png

.. |dialog|  image:: images/dialogicon.png 

This section describes various tasks related to WebUI classic pages.

Adding a Page
-------------

To add a new root page to your AIMMS WebUI:  

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. A page tree sidebar will open.

  .. image:: images/PageManager_snap2.png
    :align: center

  By default, one page is available, called 'Home', located in the 'Main Project'. 
* Press the plus button behind 'Main Project'.  
* Specify a name for your new page and press the Enter key to add the new page to the list of available pages. Press the Escape key if you want to cancel the creation of the new page. 

To add a new subpage to your AIMMS WebUI:

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. 
* Press ‘dots’ button |dots| behind the parent page of your new subpage. 
* A list of page control buttons appears. Press the button for adding a subpage:

  .. image:: images/PageManager_snap4.png
    :align: center
 
* Specify a name for your new subpage and press the Enter key to add the new subpage to the list of available pages. Press Escape if you want to cancel the creation of the new subpage.

.. tip:: 
    
    When entering the new name, a red line around the name input field can appear, meaning that the current name will not be accepted. E.g. when a page name already exists at this level in the page tree.

To navigate to the newly created page, press the page in the list of available pages in the Page Manager or in the `Page Menu <page-menu.html>`_.

After adding a page, you can `add widgets <widget-manager.html#adding-a-widget>`_ to it.

.. important:: There are some changes made to the page manager with the introduction of `Side Panels <side-panels.html>`_ from software version 4.64. The changes are explained in `adding a side panel page <side-panels.html#adding-a-side-panel>`_.

Renaming a Page
---------------

To rename a page in your AIMMS WebUI:  

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. A page tree sidebar will open. 
* Press the ‘dots’ button |dots| behind the page that you want to rename. 
* A list of page control buttons appears. Press the pencil button |pencil| for renaming the page:
  
  .. image:: images/PageManager_snap5.png
    :align: center
  
* Specify a name for your new page and press the Enter key to commit the new page name. Press the Escape key if you want to cancel renaming the page.


.. tip::

    When entering the new name, a red line around the name input field can appear, meaning that the current name will not be accepted. E.g. when a page name already exists at this level in the page tree.

Moving a Page
-------------

To move a page to a new position in your page tree you can perform a **drag-and-drop** operation as follows:  

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. A page tree sidebar will open:

  .. image:: images/PageManager_snap6.png
    :align: center
    
* Click on the page that you want to move and hold your mouse button down. 
* Move your mouse to the new position in the tree. Subtrees will automatically expand when hovering over them. A little triangle will indicate the new position of your page. If the triangle is on top of another page name, your page will end up just above this page. If it is at the bottom of another page name, your page will end up just below this page. If it is in the middle, your page will become a subpage of the other page.
* Release your mouse button to perform the move to the new position.

Changing the Visibility of a Page
---------------------------------

By default, all pages in your page tree are visible for all users of your WebUI app. However, sometimes you may want to hide certain pages. E.g. when they should only be visible for certain users of your WebUI app, or only after certain actions are performed. In such cases, you can change the visibility of a page in the following way:  

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. A page tree sidebar will open.    
* Press the ‘dots’ button |dots| behind the page for which you want to change the visibility. 
* A list of page control buttons appears. Press the eye button |eye|  to open the visibility option for the page: 

  .. image:: images/PageManager_snap7.png
    :align: center

* Specify a value for the visibility option and press the Enter key to commit it. 

Possible values are 'true' or 1 (visible), 'false' or 0 (hidden), or an AIMMS identifier that contains one of these values.

By specifying an AIMMS identifier for the visibility option of a page, you can dynamically control from within the AIMMS model, which pages should be visible on a certain moment. 

When a page is hidden, it will not show up in the `Page Menu <page-menu.html>`_. In the `Page Manager <page-manager.html>`_, hidden pages are 'grayed out' and they have a 'hidden' icon |hidden| behind their name.

Deleting a Page
---------------

To delete a page:  

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. A page tree sidebar will open.   
* Press the ‘dots’ button |dots| behind the page that you wish to delete.
* A list of page control buttons appears. Press the bin button |bin| to delete the page:

  .. image:: images/PageManager_snap8.png
    :align: center

Setting the Home Page
---------------------

In the `Page Manager <page-manager.html>`_, the first page in the *Main Project* has a home icon |home|. This means that when opening your WebUI app (in develop mode or in PRO) you are automatically being navigated to this first page.

.. image:: images/PageManager_snap9.png
    :align: center
    
By default, there is one page in your WebUI app called *home*. This is the first page and thus the 'startup' page. However, as an app developer you can make another page the startup page if you want, by `moving another page to the first position <#move-a-page>`_. This automatically makes this page the new startup page. Of course, if you just want to give the default home page another name, you can do so by `renaming the page <#rename-a-page>`_.

Wizards (DEPRECATED)
--------------------

.. important :: The Wizard is `deprecated <../deprecation-table.html#deprecated-and-end-of-life>`_. Please use the `Workflow Panel <workflow-panels.html>`_ that has a more rich and fine grained experience.

In AIMMS WebUI it is possible to create so-called *Wizards*. A *Wizard* is a set of pages that an app user should follow in a certain order. On every page in a wizard, the user can click on Next or Previous,

.. image:: images/PageManager_snap10.png
    :align: center

or Start wizard/Finish wizard in case of the first/last page.
 
.. image:: images/PageManager_snap11.png
    :align: center
    
Example
+++++++

To illustrate what a *wizard* could look like, let's look at this example: Processing your shopping cart in a web shop. After having added some items to your shopping cart, you can access your Shopping Cart wizard. By clicking on it, you'll get:

* an overview of the items in your shopping cart that you can still change (start page), click 'start wizard',
* an option to login or register as new user and provide the necessary information (page 2), click 'next',
* fields to enter your contact information and delivery address (page 3), click 'next',
* fields to specify how you want to pay (last page), click 'finish',
* a confirmation page that provides some information about what will happen next (result page).

During this process, the user can cancel the process.

Such a shopping cart wizard will guide the user through a set of pages and it will make sure that all the necessary data is provided and handled in the way it should. E.g. no order is placed when the user is still unknown. 

Create, Update or Delete a Wizard
++++++++++++++++++++++++++++++++++

To create, update or delete a wizard:

* Press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. 
* Press the ‘dots’ button |dots| behind the page that should be the start page of your wizard. 
* A list of page control buttons appears. Press the wizard button |wizard| to create or update the wizard. 
* The Wizard editor will pop up similar to the one in the following picture: 

  .. image:: images/PageManager_snap12.png
    :align: center

After having made your changes, you can press the Create wizard/Update wizard button at the bottom of the Wizard editor. To delete a wizard, use the Delete wizard button at the top of the Wizard editor.

The Wizard editor allows you to select the pages that should be part of this wizard. If you want to select more than three pages, you can use the *Add page to wizard* button. For every page, you can specify a `start and end procedure <#procedures-in-a-wizard>`_. You can move the pages up or down to change their order in the wizard. You can delete them from the wizard by using the little bin icon behind the page row in the Wizard editor. 

Update list from page tree
^^^^^^^^^^^^^^^^^^^^^^^^^^

In case all the pages for a certain wizard are subpages of the first wizard page, you can also change the order of the pages by using the *Update list from page tree* button. When you change the order of the pages in the page tree, this button allows you to easily apply these changes to the wizard page order as well.

Cancel procedure
^^^^^^^^^^^^^^^^

In the Wizard editor, you can also specify a cancel procedure that will be run when the user presses the Cancel button when going through a wizard. 

Result page
^^^^^^^^^^^

When the user presses the Finish wizard button on the last page of the wizard, the user will be directed to the Result page specified in the Wizard editor.

Procedures in a Wizard
++++++++++++++++++++++

A wizard contains a set of pages that the user should follow in a certain order. Each of these pages can have its own `page procedure <page-settings.html>`_, which will always be run when the page is opened, also when the page is opened without using a wizard. Furthermore, when creating a wizard, the app developer can specify a start and end procedure for every page that is part of the wizard. These procedures are automatically run, *only when the user is following the wizard* (i.e.: when opening the same page(s) outside of the wizard, they will not be run). The exact order of execution of procedures for a wizard page is: 

#. Start procedure 
#. Page procedure
#. All the interactivity that the user can do on the wizard page followed by clicking 'Start wizard', 'Next', or 'Finish wizard'
#. End procedure
#. Repeat step 1 for the next page in the wizard (or the 'Result page' in case of 'Finish wizard', see below)

When the user cancels the wizard, a Cancel procedure is called that can also be specified in the Wizard dialog. When the user finishes the wizard by pressing 'Finish wizard' on the last page, the user is directed to the 'Result page', which can also be specified in the Wizard dialog.

Arguments
^^^^^^^^^

The start/end/cancel procedures for pages in a wizard can have 2 arguments (this is optional): 

.. code::

    Parameter statusCode {
        Property: Output;
    }

    StringParameter statusDescription {
        Property: Output;
    }

Inside the procedures, the app developer can assign values to these arguments. E.g.

.. code:: 

    statusDescription := "You need to make a selection first.";
    statusCode := webui::ReturnStatusCode('ERROR');

or

.. code:: 

    statusDescription := "OK.";
    statusCode := webui::ReturnStatusCode('OK');

The ``statusCode`` value at the end of the end/cancel procedure will decide whether or not to continue. This means that in case the ``statusCode`` is *not* 200 ('OK'), the user will remain on the current page. The WebUI will display the ``statusDescription`` string to provide the user with extra information. In case the ``statusCode`` *is* 200 ('OK'), the user will continue to either the next page (in case of an end procedure) or the wizard will be canceled (in case of the cancel procedure). The ``statusDescription`` in such a case will only be displayed when it is not equal to "OK" or "". 
