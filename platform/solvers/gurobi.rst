Gurobi
=========
As of March 2016, AIMMS no longer resells the Gurobi Solver as part of an AIMMS license, nor is the Gurobi Solver part of the Free AIMMS Academic license going forward. 

Commercial and Academic users that purchased the Gurobi Solver in the past as an add-on to an AIMMS license and have it active and keep it maintained will still receive Gurobi Solver updates with an AIMMS license update going forward. 

In case a Gurobi Solver is needed in the future (e.g. with a new license), AIMMS offers an AIMMS Gurobi Solver Link Only, and the Gurobi Solver license needs to be acquired from Gurobi Optimization.

The AIMMS Gurobi Solver Link Only is offered at no charge with the Free AIMMS Academic License. 

For commercial AIMMS Licenses an add-on fee is required. 

Please contact info@aimms.com to learn more.
 

Gurobi Solver for Linear and Mixed Integer Programming
--------------------------------------------------------
Gurobi is a state-of-the-art solver for :doc:`Linear Programming (LP) <../math-program/linear-programming>`, :doc:`Mixed Integer Programming (MIP) <../math-program/mixed-integer-programming>` and Quadratic Programming (QP/QCP/MIQP/MIQCP) problems. A detailed list of all features supported by Gurobi can be found on our :doc:`Solvers <solvers>` page.

Gurobi Linear Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For continuous models, Gurobi includes advanced implementations of the latest algorithms including: primal and dual simplex algorithms, a parallel barrier algorithm with crossover, (parallel) concurrent optimization, and a sifting algorithm. Gurobi includes a parallel barrier optimizer for linear problems; Gurobi’s barrier algorithms fully exploit the features of the latest computer architectures.

To help simplify a given model, identify any obvious errors or problems, and identify likely useful approaches for getting the best answer in the least amount of time, Gurobi takes advantage of the broadest range of advanced presolve capabilities available.

Gurobi Mixed Integer Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For Mixed Integer Programming (MIP) models, Gurobi includes advanced implementations of the latest MIP algorithms including: deterministic, parallel branch-and-cut, non-traditional tree-of-trees search, multiple default heuristics, solution improvement, cutting planes, and symmetry detection. Gurobi allows for shared memory parallelism, and thus is capable of simultaneously exploiting any number of processors and cores per processor. Its implementation is deterministic and thus two separate runs on the same model will produce identical solution paths.

Gurobi Quadratic Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Gurobi can be used to solve Quadratic Programming (QP) problems which are problems with linear constraints and a quadratic objective function. Gurobi can also handle the variant with integer variables: Mixed Integer Quadratic Programming (MIQP) problems. Gurobi can also handle problems that have quadratic constraints: Quadratically Constrained Programming (QCP) problems and Mixed Integer Quadratically Constrained Programming (MIQCP) problems.

The QCP and MIQCP solvers support second-order cone constraints, rotated second-order cone constraints, and more general convex quadratic constraints. Starting with version 9.0, Gurobi can also be used to solve problems with a non-convex quadratic objective and/or non-convex quadratic constraints.

Gurobi Global Optimization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Gurobi 12.0 can solve global nonlinear optimization models with integer variables (MINLP) or without (NLP). 

Parallel Gurobi
----------------------------
Gurobi provides a parallel Gurobi option allowing you to take advantage of the availability of additional CPUs to speed up performance while it solves a specific model. Parallel algorithms are included at no additional charge.

Gurobi Indicator Constraints
----------------------------
Gurobi provides indicators constraints. Indicator constraints are a new constraint type that enable the user to express particular modeling constructs among variables by identifying a binary variable to control whether or not a specified linear constraint is active. Formulations using indicator constraints are more numerically robust and accurate than conventional formulations involving so-called Big M data.

About Gurobi
----------------------------
Gurobi is developed and supported by `Gurobi Optimization, Inc <http://www.gurobi.com>`_. a company founded in 2008 by Robert Bixby, Zonghao Gu and Edward Rothberg.


Gurobi Requirements
----------------------------
Gurobi requires that the computer’s CPU supports SSE2. Most modern computers support SSE2 (SSE2 was introduced by Intel in 2001 and by AMD in 2003).

Gurobi Supported Versions
----------------------------
AIMMS supports Gurobi 10.0 – 12.0.