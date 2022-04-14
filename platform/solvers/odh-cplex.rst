ODH-CPLEX
==========
ODH-CPLEX Solver for Mixed Integer Programming
-------------------------------------------------
ODH-CPLEX is a high performance solver for :doc:`Mixed Integer Programming (MIP) <../math-program/mixed-integer-programming>` and Mixed Integer Quadratic Programming (MIQP/MIQCP) problems. ODH-CPLEX uses the solver :doc:`CPLEX <cplex>` underneath.

ODH-CPLEX on Multiprocessor Machines
----------------------------------------
ODH-CPLEX is a solver designed to run on modern multiprocessor machines. Many cores are exploited by the ODH-CPLEX engine by breaking complex models and difficult MIPs into sub-models and solving them into parallel threads. ODH-CPLEX combines this new algorithm with CPLEX specifically to find solutions for difficult and/or massive MIP models. ODH-CPLEX is designed for scheduling problems but works for any MIP which has a reasonable number of integer feasible solutions. It has been deployed effectively on packing problems, supply chain and telecoms as well as scheduling applications. On large scale MIPs it provides good solutions and optimality measures that are often beyond the reach of traditional optimization methods.

About ODH-CPLEX
-----------------
ODH-CPLEX is developed and supported by `Optimization Direct, Inc <http://www.optimizationdirect.com/>`_.


ODH-CPLEX Supported Versions
-----------------------------
AIMMS supports ODH-CPLEX 4.0 - 5.3.
