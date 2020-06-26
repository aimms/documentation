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
-------------------  
This is a list of (recent) deprecated features and provides an insight into its status, an expected end of life time frame and a suggestion on how to handle because of the feature being deprecated.


+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Feature                   | Status     | End of Life     | Comment                                                                        | Resolve                                                                                               |
+===========================+============+=================+================================================================================+=======================================================================================================+
| Win 32                    | Deprecated | Dec 2019        | No longer delivered and supported                                              | Win64 versions                                                                                        |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Dongle                    | Deprecated | Dec 2019        | No longer delivered and supported                                              | Nodelock                                                                                              |
|                           |            |                 |                                                                                |                                                                                                       |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Internet Explorer 11      | Deprecated | Jan 2020        | No longer supported                                                            | Chrome or Edge (latest or latest-1)                                                                   |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| WinUI                     | Deprecated | not before      | Currently only High Prio and fixable issues                                    | WebUI                                                                                                 |
|                           |            | 2023            | Resolve → WebUI                                                                |                                                                                                       |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| SDK                       | Deprecated | not before      | Currently only High Prio and fixable issues                                    | Deploy via AIMMS PRO API, or AIMMS EO (dockerized)                                                    |
|                           |            | 2023            |                                                                                |                                                                                                       |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| WebUI Wizard              | Deprecated | mid 2020        | Will be removed, start w/ message (4.73)                                       | Workflow Panel                                                                                        |
|                           |            | (to be planned) |                                                                                |                                                                                                       |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Group Widget              | Deprecated |                 | Start with inability to add and remove suggestion in widget creation dialog    | New Page Layout V2 will make this obsolete                                                            |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Compound Sets             | Deprecated | May 2020        | No longer functioning (error produced per 4.73)                                | Restructure model. For details, see How-to                                                            |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Excel Add-on              | Deprecated |                 | Current status is no pro-active support                                        | No alternative as such                                                                                |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Tableau TDE Provider      | Deprecated |                 | Current status is no pro-active support                                        | Communication with BI tools via databases or CSV/XLS files (or upcoming JSON files).                  |
| (part of DataLink)        |            |                 |                                                                                |                                                                                                       |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| Single Data File          | Deprecated | Q2 2020         | Current status: deprecated for years already; now finally planned for removal  | Use new File & Folders (if needed, there is a conversion tool in IDE)                                 |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+
| AIMMS PRO Cluster feature | Deprecated |                 | Current status no pro-active support                                           | Various options such as scale vertically (larger machine), or use AIMMS Cloud. For details see How-to |
+---------------------------+------------+-----------------+--------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+