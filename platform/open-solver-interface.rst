:orphan:

Open Solver Interface
=====================
The AIMMS Open Solver Interface (OSI) allows you to link solvers to AIMMS through a collection of C++ interfaces. So if you do not find the solver of your liking and you want to link your own preferred solver to AIMMS, you can use the AIMMS OSI. It will allow AIMMS and this solver to communicate and solve a mathematical program instance, and it supports callbacks during the solution process into AIMMS.

Some of the interfaces are implemented by AIMMS and provide services to a solver, e.g. to allow a solver to

* retrieve the current values of solver-specific options,
* retrieve the row, column and matrix data,
* compute nonlinear function values, Jacobians and Hessians for nonlinear constraints, and
* call AIMMS-provided callback functions.

A solver must implement a number of interfaces to allow AIMMS to

* retrieve the collection of options supported by the solver,
* initiate the solution process, 
* request an IIS for an infeasible problem, and
* retrieve the solution from the solver. 

You can find more information about the AIMMS OSI in the `Open Solver Interface User’s Guide and Reference <http://download.aimms.com/aimms/AimmsOSI/frames.html?frmname=topic&frmfile=index.html>`_.

The solvers CBC and IPOPT are linked to AIMMS using the AIMMS OSI. The links to these solvers are publically available as part of the AIMMSlinks project, which is an open source project at `COIN-OR <https://github.com/coin-or/AIMMSlinks>`_.
