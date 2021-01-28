Experimental Features
*********************

.. |experimental-features| image:: images/experimentalfeatures_icon.png

Experimental Features are pre-release versions that you can enable to try out and share feedback about. Based on the usage and feedback the feature(s) eventually become official features in the WebUI, or might be removed if they are proven to not work well or do not add value to users. 


How to enable or disable Experimental Features
----------------------------------------------

To access and enable/disable the list of experimental features you can follow the below steps:

#. You need to press a three-key combination i.e ``CTRL+SHIFT+.`` (Control Key + Shift Key + Dot/Fullstop Key).
#. Once you key in the combination you will see a new icon |experimental-features| in the Application Toolbar in the top right corner. Click on the icon.

    .. image:: images/Application_Toolbar.png
        :align: center

#. Clicking on the icon will reveal the Experimental Features menu on the left hand side. 

    .. image:: images/Experimental_FeatureList.png
        :align: center

#. To enable or disable a feature, just check/uncheck the checkbox for the respective feature. In this illustration, we will enable the ``webui state support`` feature.

    .. image:: images/Experimental_FeatureList.png
        :align: center

#. After enabling the feature either click the Reload text or refresh the page. The feature will only be active once the page is reloaded.

    .. image:: images/Experimental_Reload.png
        :align: center


Current list of Experimental Features
-------------------------------------

#. Compact Scalar - By enabling this feature you have the option to condense the height of the scalar to a fixed height that is similar to a label or button widget. An option ``Enable Compact mode (1/0)``, will appear in the Miscellaneous section of the Scalar widget options that allows toggling the compact mode. 
#. Ignore Map Upgrade - Enable this option to roll back to the previous map version. 
#. `Highlight Annotations <css-styling.html#highlighting-experimental>`_
#. WebUI State Support - By enabling this feature the element parameters ``CurrentPageId`` and ``CurrentSidePanelPageId`` will be updated with the ``pageId`` of the current page the user is on and the ``pageId`` of the Side Panel page that is open, respectively.
#. `Grid Layout <webui-grid-pages.html>`_
