Side Panels 
===========

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


This section describes various tasks related to WebUI side panels.

.. important:: Side panels are available in software versions from AIMMS 4.64 onwards.

Side panels are 2 column width pages that can be configured with different widgets and accessed on different/all pages in an application via tabs on the right-hand side of the page.  
Side panels help build model interactions. These help to free up real estate on pages, or also duplicate widgets that are required on different pages, such as filters.

.. image:: images/SP_TabScreen.png
			:align: center
			:scale: 50
			
.. image:: images/SP_TabScreen_open.png
			:align: center
			:scale: 50			
		
What can side panels be used for?
---------------------------------

Side panels can be used for various purposes, such as filters, displaying KPIs, making quick notes, showing help text.

.. image:: images/SP_Examples.png
			:align: center
			:scale: 75

.. _adding a side panel page:

Adding a Side Panel
-------------------

Adding a side panel page is similar to adding a page.

In the page manager you will notice a few changes. The |plus| icon for the Main project and in the |kebab| menu for other pages has been replaced. The main project now has a |kebab| menu, which when clicked, shows 2 options, i.e. Add New Page |addpage| and Add Side panel |sidepanel|.

The |plus| icon for pages has been removed and 2 new 
icons have been introduced |addpage| and |sidepanel|, as in the 
main project add options.

Click on the Insert side panel page icon and give it any name you desire. You cannot give a name that you have already used for other pages or side panels. 

.. image:: images/SP_addandname.png
			:align: center

You can differentiate between pages and side panels by the icons that represent each type.

.. image:: images/pageside paneldiff.png
			:align: center
			
Side panels can be added to any level in the page tree, just like any normal page. Unlike Pages, Side panels do not appear in the Menu (navigation) and can only be accessed via the page manager. Side panels has the same options of a page i.e Rename, Delete, etc. You can also move the side panel the same way pages can be moved.

.. note:: 
	
	Avoid adding pages under side panel pages. These pages will not be shown in the navigation menu.

Adding widgets to a Side Panel
------------------------------

Adding widgets to a side panel page is the same as adding widgets to any other page. 

Step 1: Click the side panel page you want to add widgets to in the page manager

.. image:: images/SP_Addwidget1toSP1.png
			:align: center
			:scale: 50
			
Step 2: You will see a 2-column width page. Open the Widget Manager.

.. image:: images/SP_Addwidget1toSP2.png
			:align: center
			:scale: 50

Step 3: Add desired widgets to the page.

.. image:: images/SP_Addwidget1toSP3.png
			:align: center
			:scale: 50

.. image:: images/SP_Addwidget1toSP4.png
			:align: center
			:scale: 50

.. note:: 
	
	* Changing the width of a widget will not have any effect as the page is restricted to only 2 columns. You can change the height of the widget as required.
	* If the widgets added exceed the page height a scroll will appear in the side panel. 

.. _Configuring Side panels:

Configuring side panels
-----------------------

Side panels can be configured by the application developer via the AIMMS model. 
A new declaration has been added to the AimmsWebUI library called Public Page and Widget Specification Declarations under the `Pages and Dialog Support <library.html#pages-and-dialog-support-section>`_ section, used to configuring side panels. The set SidePanelSpecification declared inside Public Page and Widget Specification Declarations is used for configuring the side panels as illustrated here in the next steps. 

.. image:: images/SidePanelSpecificationset.png
			:align: center

This set has 4 elements representing side panels properties: 

#.  *displayText*: Is the text/label you would like the side panel tab and header to have. 
#.  *pageId*: When a page or side panel is created it is has a unique pageId.  You can find all the side panel pageIds in the set AllSidePanelPages. 

	.. image:: images/Allsidepanelpagesdata.png
			:align: center
			:scale: 75
						
	.. image:: images/SP_AllsidePanelPages_data.png
			:align: center
			:scale: 75
			
#. *tooltip*: The text here would be displayed when the user hovers over that respective side panel tab.
#. *state*: This is the state for the side panel, i.e Active and Hidden.

.. note:: 
	
	* If the set AllSidePanelPages is not yet filled with all side panel pages, please run the procedure GetAllPages. You can find this procedure in Page Support section under Public Pages Support Procedures. 
	* The "state" property is not yet in use, but will be applicable in future releases. In side panels it is considered as Active by default. You can use domain conditions to show or hide side panels on a page.
	
To configure side panels on a page, create a string parameter indexed on the `ExtensionOrder <library.html#extensionorder>`_ set with :token:`webui::indexPageExtension` and SidePanelSpecification set with :token:`webui::indexSidePanelSpec` indices, for example :token:`homepageSP(webui::indexPageExtension,webui::indexSidePanelSpec)` as shown here:

.. image:: images/SP_homepageSPidentifier.png
			:align: center

.. Note::

    When creating the string parameter to configure side panels, the first index needs to be in a subset of integers. You can create your subset of integers and use the respective index as well. To make it convenient you can use the index from the pre-declared set `ExtensionOrder <library.html#extensionorder>`_ for this purpose i.e. :token:`indexPageExtension`.

Right click the string parameter and click on the Data option in order to open the data page:

.. image:: images/SP_stringparameterdata.png
			:align: center

Add the details for the side panels you would like to show on this page. For example, if your page tree has 5 pages and 7 side panels, like here

.. image:: images/SP_pagetree.png
			:align: center
			:scale: 75

and you want 3 side panels on the "home" page, namely: 

#. Filters
#. Quick Notes
#. Help

then the data in the configuration string parameter may be filled in as follows:

.. image:: images/SP_homepageSPidentifier_data.png
			:align: center
			:scale: 75

.. note:: 

	* Side panels appear in the same order from top to bottom as they appear in the data of the string parameter.
	* If you enter an incorrect pageId, then the corresponding side panel tab will not be shown.
	
Configuring the string parameter on respective pages
----------------------------------------------------

In the WebUI, navigate to the respective page. In the Page Settings you can locate the Page Extensions option:

.. image:: images/SP_configuresidepanel.png
			:align: center
			:scale: 75
			
Add the string parameter created for that respective page in the "Side Panels" field. 

.. image:: images/SP_configurehomepage2.png
			:align: center

Once you have added the string parameter, the respective side panel tabs will appear on that page.

.. image:: images/SP_3panels.png
			:align: center
			
Similarly, you can create some (other) string parameters for other pages and configure them using the same steps.

You can configure as many side panels as you need in your application. However, please note that, since there is limited screen space, **AIMMS WebUI only displays the top 6 side panels on each page.**

Interacting with side panels
----------------------------

A side panel can be opened and closed by clicking on the respective tab. 
Hovering over a side panel will show you the tooltip that was configured in the model. 

.. image:: images/SP_tabinteraction.png
			:align: center
			:scale: 50

Clicking on the tab highlights that tab and slides opens with the widgets that were added to that respective side panel page.

.. image:: images/SP_tabinteraction_open.png
			:align: center
			:scale: 50
