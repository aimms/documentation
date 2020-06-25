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

	Grid pages are available from AIMMS software version 4.75.

Grid pages introduce a novel concept of visualization based on page layouts. When a layout is applied to a grid page, the page is divided in a number of rectangular areas which will always preserve their relative size and position on the page, even when the entire browser window is being resized. In order to become visible, each widget on a grid page must be assigned to one of the areas defined by the page layout.

This way of organizing a page and the widgets on the page is supported by appropriate fuctionalities in the Page Manager. When opening the Page Manager two tabs are now available: the App tab and the Page tab. The App tab shows a list of all the pages in the application:

.. image:: images/GridPage_PageManager_AppTab.png
    :align: center

The actions for adding, renaming, moving, changing the visibility, and deleting a grid page in the Page Manager are the same as for a classic page. In particular, adding a new grid page can be done by selecting the grid icon in the page create options:

.. image:: images/GridPage_PageManager_AppTab_InsertGrid.png
    :align: center

Once a page has been selected in the App tab of the Page Manager, the Page tab shows more details about that particular page:

.. image:: images/GridPage_PageManager_PageTab_1.png
    :align: center
	
The upper part of the Page tab allows the user to select a certain layout for the page, either as one of the Standard layouts or as a Custom layout. First we are going to discuss options for applying Standard layouts. Afterwards, we will also discuss relevant topics for using Custom layouts. 

Standard layouts
----------------

As shown in the last picture above, a particular case of a standard layout is the "Layout: classic". When this layout is applied to a grid page, then there are actually no specific areas defined and the widgets are placed on the page in the same way as done for a classic page.

The user may choose to switch to another layout from the standard list. Currently this list offers Standard Layout A1, A2, A3, A4, Standard Layout B1, B2, Standard Layout C1, C2, and Standard Layout D1, D2. 

.. image:: images/GridPage_PageTab_StandardLayouts.png
    :align: center
	
For example, if we choose the Standard Layout B2 for a newly added grid page Grid_Standard_Layout in our TransNet application and add widgets for input and output data as explained in the "Getting Started" section, then we may assign widgets to the five areas Main, Aside A, Aside B, Aside C, and Aside D as shown in the following pictures:

.. image:: images/GridPage_PageTab_Full_1.png
    :align: center
	
Initially, unassigned widgets may be moved from the "Unassigned widgtes" section to one of the defined areas by using drag-and-drop. Assigned widgets may also be moved from one area to another area also by using drag-and-drop.

The icons before the name of each area contain either a horizontal arrow from right to left, or a vertical arrow from top to bottom. These arrows indicate how the  

	


  





