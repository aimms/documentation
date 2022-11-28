Mixed Integer Programming
==============================
Mixed integer programming (MIP) problems involve the optimization of a linear objective function, subject to linear equality and inequality constraints. Some or all of the variables are required to be integer. Mixed integer programming problems are in general more difficult to solve than linear programming problems but AIMMS is equipped with the best high-performance solvers available.

AIMMS for Mixed Integer Programming
---------------------------------------
Besides the general benefits of using AIMMS, there are specific functionalities that make AIMMS an excellent tool for modeling mixed integer programming problems:

* Interface for solvers: Like other mathematical modeling languages, AIMMS provides a full interface to the best mixed integer solvers which allow you to control the performance of mixed integer solvers via option settings, and inspect the solution and statistics the solvers give back.
* Extended analytics tools: AIMMS is equipped with the Mathematical Program Inspector, a tool that lets you inspect your mixed integer model and mixed integer solution, execute “what-if” scenarios, analyze bounds, etc. This makes debugging your model very easy.
* Solver control callbacks: AIMMS also supports the solver control callbacks, which one may want to use to influence the solver, e.g., for branching, adding cuts, heuristics and incumbent solutions.

Mixed Integer Programming Solvers
-----------------------------------
Standard Solvers
^^^^^^^^^^^^^^^^^^^^^
AIMMS supports the mixed integer solvers :doc:`CPLEX <../solvers/cplex>`, :doc:`GUROBI <../solvers/gurobi>`, :doc:`CPLEX <../solvers/cplex>` and :doc:`CBC <../solvers/cbc>` to solve mixed integer programming models. A comparison of the features available in these solvers can be found on our :doc:`Solvers <../solvers/solvers>` page.

Open Solver Interface
^^^^^^^^^^^^^^^^^^^^^^^^
The AIMMS Open Solver Interface allows solver developers to link their own mixed integer programming solvers to AIMMS themselves.

Mixed Integer Programming Application Examples
----------------------------------------------
* `Bandwidth Allocation <https://github.com/aimms/examples/tree/master/Modeling%20Book/Bandwidth%20Allocation>`_
* `Car Selection <https://github.com/aimms/examples/tree/master/Application%20Examples/Car%20Selection>`_
* `Employee Scheduling <https://github.com/aimms/examples/tree/master/Application%20Examples/Employee%20Scheduling>`_
* `Facility Location <https://github.com/aimms/examples/tree/master/Modeling%20Book/Facility%20Location%20Choice>`_
* `Flow Shop <https://github.com/aimms/examples/tree/master/Application%20Examples/Flow%20Shop>`_
* `Knapsack Problem <https://github.com/aimms/examples/tree/master/Application%20Examples/Knapsack%20Problem>`_
* `Sudoku <https://github.com/aimms/examples/tree/master/Application%20Examples/Sudoku>`_