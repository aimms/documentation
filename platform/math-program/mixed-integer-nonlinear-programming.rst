Mixed Integer Nonlinear Programming
====================================
Mixed Integer Nonlinear Programming (MINLP) problems contain nonlinear expressions and integer variables. Mixed integer nonlinear programming problems are in general more difficult to solve than mixed integer programming problems and nonlinear programming problems.

For a full description of the AIMMS Presolver see Chapter 17 in the :doc:`Language Reference <../../aimms_ref>`.

Benefits of using AIMMS for MINLP
-------------------------------------
Besides the general benefits of using AIMMS, the Outer Approximation (AOA) algorithm that comes with AIMMS make it an excellent tool for modeling mixed integer nonlinear programming problems.

* Customizable: :doc:`AOA <../solvers/aoa>` is an open implementation of the outer approximation algorithm to solve mixed integer nonlinear programming problems. It is written with the AIMMS GMP functions and can be customized by the user to fine tune the algorithm for their specific problem.
* Out of the box Solver: Customization is not needed which makes AOA usable as an out of the box solver for large scale mixed integer nonlinear programming models. AOA uses a combination of a mixed integer programming and nonlinear programming solver to solve the mixed integer nonlinear programming problems.
* Solver Flexibility: Any combination of the mixed integer programming and nonlinear programming solvers available can be used.
* Efficient Presolver: AIMMS is equipped with a Presolver. With a presolve, problems can be solved faster and the solution can improve.

MINLP Solvers
-------------
Standard Solvers
^^^^^^^^^^^^^^^^
Next to AOA, AIMMS supports :doc:`BARON <../solvers/baron>` and :doc:`Knitro <../solvers/knitro>` as solvers to solve mixed integer nonlinear optimization problems. BARON is a global optimizer while AOA and Knitro can only guarantee local optima (unless the problem is convex).

Open Solver Interface
^^^^^^^^^^^^^^^^^^^^^
The AIMMS :doc:`Open Solver Interface <../solvers/open-solver-interface>` allows solver developers to link their own (mixed integer nonlinear programming) solvers to AIMMS themselves.

MINLP Application Example
---------------------------
* `Investment Portfolio Selection <https://github.com/aimms/examples/tree/master/Modeling%20Book/Investment%20Portfolio%20Selection>`_
