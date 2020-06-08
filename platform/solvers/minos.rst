MINOS
=========

MINOS Solver for Nonlinear Programming
--------------------------------------
The MINOS solver is a :doc:`Nonlinear Programming (NLP) <../math-program/nonlinear-programming>` solver. MINOS is especially effective for problems with a nonlinear objective function and sparse linear constraints (e.g., quadratic programs). MINOS can also process large numbers of nonlinear constraints. The nonlinear functions should be smooth, but need not be convex.

CONOPT, Knitro, IPOPT and SNOPT are in general more efficient Nonlinear Programming solvers than MINOS, but MINOS may be more efficient if the objective and its gradients are cheap to evaluate.

About MINOS
------------
MINOS is developed and supported by `Stanford Business Software, Inc <http://sbsi-sol-optimize.com/asp/sol_product_minos.htm>`_.


MINOS Supported Versions
-----------------------------
AIMMS supports MINOS 5.5.