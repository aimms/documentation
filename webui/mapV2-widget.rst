Map-V2 Widget
-------------

The Map widget allows to display a map in the background and show a network with nodes and arcs on the top of it.
A simple situation is for example when a transport identifier indexed over factories f and centers c in the TransNet application 
(see the "Quick Start: My First WebUI" section) is displayed like in the following picture:

.. image:: images/MapV2-1simpleEx.png
    :align: center

The map displayed in the backgroud is provided by the OpenStreetMap organization, see the `openstreetmap.org web site <https://www.openstreetmap.org>`_. 

The network with nodes and arcs on the top of the map must be defined in terms of identifiers declared in the AIMMS model.

In the sequel we illustrate how to create, configure, and use such a map widget in the AIMMS WebUI.

Creating a map widget
+++++++++++++++++++++
	
A map widget can be added to a page using the same steps as for any other widget, see `adding a new widget <widget-manager.html>`_. 
After adding the map widget in the Widget Manager one can click on its Settings wheel in order to configure the widget.

.. image:: images/MapV2-StartLayout.png
    :align: center

In the settings options editor one can find the following sections:

*	Node Sets: Multiple node sets can be added here.
*	Arc Sets: Multiple arc sets can be added here.
*	Miscellaneous: Title, Zoom, Center Latitude, Center Longitude and Visibility can be controlled here.
*	Advanced: Advanced options for this widget are available here.

.. image:: images/MapV2-StartAllOptions.png
    :align: center

Adding node sets
++++++++++++++++

After selecting the "Node Sets" section and clicking on the "+" sign at the bottom, one can add options for the first node set:

.. image:: images/MapV2-Nodes0-Options.png
    :align: center

The available options to be specified are the following:
	
*	Index: Select the index of the node set to be displayed
*	Latitude: An 1-dimensional parameter specifying the latitude coordinates for the nodes set with the selected index
*	Longitude: An 1-dimensional parameter specifying the longitude coordinates for the node set with the selected index
*	Size: An 1-dimensional parameter specifying the dynamic sizes for the node set with the selected index

.. note::
    The Latitude and Longitude must be specified by two separate identifiers declared in the model.
	
    The values of the Latitude and Longitude parameters must be within the geographical bounds, ie between (-90,90) and (-180,180), respectively. One can specify these intervals in the Range attributes of the correspoding identifiers in the model.	
	
    The default node size radius is 3 px. One can set a dynamic node size to each node set by selecting an appropriate identifier for the Size parameter in the desired node set (the index domain of such a parameter must be the same as the index of the node set).

Adding identifiers to node option fields
++++++++++++++++++++++++++++++++++++++++

When clicking on the identifier selector of the Index field (as shown above), a pop-up dialog is shown where the index of the node set may be selected:

.. image:: images/MapV2-Nodes0-Index.png
    :align: center

Next, when clicking on the identifier selector of the Latitude, a 1-dimensional parameter indexed over the selected index may be selected in the corresponding pop-up dialog:

.. image:: images/MapV2-Nodes0-Latitude.png
    :align: center

Similarly, one can follow the steps for the Longitude and the Size fields. Once all fields have been assigned, the nodes will be drawn on the map:

.. image:: images/MapV2-Nodes0-Layout.png
    :align: center

Maps with multiple node sets
++++++++++++++++++++++++++++

As mentioned above, multiple node sets may be added to the map widget. For instance, suppose that in the TransNet application we would like to add the factories f and the centers c
as separate node sets. After having added first the node set f, one can again select the Latitude parameter as discussed above, but in this case one may need to slice the parameter
to only the set f as a subset of the Locations set with index l. This may be achieved using the slicing options in the pop-up dialog as follows:

.. image:: images/MapV2-NodesF-Latitude.png
    :align: center

The same type of slicing may be applied to the Longitude and Size parameters. Moreover, one may repeat all these steps and add the centers c as a second node set with similar options.
These actions result in a map widget with 2 node sets:

.. image:: images/MapV2-NodesFC.png
    :align: center

Store Focus, Hover and Select for nodes
+++++++++++++++++++++++++++++++++++++++

Nodes on the map widget also have the functionality to store focus. This means that one can store the value of a selected node in the network in an element parameter declared in the model.
The store focus functionality opens up various interaction possibilities, because the value of the element parameter may be further used by other widgets or may impact
some parts of the model execution.

While adding the index for the node set, one will notice an option for “Store focus”. 
Here an element parameter may be specified which will store the value of the node selected upon clicking in the network.

.. image:: images/MapV2-StoreFocus-Select.png
    :align: center

Once the element parameter has been specified, one is able to see this reflected in the Index field of the correspoding node set in the options editor. 
For example, we can specify SelectedFactory for the index f and SelectedCenter for the index c, where SelectedFactory and SelectedCenter are element parameters 
in our application at hand with ranges Factories and Centers, respectively.
Furthermore, the values of these element parameters may be also displayed for inspection in other widgets outside the map.
When the user sets the focus on a specific node, the corresponding factory or center value is stored in SelectedFactory or SelectedCenter, respectively. 
In this case, the selection effect is that the selected node is highlighted on the map (ie, it gets a thick outline), while the other nodes are faded away. 
The picture below depicts this situation:

.. image:: images/MapV2-StoreFocus-View.png
    :align: center

Note that, when a node has been selected, the user may still hover over another node and inspect the tooltip information, in the same way as the hovering works when no node has been selected 
(remark: a selected node may be unselected by clicking again on it). The hover effect is that the node which is hovered over has a thin outline.
	
Adding arc sets
+++++++++++++++

After selecting the "Arc Sets" section in the options editor and clicking on the "+" sign at the bottom, one can add options for an arc set:

.. image:: images/MapV2-Arcs0-Options.png
    :align: center

The available options to be specified are the following:

*	Value: Select the 2-dimensional identifier which defines the arc set. The arcs will be drawn and the labels with the values will be displayed for each arc.
*	Hide Labels: Switch this on in order to hide the arc labels.
*	Dynamic Arc Width: This option controls whether the arcs width is fixed or dynamic. Dynamic arc width account for the values that are defined in the “Value” field of the current arc set.
*	Show Straight Lines: Switch this on in order to turn the curved arcs into straight lines.
*   Decimal Points: Specify the number of decimals to be shown for the values of the arc labels.

.. note::
    The arc identifier must be a 2-dimensional identifier like ArcFlow(i,j) where i and j are indexes of some node sets or subsets thereof.
	
    Note that, except for the “Value” field, all other options can be controlled either by constant values or by using scalar parameters declared in the model.

Adding identifiers to arc option fields
+++++++++++++++++++++++++++++++++++++++

Let's look back to our map example above with one set of nodes specified by the Locations index l. 
In this example, let's assume that l_from and l_to are two alias indexes spanning the same Locations set as the index l.
When clicking on the identifier selector of the Value field (as shown above), a pop-up dialog is shown where the arc identifier may be selected:

.. image:: images/MapV2-Arcs0-ValuesId.png
    :align: center

Once the arc identifier has been properly specified, the arcs will be drawn on the map:	

.. image:: images/MapV2-Arc0-View1.png
    :align: center

When "Hide Labels" option is turned on, the map is drawn as follows:

.. image:: images/MapV2-HideLabels-View.png
    :align: center

When "Dynamic Arc Width" option is turned on, the values of the identifier specified in thye "Values" field are accounted for in the width:

.. image:: images/MapV2-DynamicSize-View.png
    :align: center

When "Show Straight Lines" option is turned on, the arcs are drawn like in the following picture:

.. image:: images/MapV2-StraightLine-View.png
    :align: center

W  






.. code::

    Set Locations {
        Index: l;
        Text: "All Stores and Depots together";
        Definition: Stores + Depots;
    }

    Set LonLat {
        Index: iLonLat;
        Text: "The set of Longitude and Latitude to support Web UI";
        Definition: data { 'Lon', 'Lat' };
    }

    Parameter CoordinatesLocations {
        IndexDomain: (l,iLonLat);
        Text: "The coordinates of Location l";
        Definition: if ( iLonLat = 'Lon' ) then XCoordinate(l) else YCoordinate(l) endif;
    }

    Variable Transport {
        IndexDomain: (d,s);
        Text: "Delivery from Depot d to Store s where d and s are Locations l";
        Range: [0, TransportMax];
    }

along with the following data:

.. code::

    CoordinatesLocations:=
    data 
    { ( Seattle         , Lon ) : -122.330,  ( Seattle         , Lat ) :   47.603,  ( Houston         , Lon ) :  -95.370,
      ( Houston         , Lat ) :   29.760,  ( Detroit         , Lon ) :  -83.048,  ( Detroit         , Lat ) :   42.332,
      ( Denver          , Lon ) : -104.992,  ( Denver          , Lat ) :   39.740,  ( Portland        , Lon ) : -122.676,
      ( Portland        , Lat ) :   45.512,  ( 'Las Vegas'     , Lon ) : -115.140,  ( 'Las Vegas'     , Lat ) :   36.172,
      ( 'Los Angeles'   , Lon ) : -118.245,  ( 'Los Angeles'   , Lat ) :   34.053,  ( Dallas          , Lon ) :  -96.796,
      ( Dallas          , Lat ) :   32.778,  ( Chicago         , Lon ) :  -87.632,  ( Chicago         , Lat ) :   41.884,
      ( Cleveland       , Lon ) :  -81.690,  ( Cleveland       , Lat ) :   41.504,  ( 'Carson City'   , Lon ) : -119.767,
      ( 'Carson City'   , Lat ) :   39.165,  ( 'San Antonio'   , Lon ) :  -98.495,  ( 'San Antonio'   , Lat ) :   29.424,
      ( 'Virginia Beach', Lon ) :  -76.059,  ( 'Virginia Beach', Lat ) :   36.755,  ( 'New York'      , Lon ) :  -74.007,
      ( 'New York'      , Lat ) :   40.715,  ( Miami           , Lon ) :  -80.237,  ( Miami           , Lat ) :   25.729,
      ( Boston          , Lon ) :  -71.057,  ( Boston          , Lat ) :   42.359,  ( Helena          , Lon ) : -112.021,
      ( Helena          , Lat ) :   46.590,  ( Boise           , Lon ) : -116.193,  ( Boise           , Lat ) :   43.607,
      ( 'San Jose'      , Lon ) : -121.886,  ( 'San Jose'      , Lat ) :   37.338,  ( 'Salt Lake City', Lon ) : -111.888,
      ( 'Salt Lake City', Lat ) :   40.760,  ( Albuquerque     , Lon ) : -106.649,  ( Albuquerque     , Lat ) :   35.084,
      ( Phoenix         , Lon ) : -112.076,  ( Phoenix         , Lat ) :   33.448,  ( Tucson          , Lon ) : -110.970,
      ( Tucson          , Lat ) :   32.221,  ( 'San Diego'     , Lon ) : -117.162,  ( 'San Diego'     , Lat ) :   32.716,
      ( Lincoln         , Lon ) :  -96.708,  ( Lincoln         , Lat ) :   40.814,  ( 'St Paul'       , Lon ) :  -93.093,
      ( 'St Paul'       , Lat ) :   44.944,  ( Jackson         , Lon ) :  -87.895,  ( Jackson         , Lat ) :   31.508,
      ( Jacksonville    , Lon ) :  -81.656,  ( Jacksonville    , Lat ) :   30.331,  ( Charlotte       , Lon ) :  -80.838,
      ( Charlotte       , Lat ) :   35.222,  ( Frankfort       , Lon ) :  -84.879,  ( Frankfort       , Lat ) :   38.195,
      ( Atlanta         , Lon ) :  -84.391,  ( Atlanta         , Lat ) :   33.748 }

.. important:: After you have set up your coordinates, points and arcs in the options editor of your Map widget, the map doesn't automatically move/scale such that all your points are in the visible area. You may have to scroll and zoom before you actually see your data on the map. After that, your zoom level and your position is automatically saved.
