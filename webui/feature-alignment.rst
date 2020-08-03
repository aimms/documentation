Feature Mapping for WebUI 
=========================

This section outlines the various elements in the WebUI and what features each of them support.

The table below maps the features available for data widgets.

.. csv-table:: 
   :header: "Features", "`Bar Chart <bar-chart-widget.html>`_", "`Bubble Chart <bubble-chart-widget.html>`_", "`Gantt Chart <gantt-chart-widget.html>`_", "`Line Chart <line-chart-widget.html>`_","`Pie Chart <pie-chart-widget.html>`_",`Table <table-widget.html>`_,`Scalar <scalar-widget.html>`_,"`Map - Nodes <map-widget.html#adding-node-sets>`_","`Map - Arcs <map-widget.html#adding-arc-sets>`_"

    `Pivot <widget-options.html#pivot>`_,X,X,X,X,X,X,X,,
    `Store Focus <widget-options.html#store-focus>`_,X,X,X,X,X,X,,X,X
    Hover Identification,X,X,X,X,X,,,X,X
    `Totals <widget-options.html#totals>`_,X,X,X,X,X,X,X,,
    `Slicing Support <widget-options.html#id6>`_,X,X,X,X,X,X,X,,
    `Annotations <css-styling.html#data-dependent-styling>`_,X,X,X,X,X,X,X,,
    `Tooltips <widget-options.html#html-tooltips>`_,X,X,X,X,X,X,X,,
    `Widget Actions <widget-options.html#widget-actions>`_,X,X,X,X,X,X,X,,
    `Item Actions <widget-options.html#item-actions>`_,X,X,X,X,X,X,X,,
    Show High/Low,,,,,,X,,,
    `Highlight <css-styling.html#highlighting-experimental>`_,,,X,,,X,,,
    `Icons <../_static/aimms-icons/icons-reference.html>`_,,,,,,,,`X <map-widget.html#icons-for-nodes>`_,
    `Inline text <widget-options.html#additional-identifier-properties>`_,,,X,,,,,,
    Labels,,,,,,,,,X

The table below maps the features available for supporting widgets.

.. csv-table:: 
   :header: "Features", "`List <list-widget.html>`_", "`Multiselect <selection-widgets.html>`_", "`Selection <selection-widgets.html>`_", "`Legend <selection-widgets.html>`_","`Button <button-widget.html>`_",`Upload <upload-widget.html>`_,`Download <download-widget.html>`_,"`Slider <slider-widget.html>`_"

   Hover Identification,,X,X,X,,,,
    `Slicing Support <widget-options.html#id6>`_,`X <list-widget.html#slicing-the-list-group-and-list-group-items>`_,X,X,X,,,,
    Action(s) / Procedures,X,,,,X,X,X,
    Tooltips,X,,,,,,,
    `Widget Actions <widget-options.html#widget-actions>`_,X,X,,X,,,,X

The table below maps the features available for the UI components.

.. csv-table:: 
    :header: "Features","`Workflow Panel <workflow-panels.html>`_","`Status Bar <status-bar.html>`_","`Page Actions <page-settings.html#page-actions>`_"

    Slicing Support,X,X,X
    Action(s) / Procedures,,X,X
    Tooltips,X,X,X
    `Icons <../_static/aimms-icons/icons-reference.html>`_,X,X,X 

The table below maps the features available for the different type of pages.

.. csv-table:: 
    :header: "Features","`Regular Page <webui-pages.html>`_","`Side Panel Page <side-panels.html>`_","`Dialog Page <dialog-pages.html>`_"

    `Page Actions <page-settings.html#page-actions>`_,X,,
    Layout,Classic/Grid,Fixed Width,Small/Medium/Large
    `Action Upon Load <page-settings.html>`_,X,,
    `Action Upon Leave <page-settings.html>`_,X,,X
    Max Columns,X,2 Column Fixed,Small/Medium/Large