AIMMS Product Lifecycle
===========================

Deprecated and End of Life
------------------------------

AIMMS considers a feature  **Deprecated** if we plan to remove it; potentially it can be replaced by something different, but not necessarily! 
We announce deprecated features so developers can prepare for it and start looking for other ways (in- or outside our product) of achieving 
the desired behavior without using that feature because it might not be available in future versions. 
When possible, we add an **End of Life** to the feature as well; this is the date that the future is no longer available to the users.

* Where possible, we provide alternatives
* Support on Deprecated features is very limited, in most cases none 


**Example:** The Compound Sets were deprecated in Jan 2018. They have been completed removed as of 4.73 (May 2020). We developed 
a `How-to <https://how-to.aimms.com/Articles/109/109-deprecate-compound-sets-overview.html>`__ that guides AIMMS developers to an 
adjustment of their models in case they use Compound Sets (by proposing another concept to keep the model running as it should).
  

Deprecated feature table
--------------------------
This is a list of (recent) deprecated features and provides an insight into its status, an expected end of life time frame and a suggestion on how to handle because of the feature being deprecated.


.. csv-table:: 
   :header: "Category", "Feature", "Status", "End of Life", Comment,Resolve
   :widths: 10, 10, 10, 10, 20, 20

    Algorithmic Capability, AOA (non-GMP), Deprecated, April 2022 , No longer available in 4.85, Use the `GMP based AOA <https://how-to.aimms.com/Articles/192/192-solve-minlp-with-outer-approximation.html>`__
    Algorithmic Capability, NETSOL ("Pure Network" Solver) , Deprecated,                 , Deprecated since Oct 2018                     , Set model type to LP or Automatic and then an LP solver (like CPLEX) is used   
    Cloud, R , Deprecated, Q2 2021                , Current status is no pro-active support                     , We promote the use of the new HTTP Client Library in combination with the Data Exchange; see  `How-to <https://how-to.aimms.com/Articles/498/498-aimms-with-r.html>`__   
    Connectivity, AIMMS Com, Deprecated, n/a , AIMMS COM is considered 'old' architecture, Work with AIMMS to understand new/better ways to integrate AIMMS 
    Connectivity, SDK                       , Deprecated , not before 2023 , Currently only high priority and fixable issues                                    , Deploy via AIMMS PRO API (contact us)                                                   
    Connectivity, Excel Add-in              , Deprecated ,  Sept 2020                , Current status is no pro-active support                                        , No alternative as such                                                                                
    Connectivity, Spreadsheet functions              , Deprecated ,                , Current status is no pro-active support                                        , Use AXLL Library or Data Exchange Library                                                                                
    Connectivity, Tableau TDE Provider (part of DataLink) , Deprecated,                 , Current status is no pro-active support                     , Communication with BI tools via databases or CSV/XLS files (or upcoming JSON files)                  
    Connectivity, R-link (part of DataLink) , Deprecated,                 , Current status is no pro-active support                     , We promote the use of the new HTTP Client Library in combination with the Data Exchange; see  `How-to <https://how-to.aimms.com/Articles/498/498-aimms-with-r.html>`__   
    Data, Single Data File          , Deprecated , Q4 2021         , Current status: deprecated for years already; will not be removed in Q4  , Use new File & Folders (there is a conversion tool in IDE); for details see `How-to <https://how-to.aimms.com/Articles/314/314-from-dat-to-data.html>`__
    GUI-WebUI, Map v1, Deprecated, May 2020, No longer available in 4.74, Use Map v2 (standard for 4.74 and up)
    GUI-WebUI, Page Actions v1, Deprecated, May 2020, No longer available in 4.74, Use Page Action v2 (standard for 4.74 and up) where all actions are defined with an identifier 
    GUI-WebUI, Custom Position widgets, Deprecated ,                 , Currently only high priority and fixable issues , Switch to Grid Layout that gives the flexibility to create your desired layout.                                                           
    GUI-WebUI, Wizard              , Deprecated , mid 2020   (to be planned)  ,  Will be removed - started with message and inability to add (`4.73 <release-notes.html#aimms-4-73>`_), Workflow Panel with fine grained control via model                     
    GUI-WebUI, Group Widget              , Deprecated ,                 , Start with inability to add and remove suggestion in widget creation dialog    , Switch to Grid Layout that gives the flexibility to create your desired layout.                                                           
    GUI-WebUI, Sidebar Open By Default, Deprecated, March 2021, No longer available from 4.78. This is not same as the `Side Panel <https://manual.aimms.com/webui/side-panels.html>`_, No alternative as such
    GUI-WebUI, Page Manager Hidden, Deprecated, March 2021, No longer available from 4.78, Use Menu to navigate to other pages                 
    GUI-WebUI, Old Support for Units of Measurements                     , Deprecated , March 2022  , Deprecated since March 2018 (`4.51 <https://manual.aimms.com/release-notes.html#aimms-4-51>`_ release)                            ,  Use Convention identifier in your model. For details see `Units Support <https://documentation.aimms.com/webui/units-support.html>`__
    GUI-WebUI, Classic Theme                     , Deprecated , February 2022  , "Deprecated since September 2018 (`4.59.1 <https://documentation.aimms.com/webui/app-misc-settings.html?highlight=theme#use-classic-theme>`_ release).       From 4.84 release onwards, the Classic Theme ceases to exist. WebUI will default to the AIMMS Theme.", Switch off the Classic Theme if still using that. Accordingly adjust Custom CSS if used. You could also start considering `WebUI Theming <https://community.aimms.com/aimms-webui-44/webui-theming-new-easier-options-available-soon-1145>`_.   
    GUI-WebUI, Download Table Data As CSV        , Deprecated , April 2023  , "Current status is no pro-active support. Please share your `feedback <https://community.aimms.com/aimms-webui-44/feedback-wanted-would-you-prefer-the-table-download-csv-feature-over-the-table-download-excel-feature-and-why-1339>`__ on why would you prefer the Table Download CSV over the Download Excel feature.",  "Use `Download Table Data as Excel <https://documentation.aimms.com/webui/table-widget.html#excel-upload-download-support>`_ feature."    
    GUI-WinUI, WinUI App Development                     , Deprecated , not before 2026 , Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used                           , WebUI                                                                                                                                                                                                  
    Licensing, Dongle                    , Deprecated , Dec 2019        , No longer delivered and supported                                              , Nodelock                                                                
    Modeling, Compound Sets             , Deprecated , May 2020        , No longer functioning (error produced per `4.73 <release-notes.html#aimms-4-73>`_)                                , Restructure model; for details see `How-to <https://how-to.aimms.com/Articles/109/109-deprecate-compound-sets-overview.html>`__
    Modeling, GeoFindCoordinates function             , Deprecated ,        , Based on outdated code    , Use HTTP Client Library and any geo service
    Modeling, Horizons             , Deprecated ,        , Based on outdated code    , Use alternative language constructs
        PRO, AIMMS PRO Cluster feature , Deprecated ,                 , Current status no pro-active support                                           , Various options such as scale vertically (larger machine) or use AIMMS Cloud; for details see `How-to <https://how-to.aimms.com/Articles/373/373-pro-scaling-options.html>`__
    System Requirements, Win 32                    , Deprecated , Dec 2019        , No longer delivered and supported                                              , Win64 versions 4.67 or higher                                                                                       
    System Requirements, VS2013-based                    , Deprecated ,   May 2019     , No longer delivered and supported                                              , VS2017-based versions 4.67 or higher                                                                                       
    System Requirements, Internet Explorer 11      , Deprecated , Jan 2020        , No longer supported                                                            , Chrome or Edge (latest or latest-1)                                                                  
    System Requirements, Windows 7      , Deprecated , Jan 2020        , No longer supported            , Windows 8 or higher                                                                  
    System Requirements, Windows Server 2008      , Deprecated , Jan 2020        , No longer supported         , Windows Server 2012 or higher                                                                  
    

