Table Widget
============

.. |sort| image:: images/sort.png
.. |filtered-icon| image:: images/filtered_icon.png
.. |table-filtered| image:: images/headerfiltered_icon.png
.. |delete-filter-icon| image:: images/filterdelete_icon.png
.. |disable-rule| image:: images/enablerule_icon.png

The Table widget allows you to visualize and/or edit the data of one or more AIMMS identifiers represented in a tabular format:

  .. image:: images/Table-View1.png 
        :align: center 

The table widget offers the user possibilities for various actions such as:
		
* Sort table data by using the sort buttons as illustrated in the picture below: 

  .. image:: images/Table-View2.png 
        :align: center 

  The sort button applies one of the 3 states: increasing, decreasing, default:

  .. image:: images/Table-View3.png 
        :align: center	

  For example, if one chooses for the "increasing" sorting in the example above, the rows of the table are sorted as follows:
  
  .. image:: images/Table-View4.png 
        :align: center  
		
* change several `Widget Options <widget-options.html>`_, e.g.

  * add `aggregators (Totals) <widget-options.html#totals>`_
  * customize the table by drag-and-drop of the indices (`Pivot <widget-options.html#pivot>`_), 
  * specifying reverse links on the ‘Store focus’ tab of the widget’s option editor. 
    When a cell has the focus in the table, the element parameter(s) that you specify here will be filled accordingly. Such element parameters may be used at the same time by other widgets, which will update automatically. Hence, the ‘Store focus’ functionality opens up various possibilities for interaction between the widgets.
  * specify various `identifier settings <widget-options.html#identifier-settings>`_; in particular, specifying display domain, slicing, or expanding indexes
  * specify `Widget Actions <widget-options.html#widget-actions>`_ and the `Item Actions <widget-options.html#item-actions>`_ 
            
* Save the table data to a .csv file by using the `Download Table Data <#download-table-data>`_ functionality, see below.

* Change the column widths of the table, simply by dragging them to where you want them.

* Change the default row height of the table, by specifying a positive integer value in the 'Default row height' option in the Miscellaneous options editor.

* Use your keyboard (as well as the mouse) to navigate the table.

  * You can use the 0 or the 1 key to set binary values displayed as checkboxes that have the focus.
  
  * You can use the space bar to toggle binary values displayed as checkboxes that have the focus.
  
  * You can use either ENTER or ALT+ARROW DOWN to open the drop-down list in focus, in order to change its value.

Download Table Data
--------------------------
  
The Table Widget offers you the possibility to download its current contents to a .csv file on your local machine, which you can use to further process your data in, for example, Excel. On the top right, left of the 'Full Screen' icon, you can find the download icon. 

.. image:: images/Table-SaveCSV.png
    :align: center

When you click it, the contents of the table, exactly as you configured it (in terms of pivoting, for example), will be downloaded to a .csv file. Depending on your browser, you can specify the name of the file or the download location. As a default, the name of your table will be used as the filename with the '.csv' extension.

If your table contains numerical data, the numbers will be written to the .csv file in their maximum precision. So, if you display only 2 decimals in the table, but the underlying number is for example 1.2345, the full precision is written to the file. This allows you to do calculations in Excel with the resulting file, without running into rounding errors. Furthermore, the value 'na' from AIMMS is written as the value '#N/A', which is used in Excel, in order to maximize the compatibility.

Please note that the .csv file is constructed within your browser environment before downloading. This means that the performance might vary over the devices that you are using. You will get a warning if your download will be too big to handle for the WebUI: this is when the total number of cells involved exceeds 1,000,000. We have successfully tested up to the scenario of 10,000 x 100 rows/columns, using the Chrome browser on a Windows desktop machine. When you go over the limit of 1,000,000 cells, the WebUI will download the CSV file, containing more or less these 1,000,000 values. Any additional data will not be included in the CSV file (the WebUI will display a “Data truncated” warning if this happens). For large data-sets over 1,000,000 cells, we suggest you create a custom CSV and use the 'download widget' to download the file. 

Furthermore, there is a limit on the number of rows that can be downloaded (i.e. even when having just 1 column!): this is controlled by the value of the project option *WebUI_maximum_number_of_entries_in_widget*. The default value of this option is currently 1,000,000.
 
Creating Read-Only Cells
------------------------------------

By using flags (in runtime)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In a Table widget, it is possible to make specific cells read-only for the user. You can do this by using an extra string parameter in your model, which has the same name and index domain as the identifier which defines the content of the table, only post-fixed with :token:`_flags`. So, if you have a Table widget showing the content of parameter :token:`MyTableData(i, j)`, you should add a string parameter called :token:`MyTableData_flags(i, j)` in your model. In order to actually make some cells read-only, you have to set the value of the right index combination(s) to :token:`"readonly"`. So, in our example, you should add a line like:

.. code::

    MyTableData_flags(i, 'some_value_for_j') := "readonly";

After doing so, the affected cells in your Table widget will be displayed (in the default WebUI theme) in black, indicating that they cannot be edited. All the other cells are in the default (blue) color.

In case you want to change a cell to become editable again, you have to assign the empty string to the corresponding flags-identifier. So, to undo the effect of the above statement, you should execute the following code:

.. code::

    MyTableData_flags(i, 'some_value_for_j') := "";

By using the :any:`CurrentInputs` set (in runtime)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Another way to influence the modifiability of cells, is to use the :any:`CurrentInputs` set of AIMMS. This set is a predeclared subset of :any:`AllIdentifiers`. The identifiers referenced in it are modifiable sets and parameters in both the WinUI and the WebUI. Consider a parameter :token:`P`. Without further specification, this parameter is a parameter that can be modified both in the WinUI and in the WebUI. By removing this element :token:`'P'` from :any:`CurrentInputs`, the parameter :token:`P` will no longer be modifiable in either the WinUI or the WebUI.

.. code::

    CurrentInputs := CurrentInputs - 'MyTableData';
    
By using the WebUI authorization (not in runtime)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You may use the Authorization support from the WebUI Library described in :doc:`../webui/creating`. 
Please mind this authorization is not updated at WebUI runtime. Thus, the following code should be part of the `PostMainInitialization` predeclared procedure or the Startup Procedure ( :menuselection:`Settings===>Project Options===> Startup & authorization` ). 

.. code::
    
    ! Turns MyTableData identifier read-only
    webui::IdentifierAuthorization('MyTableData') := 4;

Authorization Schema reminder:

+--------------------------+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Identifier Authorization | Value | Description                                                                                                                                                                                                                       |
+==========================+=======+===================================================================================================================================================================================================================================+
| no access                | 0     | No data will be shown in the WebUI, even if the identifier is specified in a widget in the WebUI. Procedures will not be executed                                                                                                 |
+--------------------------+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| read access              | 4     | Data will be displayed in the WebUI, but will be shown as read-only data. Data changes via the WebUI are prohibited. Procedures will not be executed.                                                                             |
+--------------------------+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| read and execute access  | 5     | Data will be displayed in the WebUI, but will be shown as read-only data. Data changes via the WebUI are prohibited. Procedures with this permission can be executed from within the WebUI.                                       |
+--------------------------+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| read and write access    | 6     | Data will be displayed in the WebUI, and are displayed as editable if no other restrictions prohibit editing the data (e.g. defined identifiers). Data changes via the WebUI are not prohibited. Procedures will not be executed. |
+--------------------------+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| full access              | 7     | Data will be displayed in the WebUI, and are displayed as editable if no other restrictions prohibit editing the data (e.g. defined identifiers). Procedures with this permission can be executed from within the WebUI.          |
+--------------------------+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Data Filtering on the Table
---------------------------

.. important:: Filtering is available in software versions from AIMMS 4.75 onwards as part of Experimental Features. Filtering is currently available only for the Table widget. Please reach out to AIMMS support on how to enable Experimental Features.

.. note::

  Filters are readily available for the table and there is no need to create a specification or configuration in the model. This is an end-user tool.

When working with tables you could be looking at a lot of data. It can be difficult to find information quickly in such cases. Filters can be used to narrow down the data in your table, allowing you to view only the information you need.

Filters are useful when you want to focus only on specific information in a large dataset in a table. Filtering doesn't remove or modify data, it just changes which records appear on your widget. Filtering lets you temporarily hide unwanted data.

To add filter rules
^^^^^^^^^^^^^^^^^^^

#. In order for filtering to work correctly, your table should include at least one row and column header, which is used to identify the name of each column and row. In the example, the table columns and rows can be identified by the headers Centers and Factories respectively.

    .. image:: images/TableFilters_Example.png
        :align: center

#. A drop-down arrow will appear in the header cell for each column/row. Click the drop-down arrow for the column/row you want to filter and click on the "Add Filters Rule" option. In our example, we will filter the column "Copenhagen".

    .. image:: images/TableFilters_AddFilter.png
        :align: center

#. The Filter dialog will appear, where you can select the desired operator and enter the value. We will filter for values greater than 9.

    .. image:: images/TableFilters_SelectOperator.png
        :align: center
    
    .. image:: images/TableFilters_AddRule.png
        :align: center

    You can also find an operator by typing it in the dropdown field. For example, to see operators that have “greater” just type the word or the mathematical symbol in the field.

    .. image:: images/TableFilters_SearchRule.png
        :align: center

#. Click on "Apply" or "Apply and Close".

    .. image:: images/TableFilters_ApplyRule.png
        :align: center

    The Apply button will apply the rule and the dialog will stay open, allowing you to e.g. add another rule. The data will be filtered and visible on the table, as illustrated above.  
    
    The Apply and Close button will apply the rule and close the dialog as well.

#. The data will be filtered, temporarily hiding any content that doesn't match the criteria. In our example, only 2 values greater than 9 are visible.

    .. image:: images/TableFilters_ApplyRule.png
        :align: center

#. The column will have an indication |filtered-icon| that a filter has been applied. The header cell will also be highlighted with a different color.

    .. image:: images/TableFilters_Filtered.png
        :align: center

    The table header also show an indication |table-filtered| that a filter has been applied to the table.

#. To apply multiple rules follow the instructions again. The below illustration shows another filter applied to the row header cell "London" for values lesser than 10.

    .. image:: images/TableFilters_TwoFilters.png
        :align: center

    You can also add multiple rules for the same column or row. When two or more rules are added to the same column or row, the data for that respective column or row will display data that meets all rules combined (logical AND condition).

New rules are added to the bottom of the list of rules in the dialog. You can reorder these rules by dragging and dropping the rules in the desired order. 

The below illustration shows the effect of reordering rules. We applied two rules, the first rule to the row "Zurich" and the second to the row "Hamburg".

    .. image:: images/TableFilters_FilterOrder1.png
        :align: center

    .. image:: images/TableFilters_FilterOrder1_Result.png
        :align: center

The data shows five columns that meet the applied rules. When we reorder the second rule to the top it results in different data resulting in only four columns.

    .. image:: images/TableFilters_FilterOrder2.png
        :align: center

    .. image:: images/TableFilters_FilterOrder2_Result.png
        :align: center

You can edit values and use the table normally after the data is filtered. If you change a value for a fitlered column or row, the data might change based on the filter rules set.

To add filter rules to columns/row headers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similarly, you can also add filters to the column or row headers. For headers, only four :ref:`string operators <string-operators>` are available; "is", "is not", "contains", and "does not contain".

The "is" and "is not" operators allows you to select one or more elements from the dorpdown list. In our example, we will filter the row header "Centers". Here we select 2 elements, Copenhagen and Frankfurt. 

    .. image:: images/TableFilters_FilterHeaderAdd.png
        :align: center

    .. image:: images/TableFilters_FilterHeaderDialog.png
        :align: center

    .. image:: images/TableFilters_FilterHeaderSelect1.png
        :align: center

    .. image:: images/TableFilters_FilterHeaderSelect2.png
        :align: center

    .. image:: images/TableFilters_FilterHeader_Result.png
        :align: center

The same visual indications are seen when the filters are applied as explained in the above steps.

You can also remove selected elements by either clicking on the "x" on each individual element, or remove the complete selection by clicking the "X" in the selction box, as illustrated below.

    .. image:: images/TableFilters_FilterHeaderRemove1.png
        :align: center

    .. image:: images/TableFilters_FilterHeaderRemoveAll.png
        :align: center

To edit filter rules
^^^^^^^^^^^^^^^^^^^^

#. Click on the filter icon on the table header |table-filtered| to open the filter dialog. You can also choose to open the dialog by clicking on the drop-down and the clicking on the "Add Filters Rule" option.

    .. image:: images/TableFilters_EditFilter.png
        :align: center

#. Change the desired rule and click Apply or Apply and Close. In our example, we will change the value for the first rule from 9 to 10.

    .. image:: images/TableFilters_EditFirstFilter.png
        :align: center

    .. image:: images/TableFilters_EditFirstFilterResult.png
        :align: center

    You can change multiple rules consecutively and then click either action button. 

To clear filter rules
^^^^^^^^^^^^^^^^^^^^^

#. Click on the filter icon on the table header |table-filtered| to open the filter dialog. You can also choose to open the dialog by clicking on the drop-down and the clicking on the "Add Filters Rule" option.

    .. image:: images/TableFilters_EditFilter.png
        :align: center

#. Click on the delete icon |delete-filter-icon| for the respective rule and either Apply or Apply and Close the dialog. In our example, we will delete the rule applied to the column header cell "Copenhagen".

      .. image:: images/TableFilters_DeletedFilter.png
        :align: center

#. If you do not want to delete the rule and just want to disable it, click on the enable/disable rule switch |disable-rule|, and click either action button. 

    .. image:: images/TableFilters_DisabledFilter.png
        :align: center

    When a rule is disabled it will remain in the filter dialog but will not be applied. The disable rule option is useful when the applied filters result is an empty table. You can disable certain rules and check the results.

#. In either case, deleting or disabling a rule, the data will be filtered only on enabled rules. In our example, the rule on the row header cell "London" is applicable. The indication for the deleted or disabled rule will also be removed.

    .. image:: images/TableFilters_DisabledFilterResult.png
        :align: center

#. To clear all filter rules, click "Clear All Filters". This will clear all enabled and disabled rules and close the dialog, resulting in the original data on the table. 


Operators
^^^^^^^^^

The operators provided are specific to numeric and string/element valued data. The below tables explains each of the operators.

+-----------------------------------+-------------------------------------------------------------------------------------------+
| Numeric Operators                 | Result                                                                                    |
+===================================+===========================================================================================+
| is equal to (=)                   | All data that is equal to the entered value is displayed.                                 |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is not equal to (!=)              | All data except the entered value is displayed.                                           |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is less than (<)                  | All data that is lesser than the entered value is displayed                               |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is less than or equal to (<=)     | All data that is lesser than or equal to the entered value is displayed                   |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is greater than (>)               | All data that is greater than the entered value is displayed                              |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is greater than or equal to (>=)  | All data that is greater than or equal to the entered value is displayed                  |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is in between                     | All data that is in between the range of and equal to the two entered values are displayed|
+-----------------------------------+-------------------------------------------------------------------------------------------+
| is not in between                 | All data that is outside the range of the two entered values are displayed                |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| show top                          | Displays the highest N values in descending order. N is the value entered.                |
+-----------------------------------+-------------------------------------------------------------------------------------------+
| show bottom                       | Displays the lowest N values in ascending order. N is the value entered.                  |
+-----------------------------------+-------------------------------------------------------------------------------------------+

When adding rules to numeric operators, characters cannot be entered. The field accepts only numeric values.

.. note ::
    When ``show top`` or ``show bottom`` operators are used on a column/row, since the data is already sorted, sorting on other columns/rows will not be available. 

.. _string-operators:

+------------------------------+-------------------------------------------------------------------------------------------+
| String/Elt Operators         | Result                                                                                    |
+==============================+===========================================================================================+
| contains                     | All data that contains the entered characters are displayed                               |
+------------------------------+-------------------------------------------------------------------------------------------+
| does not contain             | All data except the strings that contain the entered characters are displayed             |
+------------------------------+-------------------------------------------------------------------------------------------+
| is                           | All data that is an exact match to the entered characters are displayed                   |
+------------------------------+-------------------------------------------------------------------------------------------+
| is not                       |All data except the strings that are an exact match to the entered characters are displayed|
+------------------------------+-------------------------------------------------------------------------------------------+
| starts with                  | All data that start with the entered characters are displayed                             |
+------------------------------+-------------------------------------------------------------------------------------------+
| ends with                    | All data that end with the entered characters are displayed                               |
+------------------------------+-------------------------------------------------------------------------------------------+

Best Practices
^^^^^^^^^^^^^^

#. When using numeric operators for filtering data that are in decimals points, we advise the use of the range operator, i.e. "in between" or "not in between" since the data that is displayed in the table and the actual stored data may vary in the number of decimals. Using the "is equal" operator will look for an exact match in the stored data.

#. When using the range operator, i.e. "in between" or "not in between", for decimal values, you might want to input values that have a small variance.  

#. To apply a filter rule on data that are dates, we advise the use of the string operators. The dates are stored in string format in AIMMS.

#. If filter rules are applied and the data in the table changes based on other interactions, please be aware that the filters will still be applied. 

#. When filters are applied and if you add/remove content, change the widget type, change the slicing information or change the pivot the applied filters will be cleared. This will be possible only if you have access to the widget settings.  