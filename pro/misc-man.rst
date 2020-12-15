Miscellaneous
=============

Case Sensitivity
----------------

AIMMS PRO 2.0 is case insensitive, meaning that the values 'test' and 'Test' are treated as the same value by AIMMS PRO 2.0. Please note that this was not yet the case with AIMMS PRO 1.0. This case insensitivity is valid for all input parameters: user names, environment names, group names, AIMMS application names and versions, the strings in the execution and priority rules structures, etc. The first time any of these parameters is created, the case is saved, but after that, any attempt to create another parameter with the same name, but with a different case will not succeed (failing or returning the already existing name, depending on the situation).

It is very important to start and stop AIMMS PRO services through AIMMS PRO Configurator only in order to get configuration changes propagated in the configuration files when you change some hidden configuration in database, else  this changes will not be reflected.   

AIMMS PRO Installation Healthcheck
----------------------------------

If you want to periodically check your AIMMS PRO installation health, use ``/healthcheck.html`` page (e.g. ``https://your-pro-host/healthcheck.html``). This page will return a JSON document with the version of your AIMMS PRO server and one of the following HTTP codes:

* 200, if everything is all right
* 500, if Portal is up and running, but cannot reach PRO Backend
* 507, if there is less than 10% of free space is available on the disk that holds PRO installation