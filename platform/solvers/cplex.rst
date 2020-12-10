CPLEX
==========
IBM ILOG CPLEX Solver
--------------------------
The CPLEX solver from IBM ILOG is a high performance solver for :doc:`Linear Programming (LP) <../math-program/linear-programming>`, :doc:`Mixed Integer Programming (MIP) <../math-program/mixed-integer-programming>` and Quadratic Programming (QP/QCP/MIQP/MIQCP) problems. A detailed list of all features supported by CPLEX can be found on our :doc:`Solvers <solvers>` page.

CPLEX Linear Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
CPLEX offers various algorithms for solving Linear Programming problems: you can choose between the primal or dual simplex algorithm, the barrier algorithm and the network algorithm. The barrier (or interior point) algorithm offers an approach particularly efficient on large sparse problems. CPLEX can handle sparse matrices very efficiently.

A presolver is used to reduce the size of the problem before it is solved, sometimes by an order of magnitude. CPLEX is very robust and reliable. It is capable of solving huge, real-world Optimization problems. Almost always the default option settings of CPLEX are sufficient to solve a problem with excellent solution times.

CPLEX Mixed Integer Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
CPLEX can also solve Mixed Integer Programming problems. The CPLEX branch-and-bound algorithm for solving Mixed Integer Programming problems uses modern features like cutting planes and heuristics to find integer solutions. Combined with the state-of-the-art presolver it makes CPLEX a very powerful tool for solving large and difficult Mixed Integer Programming problems. CPLEX features a Benders decomposition algorithm which can be used to solve linear problems with a decomposable structure (including stochastic programming problems with integer variables in the first stage).

CPLEX Quadratic Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
CPLEX can also be used to solve Quadratic Programming (QP) problems which are problems with linear constraints and a quadratic objective function. CPLEX can also handle the variant with integer variables: Mixed Integer Quadratic Programming (MIQP) problems. CPLEX can also handle problems that have quadratic constraints: Quadratically Constrained Programming (QCP) problems and Mixed Integer Quadratically Constrained Programming (MIQCP) problems.

The QCP and MIQCP solvers support second-order cone constraints, rotated second-order cone constraints, and more general convex quadratic constraints.

Parallel CPLEX
-------------------------------------
CPLEX provides a parallel CPLEX option allowing you to take advantage of the availability of additional CPUs to speed up performance while it solves a specific model. CPLEX offers two modes of operation for the functionality of the parallel Mixed Integer Programming optimizer. In deterministic mode, a newly implemented search algorithm exploits parallelism in solving nodes of the branch-and-cut tree, but produces a repeatable, invariant solution path. In opportunistic mode, the search algorithm, takes full advantage of parallelism; it performs less synchronization between threads and allows random tie breaking, which may result in different solution paths but potentially faster performance.

Parallel algorithms are included at no additional charge.

CPLEX Indicator Constraints
-------------------------------------
CPLEX provides indicators constraints. Indicator constraints are a new constraint type that enable the user to express particular modeling constructs among variables by identifying a binary variable to control whether or not a specified linear constraint is active. Formulations using indicator constraints are more numerically robust and accurate than conventional formulations involving so-called Big M data.

CPLEX Solution Polishing
-------------------------------------
Also the solution polishing heuristic of CPLEX is available in AIMMS to boost performance on certain types of models. Solution Polishing is appropriate for finding the best solutions to complex and difficult Mixed Integer Programming models within a specified time and is used to improve the best solution at the end of the branch-and-cut process if optimality has not been proven. It can also be used instead of the branch-and-cut algorithm if an initial solution can be found in the root node.

CPLEX Tuning Tool
-------------------------------------
CPLEX offers a performance tuning tool to help you analyze whether default option settings are best for your particular model or models and to aid you in adjusting option settings efficiently.

About IBM ILOG CPLEX
-------------------------------------
`IBM ILOG CPLEX <https://www.ibm.com/analytics/cplex-optimizer>`_ is developed and supported by IBM, Inc. IBM ILOG CPLEX is a registered trademark of IBM, Inc.

CPLEX Supported Versions
-------------------------------------
AIMMS supports CPLEX 12.8 – 12.10.