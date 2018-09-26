Bar Chart Widget
----------------

.. |barchart-contents| image:: images/BarChart-Contents.png

.. |barchart-pivot1| image:: images/BarChart-Pivot1.png

.. |barchart-layout1| image:: images/BarChart-Layout1.png

The Bar Chart widget represents data as vertical bars. More specifically, it offers the possibility to display multi-dimensional data in your model by using an X/Y-plane to display a bar 
for each data point. The height of a bar provides information about the value of the correspoding data point. 
For example, in the TransNet application (see the "Quick Start: My First WebUI" section), the unit transport costs for every combination (factory,center) may be represented using a bar chart 
like illustrated in the sequel.


Contents and Pivoting
+++++++++++++++++++++

In order to determine the information to be rendered by a bar chart, first one has to specify the data identifier(s) in the Contents tab of the widget's options editor:

.. image:: images/BarChart-Contents.png
    :align: center
	
Next, in the Pivot tab of the options editor, one can specify how the data dimensions are to be organized in the chart. 
For example, if both the factory index f and the center index c are specified in the X-axis section and the <IDENTIFIER-SET> in the Totals section then the resulting bar chart looks like 
in below picture on the right:

.. image:: images/BarChart-View1.png
    :align: center

One may move some data indexes in the Grouped section of the Pivot tab. In our example, moving the center index c to the Grouped section results in the following bar chart view:

.. image:: images/BarChart-View2.png
    :align: center

Similarly, one may move some data indexes in the Stacked section of the Pivot tab. In our example, moving the center index c to the Stacked section results in a bar chart view like below:

.. image:: images/BarChart-View3.png
    :align: center
	
Change Type
+++++++++++

In the Change Type tab of the widget's options editor, one can switch from the barchart to some other type. 
In the exmple at hand, one can switch eg. from the barchart to the table, resulting in the tabular view of the data values:

.. image:: images/BarChart-ViewTable.png
    :align: center

	
	
	
exactly 3 AIMMS parameters on the Bubblechart tab of the widget's option editor (the one with the lonely bubble in it). 
The top one ('X') should contain the X-coordinates, the second one ('Y') the Y-coordinates and the third one ('Size') the bubble sizes. 
All 3 parameters should have the same index domain. For a bubble chart displaying information about the planets in our solar system, the following identifiers could be used in your model:

* A set called :token:`Planets` with index :token:`p`;
* A parameter called :token:`DistanceToSun(p)`;
* A parameter called :token:`Y(p)`; and
* A parameter called :token:`Diameter(p)`.

In this particular case, the Y-coordinate doesn't mean anything. In such cases, just set it to a constant value. In your bubble chart you would have to specify the 3 parameters in the order given above. Using real 'world' data could result in the following bubble chart.

.. image:: images/planetchart.jpg
    :align: center

Overriding tooltips
+++++++++++++++++++

As described `here <widget-manager.html#adding-tooltips>`_, you can also override the default tooltips for a bubble chart. However, you will need to add a string parameter based on the name of the identfier that represents the _size_ of the bubble. So, if, for example, the parameter :token:`Diameter` represents the bubble sizes, you should add a string parameter called :token:`Diameter_Tooltips` with the same index domain as :token:`Diameter` in order to override the default tooltip (in this case, index :token:`p`). In the chart above, you can see the result of using the following definition for the :token:`Diameter_Tooltips(p)` identifier:

.. code::

    FormatString("The diameter of %e is %n km.", p, Diameter(p));
    
Coloring
++++++++

The coloring of the individual bubbles in a bubble chart is determined by the last index that you have specified on the Groups tab of the options editor. For example, if you have a bubble chart with bubbles based on identifiers with a 3-dimensional index, let's say years, countries and seasons, and pivot the chart such that the years index is the last one, all bubbles with the same year will be colored equally.

Specific options
++++++++++++++++

The bubble chart has some specific options that you can specify. These are located on the Miscellaneous tab of the widget's options editor:

* X-axis label: here you can specify a literal string or a model identifier to use as a legend which will be displayed along the X-axis.
* Y-axis label: the same, only this time for the Y-axis.
* Size label: here you can specify a literal string or a model identifier to describe what piece of information is used as the bubble size. It is displayed in the top-right corner of your bubble chart.

Additional Remarks
++++++++++++++++++

A number of things are important to know when creating or interpreting the Bubble Chart widget:

#. The axis scaling may include standard abbreviations of quantities, such as :token:`k` for thousands, or :token:`M` for millions.
#. If there are bubbles with a *negative* size, they are rendered as empty circles, as opposed to the filled positive values.
#. Bubbles with a size of 0 are not rendered.
#. The *area* of the bubbles depict their relative sizes, not their *diameter*. Please note that the scale of the bubble areas is unrelated to the scale on the X- and/or Y-axis. Only their relative sizes are important.
#. You can specify reverse links on the 'Store focus' tab of the widget's option editor. When you select a bubble in the chart, the element parameters that you specify here will be filled accordingly, opening up all kinds of interactive opportunities.