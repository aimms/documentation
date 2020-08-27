Custom Layouts
==============

Different types of Custom Layout
--------------------------------

The general framework for creating `custom layouts <webui-grid-pages.rst>`_ is explained in the WebUI Grid Pages section. The current section illustrates more specifically how to use pixels (px) or percentages (%) to set a fixed width or height to columns or rows in your layouts.

This is useful when you either require a vertical scrollbar or in some cases a horizontal scrollbar, or if you do not want to use the full height or width of your viewport.

To control the height of your application either to a fixed height or to introduce a vertical scrollbar you need to customize the values in `gridTemplateRows` i.e. for the rows. 

To control the width of your application either to a fixed width or to introduce a horizontal scrollbar you need to customize the values in `gridTemplateColumns` i.e. for the columns. 

Using pixels (px)
-----------------

In order to use pixels, you might want to first determine the height (in pixels) of the browser viewport. 

.. image:: images/viewport.png
    :align: center
    :scale: 75

When you use the Workflow Panel and the Side Panels, your viewport size is slightly smaller as illustrated in the image below:

.. image:: images/viewportWorkflowSidePanel.png
    :align: center
    :scale: 75

Once you know the height of the viewport, if you want to fix the height of your application to half of your viewport's size, for example, just divide the values such that the sum of the values defining the height of the rows is half of the height of the viewport.

To illustrate the above example, let's consider that the height of the browser viewport is 1000px. In this case, the specification of the `gridTemplateRows` could be, for instance, as follows: 

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "100px 100px 300px",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

As long as the sum of the values used to divide the rows does not exceed the browser viewport, no scrollbar will appear. To introduce a vertical scrollbar the sum needs to exceed the browser viewport height.

So, assuming again that the viewport height is 1000px, if you want to introduce a vertical scrollbar you can use a code snippet such as the following:

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "300px 400px 500px",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

Now let's consider the situation where the width of the browser viewport is 1000px.

Similarly as above, for fixing the width such that the layout is half of the browser viewport, just divide the values such that the sum of the values used to divide the columns is half of the viewport's width:  

.. code::

	"props": {
		"gridTemplateColumns": "100px 200px 200px",
		"gridTemplateRows": "1fr 1fr 1fr",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

If you want to introduce a horizontal scrollbar you can use a code snippet like the one below, where the sum exceeds the browser viewport width:

.. code::

	"props": {
		"gridTemplateColumns": "300px 500px 500px",
		"gridTemplateRows": "1fr 1fr 1fr",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},


Using percentages (%)
---------------------

Similar to the case of pixels, in order to avoid a scrollbar when using percentages the sum of the values should not exceed 100%, and if you want a scrollbar then the sum must exceed 100%.

To illustrate an example where you want to avoid scrollbar or want the application to be half the size of the browser viewport, you can use a snippet such as below:

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "10% 20% 20%",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

If you want to introduce a vertical scrollbar you can use, for instance, this snippet below:

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "10% 40% 80%",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

Similarly, if you want to control the width of the application, to avoid a horizontal scrollbar or use only half the width of the viewport you can use the below snippet.

.. code::

	"props": {
		"gridTemplateColumns": "10% 20% 20%",
		"gridTemplateRows": "1fr 1fr 1fr",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

If you want to introduce a horizontal scrollbar you can use a snippet such as the following: 

.. code::

	"props": {
		"gridTemplateColumns": "10% 40% 80%",
		"gridTemplateRows": "1fr 1fr 1fr",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

However, there is one fundamental difference between using pixels and percentages: pixels are fixed width/height regardless of the browser viewport size, whereas percentages adjust according to the browser viewport size since it adapts to the percentage of the size of the browser viewport.


Using combinations of fr, px, and %
-----------------------------------

You can also use a combination of fractions and pixels and percentages. This is typically useful when you might want to fix the size of a particular row or column but not restrict the rest of the layout.

The snippet below illustrates the use of fractions (fr) and pixels (px), where the first and second columns have a fixed width of 200px each, and the first row has a fixed height of 100px. This will result in the `Title` and `Extra` areas having a fixed height of 100px and the `Map` area with a width of 400px. 

.. code::

	"props": {
		"gridTemplateColumns": "200px 200px 1fr 1fr",
		"gridTemplateRows": "100px 2fr 1fr",
		"gridTemplateAreas": " \"Title Title Title Extra\" \"Data Data Data Data\" \"Map Map Output Optimize\" "
	},


.. note::
	Fractions (fr) and percentages (%) are ideally the same since they are a measure of proportion.


Syntax and Semantics
--------------------

It is important to understand some of the syntax and semantics of the JSON used to create custom layouts.

#. Please ensure the structure is intact. It should follow the structure below:

		.. code::
				
				{
					"componentName": "Grid",
					"props": {
						"gridTemplateColumns": "NUMBER OF COLUMNS AND PROPORTIONS",
						"gridTemplateRows": "NUMBER OF ROWS AND PROPORTIONS",
						"gridTemplateAreas": "AREA-NAMES WITH DIVISIONS/LAYOUT"
					},
					"items": [
						{
							"componentName": "WidgetArea",
							"props": {
								"gridArea": "AREA-NAME",
								"name": "DISPLAY OF AREA-NAME IN THE LAYOUT",
								"gridAutoFlow": "ORIENTATION OF WIDGETS"
							}
						}
					]
				}

	Examples of what can be changed:

		* NUMBER OF COLUMNS AND PROPORTIONS: "1fr 1fr" : Two columns with equal proportions.
		* NUMBER OF ROWS AND PROPORTIONS: "1fr 1fr" : Two rows with equal proportions.
		* AREA-NAMES WITH DIVISIONS/LAYOUT: " \"Area-A Area-A\" \"Area-B Area-C\" " : The first row and both columns are assigned to the same area i.e. "Area-A". The second row has two areas one for each column i.e. "Area-B", and "Area-C".
		* DISPLAY OF AREA-NAME IN THE LAYOUT: Area-A, Area-B and Area-C : This property is case sensitive. Use the exact names used in AREA-NAMES WITH DIVISIONS/LAYOUT here as well. Also, each area needs to be defined separately.
		* ORIENTATION OF WIDGETS: "row" or "column" : Use row if you want the widgets to appear one on top of the other and column if you want widgets to appear side by side. This property is case sensitive as well.

#. In the ``props`` section, only change the values for ``gridTemplateColumns``, ``gridTemplateRows``, and ``gridTemplateAreas``, as explained above.

#. While defining "``gridTemplateColumns`` and ``gridTemplateRows`` no spaces should be given between the numeric and measure of proportionality. eg: 1fr, 50px, 20%.

	.. image:: images/PageV2_RightWrongDivisions.png
    		:align: center

#. To understand the ``gridTemplateAreas`` refer to the illustration below:

	.. image:: images/PageV2_TemplateAreasExplanation.png
    		:align: center

	The above illustration results in the below layout.

	.. image:: images/PageV2_TemplateAreasPreview.png
    		:align: center


Troubleshooting
---------------

If you are not able to get your desired output you might want to check a few things. 

* Check if you have defined all the areas that you used in "gridTemplateAreas".
* Check if your division matches the rows and columns and if the grouping is correct.
* Check if the values in "gridArea" used to define each area has the correct case sensitive names.
* Check if there are no spaces in "gridTemplateColumns": "1fr", and "gridTemplateRows": "1fr 1fr", between the numeric and measure of proportion.
* Check for errors in the JSON using a JSON Parser. You can use one of the links here. `Link 1 <http://json.parser.online.fr/>`_ or `Link 2 <https://jsonparseronline.com/>`_.