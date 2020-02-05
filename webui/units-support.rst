Support for Units of Measurement
================================

In the WebUI, units from your AIMMS model will per default be displayed in the Table, Scalar and Slider widgets. These widgets have an option 'Show Units' in the 'Miscellaneous' tab of their options editor where you can overrule this. For all widget types, the units will be displayed in the tooltips as well.

The units that are displayed follow the Convention identifier in your model that is specified in the Convention attribute of you Main model.

.. note:: 

    In AIMMS 4.50 and lower versions, unit support was handled in the manner described below. When opening your WebUI in AIMMS 4.51 or higher, you will automatically get a warning dialog if this 'old-style' unit support is detected. You are encouraged to adapt your model to the new standard.

.. code-block:: js

    IdentifierUnitMap = {
		"Distance" : "km"
	};

will display the distance values in 'km'. Input for the 'Distance' identifier will also be interpreted in terms of 'km'. Please note that you can only specify display units for which there exists a valid conversion to the base unit of the identifier in your model.
