COPT
=====
The COPT solver from Cardinal Operations is a high performance solver for :doc:`Linear Programming (LP) <../math-program/linear-programming>`, :doc:`Mixed Integer Programming (MIP) <../math-program/mixed-integer-programming>` and Quadratic Programming (QP/QCP) problems. A detailed list of all features supported by COPT can be found on our :doc:`Solvers <solvers>` page.

COPT Linear Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
COPT offers various algorithms for solving Linear Programming problems: you can choose between the dual simplex algorithm, the parallel barrier algorithm and the parallel concurrent algorithm. The barrier (or interior point) algorithm offers an approach particularly efficient on large sparse problems. COPT can handle sparse matrices very efficiently.

A presolver is used to reduce the size of the problem before it is solved, sometimes by an order of magnitude. COPT is very robust and reliable. It is capable of solving huge, real-world Optimization problems. Almost always the default option settings of COPT are sufficient to solve a problem with excellent solution times.

COPT Mixed Integer Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
COPT can also solve Mixed Integer Programming problems. The COPT branch-and-bound algorithm for solving Mixed Integer Programming problems uses modern features like cutting planes and heuristics to find integer solutions. Combined with the state-of-the-art presolver it makes COPT a very powerful tool for solving large and difficult Mixed Integer Programming problems.

COPT Quadratic Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
COPT can also be used to solve Quadratic Programming (QP) problems which are problems with linear constraints and a (convex) quadratic objective function. COPT can also handle problems that have quadratic constraints: Quadratically Constrained Programming (QCP) problems.

The QCP solver support second-order cone constraints, rotated second-order cone constraints, and more general convex quadratic constraints.

Parallel COPT
-------------------------------------
COPT provides a parallel COPT option allowing you to take advantage of the availability of additional CPUs to speed up performance while it solves a specific model.

Parallel algorithms are included at no additional charge.

About Cardinal Operations
-------------------------------------
`COPT <https://guide.coap.online/copt/en-doc/intro.html>`_ is developed and supported by Cardinal Operations.

COPT Supported Versions
-------------------------------------
AIMMS supports COPT 6.0.