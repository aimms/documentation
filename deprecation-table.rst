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
    Algorithmic Capability, Matrix Manipulation functions, Deprecated, Q2 2023 , Deprecated since March 2013 , Use the `GMP functions <https://documentation.aimms.com/language-reference/optimization-modeling-components/implementing-advanced-algorithms-for-mathematical-programs/introduction-to-the-gmp-library.html>`__
    Algorithmic Capability, NETSOL ("Pure Network" Solver) , Deprecated,                 , Deprecated since Oct 2018                     , Set model type to LP or Automatic and then an LP solver (like CPLEX) is used   
    Algorithmic Capability, Octeract , Deprecated, July 2025 , Deprecated since June 2025                     , Use alternative `solvers <https://documentation.aimms.com/platform/solvers/solvers.html#supported-math-program-types>`__
    Cloud, R , Deprecated, Q2 2021                , Current status is no support                     , We recommend `DEX <https://documentation.aimms.com/dataexchange/index.html>`__; see `How-to <https://how-to.aimms.com/Articles/498/498-aimms-with-r.html>`__ 
    Connectivity, AIMMS Com, Deprecated, n/a , AIMMS COM is considered 'old' architecture, Work with AIMMS to understand new/better ways to integrate AIMMS 
    Connectivity, SDK                       , Deprecated , not before 2026 , Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used, `AIMMS PRO REST API <https://documentation.aimms.com/cloud/rest-api.html>`__
    Connectivity, Excel Add-in              , Deprecated ,  Sept 2020                , Current status is no support                                        , 
    Connectivity, Spreadsheet functions              , Deprecated ,                , Current status is no pro-active support                                        , Use AXLL Library or Data Exchange Library                                                                                
    Connectivity, Tableau TDE Provider (part of DataLink) , Deprecated, , Current status is no support, "Two options: (1) Using `DEX <https://documentation.aimms.com/dataexchange/index.html>`__ to write data in files (Parquet, JSON, XML, XLSX or CSV) to the Azure Data Lake Storage service that is part of each Cloud account (`Azure Data Lake Storage Gen 2 on the AIMMS Cloud Platform <https://how-to.aimms.com/Articles/594/594-adls-data-integration.html>`__) and providing the Tableau application access to these files. (2) Writing the data to a database that the Tableau application can reach."
    Connectivity, R-link (part of DataLink) , Deprecated, Will no longer be available to be added to projects after 31.12.2023; Available for download from autolib repository until at least 2026, Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used, We recommend `DEX <https://documentation.aimms.com/dataexchange/index.html>`__; see also `How-to <https://how-to.aimms.com/Articles/498/498-aimms-with-r.html>`__ 
    Connectivity, DataLink (includes `CSVProvider <https://documentation.aimms.com/datalink/providers.html#csvprovider>`__ and `XLSProvider <https://documentation.aimms.com/datalink/providers.html#xlsprovider>`__), Deprecated, Will no longer be available to be added to projects after 31.12.2023; Available for download from autolib repository until at least 2026, Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used, We recommend `DEX <https://documentation.aimms.com/dataexchange/index.html>`__
    Connectivity, HTTP Client , Deprecated, Will no longer be available to be added to projects after 31.12.2023; Available for download from autolib repository until at least 2026, Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used, We recommend `DEX <https://documentation.aimms.com/dataexchange/index.html>`__; see also `How-to <https://how-to.aimms.com/C_Developer/Sub_Connectivity/sub_dataexchange/index.html>`__
    Connectivity, Email Client , Deprecated, Will no longer be available to be added to projects after 31.12.2023; Available for download from autolib repository until at least 2026, Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used, We recommend using an email API service together with `DEX <https://documentation.aimms.com/dataexchange/index.html>`__; see also `How-to <https://how-to.aimms.com/C_Developer/Sub_Connectivity/sub_dataexchange/index.html>`__
    Data, Single Data File          , Deprecated , June 2022         , No longer available per 4.86  , Use new File & Folders (there is a conversion tool in IDE); for details see `How-to <https://how-to.aimms.com/Articles/314/314-from-dat-to-data.html>`__
    GUI-WebUI, Map v1, Deprecated, May 2020, No longer available per 4.74, Use Map v2 (standard for 4.74 and up)
    GUI-WebUI, Page Actions v1, Deprecated, May 2020, No longer available per 4.74, Use Page Action v2 (standard for 4.74 and up) where all actions are defined with an identifier 
    GUI-WebUI, Custom Position widgets, Deprecated ,                 , Currently only high priority and fixable issues , Switch to Grid Layout that gives the flexibility to create your desired layout.                                                           
    GUI-WebUI, Wizard              , Deprecated , mid 2020   (to be planned)  ,  Will be removed - started with message and inability to add (`4.73 <release-notes.html#aimms-4-73>`_), Workflow Panel with fine grained control via model                     
    GUI-WebUI, Group Widget              , Deprecated ,                 , Start with inability to add and remove suggestion in widget creation dialog    , Switch to Grid Layout that gives the flexibility to create your desired layout.                                                           
    GUI-WebUI, Sidebar Open By Default, Deprecated, March 2021, No longer available per 4.78. This is not same as the `Side Panel <https://manual.aimms.com/webui/side-panels.html>`_, No alternative as such
    GUI-WebUI, Page Manager Hidden, Deprecated, March 2021, No longer available per 4.78, Use Menu to navigate to other pages                 
    GUI-WebUI, Old Support for Units of Measurements                     , Deprecated , March 2022  , Deprecated since March 2018 (`4.51 <https://manual.aimms.com/release-notes.html#aimms-4-51>`_ release)                            ,  Use Convention identifier in your model. For details see `Units Support <https://documentation.aimms.com/webui/units-support.html>`__
    GUI-WebUI, Classic Theme                     , Deprecated , February 2022  , "Deprecated since September 2018 (`4.59.1 <https://documentation.aimms.com/webui/app-misc-settings.html?highlight=theme#use-classic-theme>`_ release).       From 4.84 release onwards, the Classic Theme ceases to exist. WebUI will default to the AIMMS Theme.", Switch off the Classic Theme if still using that. Accordingly adjust Custom CSS if used. You could also start considering `WebUI Theming <https://community.aimms.com/aimms-webui-44/webui-theming-new-easier-options-available-soon-1145>`_.   
    GUI-WebUI, Download Table Data As CSV        , Deprecated , April 2023  , "Current status is no pro-active support. Please share your `feedback <https://community.aimms.com/aimms-webui-44/feedback-wanted-would-you-prefer-the-table-download-csv-feature-over-the-table-download-excel-feature-and-why-1339>`__ on why would you prefer the Table Download CSV over the Download Excel feature.",  "Use `Download Table Data as Excel <https://documentation.aimms.com/webui/table-widget.html#excel-upload-download-support>`_ feature."    
    GUI-WebUI, Widget Filtering (This is not to be confused with the Table Filtering feature)        , Deprecated , Jan 2023  , "From AIMMS 4.66 onwards, the 'Filter' Option Editor tab is not present anymore in any widget.",  "Utilizing the Slicing functionality on the Identifiers displayed in your widgets is the recommended method of widget filtering. For details see `How-to <https://how-to.aimms.com/Articles/333/333-update-webui-version.html#aimms-4-66-widget-filtering>`__ and `Widget Options documentation <https://documentation.aimms.com/webui/widget-options.html#widget-options>`__"    
    GUI-WinUI, WinUI App Development                     , Deprecated , not before 2026 , Currently only High Prio and fixable issues will be considered for solving and assuming the then current Windows OS still supports third party components used                           , WebUI                                                                                                                                                                                                  
    Licensing, Dongle                    , Deprecated , Dec 2019        , No longer delivered and supported                                              , Nodelock                                                                
    Modeling, Compound Sets             , Deprecated , May 2020        , No longer functioning (error produced per `4.73 <release-notes.html#aimms-4-73>`_)                                , Restructure model; for details see `How-to <https://how-to.aimms.com/Articles/109/109-deprecate-compound-sets-overview.html>`__
    Modeling, GeoFindCoordinates function             , Deprecated ,        , Based on outdated code    , Use `DEX <https://documentation.aimms.com/dataexchange/index.html>`__ Library and any geo service as illustrated `here <https://how-to.aimms.com/Articles/684/684-LocationIQ.html>`_
    Modeling, Horizons             , Deprecated ,        , Based on outdated code    , Use alternative language constructs
    Modeling, MultiSolve             , Deprecated , Dec 2023   ,     , Use `GMP::SolverSession::AsynchronousExecute <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_solversession-procedures-and-functions/gmp_solversession_asynchronousexecute.html>`__ solve or contact support@aimms.com
    PRO, AIMMS PRO Cluster feature , Deprecated ,                 , Current status no pro-active support                                           , Various options such as scale vertically (larger machine) or use AIMMS Cloud; for details see `How-to <https://how-to.aimms.com/Articles/373/373-pro-scaling-options.html>`__
    PRO, Java/C++ API , Deprecated ,  , Currently only High Prio and fixable issues will be considered for solving , Switch to REST service for Tasks
    System Requirements, Win 32                    , Deprecated , Dec 2019        , No longer delivered and supported                                              , Win64 versions 4.67 or higher                                                                                       
    System Requirements, VS2013-based                    , Deprecated ,   May 2019     , No longer delivered and supported                                              , VS2017-based versions 4.67 or higher                                                                                       
    System Requirements, Internet Explorer 11      , Deprecated , Jan 2020        , No longer supported                                                            , Chrome or Edge (latest or latest-1)                                                                  
    System Requirements, Windows 7      , Deprecated , Jan 2020        , No longer supported            , Windows 8 or higher                                                                  
    System Requirements, Windows Server 2008      , Deprecated , Jan 2020        , No longer supported         , Windows Server 2012 or higher                                                                  
    

.. below are spelling exceptions only for this document

.. spelling::
    autolib
