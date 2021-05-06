Side Panels Grid Pages
======================

.. |plus| image:: images/plus.png

.. |kebab|  image:: images/kebab.png

.. |addpage|  image:: images/addpage.png

.. |sidepanel|  image:: images/sidepanel.png

.. |page-manager| image:: images/PageManager_snap1.png

.. |sidepanelgrid|  image:: images/SP_grid_icon.png

.. |appmanager_kebab|  image:: images/appmanager_kebab.png

This section describes various tasks related to WebUI Side Panel Grid Pages.

.. important:: Side Panel Grid Pages are available in software versions from AIMMS 4.80 onwards.

.. note:: When running an AIMMS project which was created with AIMMS 4.80 (or with a newer version) by using AIMMS 4.79 (or an older version), the side panel grid pages created in AIMMS 4.80 may be treated as regular pages in AIMMS 4.79, because side panel grid pages are not available in AIMMS 4.79 or in older AIMMS versions. Before upgrading your AIMMS project to a new AIMMS version, please create a backup of your project which may still be run with the older AIMMS versions.

Side Panel Grid Pages are Side Panel pages with a grid layout. So, they combine the features of the `Side Panels <side-panels.html>`_ and the features of `WebUI Grid Pages <webui-grid-pages.html>`_. In this respect, the explanations about the behavior provided in the side panels section and the WebUI grid pages section also apply to the side panel grid pages discussed here. Therefore, we advise the reader to take a look at those two sections as well for explanations on aspects that are generally applicable.

Side panels are special pages with a fixed width of two columns which can be accessed on various regular pages in an application by using tabs on the right-hand side of the page (see illustrations bellow). Side panels can be configured with widgets and can help building model interactions. Also, they can hold widgets (such as filters) which are required by several pages, preventing the need to duplicate such widgets on each individual page. This way, side panels help to free up space on regular pages.

.. image:: images/SidePanel_HomeExample1.png
			:align: center
			
.. image:: images/SidePanel_HomeExample2.png
			:align: center
		
What can side panels be used for?
---------------------------------

Side panels can be used for various purposes, such as filters, displaying KPIs, making quick notes, showing help text, etc.

Side Panels give developers the possibility to add extra widgets to a page that are always easily accessible in a collapsible panel on the right. The Side Panel is a good place for filters or help text.

Avoid core functionalities in side panels. E.g. steps to achieve (initial) output on the page. Avoid buttons in side panels. Buttons are probably a key function for the page. Put widget-specific procedure in `widget action <widget-options.html#widget-actions>`_. 

.. image:: images/SidePanel_Examples.png
			:align: center

Adding a Side Panel Grid Page
-----------------------------

Adding a side panel grid page is similar to adding any other page.

When using the `Application Manager <app-management.html>`_, in the App tab click the |appmanager_kebab| icon for the page under which want to add the side panel grid page and select the "Add Side Panel Page". Give the new side panel grid page any name you desire. Note that you cannot give it a name that you have already used for other pages, side panels, or dialog pages. 

+----------------------------------------------+-----------------------------------+
| With Application Management                  | Without Application Management    |
+----------------------------------------------+-----------------------------------+
| .. image:: images/SPGL_Add_AppManager.png    | .. image:: images/SPGL_Add.png    |
|    :align: center                            |    :align: center                 |
+----------------------------------------------+-----------------------------------+
| .. image:: images/SPGL_GiveName.png                                              |
|    :align: center                                                                |
+-------------------------------------------+--------------------------------------+

.. image:: images/SPGL_Named.png
			:align: center

You can differentiate between other types of pages and a side panel grid page by the icons that represent each type. The side panel grid page is represented with |sidepanelgrid|.
			
Side panel pages can be added to any level in the page tree, just like any normal page. Unlike Pages, Side panel pages do not appear in the Menu (navigation) and can only be accessed via the Application manager (Page manager). Side panel grid pages have the same options as any other page i.e Rename, Delete, etc. You can also move the side panel the same way pages can be moved.

.. note:: 
	
	Avoid adding regular pages under other side panel pages. These pages will not be shown in the navigation menu.

Adding widgets to a Side Panel Grid Page
----------------------------------------

Essentially, adding widgets to a side panel grid page works in the same way as for a grid page. 

Step 1: Click the side panel grid page you want to add widgets to, in the application tree.

.. image:: images/SPGL_SelectPage.png
			:align: center
			
Step 2: You will see a 2-column width page. Switch to the "Page" tab, notice that ``Layout 11`` is assigned by default. 

.. image:: images/SPGL_Layout11Default.png
			:align: center

Step 3: Click the "+" button to open the widget addition wizard and add a widget.

.. image:: images/SPGL_AddWidget.png
			:align: center

Step 4: Any new widget added appears in the "Unassigned widgets" area. Drag and drop the widget into "Area A".

.. image:: images/SPGL_AddandDrag.png
			:align: center

Step 5: Once the widget appears in the designated area, you can configure the widget as required.

.. image:: images/SPGL_ConfigureWidget.png
			:align: center

Step 6: Repeat steps 3 to 5 to add more widgets to the side panel. Since ``Layout 11`` is the assigned layout, all widgets added to the area will be distributed equally.

.. image:: images/SPGL_Final.png
			:align: center

Creating a Custom Layout 
------------------------

As illustrated above, when a new side panel grid page is added, ``Layout 11`` is assigned by default. Let's say you do not want the widgets to be distributed equally but in different proportions, you may want to choose from the other standard layouts. However, since the side panel is restricted to a 2-column width, almost all of the standard layouts will not be suitable. In such a case you can create a custom layout.

Follow the below steps to create your custom layouts that can be assigned to the side panel grid pages.

Step 1: Clone ``Layout 11`` by clicking the |kebab| icon and clicking "Clone to Custom" OR Click on the "Custom" tab and then "Add a layout" option.

.. image:: images/SPGL_CloneToCustom.png
			:align: center

Step 2: This opens the Layout Editor. Give the template a desired name.

.. image:: images/SPGL_LayoutEditor.png
			:align: center

Step 3: Since the side panel has a custom width, we advise you to configure/modify values in the ``gridTemplateRows`` property. For example, divide the rows into three areas that are distributed in the ratio 1:2:3, namely Area-A, Area-B, and Area-C. 

.. code ::

		{
			"componentName": "Grid",
			"props": {
				"gridTemplateColumns": "1fr",
				"gridTemplateRows": "1fr 2fr 3fr",
				"gridTemplateAreas": "\"area-a\" \"area-b\" \"area-c\""
			},
			"items": [
				{
					"componentName": "WidgetArea",
					"props": {
						"gridArea": "area-a",
						"name": "Area A",
						"gridAutoFlow": "row"
					}
				},
				{
					"componentName": "WidgetArea",
					"props": {
						"gridArea": "area-b",
						"name": "Area B",
						"gridAutoFlow": "row"
					}
				},
				{
					"componentName": "WidgetArea",
					"props": {
						"gridArea": "area-c",
						"name": "Area C",
						"gridAutoFlow": "row"
					}
				}
			]
		}

You can also change the ``"gridTemplateColumns"`` property to add more columns, but please be aware that the columns will be adjusted in the space that is available in the 2-column width, as illustrated below:

.. image:: images/SPGL_TwoColumns.png
			:align: center

Step 4: Once created, the custom template is applied. Now assign the widgets to the areas as required.

.. image:: images/SPGL_CustomAssigned.png
			:align: center

If you require more information on custom layouts please `read more on Creating Grid Definitions <webui-grid-pages.html#creating-grid-definitions>`_. 

In case the widgets being assigned require more space, you can introduce a vertical scroll by dividing the areas `using percentages <webui-grid-pages.html#using-percentages>`_, the total of which should exceed 100%.

Horizontal scroll is not supported in Side Panels.

Configuring side panels
-----------------------

Side panels can be configured by the application developer via the AIMMS model. 
A new declaration has been added to the AimmsWebUI library called Public Page and Widget Specification Declarations under the `Pages and Dialog Support <library.html#pages-and-dialog-support-section>`_ section, used to configuring side panels. The set SidePanelSpecification declared inside Public Page and Widget Specification Declarations is used for configuring the side panels as illustrated here in the next steps. 

.. image:: images/SidePanel_Specification.png
			:align: center

This set has 4 elements representing side panels properties: 

#.  ``displayText``: Is the text/label you would like the side panel tab to have. This is an optional field. If left empty, no text will be displayed on the tab.
#.  ``pageId``: When a page or side panel is created it is has a unique pageId.  You can find all the side panel pageIds in the set AllSidePanelPages. This is a required field.

	.. image:: images/Allsidepanelpagesdata.png
			:align: center
						
	.. image:: images/SP_AllsidePanelPages_data.png
			:align: center
			
#. ``tooltip``: The text here would be displayed when the user hovers over that respective side panel tab. This is an optional field and if left empty, no tooltip is displayed.
#. ``icon``: The icon you want to display on the side panel tab. You can select from a list of 1600+ icons, the reference can be found in the `icon list <../_static/aimms-icons/icons-reference.html>`_. `Custom icons <webui-folder.html#custom-icon-sets>`_ can also be used if required. This is an optional field and if left empty, no icon will be displayed.
#. ``color``: The color you want to display for the icon configured, eg: Blue, Red, etc. Browsers support around `140 color names <https://www.w3schools.com/colors/colors_names.asp>`_. This is an optional field. You can also use Hex codes eg: #FF0000 for Red. This is an optional field; if left empty, the icon will be blue when the tab is collapsed. The icon color changes to white when the side panel tab is expanded since the tab's color becomes blue and most of the other colors blend in making it difficult to view the icon.
#. ``state``: This is the state for the side panel, i.e Active and Hidden. This is an optional field and is currently not in use.

.. note:: 
	
	* If the set AllSidePanelPages is not yet filled with all side panel pages, please run the procedure GetAllPages. You can find this procedure in Page Support section under Public Pages Support Procedures. 
	* The ``state`` property is not yet in use, but will be applicable in future releases. In side panels it is considered as Active by default. You can use domain conditions to show or hide side panels on a page.
	
To configure side panels on a page, create a string parameter indexed on the `ExtensionOrder <library.html#extensionorder>`_ set with ``webui::indexPageExtension`` and SidePanelSpecification set with ``webui::indexSidePanelSpec`` indices, for example ``HomePageSidePanel(webui::indexPageExtension,indexSidePanelSpec)``. 

.. Note::

    When creating the string parameter to configure side panels, the first index needs to be in a subset of integers. You can create your subset of integers and use the respective index as well. To make it convenient you can use the index from the pre-declared set `ExtensionOrder <library.html#extensionorder>`_ for this purpose i.e. ``indexPageExtension``.

Right click the string parameter and click on the Data option in order to open the data page:

.. image:: images/SidePanel_StringParameterData.png
			:align: center

Add the details for the side panels you would like to show on this page. For example, if your page tree has 5 pages and 7 side panels, like here

.. image:: images/SP_pagetree.png
			:align: center

and you want 3 side panels on the "home" page, namely: 

#. Filters
#. Quick Notes
#. Help

then the data in the configuration string parameter may be filled in as follows:

.. code:: 

	data { ( 1, displayText ) : "Filters"            ,  ( 1, pageId      ) : "filters_1"          ,
		( 1, tooltip     ) : "Global Filters"        ,  ( 1, icon        ) : "aimms-filter3"         ,
		( 2, displayText ) : "Quick Notes"           ,  ( 2, pageId      ) : "quick_notes"           ,
		( 2, tooltip     ) : "Make a Quick Note"     ,  ( 3, displayText ) : "Help"                  ,
		( 3, pageId      ) : "help_1"                ,  ( 3, tooltip     ) : "All the help you need!",
		( 3, icon        ) : "aimms-question"        ,  ( 3, color       ) : "green"                  }
		
In the above data we have not defined values for the color of the icon for the Filters tab and the icon and its color for the Quick Notes tab.

.. note:: 

	* Side panels appear in the same order from top to bottom as they appear in the data of the string parameter.
	* If you enter an incorrect pageId, then the corresponding side panel tab will not be shown.
	
Configuring the string parameter on respective pages
----------------------------------------------------

In the WebUI, navigate to the respective page. In the Page Settings you can locate the Page Extensions option:

.. image:: images/SP_configuresidepanel.png
			:align: center
			
Add the string parameter created for that respective page in the "Side Panels" field. 

.. image:: images/SidePanel_SpecifyingStringParameter.png
			:align: center

Once you have added the string parameter, the respective side panel tabs will appear on that page.

.. image:: images/SidePanel_Result.png
			:align: center
			
Similarly, you can create some (other) string parameters for other pages and configure them using the same steps.

You can configure as many side panels as you need in your application. However, please note that, since there is limited screen space, **AIMMS WebUI only displays the top 6 side panels on each page.**

Interacting with side panels
----------------------------

A side panel can be opened and closed by clicking on the respective tab. 
Hovering over a side panel will show you the tooltip that was configured in the model. 

.. image:: images/SidePanel_TabInteraction.png
			:align: center

Clicking on the tab highlights that tab and slides opens with the widgets that were added to that respective side panel page.

.. image:: images/SidePanel_TabInteraction_Open.png
			:align: center