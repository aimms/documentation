.. |tickmark| image:: images/greentick_icon_small.png
.. |tickmark1| image:: images/greentick_icon.png

Feature Mapping for WebUI 
=========================

This section outlines the various elements in the WebUI and what features each of them support.

The table below maps the features available for data widgets.

.. csv-table:: 
   :header: "Features", "`Bar Chart <bar-chart-widget.html>`_", "`Bubble Chart <bubble-chart-widget.html>`_", "`Gantt Chart <gantt-chart-widget.html>`_", "`Line Chart <line-chart-widget.html>`_","`Pie Chart <pie-chart-widget.html>`_",`Table <table-widget.html>`_,`Scalar <scalar-widget.html>`_,"`Map - Nodes <map-widget.html#adding-node-sets>`_","`Map - Arcs <map-widget.html#adding-arc-sets>`_"

    `Pivot <widget-options.html#pivot>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    `Store Focus <widget-options.html#store-focus>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,|tickmark|,|tickmark|
    Hover Identification,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,,|tickmark|,|tickmark|
    `Totals <widget-options.html#totals>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    `Slicing Support <widget-options.html#id6>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    `Annotations <css-styling.html#data-dependent-styling>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    `Tooltips <widget-options.html#html-tooltips>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    `Widget Actions <widget-options.html#widget-actions>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    `Item Actions <widget-options.html#item-actions>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,
    Y-Axis Min & Max Bounds and Step,|tickmark|,,,|tickmark|,,,,,
    Show High/Low,,,,,,|tickmark|,,,
    `Highlight <css-styling.html#highlighting-experimental>`_,,,|tickmark|,,,|tickmark|,,,
    `Icons <../_static/aimms-icons/icons-reference.html>`_,,,,,,,,|tickmark|,
    `Inline text <widget-options.html#additional-identifier-properties>`_,,,|tickmark|,,,,,,
    Labels,,,,,,,,,|tickmark|
    `Filtering <table-widget.html#data-filtering-on-the-table>`_,,,,,,|tickmark|,,,

The table below maps the features available for supporting widgets.

.. csv-table:: 
   :header: "Features", "`List <list-widget.html>`_", "`Multiselect <selection-widgets.html>`_", "`Selection <selection-widgets.html>`_", "`Legend <selection-widgets.html>`_","`Button <button-widget.html>`_",`Upload <upload-widget.html>`_,`Download <download-widget.html>`_,"`Slider <slider-widget.html>`_"

   Hover Identification,,|tickmark|,|tickmark|,|tickmark|,,,,
    `Slicing Support <widget-options.html#id6>`_,|tickmark|,|tickmark|,|tickmark|,|tickmark|,,,,
    Action(s) / Procedures,|tickmark|,,,,|tickmark|,|tickmark|,|tickmark|,
    Tooltips,|tickmark|,,,,,,,
    `Widget Actions <widget-options.html#widget-actions>`_,|tickmark|,|tickmark|,,|tickmark|,,,,|tickmark|

The table below maps the features available for the UI components.

.. csv-table:: 
    :header: "Features","`Workflow Panel <workflow-panels.html>`_","`Status Bar <status-bar.html>`_","`Page Actions <page-settings.html#page-actions>`_"

    Slicing Support,|tickmark|,|tickmark|,|tickmark|
    Action(s) / Procedures,,|tickmark|,|tickmark|
    Tooltips,|tickmark|,|tickmark|,|tickmark|
    `Icons <../_static/aimms-icons/icons-reference.html>`_,|tickmark|,|tickmark|,|tickmark| 

The table below maps the features available for the different type of pages.

.. csv-table:: 
    :header: "Features","`Regular Page <webui-pages.html>`_","`Side Panel Page <side-panels.html>`_","`Dialog Page <dialog-pages.html>`_"

    `Page Actions <page-settings.html#page-actions>`_,|tickmark|,,
    `Classic Layout <webui-classic-pages.html>`_,|tickmark|,Fixed Width,Small/Medium/Large
    `Grid Layout <webui-grid-pages.html>`_,|tickmark|,,
    `Action Upon Load <page-settings.html>`_,|tickmark|,,
    `Action Upon Leave <page-settings.html>`_,|tickmark|,,|tickmark|
    Max Columns (Clasic Layout),|tickmark|,2 Column Fixed,Small/Medium/Large