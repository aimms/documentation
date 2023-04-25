Legend Widget
=============

The Legend widget has two functions in the WebUI. Its main function is to show a legend for another widget which does not offer a legend by itself. Next to that, it can be used to select a value from a set.

As a Legend
+++++++++++

The best way to illustrate the Legend's widget main functionality, is by example. So, consider a model which displays the length of a few persons in a Bar chart (using the 'PersonLength(p)' parameter), which is pivoted in such a way that it does not show a legend, like this:

  .. image:: images/length-barchart.jpg
      :align: center

In such a situation you can create a Legend widget and configure it to have the same one-dimensional 'PersonLength(p)' parameter as its contents:

  .. image:: images/length-barchart-config.jpg
      :align: center

This will result in the following widget combination:

  .. image:: images/length-barchart-with-legend.jpg
      :align: center

Because the same one-dimensional parameter that is used in the Barchart is also used in the Legend widget, the colors that are used in both widgets will be the same for each element making up the index of this parameter. In other words, the brown bar in the Bar chart can be interpreted using the Legend widget, where we can read that this bar represents the length of the person called 'Corneel'.

The legend is not restricted to one-dimensional parameters though. You can also use it as a legend for a specific dimension of a multi-dimensional parameter. For example, when displaying a Bar chart showing the length of some persons at specific ages (using a two-dimensional PersonLength(p, a) parameter), you can provide a one-dimensional parameter with the same index as one of the indices of this two-dimensional parameter (in this case, 'PersonLength(p)' again), to achieve the following:

  .. image:: images/historic-length-barchart-with-legend.jpg
      :align: center


As a Selection Widget
+++++++++++++++++++++

As mentioned above, the Legend widget can also be used as a selection widget. To do that, you can either provide a scalar element parameter as the contents of it, or use a one-dimensional binary parameter. In both cases, the legend will display the same (if the range of the scalar element parameter is the same as the set belonging to the index of the one-dimensional parameter). So, the following two configurations:


  .. image:: images/legend-selection.jpg
      :align: center

Will display this Legend widget:

  .. image:: images/legend-select-a-person.jpg
      :align: center

You can select exactly one value with the widget. In case of the configuration on the left, ItemSelected for the selected person will get the value 1, in case of the configuration on the right, the element parameter SelectedPerson will be the selected person.