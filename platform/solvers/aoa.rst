AIMMS Outer Approximation (AOA)
=================================

AOA is a Default AIMMS Solver, available in every AIMMS system.

AOA for Mixed Integer Nonlinear Programming
--------------------------------------------
The AIMMS Outer Approximation (AOA) module uses an outer approximation algorithm to solve :doc:`Mixed Integer Nonlinear Programming (MINLP) <../math-program/mixed-integer-nonlinear-programming>` problems. Outer approximation is a well-known basic approach to solve MINLP problems. The underlying algorithm is an interplay between two solvers, namely one for solving mixed-integer linear problems and one for solving nonlinear problems.

AOA uses the system module ``GMPOuterApproximation``. This module contains a standard outer approximation algorithm that is written in the AIMMS modeling language. The user can customize the individual algorithmic steps in order to achieve such goals as:

* obtaining better performance,
* obtaining a better solution,
* storing multiple integer solutions found by the algorithm,
* being able to use different solvers NLP/MIP solvers during the algorithm in order to increase the chance to obtain feasible solutions, or even
* being able to modify the submodels in a problem-specific manner in between algorithm steps.

For a full description of the outer approximation algorithm implemented in AIMMS see :doc:`lr:optimization-modeling-components/aimms-outer-approximation-algorithm-for-minlp/index`.

GMP Library
-----------
AOA has been implemented by using routines from the `GMP library <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/index.html>`_. The AOA algorithm can be further customized using all available functionality in the GMP library, e.g. to modify the MIP master problem, or add problem-specific constraints.

.. comment: 
  
    An example of a customization of AOA is provided in this paper about a `modified outer approximation algorithm <http://download.aimms.com/aimms/download/papers/rgraph_modified_oa.pdf>`_ for distillation column synthesis.

The AOA module also contains an outer approximation algorithm based on the approach of Quesada & Grossman (1992). This approach uses the branch-and-cut algorithm of :doc:`CPLEX <cplex>` or :doc:`GUROBI <gurobi>` in combination with outer approximation, and often solves convex models with binary variables much faster than other algorithms.
