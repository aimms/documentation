System Requirements
===================

.. note::

    This section of the AIMMS PRO documentation does *not* apply to the `AIMMS Cloud Platform <../cloud/index.html>`_. See `here <../cloud/requirements.html>`_ for AIMMS Cloud Platform specific system requirements.

AIMMS PRO comprises both server- and client-side components. In this section we will describe the minimum server requirements for running AIMMS PRO, as well as requirements for desktop users connecting to the AIMMS PRO Server through the AIMMS PRO client.

Minimum Server Requirements
---------------------------

The minimum server requirements for **Windows Server** are:

* Windows Server 2008 64-bit or Windows Server 2012 64-bit or Windows Server 2016 64-bit, up-to-date with latest security patches
* minimum of 4 cores
* minimum of 16 GB RAM
* 500 GB available hard disk space

.. note::

	For Windows Server lower than 2016 you may need to install an update for Universal C Runtime (CRT). Please refer `Update for Universal C Runtime in Windows <https://support.microsoft.com/en-us/help/2999226/update-for-universal-c-runtime-in-windows>`_.

In assessing the actual server requirements, you have to take into account the anticipated number of concurrent server sessions n, in which case n + 1 cores would be advisable. Similarly, the memory requirements for the server are determined by the size of the data of the largest job running on the server multiplied by the number of concurrent server sessions. Using AIMMS PRO over time may accumulate application data in the PRO storage directory.

Client Requirements
-------------------

Client requirements differs a bit depending on the use and type of the AIMMS Applications(WinUI/WebUI).

**For developing a WinUI/WebUI applications and using WinUI applications:**

* Windows 7 or higher, 32-bit (x86) or 64-bit (x64)
* At least 8 GB RAM, maximum model size is only restricted by available RAM
* 10 GB of available hard disk space
* Browser: recent Chrome version, Internet Explorer 11 or recent Edge version


**For using WebUI applications**

* Any operating system including Windows, MacOS and iOS
* Browser: recent Chrome version, Internet Explorer 11 or recent Edge version. 
* For iOS the Safari browser is supported
* For applications that have been built with the previous generation UI builder, ‘WinUI’ additional browsers are supported: IE8+, Firefox and Opera.


Network Requirements
--------------------

As far as network requirements are concerned, specifying an exact number for client apps is very application-specific. While for AIMMS apps with a WebUI the bandwidth requirements are mostly determined by the amount of data actually displayed on a page, and the rate at which this data needs to be updated, for AIMMS apps deploying a Windows desktop client bandwidth usage are of a much more spiky nature. The main bandwidth consumption in this case comes from streaming the runtime and app (if not already cached on the user's desktop), and case files containing the application inputs and results being communicated with the server. Depending the size of typical case files for a specific app, the maximum bandwidth requirements are mainly determined by the download times of case files, such that these still lead to an acceptable user experience.  

Please note that most AIMMS apps are intended to serve as *decision support* applications. Typical for such applications is the ability for the end-user to ''play'' with all available data in the application in order to understand and gain confidence in the presented solution, and observe the sensitivities of the model output with respect to changes in the input data. For this reason, AIMMS apps hold all available data in memory, which may lead to spikes in network traffic not seen in typical transaction systems.

Concurrent Connections
----------------------

By default AIMMS PRO allows 50 concurrent connections, that means it's possible to run 25 desktop applications(solver sessions) or 50 WebUI applications(data sessions) at the same time. Please note that any desktop application requires 2 connections and any WebUI application requires 1 connection. If you really want to make 50 concurrent connection then you should increase the memory limits for AimmsPROWebService. (Go to C:\\Program Files\\AimmsPRO 2.0\\AimmsPROWebService.cfg. Inside this config file you can find "-Xms256m","-Xmx512m" parameters under '"jvmOptions" section. Change these parameters to "-Xms512m","-Xmx1024m").

License Session Count
---------------------

Starting from *AIMMS PRO 2.13.3* and *AIMMS License Server 4.0.0.50*, Client license sessions are now counted per user/device combination, instead of per session. Which means one user can now run multiple apps whilst only occupying one session.

