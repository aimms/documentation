Nonlinear Programming
======================
Nonlinear programming (NLP) is the process of solving a system of equalities and inequalities, collectively termed constraints, over a set of unknown real variables, along with an objective function to be maximized or minimized, where some of the constraints or the objective function are nonlinear.

Nonlinear programming problems are in general more difficult to solve than linear programming problems, and often the solution found is only a local optimum. The solution methods for nonlinear programming models vary, which can result in different nonlinear solvers giving different local optima for the same problem.

Benefits of using AIMMS for Nonlinear Programming
---------------------------------------------------
Besides the general benefits of using AIMMS, there is some specific functionality that makes AIMMS excellent for modeling nonlinear programming problems.

* Efficient Presolver: AIMMS is equipped with a Presolver. With a presolve, nonlinear problems can be solved faster and the solution can improve. The nonlinear programming solver may even find a feasible solution for problems declared infeasible without the presolve, and in other cases provide proof that it really is infeasible.
* Multistart Algorithm: AIMMS comes with an open customizable multistart algorithm which may increase the chance of finding a good final solution.
* Efficient Hessian Calculation: AIMMS contains an efficient implementation of Hessian calculation which can speed up the solution process of some nonlinear programming solvers.
* Find the right solver: As the performance of the various available nonlinear programming solvers depends heavily on the specific problem, AIMMS makes it very easy to find the best solver for your specific problem by supporting links to many solvers.

For a full description of the AIMMS Presolver and the multistart algorithm see :doc:`lr:optimization-modeling-components/advanced-methods-for-nonlinear-programs/the-aimms-presolver`.


Nonlinear Programming solvers
--------------------------------
Standard Nonlinear Programming Solvers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AIMMS supports the solvers :doc:`CONOPT <../solvers/conopt>`, :doc:`Knitro <../solvers/knitro>`, :doc:`IPOPT <../solvers/ipopt>`, :doc:`SNOPT <../solvers/snopt>` and :doc:`MINOS <../solvers/minos>` to solve nonlinear programming models. AIMMS also supports the global Optimization (GO) solvers :doc:`BARON <../solvers/baron>` and :doc:`Octeract <../solvers/Octeract>`, which can find global optima for a certain subset of nonlinear programming problems, while the other solvers only guarantee local optima.

Open Solver Interface
^^^^^^^^^^^^^^^^^^^^^^^^
The AIMMS :doc:`Open Solver Interface <../solvers/open-solver-interface>` allows solver developers to link their own nonlinear programming solvers to AIMMS themselves.

Nonlinear Programming Application Examples
----------------------------------------------
* `Circle Packing <https://github.com/aimms/examples/tree/master/Application%20Examples/Circle%20Packing>`_
* `Distribution Center Allocation <https://github.com/aimms/examples/tree/master/Application%20Examples/Distribution%20Center%20Allocation>`_
* `Life Cycle Consumption <https://github.com/aimms/examples/tree/master/Application%20Examples/Life%20Cycle%20Consumption>`_
* `Refinery Pooling Planning <https://github.com/aimms/examples/tree/master/Modeling%20Book/Refinery%20Pooling%20Planning>`_
* `Two Level Decision Problem <https://github.com/aimms/examples/tree/master/Modeling%20Book/Two%20Level%20Decision>`_

