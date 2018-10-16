Line Chart Widget
-----------------

The Line Chart widget is a X-Y plot and represents data as a graph with lines and dots. A typical situation is when a 1-dimensional identifier such as the Demand(c) of a distribution center c in the TransNet application 
(see the "Quick Start: My First WebUI" section) is displayed like in the following picture:

.. image:: images/LineChart-1dimEx.png
    :align: center

More generally, a line chart widget offers the possibility to display multi-dimensional data in your model by displaying a dot for each data point in the X/Y-plane. 
The Y-coordinate of a dot provides information about the value of the correspoding data point. The dots may be linked by lines in between rendering the graph. 
For example, in the TransNet application, the unit transport costs for every combination (factory, center) may be represented using a line chart widget
like illustrated in more details in the sequel. More specifically, we discuss and illustrate below one-by-one the tabs in the line chart's options editor 
which may be accessed through the Settings wheel as shown in the picture above.

Contents and Pivoting
+++++++++++++++++++++

In order to determine the information to be rendered by a line chart, first one has to specify the data identifier(s) in the Contents tab of the widget's options editor, where one may search 
for the available model data using the correspoding functionality at the bottom:

.. image:: images/LineChart-Contents.png
    :align: center
	
Next, in the Pivot tab of the options editor, one can specify how the data dimensions are to be organized in the chart. 
For example, if both the factory index f and the center index c are specified in the X-axis section and the <IDENTIFIER-SET> in the Totals section then the resulting bar chart looks like 
in the picture below on the right:

.. image:: images/LineChart-View1.png
    :align: center

One may move some data indexes in the Overlays section of the Pivot tab. In our example, moving the factory index f to the Overlays section results in the following line chart view:

.. image:: images/LineChart-View2.png
    :align: center

So, now for every factory f there is a line in the chart with a different color. The three lines are drawn independent of each other.

If one moves the center index f to the Overlays section and the factory index f back to the X-axis, then the line chart view shows a line for every center:

.. image:: images/LineChart-View22.png
    :align: center
	
Similarly, one may move some data indexes in the Stacked section of the Pivot tab. In our example, moving the center index f to the Stacked section results in a line chart view like below:

.. image:: images/LineChart-View3.png
    :align: center

Again, for every factory f there is a line in the chart with a different color, but the three lines are now drawn on the top of each other.
	
Change Type
+++++++++++

In the Change Type tab of the widget's options editor, one can switch from the line chart type to some other representation type. 
In the example at hand, one can switch eg. from the line chart to the table, resulting in the tabular view of the same data values:

.. image:: images/LineChart-ViewChangeType.png
    :align: center

Linechart Settings
++++++++++++++++++

In the Linechart Settings tab of the widget's options editor, a minimum and a maximum bound for the Y-axis may be specified, either as constants or as scalar identifiers from the model.
Additionally, one may also specify a step size which determines the distance between the horizontal grid lines drawn in the chart:

.. image:: images/LineChart-ViewSettings.png
    :align: center	
	
Filters
+++++++

In the Filters tab of the widget's options editor, some of the other widgets on the same page may be chosen for filtering the data points shown in the line chart. 
In our example, suppose we change the pivoting back to the initial situation where both the factory index f and the center index c are specified in the X-axis section 
and the <IDENTIFIER-SET> in the Totals section. In this case, chosing TransportData widget as a filter results in a confined line chart view as only those data points 
are shown for which the TransportData widget shows non-default values: 

.. image:: images/LineChart-ViewFilters.png
    :align: center	

Not accidentally, these filtered values are among the lowest unit transport costs which are preferred when minimizing the overall costs for the entire network.

Totals
++++++

In the Totals tab of the widget's options editor, aggregated values such as sum, mean, count, min, or max computed over one of the data indexes my be added to the chart. 
In our example, suppose we change the pivoting to the situation where the factory index f is in Overlays section, the center index c is in the X-axis section 
and the <IDENTIFIER-SET> in the Totals section. In this case, if we add the mean over the centers c to our example line chart, then three additional dots representing 
the aggregated values become visible in the chart: 

.. image:: images/LineChart-ViewTotals.png
    :align: center	

Totals2
+++++++

In the Totals tab of the widget's options editor, aggregated values such as sum, mean, count, min, or max computed over one of the data indexes my be added to the chart. 
In our example, suppose we change the pivoting to the situation where the factory index f is in Overlays section, the center index c is in the X-axis section 
and the <IDENTIFIER-SET> in the Totals section. In this case, if we add the mean over the centers c to our example line chart, then three additional dots representing 
the aggregated values become visible in the chart:

.. image:: images/LineChart-ViewTotals2.png
    :align: center	
	
Identifier Settings
+++++++++++++++++++

In the Identifier Settings tab of the widget's options editor, one can apply a display domain or some slicing to the data identifier(s).

The "Set display domain" section works in the same way as for eg. the bar chart.

In the "Set slicing per index" section it is possible to slice one index to another index of a subset, to an element parameter or to a fixed element in the corresponding set.
For instance, we can slice our factory index f to the fixed element 'Hamburg' in the Factories set, resulting in the line chart view as shown here: 

.. image:: images/LineChart-ViewSlice.png
    :align: center 

Similarly, one could slice the index f to an element parameter CurrentFactory having the declared range the set Factories (where the value of CurrentFactory may be determined from within the model
or by a choice made through another widget in the user interface). 

Store Focus, Hover and Select
+++++++++++++++++++++++++++++

In the Store Focus tab of the widget's options editor, for each index it is possible to specify an element parameter in the same set which will store the corresponding value when the user sets the
focus on a specific dot in the chart. For example, we can specify SelectedFactory for the index f and SelectedCenter for the index c, where SelectedFactory and SelectedCenter are element paramneters 
in our application at hand with ranges Factories and Centers, respectively. The values of SelectedFactory and SelectedCenter may be displayed for inspection in some other widgets outside the line chart.
When the user sets the focus on a specific dot, the corresponding factory and center values are stored in SelectedFactory and SelectedCenter, respectively. In this case, the selected dot is highlighted
by a visible (gray) contour, while the rest of the dots and lines are somewhat faded away. The picture below depicts this situation:

.. image:: images/LineChart-ViewStoreFocus.png
    :align: center

When a dot has been selected, the user may still hover over another dot and inspect the tooltip information, in the same way as the hovering works when no dot has been selected 
(remark: a selected dot may be unselected by clicking again on it):

.. image:: images/LineChart-ViewHover.png
    :align: center

It is also possible to select a line by clicking on it, in which case the selected line is highlighted by a visible (gray) color, while the rest of the dots and lines are somewhat faded away: 

.. image:: images/LineChart-SelectLine.png
    :align: center

However, in this case the store focus cannot be applied, because such a selection does not determine a unique pair of values for the element parameters (SelectedFactory, SelectedCenter).
Again, as a remark: a selected line may be unselected by clicking again on it.

.. note::

    In the Line Chart widget the Hover and Select visual functionalities are available. However, when selecting a line, the line itself does not set any store focus elements as this cannot be uniquely determined. Only the nodes selections can set such store focus identifiers.

Miscellaneous
+++++++++++++

In the Miscellaneous tab of the line chart's options editor, other options may be set such as the title of the widget, whether or not the widget is visible (this may be determined by a model parameter)
or the number of decimals for the values displayed in the chart.
