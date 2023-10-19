Selection Widgets
=================

Selection widgets allow the user to select one element in a set or a subset of elements in a set by using an element parameter or an 1-dimensional binary indicator parameter,
respectively. The available types of selection widgets are selectionbox, multiselect, and legend (see further below).

Selection Widgets with Element Parameter
------------------------------------------------------------

It is possible to specify an element parameter as data identifier in the Contents tab of the widget's options editor, where one may search 
for the available model data using the corresponding functionality at the bottom:

.. image:: images/Selection-ContentsEP.png
    :align: center

In our example (see the "Quick Start: My First WebUI" section), CurrentCenter is declared as an element parameter with the range the set Centers. 
The value of this element parameter may be viewed using a selectionbox, a multiselect, or a legend type, according to the choice made in the Change Type tab 

.. image:: images/Selection-ViewEP.png
    :align: center

Selection Widgets with an 1-dimensional Binary Parameter
------------------------------------------------------------------------------------

It is also possible to specify a 1-dimensional binary parameter as data identifier in the Contents tab of the widget's options editor, where one may search 
for the available model data using the corresponding functionality at the bottom:

.. image:: images/Selection-ContentsBP.png
    :align: center

In our example, the binary parameter IsInSubsetCenters(c) is declared with the index domain the set Centers. In this case, it is appropriate to use a multiselect
type of widget which allows to select several elements from the underlying set:

.. image:: images/Selection-MultiSelect.png
    :align: center

Note that, in this case it is still possible to switch to other representation type, e.g.. to selectionbox, but then the selection is restricted to just one element
from the underlying set. 

.. note::

    In the AIMMS `4.97.1 <https://manual.aimms.com/release-notes.html#aimms-4-97>`_ release, we enhanced the functionality of the Select and Deselect links in the MultiSelect widget. With this improvement, when you apply a filter to the widget, the "Select" and "Deselect" links will now accurately select or deselect all the filtered entries. Furthermore, for added clarity, we've included a count of available entries next to the "Select" and "Deselect" links.


Identifier Settings
--------------------------

In the Identifier Settings tab of the widget's options editor, one can apply a display domain in the "Set display domain" section, which works in the same way as for other widgets.

In the case of a selection widget with an 1-dimensional binary parameter, in the "Set slicing per index" section it is possible to slice the underlying index to another index of a subset.
For instance, we can slice our center index c to the index pref_c of a subset PreferredCenters of the root set Centers. Assuming that the subset PreferredCenters set has the elements 
{Amsterdam, Copenhagen, Edinburgh, Frankfurt, Paris, Vienna}, this results in a possible multiselection view for IsInSubsetCenters(c) as shown here: 

.. image:: images/Selection-ViewIdentSettings.png
    :align: center

So, in such a case the multiselect widget may modify only those values of IsInSubsetCenters which correspond to some center which belongs to the PreferredCenters (sub)set.
	
Miscellaneous options
---------------------------

In the Miscellaneous tab of the widget's options editor, other options may be set such as the title of the widget and whether or not the widget is visible (this may be determined by a constant 
or by a parameter from the model).

Warnings and trouble shooting
--------------------------------

.. warning::
    
    The current implementation of all Selection widgets (``selectionbox``, ``multiselect``, and ``legend``) fetches the entire input set from AIMMS, and then applies the filtering in the browser. 

    Please keep in mind that if you have a very large set, slow computer or high latency & low bandwidth network, the selection widget might end up in an "Empty" state, because the browser hits the time limit while fetching the data. For example, a ``selectionbox`` will look as shown below.
    
    .. image:: images/EmptySelectionbox.png
    
    If you are in this situation:
    
    * Please try to work with several subsets, or try to use another widget. 
    * The `table widget <table-widget.html>`_ for example is our most advanced widget. It can be used to make a selection, together with a custom scalar string search updating the table widget's `display domain <widget-options.html#id7>`_.
    
.. note::

    In the `4.70.2 release of AIMMS <https://documentation.aimms.com/release-notes.html#aimms-4-70-2-release-december-19-2019>`_, we increased the timeout from 15s to 25s. https://www.aimms.com/english/developers/downloads/download-aimms/release-notes
