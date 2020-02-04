Dialog Pages
============

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


.. important:: Dialog pages are available in software versions from AIMMS 4.65 onwards.

Dialog Pages are used for intermediate actions or steps in your workflow. You can build model interaction by calling dialog pages for the user to perform a specific action such as setting SLA's or adjusting inventory etc. In addition, you can use Dialog pages to display information about a selected item without breaking the flow by calling the OpenDialogPage function. For example showing the detailed properties of a scheduled batch. 

A dialog page has one of three predefined sizes: Small, Medium and Large. Dialog pages can have up to 3 buttons, 2 of which are shown by default, typically Cancel and OK. The text and callback procedures for these buttons can be controlled via the OpenDialogPage function. 

When a dialog box is open, the user can interact with the dialog only. The dialog box can only be closed by clicking on one of the actions.   


Adding a Dialog Page
--------------------

Adding a dialog page is similar to adding a page or side panel.

Click on the Insert Dialog page icon |dialog| and give it any name you desire. You cannot give a name that you have already used for other pages, side panels or dialog pages. 

.. image:: images/dialogpage_add.png
			:align: center
			:scale: 75

Dialog pages can be added to any level in the page tree, just like a normal page. Unlike Pages, Dialog pages do not appear in the Menu (navigation) and can only be accessed via the page manager. Dialog pages have the same options as a page or side panel, i.e. Rename, Delete, etc. You can also move the dialog pages the same way pages can be moved.

You can chose a size for the dialog page, the dimension for which are:

#.  Small: Width = 3 Columns, Height = 2 Rows. Here you can fit widgets with dimensions that add up to 3 columns and 2 rows, e.g. 1 widget with width = 3 columns or less and height = 2 rows or less OR 2 widgets with width = 3 columns or less and height = 1 row.

	.. image:: images/dialog_diffsizes_small.png
				:align: center
				:scale: 50

#.  Medium: Width = 6 Columns, Height = 3 Rows. Here you can fit widgets with dimensions that add up to 6 columns and 3 rows. 

	.. image:: images/dialog_diffsizes_medium.png
				:align: center
				:scale: 50

#.  Large: Width = 8 Columns, Height = 3 Rows .  Here you can fit widgets with dimensions that add up to 8 columns and 3 rows.

	.. image:: images/dialog_diffsizes_large.png
				:align: center
				:scale: 50

The title and action buttons on the dialog page can be configured via the model. These are placeholders to depict how the actual dialog page will look. This also gives an idea of the usable area for adding widgets in the dialog page.

.. image:: images/dialog_placeholders.png
			:align: center
			:scale: 75

.. note:: 
	
	Avoid adding pages under dialog pages. These pages will not be shown in the navigation menu.

Adding widgets to a Dialog Page
-------------------------------

`Adding widgets <widget-manager.html#adding-a-widget>`_ is the same for dialog pages as it is for normal pages or side panels.

Select a desired size by clicking on the respective button in the top right corner of the dialog page. Open the widget manager and `add widgets <widget-manager.html#adding-a-widget>`_ that are needed. 

.. image:: images/dialogapge_selectsize.png
			:align: center
			:scale: 75

When the height of a widget exceeds the height of the dialog page, the widget will be clipped, as Dialog pages do not have a scroll bar. Pick a suitable size for the dialog page and the widgets you want to have in the dialog page. You can change the size of the dialog page any number of times when in developer mode. The Small, Medium, Large buttons are not available to end users, so the sizes cannot be changed once the application is published.

.. image:: images/dialogapge_widgetclipped.png
			:align: center
			:scale: 75

.. image:: images/dialogapge_goodfit.png
			:align: center
			:scale: 75

Configuring Dialog Pages
------------------------

The procedure `OpenDialogPage(pageId,title,actions,onDone) <library.html#opendialogpage>`_ needs to be used to invoke dialog pages on the desired page. 

An `example <library.html#id4>`_ of the procedure with declarations would result in:

.. code::

	MyActions:= data { Decline, Accept };
	pageId := 'dialog_page';
	webui::OpenDialogPage(pageId, "Dialog Page Title", MyActions, 'Procedure_Actions');


.. image:: images/dialog_procedurecall.png
			:align: center
			:scale: 50

The button names are assigned from left to right from the defined set. If the set has only 1 element, only one button will be displayed. A maximum of 3 buttons can be shown. In the case where 3 buttons are shown, the style of the 1st two buttons are the same and the 3rd button is different.

.. image:: images/dialog_1n3buttons.png
			:align: center
			:scale: 75

Interacting With Dialog Pages
-----------------------------

When a Dialog page is open, the user can only interact with the widgets on the dialog page and the dialog page itself. The dialog page can be closed only by clicking on the action(s). The user can move/drag the dialog page around the page.     
  
When one dialog page is open, another dialog page cannot be invoked from the open dialog. 