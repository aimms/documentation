Data Manager
************

.. |data-manager| image:: images/DataManager_snap1.png

To use the data management features through the WebUI, the :token:`Data management style` option of your AIMMS application has to be set to :token:`Disk files and folders`. This is the default for AIMMS 4 projects. The WebUI has a data management pane, which lists all available data cases. The data management pane allows you to load, save and delete cases associated with your AIMMS project. It can be opened with the 'list' icon |data-manager|:

.. image:: images/DataManager_snap6.png
    :align: center

When running your WebUI app in development mode, the cases will be stored in the *Data* subfolder of your project folder. When running your WebUI app through PRO, cases will be stored on the PRO server. Bundled cases (i.e. cases that are included in a subfolder of your published application) are still accessible, but are read-only.


User Actions
============

There are several data case actions the user can perform.


Active case
-----------

You can set an active case through the data management pane by hovering over a case in the "available cases" list and clicking the "load as active" option: 

.. image:: images/DataManager_snap2.png
    :align: center
    
The case is then loaded as the active case in your AIMMS model. This means that it will be used as the basis for the data in memory in your model; any changes you make can be either saved to this case, or in a new case. When switching from active case, you will be asked what to do with any unsaved data.

.. image:: images/DataManager_snap3.png
    :align: center
    
Case comparison
---------------

The WebUI can be put into case comparison mode by adding one or more cases in the "compared cases" list by clicking their "compare case" option:

.. image:: images/DataManager_snap4.png
    :align: center

In this mode, all data-showing widgets (such as tables and charts) will show an additional case dimension. When in case comparison mode, the active case is automatically included in the compared cases:

.. image:: images/transnet-compcase_v470.png 
    :align: center

Any editable data from the active case will be shown in blue in the table, whereas all other data will be read-only and shown in black. Removing the last case from the case comparison will automatically switch the WebUI to the regular mode of showing the data from the active case.

Next to using the data management pane to add cases to the list of "compared cases", you can also do this from within AIMMS. In the AimmsWebUI library, there is the webui::CompareCaseBool identifier. This identifier is set to 'true' when a case is added to the list of "compared cases" and false when it is removed from the list. If you want to add or remove cases to/from the list of "compared cases" from within a procedure in AIMMS, you can update this webui::CompareCaseBool identifier.

Private vs. shared cases
------------------------

Whenever you run your WebUI app through AIMMS PRO, any case you save will be stored on the PRO server. By default, such a case will be a private case, meaning that it is only visible by its creator. Only the creator may toggle a private case to a shared case (and vice versa). 

.. image:: images/DataManager_snap5.png
    :align: center

A shared case is visible to everybody, but read-only to everybody except the creator.
