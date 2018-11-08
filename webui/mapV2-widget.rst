Map-V2 Widget
-------------

The Map widget allows to display a map in the background and show a network with nodes and arcs on the top of it.
A simple situation is for example when a transport identifier indexed over factories f and centers c in the TransNet application 
(see the "Quick Start: My First WebUI" section) is displayed like in the following picture:

.. image:: images/MapV2-1simpleEx.png
    :align: center

The map displayed in the backgroud is provided by OpenStreetMap organization, see the `openstreetmap.org web site <https://www.openstreetmap.org>`_. 

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

After clicking on the "+" sign at the bottom, one can add options for the first node set:

.. image:: images/MapV2-Nodes0-Options.png
    :align: center

The available options to be specified are:
	
*	Index – Select the index of the node set you would like to display
*	Latitude – A 1-dimensional parameter specifying the latitude coordinates for the nodes set with the selected index
*	Longitude – A 1-dimensional parameter specifying the longitude coordinates for the node set with the selected index
*	Size – A 1-dimensional parameter specifying the dynamic sizes for the node set with the selected index

.. note::
    Please note that the Latitude and Longitude must be specified by two separate identifiers declared in the model.
	
    The values of the Latitude and Longitude parameters must be within the geographical bounds, ie between (-90,90) and (-180,180), respectively. One can specify these intervals in the Range attributes of the correspoding identifiers in the model.	
	
    The default node size radius is 3 px. You can set dynamic node size to each node set. Just select the identifier for the Size parameter in the desired node set. Please ensure that the index domain of such a parameter is the same as the index of the node set.

Adding identifiers to the option fields
+++++++++++++++++++++++++++++++++++++++

When clicking on the identifier selector of the Index (as shown above), a pop-up dialog is shown where the index of the node set may be selected:

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

M
  







	
The Map widget allows you to display a map with arcs and/or (dynamically sized) nodes on top of it if you want. 
In the WebUI you need an identifier indexed over two indices: the index related to the locations and one extra index. 
The set belonging to that second index should contain 2 elements. The first element will be related to the longitude 
and the second element to the latitude. 

.. note::
    Please note that the naming of the indexes of the LonLat set is exactly as you should name them too.
    
See also screen capture below and supportive snippet of AIMMS Model Code. 

.. image:: images/mapwidget.png
    :align: center

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

Dynamic Node Sizing
+++++++++++++++++++

It is possible to specify the size of the nodes that are displayed in your Map widget. You can do so by specifying a one-dimensional parameter in the Contents options editor, indexed over the locations. You can use any size you want; the Map widget will automatically scale the sizes provided relatively to each other. There are two special cases:

#. A node size can be 0;
#. A node size can be <0.

It is up to the app developer to use `(blank) annotations <#data-dependent-styling>`_ on the node set in order to treat these special cases differently (or not, whatever he chooses).