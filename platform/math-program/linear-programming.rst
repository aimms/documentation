Linear Programming
=====================
Linear programming is a mathematical technique used in solving a variety of problems related with management, from scheduling, media selection, financial planning to capital budgeting, transportation and many others, with the special characteristic that linear programming expect always to maximize or minimize some quantity.

Linear programming helps to make the best possible use of available productive resources Linear Programming (LP) problems involve the Linear Optimization of a linear objective function, subject to linear equality and inequality constraints. In addition all variables in a linear programming model are continuous. There are efficient solution methods for linear programming models and even most very large linear programming models can be solved by the :doc:`available linear programming solvers <../solvers/solvers>`.

AIMMS for Linear Programming
----------------------------------------------
Besides the general benefits of using AIMMS, there there are specific functionalities that make AIMMS excellent software for modeling linear programming problems:

* Interface for solvers: Like other mathematical modeling languages, AIMMS provides a full interface to the best linear programming solvers, allowing you to control the performance of linear programming solvers via option settings, callbacks, and inspection of the statistics the solvers give back, such as reduced costs.
* Extended analytics tools: AIMMS is equipped with the `Mathematical Program Inspector <https://download.aimms.com/aimms/download/manuals/AIMMS3UG_MathProgramInspector.pdf>`_, a tool that lets you inspect your linear programming model and solution, execute “what-if” scenarios, analyze bounds, etc. This makes debugging your model very easy.

Linear Programming Solvers
------------------------------
Standard Solvers
^^^^^^^^^^^^^^^^^^^^
AIMMS supports the solvers :doc:`CPLEX <../solvers/cplex>`, :doc:`GUROBI <../solvers/gurobi>`, :doc:`CBC <../solvers/cbc>` and :doc:`XA <../solvers/xa>` to solve Linear Programming models. A comparison of the features available in these solvers can be found on our :doc:`Solvers <../solvers/solvers>` page.

Open Solver Interface
^^^^^^^^^^^^^^^^^^^^^^^
The AIMMS :doc:`Open Solver Interface <../solvers/open-solver-interface>` allows solver developers to link their own solvers to AIMMS themselves.

Application Examples
---------------------

* `Distribution Center Allocation <https://github.com/aimms/examples/tree/master/Application%20Examples/Distribution%20Center%20Allocation>`_
* `Farm Planning <https://github.com/aimms/examples/tree/master/Modeling%20Book/Farm%20Planning>`_
* `Inventory Control <https://github.com/aimms/examples/tree/master/Modeling%20Book/Inventory%20Control>`_
* `Telecommunication Network Design <https://github.com/aimms/examples/tree/master/Modeling%20Book/Telecommunication%20Network%20Design>`_
* `Transport Model <https://github.com/aimms/examples/tree/master/Application%20Examples/Transport%20Model>`_

