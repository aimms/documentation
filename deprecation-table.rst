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
a `How-to <https://how-to.aimms.com/Articles/109/109-deprecate-compound-sets-overview.html>`_ that guides AIMMS developers to an 
adjustment of their models in case they use Compound Sets (by proposing another concept to keep the model running as it should).
  

Deprecated feature table
--------------------------
This is a list of (recent) deprecated features and provides an insight into its status, an expected end of life time frame and a suggestion on how to handle because of the feature being deprecated.


.. csv-table:: 
   :header: "Category", "Feature", "Status", "End of Life", Comment,Resolve
   :widths: 10, 10, 10, 10, 20, 20

    System Requirements, Win 32                    , Deprecated , Dec 2019        , No longer delivered and supported                                              , Win64 versions                                                                                        
    System Requirements, Internet Explorer 11      , Deprecated , Jan 2020        , No longer supported                                                            , Chrome or Edge (latest or latest-1)                                                                  
    Licensing, Dongle                    , Deprecated , Dec 2019        , No longer delivered and supported                                              , Nodelock                                                                
    GUI, WinUI                     , Deprecated , not before 2023 , Currently only High Prio and fixable issues will be considered for solving                            , WebUI                                                                                                 
    GUI-WebUI, Wizard              , Deprecated , mid 2020   (to be planned)  ,  Will be removed - started with message and inability to add (`4.73 <release-notes.html#aimms-4-73>`_), Workflow Panel with fine grained control via model                     
    GUI-WebUI, Group Widget              , Deprecated ,                 , Start with inability to add and remove suggestion in widget creation dialog    , New Page Layout V2 will make this obsolete                                                           
    Modeling, Compound Sets             , Deprecated , May 2020        , No longer functioning (error produced per `4.73 <release-notes.html#aimms-4-73>`_)                                , Restructure model; for details see `How-to <https://how-to.aimms.com/Articles/109/109-deprecate-compound-sets-overview.html>`_
    Data, Single Data File          , Deprecated , Q2 2020         , Current status: deprecated for years already; now finally planned for removal  , Use new File & Folders (there is a conversion tool in IDE)                 
    Connectivity, SDK                       , Deprecated , not before 2023 , Currently only high priority and fixable issues                                    , Deploy via AIMMS PRO API (contact us)                                                   
    Connectivity, Excel Add-in              , Deprecated ,  Dec 2020                , Current status is no pro-active support                                        , No alternative as such                                                                                
    Connectivity, Tableau TDE Provider (part of DataLink) , Deprecated,                 , Current status is no pro-active support                     , Communication with BI tools via databases or CSV/XLS files (or upcoming JSON files)                  
    PRO, AIMMS PRO Cluster feature , Deprecated ,                 , Current status no pro-active support                                           , Various options such as scale vertically (larger machine) or use AIMMS Cloud; for details see `How-to <https://how-to.aimms.com/Articles/373/373-pro-scaling-options.html>`_
