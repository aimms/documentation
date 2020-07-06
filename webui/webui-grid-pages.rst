WebUI Grid Pages 
================

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


This section describes various tasks related to WebUI grid pages.

.. important::

	Grid pages are available starting from AIMMS software version 4.75.

Grid pages introduce in AIMMS WebUI the concept of visualization based on page layouts, which is a widely used standard in webdesign. This concept features several advantages such as better responsiveness, fluid layouts, and the possibility for full page widgets. What is taken out compared to the classic pages is the repositioning of all widgets when the browser window is resized. The intention is to stimulate moving an entire application to this grid page format, which may be achieved gradually, by converting one page at a time (the idea is that the classic page style will be deprecated in time).

When a page layout is applied to a grid page, the page is divided into a number of rectangular areas and each area is to host a group of widgets. In order to become visible on a grid page, each widget on that page must be assigned to one of the areas defined by the page layout. Currently, all the standard layouts use so-called fractions for resizing. This way, the layout areas always preserve their relative size and position on the page, even when the entire browser window is being resized. However, Grid supports more options for (re)sizing like pixels, percentages or em’s, and also supports combinations of those. These options can already be used in custom layouts, see further below. 

The organization of a page and the widgets on the page by using layouts is supported by appropriate functionalities in the Page Manager.

Page Manager with Grid Pages
----------------------------

When opening the Page Manager two tabs are now available: the App tab and the Page tab. The App tab shows the list of all the pages in the application:

.. image:: images/GridPage_PageManager_AppTab.png
    :align: center

The actions for adding, renaming, moving, changing the visibility, and deleting a grid page in the Page Manager are the same as for a classic page. In particular, adding a new grid page can be done by selecting the grid icon in the page (create) options:

.. image:: images/GridPage_PageManager_AppTab_InsertGrid.png
    :align: center

Once a page has been selected in the App tab of the Page Manager, the Page tab shows more details about that particular page:

.. image:: images/GridPage_PageManager_PageTab_1.png
    :align: center
	
The upper part of the Page tab allows the user to select a certain layout for the page, either as one of the Standard layouts or as a Custom layout. First we are going to discuss options for applying Standard layouts. Afterwards, we will also discuss relevant topics for using Custom layouts. 

Standard Layouts
----------------

As shown in the last picture above, a particular case of a standard layout is the "Layout: classic". When this layout is applied to a grid page, then there are actually no specific areas defined and the widgets are placed on the page in the same way as done for a classic page. Resizing the entire browser window will result in the same repositioning of the widgets as the one applied to the classic pages.

The user may choose to switch to another layout from the standard list. Currently this list offers Standard Layout A1, A2, A3, A4, Standard Layout B1, B2, Standard Layout C1, C2, and Standard Layout D1, D2 (please use the left arrow < and the right > in order to scroll horizontally through the list):   

.. image:: images/GridPage_PageTab_StandardLayouts.png
    :align: center
	
For example, if we choose the Standard Layout B2 for a newly added grid page Grid_Standard_Layout in our TransNet application and add widgets for input and output data as explained in the "Getting Started" section, then we may assign widgets to the five areas Main, Aside A, Aside B, Aside C, and Aside D as shown in the following pictures:

.. image:: images/GridPage_PageTab_Full_1.png
    :align: center
	
Initially, unassigned widgets may be moved from the "Unassigned widgets" section to one of the defined areas by using drag-and-drop. Assigned widgets may also be moved from one area to another by using drag-and-drop:

.. image:: images/GridPage_Drag-and-Drop_1.png
    :align: center

The icon before the name of an area contains either a horizontal arrow from left to right, or a vertical arrow from top to bottom. These arrows indicate how the widgets are distributed within each area, either columnwise in equal columns or rowwise in equal rows, which is also indicated by the corresponding tooltip:

.. image:: images/GridPage_Area_Name_Tooltip.png
    :align: center

Please also note the "+" sign at the bottom of the Page tab of the Page Manager. This allows the user to add a new widget to the selected page directly from within this Page tab, without the need to open the Widget Manager in order to access the same functionality.  

The layout selection and the assignments of widgets to areas as shown above results in the following page visualization:

.. image:: images/GridPage_StandardLayout_FullPage_1.png
    :align: center

Note that the area "Aside B" is here in the lower right part of the page and contains the two widgets for Transport and Total Costs values, which are distributed columnwise in equal columns.

Switching between Layouts
-------------------------

When the user switches to another layout , for example to Standard Layout C1, then the widgets stay assigned to areas with the same name, if these areas exist in the newly selected layout. If not, then the corresponding widgets appear in the "Unassigned widgets" section and may be moved by drag-and-drop to one of the currently available areas, if required:

.. image:: images/GridPage_StandardLayoutC1_FullPage_1.png
    :align: center

In this example, the Demand widget (which used to be assigned to area "Aside D" in the Standard Layout B2) has been moved to "Unassigned widgets" section (because the area "Aside D" is not defined in the Standard Layout C1).
Also, the distribution of widgets in area "Aside B" is now rowwise in the current Standard Layout C1 (whereas it used to be columnwise in the Standard Layout B2).

In general, widgets will always remember which named area they were assigned to, also upon switching layouts. Only when you explicitly move a widget to another area, will they store their new assignment. In other words, one can switch layouts without breaking the assignments of the widgets, as long as one does not re-arrange them.

As apparent from this example, the standard layouts provide some convenient basic options to start with. However, specific requirements for a page may require the usage of a Custom page layout.

Custom Layouts
--------------

A new custom layout may be added by using the corresponding "+" button in the Custom section of the Page (layout) tab or by cloning one of the standard layouts (which is to be modified afterwards):

.. image:: images/GridPage_NewCustomLayout_1.png
    :align: center

A custom layout may be edited (i.e. modified) by using the Edit option in its upper right corner:

.. image:: images/GridPage_CustomLayouts_Edit_1.png
    :align: center

This will open the layout Editor where the layout name and format may be adjusted and then saved:

.. image:: images/GridPage_CustomLayouts_Editor_1.png
    :align: center

For example, we can modify the layout and save the modified layout under the name "Custom Layout B2" as follows:

.. image:: images/GridPage_CustomLayoutB2_1.png
    :align: center
	
Note that in this case the grid has 8 columns and 3 rows (instead of 4 columns and 2 rows as it used to have initially). Also a new (sixth) area "Aside E" has been added to the layout:

.. image:: images/GridPage_CustomLayoutB2_2.png
    :align: center

Clearly, this new area "Aside E" is used when defining the grid template areas in the modified layout format:

.. image:: images/GridPage_CustomLayoutB2_3.png
    :align: center

When we apply the resulting custom layout as defined above to our page, the resulting visualization is as follows:

.. image:: images/GridPage_CustomLayoutB2_FullPage.png
    :align: center

This resulting page looks better than the one achieved only based on the Standard Layout B2 discussed above. In particular, we have gained more space for the map widget such that the network is better visible now. Also, this page preserves the clear division between the input, optimization, and output data in a similar way as discussed in the "Getting Started" section of this manual. 




  





