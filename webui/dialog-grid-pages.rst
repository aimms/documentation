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

Adding a dialog grid page is similar to adding a page or side panel.

When using the App/Page Manager, click on the insert option "Add Grid Layout Dialog Page" and give the new dialog grid page any name you desire. Note that you cannot give it a name which you have already used for other pages, side panels or dialog pages. 

.. image:: images/dpG_add_new.png
			:align: center

Dialog grid pages can be added to any level in the page tree, just like any other type of page. Unlike pages or grid pages, dialog (grid) pages do not appear in the navigation Menu and can only be accessed via the App/Page Manager, where they have the same options as a page or side panel, i.e. Rename, Delete, etc. You can also move the dialog (grid) pages at a different location within the pages tree in the usual way. 

.. note:: 
	
	Avoid adding pages under dialog (grid) pages. These pages will not be shown in the navigation menu.

By default, a newly added dialog grid page gets the stadndard grid "Layout 11", which has just one area for widgets.

For a dialog grid page you can chose a standard size from the three opions - Small, Medium, or Large, the dimensions of which are as follows:

#.  Small: Width = 3 Columns, Height = 2 

	.. image:: images/dpG_new_small.jpg
				:align: center

#.  Medium: Width = 6 Columns, Height = 3 Rows 

	.. image:: images/dpG_new_medium.jpg
				:align: center

#.  Large: Width = 8 Columns, Height = 3 Rows 

	.. image:: images/dpG_new_large.jpg
				:align: center

Besides the option for one of the three predefined sizes above, a dialog grid page also has the option for a customized page size. In this case, the width and the height may be specified in the Miscellaneous section of the Page Settings:

#.  Custom Size: Example: Width = 4 Columns, Height = 3 Rows  

	.. image:: images/dpG_new_customsize.jpg
				:align: center

In the same way as for regular dialog pages, the title and action buttons on a dialog grid page can be configured via the model. 


Adding widgets to a Dialog Page
-------------------------------

`Adding widgets <widget-manager.html#adding-a-widget>`_ is the same for dialog pages as it is for normal pages or side panels.

Select a desired size by clicking on the respective button in the top right corner of the dialog page. Open the widget manager and `add widgets <widget-manager.html#adding-a-widget>`_ that are needed. 

.. image:: images/dialogapge_selectsize.png
			:align: center

When the height of a widget exceeds the height of the dialog page, the widget will be clipped, as Dialog pages do not have a scroll bar. Pick a suitable size for the dialog page and the widgets you want to have in the dialog page. You can change the size of the dialog page any number of times when in developer mode. The Small, Medium, Large buttons are not available to end users, so the sizes cannot be changed once the application is published.

.. image:: images/dialogapge_widgetclipped.png
			:align: center

.. image:: images/dialogapge_goodfit.png
			:align: center

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

The button names are assigned from left to right from the defined set. If the set has only 1 element, only one button will be displayed. A maximum of 3 buttons can be shown. In the case where 3 buttons are shown, the style of the 1st two buttons are the same and the 3rd button is different.

.. image:: images/dialog_1n3buttons.png
			:align: center

Interacting With Dialog Pages
-----------------------------

When a Dialog page is open, the user can only interact with the widgets on the dialog page and the dialog page itself. The dialog page can be closed only by clicking on the action(s). The user can move/drag the dialog page around the page.     
  
When one dialog page is open, another dialog page cannot be invoked from the open dialog. 