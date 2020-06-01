Technical Specifications
========================
Platform availability
---------------------

Platform versions
+++++++++++++++++++++

The Windows 64-bit and Linux 64-bit platform versions of AIMMS Developer have some different functionality compared to the Windows 32-bit platform. A summary of major differences is given in the tables below.

Note that AIMMS Developer 4.71.1 and higher do not include 32-bit versions.

Function availability
+++++++++++++++++++++++++++

+-+-+
|Functionality	|	Windows	|Linux|
+-+-+
|Developer Version|		✔	| |
+-+-+
|End User Version|		✔	| |
+-+-+
|Component Version|		✔|	✔|
+-+-+
|Active-X objects|	✔|	✔	|
+-+-+
|Advanced IDE	|	✔	| |
+-+-+
|XML Schema Mapping dialog|	✔|	✔|
+-+-+	
|ODBC linkage	|	✔	|✔|
+-+-+
|OLE DB linkage	|	✔	| |
+-+-+
|Excel Add-in	|	✔	| |
+-+-+
|Excel Functions|		✔|	✔|
+-+-+
|Unicode support	|	✔|	✔|
+-+-+
|Nodelock licensing	|	✔	|✔|
+-+-+
|License server	|	✔	| |
+-+-+

Solver availability
+++++++++++++++++++

+-+---+---+
|	Windows|	Linux|
+-+-+-+-+-+
|Solvers	|Solver & Solver Link	|Solver Link Only|	Solver & Solver Link|	Solver Link Only|
+-+-+-+-+-+
|AOA|		✔|	|	✔|	|
+-+-+-+-+-+
|BARON|		✔|	|	|	|
+-+-+-+-+-+
|CBC|		✔|	|	✔|	|
+-+-+-+-+-+
|CP Optimizer|	✔|	✔|	✔|	✔|
+-+-+-+-+-+
|CPLEX|		✔|	✔|	✔|	✔|
+-+-+-+-+-+
|GUROBI	|	|	✔|	|	✔|
+-+-+-+-+-+
|IPOPT|		✔|	|	✔|	|
+-+-+-+-+-+
|KNITRO|	✔|	✔|	✔|	✔|
+-+-+-+-+-+
|MINOS|		✔|	✔|	✔|	✔|
+-+-+-+-+-+
|PATH|		✔|	✔|	✔|	✔|
+-+-+-+-+-+
|SNOPT|		✔|	✔|	✔|	✔|
+-+-+-+-+-+
|XA|		✔|	✔|	✔|	✔|
+-+-+-+-+-+

System requirements
---------------------

Windows x64
++++++++++++++++

+-+-+
|Attribute|	Requirement|
+-+-+
|OS	|Microsoft Windows 10 or higher (for x64)|
+-+-+
|Processor	|AMD or Intel x64 system|
+-+-+
|RAM|	2 GB|
+-+-+
|Free space|	1 GB|
+-+-+
|Display	|XGA display adapter and monitor|
+-+-+

As of AIMMS 4.71, we no longer offer AIMMS for Windows x32.

Linux x64
++++++++++++++

Requirements for the portable Intel Linux AIMMS component release:

+-+-+
|Attribute	|Requirement|
+-+-+
|OS|	Centos 6, Red Hat 6, or Ubuntu 12.04 Linux operating system|
+-+-+
|Processor	|Intel x64 compatible system|
+-+-+
|RAM	|1 GB|
+-+-+
|Free space	|1 GB|
+-+-+

The portable component version has initially been ported to the Intel Linux operating system. Please contact AIMMS Support if you would like to have the portable component available on a specific 64-bit Linux/Unix operating system.


Dataset size
------------

The minimum system requirements listed for Windows and Linux are needed to run medium-sized AIMMS Developer projects and datasets without performance degradation.

This may depend on other applications that are active while running AIMMS.

When running an AIMMS project for larger datasets, the large memory requirements can cause disk swapping. This is also likely if you reduce the amount of installed or available RAM.

To improve the overall performance of both AIMMS and other active applications, we recommend to install additional RAM.

See our `Execution Efficiency <https://how-to.aimms.com/C_Developer/Sub_Language/sub_efficiency/index.html>`_ articles for help to work efficiently with large projects.