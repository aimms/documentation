Server-side Logging
===================

All activities of the AIMMS PRO Service, Portal Service and server-side sessions are logged. Such logs may be useful when tracing the cause of unexpected errors that may occur while running AIMMS PRO.

.. note:: 

    Security notice, see:  `Apache log4j vulnerability does not affect AIMMS software <https://community.aimms.com/aimms-pro-cloud-platform-43/apache-log4j-vulnerability-does-not-affect-aimms-software-1123>`_


Logs Location
-------------

All log files are gathered in Log subfolder of the AIMMS PRO data folder, by default that would be *C:\\ProgramData\\AimmsPRO\\Log*. You may change the logs configuration as described below in order to get more detailed logging information, change file names, file generation policy, etc.

Log files
---------

If something does not work you may want to check the following files for errors:

* *Server.log* - AIMMS PRO Backend logs
* *Portal.log* - AIMMS PRO Portal logs
* *Session.log* - Solver or Data session logs
* *Configurator.log* - AIMMS PRO Configurator logs
* *WebSocketsProxy.log* -  WS Proxy logs. Check this logs to figure out issues with tunnels or connections to the license server.
* *WarLauncher.log* - WAR Launcher logs. Generic web part of AIMMS PRO Portal.
* *Security.log* - Starting with AIMMS PRO 2.24, security logging is enabled which logs AIMMS PRO Security events like user logon, logoff, logon failure, user group and user details changes, changes in the user management. Also logs App security events like App publish, update, edit and delete starting with AIMMS PRO 2.28.

**Enable Security logs for existing installations:**

If you want to add security events logging to your existing on-premise installation, then delete AimmsPROServerLog.xml before upgrading your AIMMS PRO or modify AimmsPROServerLog.xml (e.g. *C:\\ProgramData\\AimmsPRO\\Config\\AimmsPROServerLog.xml*) and replace the last line of the file (the one that says *</included>*) with the following:

.. code-block:: xml

		<property name="SECURITY_LOG_LEVEL" value="trace"/>
		<appender name="SECURITY_FILE"
				class="ch.qos.logback.core.rolling.RollingFileAppender">
			<file>${LOG_HOME}/Security.log</file>
			<!-- DO NOT Support multiple-JVM writing to the same log file -->
			<prudent>false</prudent>
			<rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
				<!-- daily rollover -->
				<fileNamePattern>${LOG_HOME}/Security.%d{yyyy-MM-dd}.%i.log</fileNamePattern>
				<timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
					<maxFileSize>100MB</maxFileSize>
				</timeBasedFileNamingAndTriggeringPolicy>
				<maxHistory>30</maxHistory>
			</rollingPolicy>
			<append>true</append>
			<!-- encoders are assigned the type ch.qos.logback.classic.encoder.PatternLayoutEncoder by default -->
			<encoder>
				<pattern>%msg%n%n</pattern>
			</encoder>
		</appender> 
		<logger name="com.aimms.pro.logging.security" additivity="false">
			<level value="${SECURITY_LOG_LEVEL}" />
			<appender-ref ref="SECURITY_FILE" />
		</logger>

		</included>

 

Files with the similar names but with the date appended contain logs from previous days. For example, *AimmsPROServer.2015-06-21.0.log* contains AIMMS PRO Backend logs for 21st of June 2015.

Log Configuration
-----------------

All log configuration files are located in the ``dataDir`` Config directory. AIMMS PRO 2.0 uses the following log configuration files:

* *AimmsPROServerLog.xml* - AIMMS PRO 2 Server logging
* *AimmsPROSessionLog.xml* - Server-side sessions logging
* *AimmsPROConfiguratorLog.xml* - AIMMS PRO Configurator logging
* *AimmsPROPortalServerLog.xml* - AIMMS PRO 2 Portal logging
* *AimmsPROWebsocketsProxyLog.xml* - AIMMS PRO WS Proxy logging
* *AimmsPROWarLauncherLog.xml* - AIMMS PRO WARLauncher logging

 
Changing the logging Level
--------------------------

For each component, you can specify the detail level at which logging events should take place. By default, all components log at the INFO level. You can modify the logging level by editing the log configuration files mentioned above. In case of unexpected errors, you may want to (temporarily) change the logging level of the corresponding component to DEBUG or
TRACE, which will create a log file containing all available logging events for that component.

* For *AIMMS PRO 2 Service*, changing the log level is very easy: open AimmsPROServerLog.xml and change the value of the property PRO_LOG_LEVEL from INFO to TRACE. The service will automatically reload the configuration file within 30 seconds, no restart is required.
* For the configuration files with the *.cfg* extension, change the entry *log4j.rootLogger=INFO,Logfile* to *log4j.rootLogger=trace,Logfile*. The corresponding service needs to be restarted to pickup the new configuration.
* For the configuration files with the *.xml* extension, look for the node *root* and change the entry *level value="info"* to *level value="trace"*. The corresponding service needs to be restarted to pickup the new configuration.
