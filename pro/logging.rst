Server-side Logging
===================

All activities of the AIMMS PRO Service, Portal Service and server-side sessions are logged. Such logs may be useful when tracing the cause of unexpected errors that may occur while running AIMMS PRO.

Logs Location
-------------

All log files are gathered in Log subfolder of the AIMMS PRO data folder, by default that would be *C:\\ProgramData\\AimmsPRO\\Log*. You may change the logs configuration as described below in order to get more detailed logging information, change file names, file generation policy, etc.

Log files
---------

If something does not work you may want to check the following files for errors:

* *AimmsPROServer.log* - AIMMS PRO Backend logs
* *AimmsPROWeb.log* - AIMMS PRO Web (Portal & WebUI) logs
* *AimmsPROConfigurator.log* - AIMMS PRO Configurator logs
 

Files with the similar names but with the date appended contain logs from previous days. For example, *AimmsPROServer.2015-06-21.0.log* contains AIMMS PRO Backend logs for 21st of June 2015.

Log Configuration
-----------------

All log configuration files are located in the *dataDir* Config directory. AIMMS PRO 2.0 uses the following log configuration files:

* *AimmsPROServerLog.xml* - AIMMS PRO 2 Service logging
* *AimmsPROSessionLog.xml* - Server-side sessions logging
* *AimmsPROConfiguratorLog.xml* - AIMMS PRO Configurator logging
* *AimmsPROWebLog.cfg* - AIMMS PRO Web Service logging
* *AimmsDispatcherServiceLog.cfg* - AIMMS Dispatcher Service
 
Changing the logging Level
--------------------------

For each component, you can specify the detail level at which logging events should take place. By default, all components log at the INFO level. You can modify the logging level by editing the log configuration files mentioned above. In case of unexpected errors, you may want to (temporarily) change the logging level of the corresponding component to DEBUG or
TRACE, which will create a log file containing all available logging events for that component.

* For *AIMMS PRO 2 Service*, changing the log level is very easy: open AimmsPROServerLog.xml and change the value of the property PRO_LOG_LEVEL from INFO to TRACE. The service will automatically reload the configuration file within 30 seconds, no restart is required.
* For the configuration files with the *.cfg* extension, change the entry *log4j.rootLogger=INFO,Logfile* to *log4j.rootLogger=trace,Logfile*. The corresponding service needs to be restarted to pickup the new configuration.
* For the configuration files with the *.xml* extension, look for the node *root* and change the entry *level value="info"* to *level value="trace"*. The corresponding service needs to be restarted to pickup the new configuration.
