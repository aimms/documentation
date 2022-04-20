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
  

Limited Support for Special Numbers
-----------------------------------

AIMMS offers support for special numbers, like inf, na, undef, etc. The WebUI table offers limited support here, for inf and -inf only. The following applies:

* The Table widget displays inf/-inf values from AIMMS as ∞/-∞.
* You can enter the value for infinity in the Table itself by typing either 'inf', '-inf', 'Infinity', '-Infinity', '∞' or '-∞'.
* If you are displaying Totals in the Table, the following rules apply:
  * any Total that contains 'inf' (as an operand) and no '-inf' results in 'inf'.
  * any total that contains '-inf' (as an operand) and no 'inf' results in '-inf'.
  * any total that contains 'inf' (as an operand) as well as '-inf' results in undefined and produces an error message in the WebUI.


Download Table Data
--------------------------
  
The Table Widget offers you the possibility to download its current contents to a .csv file on your local machine, which you can use to further process your data in, for example, Excel. On the top right, left of the 'Full Screen' icon, you can find the download icon. 

.. image:: images/Table-SaveCSV.png
    :align: center

When you click it, the contents of the table, exactly as you configured it (in terms of pivoting, for example), will be downloaded to a .csv file. Depending on your browser, you can specify the name of the file or the download location. As a default, the name of your table will be used as the filename with the '.csv' extension.

If your table contains numerical data, the numbers will be written to the .csv file in their maximum precision. So, if you display only 2 decimals in the table, but the underlying number is for example 1.2345, the full precision is written to the file. This allows you to do calculations in Excel with the resulting file, without running into rounding errors. Furthermore, the value 'na' from AIMMS is written as the value '#N/A', which is used in Excel, in order to maximize the compatibility.

Please note that the .csv file is constructed within your browser environment before downloading. This means that the performance might vary over the devices that you are using. You will get a warning if your download will be too big to handle for the WebUI: this is when the total number of cells involved exceeds 500,000. We have successfully tested up to a scenario like 5,000 x 100 rows/columns, using the Chrome browser on a Windows desktop machine. When you go over the limit of 500,000 cells, the WebUI will download the CSV file, containing more or less these 500,000 values. Any additional data will not be included in the CSV file (the WebUI will display a “Data truncated” warning if this happens). For large data-sets over 500,000 cells, we suggest you create a custom CSV and use the 'download widget' to download the file. 

Furthermore, there is a limit on the number of rows that can be downloaded (i.e. even when having just 1 column!): this is controlled by the value of the project option *WebUI_maximum_number_of_entries_in_widget*. The default value of this option is currently 50,000.
 
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

.. note::

  Filters are readily available for the table and there is no need to create a specification or configuration in the model. This is an end-user tool.

  Filtering is available on tables that are added to Regular pages and Side Panel pages. It is currently not possible to add filter rules to tables added to Dialog pages. 

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

You can edit values and use the table normally after the data is filtered. If you change a value for a filtered column or row, the data might change based on the filter rules set.

.. note:: When filtering data on columns and rows, select either a numeric or string operator based on the data in the column/row. If the data is numeric use one of the numeric operators and if the data is alphanumeric use one of the string operators. When an element parameter is added to the table, the data will be treated either as numeric or alphanumeric. It is currently not possible to select elements while adding a filter rule the way it can be done when filtering headers, which is explained in the below section. 

To add filter rules to columns/row headers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Similarly, you can also add filters to the column or row headers. For headers, only five :ref:`string operators <string-operators>` are available; "is", "is not", "contains", "does not contain" and ":ref:`matches regex<RegExp>`".

The "is" and "is not" operators allow you to select one or more elements from the dropdown list. In our example, we will filter the row header "Centers". Here we select 2 elements: Copenhagen and Frankfurt. 

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

You can also remove selected elements by either clicking on the "x" on each individual element, or remove the complete selection by clicking the "X" in the selection box, as illustrated below.

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

    The ``is equal to (=)`` and ``is not equal to (!=)`` filters data that is displayed in the table. The other operators will filter data on the actual stored data which may vary in the number of decimals.

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
| matches regex                | All data that match the specified regular expression are displayed (see below)            |
+------------------------------+-------------------------------------------------------------------------------------------+

.. _RegExp:

Regular Expressions
^^^^^^^^^^^^^^^^^^^

The last String/Elt Operator mentioned in the tables above ('matches regex') needs some more explanation. It allows you to use regular expressions in your filtering, providing additional flexibility over the other String/Elt Operators. The regular expressions that are accepted are those that are accepted in all search boxes in the WebUI. For details and examples on which expression you can use and on how to use them, please refer to the `documentation of the search boxes <widget-manager.html#using-the-search-boxes>`_.

Best Practices
^^^^^^^^^^^^^^

#. When using the range operator, i.e. "in between" or "not in between", for decimal values, you might want to input values that have a small variance.  

#. To apply a filter rule on data that are dates, we advise the use of the string operators. The dates are stored in string format in AIMMS.

#. If filter rules are applied and the data in the table changes based on other interactions, please be aware that the filters will still be applied. 

#. When filters are applied and if you add/remove content, change the widget type, change the slicing information or change the pivot the applied filters will be cleared. This will be possible only if you have access to the widget settings.  


.. Important::
    When using aggregators like mean and count, please be aware the WebUI may display different results depending on whether filters are applied or not. When no filters are applied, these aggregators are computed by the AIMMS engine which does not take into account whether columns/rows are visible in the WebUI. In such a case the results may be different than what an end-user might expect because they may assume that the aggregators may be computed using the visible columns/rows only.

    When filters are applied, the aggregators are computed using only the columns/rows that are displayed using the current set of filters, which may lead to a different set of results even when the filters do not change the content of the filtered/non-filtered table.
    
    To prevent any confusion with your end-users when using aggregators like mean and count, you are therefore advised to use a display domain that will make sure that any columns/rows included in the aggregator computations will also be visible on the screen.

Date and Time picker for Calendar elements
------------------------------------------

.. Important:: 
    The Date and Time picker is available in software versions from AIMMS 4.77 onwards.

A Date and Time picker is displayed to select a date and time when a `Calendar <https://how-to.aimms.com/Articles/189/189-using-calendars-in-aimms.html>`_ is referenced in a table. A calendar icon appears in the cell, on hover, that represent `Calendar <https://how-to.aimms.com/Articles/189/189-using-calendars-in-aimms.html>`_ elements and the picker is displayed by either clicking the calendar icon or double clicking on the cell.

.. Image:: images/DateTime_CalendarDefault.png
    :align: center

.. Image:: images/DateTime_CalendarIcon.png
    :align: center

The Date and Time picker makes it easy to differentiate between dates and to maintain a reference. The current date is displayed with a bold blue colour so the users can identify the current date easily. The selected date is highlighted with a blue background. Based on the calendar range, the date picker allows the user to select dates only from the range. Inactive dates are greyed out and cannot be selected. The date and time picker also has the option to select the current date and time by clicking on the "Today" button. The user can also clear the date by clicking the "Clear Date" button. The week numbers are also displayed for users who reference weeks by the week number.

.. Image:: images/DateTime_CalendarRanges.png
    :align: center

When the user selects a certain date, the picker automatically switches to the time picker. The user can also toggle between dates, months and years by clicking on the blue bar of the picker. The users can also change months or years by clicking on the arrows when on the respective selections.

.. Image:: images/DateTime_ToggleDMY.png
    :align: center

As mentioned above, the date picker allows selection of dates only in the range of the defined calendar. Although the actual time ranges are not confined when the time selection is made by the user, if a time is selected that might fall outside the range set in the calendar, an error "Selected Date/Time is outside of allowed range" will be displayed.

For example, if the calendar range is set from ``2019-10-07 06:00`` to ``2019-10-07 20:00``, and the user selects ``2019-10-07 21:00``, the error message "Selected Date/Time is outside of allowed range" will be displayed and the date will be set either to the previous value or left blank.

There are different combinations of the date and time picker which are controlled by the Unit property defined in the calendar.

+------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Calendar Unit          | Date and Time picker option                                                                                                 |
+========================+=============================================================================================================================+
| Century, Year          | The user is given the option to only select the year.                                                                       |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Month                  | The user can select a year and the corresponding month.                                                                     |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Day                    | The user can select a year, the corresponding month and date.                                                               |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Hour                   | After selecting the date, the time picker is displayed where the user can select the hour.                                  |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Minutes                | The user can select up-to the minute.                                                                                       |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------+
| Second, Tick           | The user still gets the option to select up-to the minute. Selecting seconds and ticks is not possible at the moment.       |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------+

When the Unit is set to Century, Year, Month or Day, the time picker is not displayed.

.. spelling::

    inf
    na
    undef
    modifiability