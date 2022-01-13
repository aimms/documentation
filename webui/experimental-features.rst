Experimental Features
*********************

.. |experimental-features| image:: images/experimentalfeatures_icon.png

Experimental Features are features that have not been ironed out fully yet, but which you can enable to try out and share feedback about. Based on the usage and feedback the feature(s) eventually become official features in the WebUI or might be removed if they are proven to not work well or do not add value to users. 


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

#. To enable or disable a feature, just check/uncheck the checkbox for the respective feature. In this illustration, we will enable the ``webui state support`` feature. After enabling the feature either click the Reload text or refresh the page. The feature will only be active once the page is reloaded.

    .. image:: images/Experimental_Reload.png
        :align: center


Current list of Experimental Features
-------------------------------------

.. csv-table:: 
   :header: "Experimental Feature", "Description", "Version introduced - Stage","General Availability expected by"
   :widths: 20, 65, 10, 5

   Compact Scalar, "By enabling this feature you have the option to condense the height of the scalar to a fixed height that is similar to a label or button widget. An option ``Enable Compact mode (1/0)``, will appear in the Miscellaneous section of the Scalar widget options that allows toggling the compact mode.", 4.46 - Feature Candidate, TBD
   `Highlight Annotations <css-styling.html#highlighting-experimental>`_, "Enable this feature to use annotations to responsively highlight certain tuples in the Table and the Gantt Chart widget. `Read more here <css-styling.html#highlighting-experimental>`_.", 4.68.5 - Feature Candidate, TBD
   WebUI State Support, "By enabling this feature the element parameters :any:`webui::CurrentPageId` and :any:`webui::CurrentSidePanelPageId` will be updated with the ``pageId`` of the current page the user is on and the ``pageId`` of the Side Panel page that is open, respectively.", 4.72 - Feature Candidate, TBD
   Skip Combining CSS/JS Files, "Activate this option to load the CSS and JS files separately. This is unlike the other experimental features. This option will eventually be removed and the new setup will be applied. `Read more about the improvements here <https://community.aimms.com/product-updates-roadmap-36/smarter-delivery-of-webui-for-improved-performance-838>`_. This option is merely here such that you can use the old setup in case you face issues with the new setup. Please note, you will have to close the project, reopen the project and launch the WebUI each time this option is toggled.", 4.78 - Feature Standby, TBD


Development Stages
*********************

* **Feature Standby** - An option that allows you to use the earlier version of a General Availability feature that is recently introduced. This option is removed after a period of time that allows models to be updated and adjusted to the new feature.
* **Feature Candidate** - The feature is available to be used and tested, but might have a change in implementation. There could be a chance that we replace this feature with an alternate improved feature as well.
* **Beta** - The feature is available to be used and tested. We collect feedback and suggestions for further improvement that may or may not be implemented before General Availability.
* **Release Candidate** - The feature is stable and ready to be released unless significant bugs emerge. 
* **General Availability** - The feature is officially released and supported as part of SLA. 

.. note ::
    The development stages and General Availability versions for the experimental features can change based on certain conditions.