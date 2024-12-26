Technical Specifications
========================

On this page you'll find information about platform availability and system requirements.

Platform availability
---------------------

Platform versions
+++++++++++++++++++++

The AIMMS Development Software is offered as a Windows 64-bit versions only. For deployment, one can use AIMMS PRO or AIMMS Cloud (the managed version of AIMMS PRO); the latter is the preferred deployment option for AIMMS Apps. 
For special deployments, we offer Linux versions (please contact support@aimms.com to learn more).

Solver availability
+++++++++++++++++++

+--------------+----------------------+------------------+
| Solvers      | Solver + Solver Link | Solver Link Only |
+--------------+----------------------+------------------+
| AOA          | ✔                    |                  |
+--------------+----------------------+------------------+
| BARON        | ✔                    |                  |
+--------------+----------------------+------------------+
| CBC          | ✔                    |                  |
+--------------+----------------------+------------------+
| CONOPT       | ✔                    |                  |
+--------------+----------------------+------------------+
| COPT         | ✔                    |                  |
+--------------+----------------------+------------------+
| CP Optimizer | ✔                    | ✔                |
+--------------+----------------------+------------------+
| CPLEX        | ✔                    | ✔                |
+--------------+----------------------+------------------+
| GUROBI       |                      | ✔                |
+--------------+----------------------+------------------+
| IPOPT        | ✔                    |                  |
+--------------+----------------------+------------------+
| Knitro       | ✔                    | ✔                |
+--------------+----------------------+------------------+
| MINOS        | ✔                    | ✔                |
+--------------+----------------------+------------------+
| Octeract     | ✔                    |                  |
+--------------+----------------------+------------------+
| ODH-CPLEX    | ✔                    |                  |
+--------------+----------------------+------------------+
| PATH         | ✔                    | ✔                |
+--------------+----------------------+------------------+
| SNOPT        | ✔                    | ✔                |
+--------------+----------------------+------------------+

System requirements
---------------------

Windows x64
++++++++++++++++

+------------+------------------------------------------+
| Attribute  | Requirement                              |
+============+==========================================+
| OS         | Microsoft Windows 10 or higher (for x64) |
+------------+------------------------------------------+
| Processor  | AMD or Intel x64 system                  |
+------------+------------------------------------------+
| RAM        | 2 GB                                     |
+------------+------------------------------------------+
| Free space | 1 GB                                     |
+------------+------------------------------------------+
| Display    | XGA display adapter and monitor          |
+------------+------------------------------------------+

As of AIMMS 4.71, we no longer offer AIMMS for Windows x32.

Linux x64
++++++++++++++

Requirements for the portable Intel Linux AIMMS component release:

+------------+------------------------------------------------------------------+
| Attribute  | Requirement                                                      |
+============+==================================================================+
| OS         | Red Hat 8 or higher, Alma Linux 8.10 or higher, or Ubuntu 20.04  |
+------------+------------------------------------------------------------------+
| Processor  | Intel x64 compatible system                                      |
+------------+------------------------------------------------------------------+
| RAM        | 2 GB                                                             |
+------------+------------------------------------------------------------------+
| Free space | 1 GB                                                             |
+------------+------------------------------------------------------------------+

The portable component version has initially been ported to the Intel Linux operating system. Please contact AIMMS Support if you would like to have the portable component available on a specific 64-bit Linux/Unix operating system.


Dataset size
------------

The minimum system requirements listed for Windows and Linux are needed to run medium-sized AIMMS Developer projects and datasets without performance degradation.

This may depend on other applications that are active while running AIMMS.

When running an AIMMS project for larger datasets, the large memory requirements can cause disk swapping. This is also likely if you reduce the amount of installed or available RAM.

To improve the overall performance of both AIMMS and other active applications, we recommend to install additional RAM.

See our `Execution Efficiency <https://how-to.aimms.com/C_Developer/Sub_Language/sub_efficiency/index.html>`_ articles for help to work efficiently with large projects.
