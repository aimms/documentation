Knitro
=======
The Free Academic License does not contain a Knitro license. A special academic Knitro license is available within the paid academic program.

Knitro Solver for (Mixed Integer) Nonlinear Programming
----------------------------------------------------------
Knitro from Artelys is a solver for :doc:`Nonlinear Programming (NLP) <../math-program/nonlinear-programming>` problems, including problems with complementarity constraints (MPCC, MCP), equality and inequality constraints (both convex and nonconvex), and bound constraints. Special handling is provided for LPs, QPs, systems of nonlinear equations, and nonlinear least squares problems. Knitro can also be used to solve :doc:`Mixed Integer Nonlinear Programming (MINLP) <../math-program/mixed-integer-nonlinear-programming>` problems.

Nonlinear Programming
^^^^^^^^^^^^^^^^^^^^^^^
Knitro provides four different state-of-the-art algorithms to address the wide range of nonlinear optimization applications:

* a barrier method with direct factorization,
* a barrier method using the conjugate gradient method,
* an active set method, and
* a sequential quadratic programming method.

Knitro can solve these four algorithms in parallel using multiple threads.

This equips the user with a range of tools to achieve the best performance for a particular problem. For example, approximate solution points determined by a barrier algorithm can be converged to more accurate solutions by crossing over to the active set algorithm.

All algorithms use exact second order derivatives from AIMMS, and scale efficiently to solve nonlinear problems with tens or even hundreds of thousands of variables and constraints.

Nonlinear programming problems are often non-convex and in that case there may be many locally optimal solutions. Normally Knitro returns the first locally optimal solution found but Knitro offers a multi-start algorithm that searches for a better optimal solution by restarting Knitro from different initial points.

Mixed Integer Nonlinear Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Knitro features two algorithms for solving mixed integer nonlinear programming (MINLP) problems. The first is a nonlinear branch-and-bound method and the second implements the hybrid Quesada-Grossman method for convex MINLP. The Knitro MINLP code is designed for convex mixed integer nonlinear programming and is a heuristic for non-convex problems.

About Knitro
--------------
Knitro is developed and supported by `Artelys <http://www.artelys.com/en/optimization-tools/knitro>`_, and has been solving commercial optimization applications since 2001. Knitro is a registered trademark of Artelys.

Knitro Supported Versions
-----------------------------
AIMMS supports Knitro 11.0 – 12.0.
