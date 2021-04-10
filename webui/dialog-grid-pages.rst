Dialog Grid Pages
=================

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


This section describes various tasks related to the WebUI Dialog Grid Pages.

.. important:: Dialog pages are available in software versions from AIMMS 4.80 onwards.

Dialog Grid Pages are dialog pages with a grid layout. So, they combine the features of `Dialog Pages <dialog-pages.html>`_ and the features of `WebUI Grid Pages <webui-grid-pages.html>`_. In this respect, the explanations about the behavior provided in the dialog pages section and in the WebUI grid pages section also apply to the dialog grid pages discussed here. Therefore, we advise the reader to take a look at those two sections as well for explanantions on aspects which are generally applicable. 

For example, like the regular dialog pages, dialog grid pages can also have up to 3 buttons, 2 of which are shown by default, typically Cancel and OK. The text and callback procedures for these buttons can be controlled via the OpenDialogPage function. Also, when a dialog grid page is open, the user can interact with the dialog only. The openned dialog box can only be closed by clicking on one of the action buttons on it.   

However, there are also some exceptions which are applicable to the dialog grid pages and which will be stated explicitly in this section. Moreover, there are also some features which are specific to the dialog grid pages and these will be mentioned here as well. 

For instance, a dialog grid page not only has the option for one of the three predefined sizes (Small, Medium and Large), but also the option for a customized page size.  

Adding a Dialog Grid Page
-------------------------

Adding a dialog grid page is similar to adding a (grid) page, a regular dialog, or a side panel.

When using the `App/Page Manager <app-management.html>`_, click on the insert option "Add Grid Layout Dialog Page" and give the new dialog grid page any name you desire. Note that you cannot give it a name which you have already used for other pages, side panels or dialog pages. 

.. image:: images/dpG_add_new.png
			:align: center

Dialog grid pages can be added to any level in the page tree, just like any other type of page. Unlike pages or grid pages, dialog (grid) pages do not appear in the navigation Menu and can only be accessed via the `App/Page Manager <app-management.html>`_, where they have the same options as a page or side panel, i.e. Rename, Delete, etc. You can also move the dialog (grid) pages at a different location within the pages tree by using drag-and-drop in the usual way. 

.. note:: 
	
	Avoid adding pages under dialog (grid) pages as such pages will not be shown in the navigation menu.

By default, a newly added dialog grid page gets the standard grid "Layout 11", which has just one area for widgets.

For a dialog grid page you can chose a standard size from the three opions - Small, Medium, or Large, the dimensions of which are as follows:

1.  Small: Width = 3 Columns, Height = 2 

	.. image:: images/dpG_new_small.jpg
				:align: center

2.  Medium: Width = 6 Columns, Height = 3 Rows 

	.. image:: images/dpG_new_medium.jpg
				:align: center

3.  Large: Width = 8 Columns, Height = 3 Rows 

	.. image:: images/dpG_new_large.jpg
				:align: center

Besides the option for one of the three predefined sizes above, a dialog grid page also has the option for a customized page size. In this case, the width and the height may be specified in the Miscellaneous section of the `Page Settings <page-settings.html>`_:

4.  Custom Size: Example: Width = 4 Columns, Height = 3 Rows  

	.. image:: images/dpG_new_customsize.jpg
				:align: center

For a dialog grid page with custom size, the maxrows option may be set between 1 and 4, while the maxcolumns option may be set between 1 and 14. If other values are specified, then they will be rounded to the nearest integer within these intervals.

The pictures above show the dialog grid pages in their preview mode. In this mode, the title and the action buttons shown are just placeholders in order to depict how the actual dialog grid page will look like when summoned. This preview also gives an idea of the usable area for adding widgets in the dialog grid page. In the same way as for regular dialog pages, the title and the action buttons applied on a dialog grid page which is summoned can be configured via the model, see further below. 


Adding widgets to a Dialog Grid Page
------------------------------------

`Adding widgets <widget-manager.html#adding-a-widget>`_ to a dialog grid page works in the same way as for a (grid) page, a regular dialog, or a side panel.

First select a desired dialog size by clicking on the respective button in the top right corner of the dialog grid page or by defining a custom size for it. Then open the widget manager and `add widgets <widget-manager.html#adding-a-widget>`_ which are needed. 

.. image:: images/dialogapge_selectsize.png
			:align: center

When the height of a widget exceeds the height of the dialog page, the widget will be clipped, as Dialog pages do not have a scroll bar. Pick a suitable size for the dialog page and the widgets you want to have in the dialog page. You can change the size of the dialog page any number of times when in developer mode. The Small, Medium, Large buttons are not available to end users, so the sizes cannot be changed once the application is published.

.. image:: images/dialogapge_widgetclipped.png
			:align: center

.. image:: images/dialogapge_goodfit.png
			:align: center

Configuring Dialog Grid Pages
-----------------------------

The procedure `OpenDialogPage(pageId,title,actions,onDone) <library.html#opendialogpage>`_ needs to be used in order to invoke a dialog grid page on the desired page. 

An `example <library.html#id4>`_ of the procedure with declarations would result in:

.. code::

	MyActions:= data { Decline, Accept };
	pageId := 'dialog_page';
	webui::OpenDialogPage(pageId, "Dialog Page Title", MyActions, 'Procedure_Actions');


.. image:: images/dialog_procedurecall.png
			:align: center

The button names are assigned from left to right from the defined set. If the set has only 1 element, only one button will be displayed. A maximum of 3 buttons can be shown. In the case where 3 buttons are shown, the style of the 1st two buttons are the same and the 3rd button is different.

.. image:: images/dialog_1n3buttons.png
			:align: center

Interacting With Dialog Grid Pages
----------------------------------

When a dialog grid page is open, the user can only interact with the widgets on the dialog grid page and with the dialog grid page itself. The dialog grid page can be closed only by clicking on one of its actions button. The user can move/drag the dialog page around the page which invoked it.     
  
When one dialog grid page is open, no other dialog (grid) page can be invoked from the already openned dialog. 