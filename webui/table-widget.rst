Table Widget
------------

.. |sort| image:: images/sort.png

The Table widget allows you to vizualize and/or edit the data of one or more AIMMS identifiers represented in a tabular format:

  .. image:: images/Table-View1.png 
        :align: center 

The table widget offers the user possibilities for various actions such as:
		
* Sort table data by using the sort buttons as illustrated in the picture below: 

  .. image:: images/Table-View2.png 
        :align: center 

  The sort button applies one of the 3 state: ascending, descending, unsorted:

  .. image:: images/Table-View3.png 
        :align: center	
		
* change several `Widget Options <widget-options.html>`_, e.g.

  * add `aggregators (Totals) <widget-options.html#totals>`_
  * customize the table by drag-and-drop of the indices (`Pivot <widget-options.html#pivot>`_), 
  * specifying reverse links on the ‘Store focus’ tab of the widget’s option editor. 
    When a cell has the focus in the table, the element parameter(s) that you specify here will be filled accordingly, opening up various opportunities for interaction between the widgets.
  *

* Save the table data to a .csv file by using the `Download Table Data <#download-table-data>`_ functionality, see below.

* Change the column widths of the table, simply by dragging them to where you want them.

* Change the default row height of the table, by specifying a positive integer value in the 'Default row height' option in the Miscellaneous options editor.

* Use your keyboard (as well as the mouse) to navigate the table.

  * You can use the 0 or the 1 key to set binary values displayed as checkboxes that have the focus.
  
  * You can use the space bar to toggle binary values displayed as checkboxes that have the focus.
  
  * You can use either ENTER or ALT+ARROW DOWN to open the dropdown list in focus, in order to change its value.

Download Table Data
+++++++++++++++++++
  
The Table Widget offers you the possibility to download its current contents to a .csv file on your local machine, which you can use to further process your data in, for example, Excel. On the top right, left of the 'Full Screen' icon, you can find the download icon. 

.. image:: images/Table-SaveCSV.png
    :align: center

When you click it, the contents of the table, exactly as you configured it (in terms of pivoting, for example), will be downloaded to a .csv file. Depending on your browser, you can specify the name of the file or the download location. As a default, the name of your table will be used as the filename with the '.csv' extension.

If your table contains numerical data, the numbers will be written to the .csv file in their maximum precision. So, if you display only 2 decimals in the table, but the underlying number is for example 1.2345, the full precision is written to the file. This allows you to do calculations in Excel with the resulting file, without running into rounding errors. Furthermore, the value 'na' from AIMMS is written as the value '#N/A', which is used in Excel, in order to maximize the compatibility.

Please note that the .csv file is constructed within your browser environment before downloading. This means that the performance might vary over the devices that you are using. You will get a warning if your download will be too big to handle for the WebUI: this is when the total number of cells involved exceeds 500.000. We have successfully tested up to the scenario of 5000 x 100 rows/columns, using the Chrome browser on a Windows desktop machine. When you go over this limit of 500.000 cells, the WebUI will download the CSV file, containing more or less these 500.000 values. Any additional data will not be included in the CSV file (the WebUI will display a "Data truncated" warning if this happens). Furthermore, there is a limit on the number of *rows* that can be downloaded: this is currently 50.000 rows (i.e. even when having just 1 column!).
 
Creating Read-Only Cells
++++++++++++++++++++++++

By using flags
^^^^^^^^^^^^^^

In a Table widget, it is possible to make specific cells read-only for the user. You can do this by using an extra string parameter in your model, which has the same name and index domain as the identifier which defines the content of the table, only post-fixed with :token:`_flags`. So, if you have a Table widget showing the content of parameter :token:`MyTableData(i, j)`, you should add a string parameter called :token:`MyTableData_flags(i, j)` in your model. In order to actually make some cells read-only, you have to set the value of the right index combination(s) to :token:`"readonly"`. So, in our example, you should add a line like:

.. code::

    MyTableData_flags(i, 'some_value_for_j') := "readonly";

After doing so, the affected cells in your Table widget will be displayed (in the default WebUI theme) in black, indicating that they cannot be edited. All the other cells are in the default (blue) color.

In case you want to change a cell to become editable again, you have to assign the empty string to the corresponding flags-identifier. So, to undo the effect of the above statement, you should execute the following code:

.. code::

    MyTableData_flags(i, 'some_value_for_j') := "";

By using the CurrentInputs set
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Another way to influence the modifiability of cells, is to use the :token:`CurrentInputs` set of AIMMS. This set is a predeclared subset of :token:`AllIdentifiers`. The identifiers referenced in it are modifiable sets and parameters in both the WinUI and the WebUI. Consider a parameter :token:`P`. Without further specfication, this parameter is a parameter that can be modified both in the WinUI and in the WebUI. By removing this element :token:`'P'` from :token:`CurrentInputs`, the parameter :token:`P` will no longer be modifiable in either the WinUI or the WebUI.

