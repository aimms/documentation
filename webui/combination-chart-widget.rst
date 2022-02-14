Combination Chart Widget
========================

The Combination Chart widget is an example of a widget based on the so-called highcharts offered by https://www.highcharts.com/ and further supported in the AIMMS WebUI.

The Combination Chart widget can combine several chart types in a single chart widget. More specifically, it has been built upon the combination chart presented at https://www.highcharts.com/docs/chart-and-series-types/combining-chart-types.

Currently, The Combination Chart widget only supports the 'column' chart type, resulting in a Column Chart, see also https://www.highcharts.com/docs/chart-and-series-types/column-chart. 
In the near future, the Combination Chart widget in AIMMS WebUI will be extended with other chart types like ‘line’ and ‘area’ and you will be able to specify a chart type per identifier. 

<name is explained by the fact that you can combine different chart types in a single chart> @Ovidiu

For the time being, please refer to the supported features described below...

The Column Chart is a particular instance of the Combination Chart which represents data as vertical bars, also called columns. In this section we refer to a Combination Chart Widget which uses only columns as a column chart widget. 
Note, however, that the formal widget type used for adding it to a page is still "combinationchart".

A column chart widget can render data in your model by using an X/Y-plane and display a column for each data point. The height of a column in the chart equals the value of the corresponding data point.
In this section we discuss and illustrate the features and options of the column chart. The chart's options may be set and accessed through the options editor which open upon clicking on the Settings cog-wheel in the widget header:

.. image:: images/ColumnChart-Settings-1.png
   :align: center

| 
	
Besides literal values, most options may also be specified using identifiers declared in the AIMMS model. 
For example, in the TransNet application, the demand for products of every distribution center may be represented using a column chart widget. 
Similarly, the unit transport costs for every combination (factory, center) may be rendered in a column chart. 
We use such examples, as will become clearer in the sequel, in order to illustrate the concrete usage of the various chart features. 

Contents 
--------

Firstly, a data identifier to be rendered in the column chart has to be specified in the Contents tab of the widget's options editor. An identifier may be added to the contents by using the "+" functionality at the bottom:

.. image:: images/ColumnChart-Contents-1.png
   :align: center

| 

For each identifier added to the Contents tab the following settings can be specified: the indentifier name (as declared in the AIMMS model), the chart type to be applied to this identifier, its display domain, the number of decimals, and the indicator for showing/hidding the units of measurement. 
These values may be literal or given through identifiers present in the AIMMS model, as shown below:

.. image:: images/ColumnChart-Identifier-Settings-1.png
   :align: center  

An AIMMS model identifier may be selected by using the icon on the right side of each option field:

.. image:: images/ColumnChart-Select-Identifier-1.png
   :align: center  

Clicking on this icon opens an option dialog which allows to select the identifier itself as well as to specify some slicing which is to be applied to the identifier indexes:

.. image:: images/ColumnChart-Identifier-Slicing-1.png
   :align: center  

In the "Configuration" section of the option dialog shown above it is possible to slice one index to another index of a subset, to an element parameter, or to a fixed element in the corresponding set.
For instance, we can slice our center index c to the fixed element 'Amsterdam' in the Centers set. Similarly, one could slice the index c to an element parameter CurrentCenter having the declared range the set Centers 
(where the value of CurrentCenter may be determined from within the model or by a choice made through another widget in the user interface). 
Clearly, each slicing specification will result in a different data view in the chart showing only the data points corresponding to those tuples (set element combinations) which are still valid according to current slicing. 
For detailed explanation, please refer to `Widget Options > Indentifier Settings > Slicing <widget-options.html#id6>`__.

<best practices wrt selecting identifiers with different domains, explain what happens with missing indices> @Ovidiu

For each identifier, the chart type to be applied to it can be specified in the "Chart Type" field...

<add section on chart types, for each chart type add a small description and example screenshot>
<update screenshot's, should we wait for the order of the options to change?> @Ovidiu

<please be aware that a lot of examples in this section use the 'column' chart type as an example. However, the info is also valid for other chart types> @Ovidiu

<add comment to say that the combination chart widget can now also be used to create a bar-line chart> @Ovidiu

Moving on, in the "Display Domain" field of the identifier settings, a constant or a model identifier may be specified as well. The column chart will then only display data points for which the display condition is evaluated as true.
In our example, if the indexed (binary) parameter p_IsSomeCenter(c) is specified as the display domain for Demand(c), then the column chart only displays the demand values of the distribution centers c for which the parameter p_IsSomeCenter(c) is
not 0. We can visualize this effect, for instance, by showing the values of p_IsSomeCenter(c) in a selection widget of type "multiselect" next to the column chart which shows Demand(c).

.. note:: Please realize that entering the number ‘1’ as the display domain will result in a dense view of your data.

.. image:: images/ColumnChart-DisplayDomain-1.png
   :align: center
   :scale: 82%

.. image:: images/ColumnChart-DisplayDomain-2.png
   :align: center
   :scale: 81%

|

Next, the number of decimals and the indicator for showing/hidding the units of measurement may be specified in the corresponding fields of the identifier settings, as already shown above. 
Please note that either option needs to be resolved to a scalar value. So, in particular, it is not possible to specify an indexed identifier like p_NumDecimals(c) for the number of decimals. 
This means that you cannot show a different number of decimals for different data values which belong to the same identifier.
These "per identifier" options are then reflected in the chart view provided that the data labels are toggled on (see more info about toggling labels in the `Chart Settings <column-chart-widget.html#column-chart-settings>`__ section below):

.. image:: images/ColumnChart-NumDec-ShowUnits-1.png
   :align: center  

|

Note, that if the number of decimals and/or the indicator for showing/hidding the units of measurement are not specified for a certain indentifier, then the values from the Defaults section will be inherited and applied to that identifier:

.. image:: images/ColumnChart-NumDec-ShowUnits-2.png
   :align: center  

|

More specifically, in the example above the number of decimals is not explicitly set for the identifier Demand(c) and therefore, this option value '2' is automatically inherited from the number of decimals specified in the Defaults section of the Contents tab.
Similarly, the value '1' (or "on") of the the indicator for showing/hidding the units of measurement for the identifier Demand(c) is not specified explicitly in the corresponding identifier field, but it is inherited from the indicator value from the Defaults.
Either option can be specified per identifier or inherited from Defaults independently from the other option. 

Pivoting
--------

In the Pivot tab of the chart options editor, one can specify how the data dimensions are to be organized in the chart. 

For example, if the <IDENTIFIER-SET> index in the X-axis section and the center index c is moved to the Grouped section, then the resulting column chart looks like in the picture below on the left:

.. image:: images/ColumnChart-Pivot-1.png
    :align: center

Similarly, one may move some data indexes in the Stacked section of the Pivot tab. In our example, moving the center index c to the Stacked section results in a column chart view as follows:

.. image:: images/ColumnChart-Pivot-2.png
    :align: center

<add some comments on best practices, for example think twice before adding two identifiers with different units in the same chart> @Koos

<explain that the chart types cannot be used if the identifier index is in the 'header' or 'totals' group (as the identifier cannot uniquely be determined anymore>  @Koos

Column Chart Settings
---------------------

In the Chart Settings tab of the widget options editor there are several groups of options which may be specified: 

.. image:: images/ColumnChart-ChartSettings-0.png
    :align: center

Next, we discuss each of these option groups in turn.

X-Axis
++++++

In the X-Axis group it is possible to specify the Label for the X-axis and the so-called "Maximum Number of Categories in the Viewport":

.. image:: images/ColumnChart-XAxis-Options-1.png
    :align: center

In order to illustrate the effect of these settings, assume for the time being that the Pivoting is adjusted as follows: 

.. image:: images/ColumnChart-XAxis-Pivot-0.png
    :align: center

The Label value add the corresponding text as label of the X-axis. 
The value of the "Maximum Number of Categories in the Viewport" specifies the maximum number of data tuples from the X-axis in the Pivot tab which are shown at a time in the chart.
If there are more data points than this maximum number in viewport, then a horizontal scroll bar appears along the X-axis such that the user can scroll through all points.
These are illustrated in the following picture:

.. image:: images/ColumnChart-XAxis-1.png
    :align: center

| 

Y-Axis
++++++

In the Y-Axis group it is possible to specify the Label for the Y-axis, a minimum and a maximum bound for the Y-axis, and a step size which determines the distance between the horizontal grid lines drawn in the chart 
(these all may be constant literals or given by model identifiers):

.. image:: images/ColumnChart-YAxis-1.png
    :align: center

Note that the situation shown here corresponds again to the first instance of pivoting the indexes as discussed in the Pivoting section above.

Legend
++++++

In the Legend group it is possible to specify an indicator whether to show or to hide the legend provided by the chart:

.. image:: images/ColumnChart-Legend-Option-1.png
    :align: center

When the Legend is turned on, then it is displayed at the bottom of the chart, as illustrated below:

.. image:: images/ColumnChart-Legend-1.png
    :align: center

When the Legend option is not specified by a model identifier, but by the literal (binary) indicator, then the option of toggling the Legend on/off is also available through a dedicated icon on the widget header:

.. image:: images/ColumnChart-Legend-2.png
    :align: center

Labels
++++++

In the Labels group it is possible to specify an indicator whether to show or to hide the text labels of the columns in the chart:

.. image:: images/ColumnChart-Labels-1.png
    :align: center

<are labels only valid for the 'column' chart-type?>  @Ovidiu

Others
++++++

In the Others group it is possible to specify the Chart Title which will be shown on the top of the chart:

.. image:: images/ColumnChart-ChartTitle-1.png
    :align: center

|  

add Color Index

<explain color index> @Koos

add Transparency Index

<explain transparency index> @Koos

<we might need to extend the example here (to have more indices here): I propose to extend the demand date with a period index> - another chart with unitcost or transport @Koos

<add some best practices (on color palette) when using both the color and transparency index> @Koos


Index Settings, Select, and Store Focus
---------------------------------------

In the Index Settings tab of the widget options editor, for each index it is possible to specify an element parameter in the same set which will store the corresponding value when the user selects a specific column in the chart (by clicking on it, in which case the color of the column turns grey). 
For example, we can specify en element parameter ep_Center for the index c and en element parameter ep_Focusidentifier for the <IDENTIFIER-SET> index, where ep_Center and ep_Focusidentifier are element parameters 
in our application at hand with the sets Centers and AllIdentifiers, respectively, as ranges. The values of ep_Center and ep_Focusidentifier may be displayed for inspection in some other widgets outside the column chart:

.. image:: images/ColumnChart-IndexSettings-1.png
    :align: center

|  

Select, Hover, and Tooltips
---------------------------

When the user selects a specific column, the corresponding center value is stored in the element parameter ep_Center as shown above. When the user hovers with the mouse cursor over a column (for example, before selecting it), then that column is highlighted, 
while the other columns are faded away. In this case, also a tooltip is shown, either a default tooltip or a custom tooltip specified using a webui::TooltipIdentifier annotation, see the section `Identifier Annotations <widget-options.html#identifier-annotations>`__.
The picture below depicts this situation:

.. image:: images/ColumnChart-Hover-Tooltip-1.png
    :align: center

|  

When a column has been selected, the user may still hover over another column and inspect the tooltip information, in the same way as the hovering works when no column has been selected 
(remark: a selected column may be unselected by clicking again on it):

.. image:: images/ColumnChart-Hover-Tooltip-2.png
    :align: center

|  

Custom Styling
--------------

By specifying a webui::AnnotationsIdentifier as explain in the section `Identifier Annotations <widget-options.html#identifier-annotations>`__ and by using it subsequently for custom styling as explained in the section `Custom Styling <css-styling.html#css-styling>`__, 
it is possible to apply a custom styling to a column chart as well.
For instance, in our example application at hand one could style differently those columns in the chart which have a demand value greater than a certain threshhold value given by a scalar parameter called p_Demand_HighValue. 
This situation is depicted in the following picture:

.. image:: images/ColumnChart-CustomStyling-1.png
    :align: center

|  

<Add some example on using custom CSS to specify an custom color palette> @Koos

Widget Extensions
-----------------

In the Widget Extensions tab of the widget options editor, it is possible to add the string parameters configured for the `Widget Actions <widget-options.html#widget-actions>`_ and the `Item Actions <widget-options.html#item-actions>`_ for the widget.
When these parameters are configured, then the widget actions may be accessed using the corresponding icon on the widget header or the item actions (for a selected column) may be called using the right-mouse click:

.. image:: images/ColumnChart-Actions-1.png
    :align: center

|  

Miscellaneous
----------------

In the Miscellaneous tab of the column chart options editor, other options may be set such as the title of the widget and the indicator whether or not the widget is visible on the page (besides literals, both may be specified through model identifiers as well):

.. image:: images/ColumnChart-Miscellaneous-Options-1.png
    :align: center

|  

The specified chart title is reflected on the widget header:

.. image:: images/ColumnChart-Miscellaneous-1.png
    :align: center

|  



