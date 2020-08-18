Custom Layouts
==============

Different types of Custom Layout
--------------------------------

Creating `custom layouts <webui-grid-pages.rst>`_ is explained in the WebUI Grid Pages section. This topic will illustrate "How To" use pixels (px) or percentages (%) to set a fixed width or height to columns or rows in your layouts.

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

To illustrate the above example, let's consider that the height of the browser viewport is 1000px.

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "100px 100px 300px",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

As long as the sum of the values used to divide the rows does not exceed the browser viewport, no scrollbar will appear. To introduce a vertical scrollbar the sum needs to exceed the browser viewport height.

If you want to introduce a vertical scrollbar you can use the below snippet.

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "300px 400px 500px",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

Similarly, for fixing the width such that the layout is half of the browser viewport, just divide the values such that the sum of the values used to divide the columns is half of the viewport's width.  

Let's consider the width of the browser viewport is 1000px.

.. code::

	"props": {
		"gridTemplateColumns": "100px 200px 200px",
		"gridTemplateRows": "1fr 1fr 1fr",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

If you want to introduce a horizontal scrollbar you can use the below snippet, where the sum exceeds the browser viewport width. 

.. code::

	"props": {
		"gridTemplateColumns": "300px 500px 500px",
		"gridTemplateRows": "1fr 1fr 1fr",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},


Using percentages (%)
---------------------

Similar to the concept of the pixels to avoid scrollbar the sum of the values should not exceed 100%, and if you want a scrollbar then the sum must exceed 100%.

To illustrate an example where you want to avoid scrollbar or want the application to be half the size of the browser viewport, you can use the below snippet.

.. code::

    "props": {
		"gridTemplateColumns": "2fr 1fr 1fr",
		"gridTemplateRows": "10% 20% 20%",
		"gridTemplateAreas": " \"Title Title Extra\" \"Data Data Data\" \"Map Output Optimize\" "
	},

If you want to introduce a vertical scrollbar you can use the below snippet.

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

If you want to introduce a horizontal scrollbar you can use the below snippet. 

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