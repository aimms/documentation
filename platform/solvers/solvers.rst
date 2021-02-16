Solvers availability
====================

AIMMS, as a complete optimization modeling system, comes with all
functionality to develop and create complete optimization applications.
This means that a large set of mathematical model types (Linear, Mixed
Integer, Nonlinear, Mixed Integer Nonlinear, etc.) can be formulated
within AIMMS. AIMMS uses solvers to optimize mathematical models.
Depending on the solvers available with your license, you are able to
solve the models at a requested performance (high and medium performance
solvers do exist for most model types).

The standard license of AIMMS includes the world-class solver
CPLEX.
The installation package of AIMMS also has
the `COIN-OR <http://www.coin-or.org/>`__ solvers CBC (LP/MIP) and IPOPT
(NLP) included; these two solvers are not owned or serviced by the AIMMS
company – they are by the open source community – but can be also used
by any AIMMS user. This set of solvers, together with the freely
available :doc:`advanced-algorithms`
set of AIMMS such as AIMMS Outer Approximation, Benders Decomposition
and more – offers a great start for creating optimization applications.
Of course, the set of solvers available in a license can be extended by
other `commercial solver
add-ons <https://www.aimms.com/support/licensing>`__.

All solvers are connected to AIMMS by using the :doc:`AIMMS Open Solver
Interface <open-solver-interface>`,
which link solvers through a collection of C++ interfaces.

Contents
--------

-  :ref:`available-solvers`
-  :ref:`robust-optimization-add-on`
-  :ref:`supported-math-program-types`
-  :ref:`math-program-types-explanation`
-  :ref:`lp-and-mip-solver-features`

.. _available-solvers:

Available Solvers in AIMMS
--------------------------

+-----------------+----------------------------------+--------------------------+
| Solver          | Description                      | Available on AIMMS Cloud |
+=================+==================================+==========================+
| AOA             | White box AIMMS Outer            |                          |
|                 | Approximation module for solving | ✔                        |
|                 | mixed integer nonlinear          |                          |
|                 | programming                      |                          |
+-----------------+----------------------------------+--------------------------+
| BARON           | Branch-And-Reduce Optimization   |                          |
|                 | solver for global optimization   | ✔                        |
|                 |                                  |                          |
+-----------------+----------------------------------+--------------------------+
| CBC             | Open source linear programming / |                          |
|                 | mixed integer programming solver | ✖                        |                     
|                 | at COIN-OR                       |                          |
+-----------------+----------------------------------+--------------------------+
| CONOPT          | Large-scale nonlinear            |                          |
|                 | programming solver from Arki     | ✔                        |
|                 | Consulting                       |                          |
+-----------------+----------------------------------+--------------------------+
| CPLEX           | High performance linear          |                          |
|                 | programming / mixed integer      | ✔                        |
|                 | programming solver from IBM ILOG |                          |
+-----------------+----------------------------------+--------------------------+
| CP Optimizer    | State-of-the-art constraint      |                          |
|                 | programming solver from IBM ILOG | ✔                        |
|                 |                                  |                          |
|                 |                                  |                          |
+-----------------+----------------------------------+--------------------------+
| GUROBI          | High performance linear          |                          |
|                 | programming / mixed integer      | ✖                        |
|                 | programming solver from Gurobi   |                          |
|                 | Optimization                     |                          |
+-----------------+----------------------------------+--------------------------+
| IPOPT           | Open source Interior Point       |                          |
|                 | optimizer for large-scale        | ✖                        |
|                 | nonlinear optimization at        |                          |
|                 | COIN-OR                          |                          |
+-----------------+----------------------------------+--------------------------+
| KNITRO          | Large-scale nonlinear            |                          |
|                 | programming solver from Artelys  | ✔                        |
|                 |                                  |                          |
+-----------------+----------------------------------+--------------------------+
| MINOS           | Nonlinear programming solver     |                          |
|                 | from Stanford University         | ✖                        |
|                 |                                  |                          |
+-----------------+----------------------------------+--------------------------+
| ODH-CPLEX       | High performance mixed integer   |                          |
|                 | programming solver from          | ✔                        |
|                 | Optimization Direct              |                          |
+-----------------+----------------------------------+--------------------------+
| PATH            | Newton-based solver for solving  |                          |
|                 | mixed complementarity            | ✖                        |
|                 | programming                      |                          |
+-----------------+----------------------------------+--------------------------+
| SNOPT           | Nonlinear programming solver     |                          |
|                 | from Stanford University         | ✖                        |
|                 |                                  |                          |
+-----------------+----------------------------------+--------------------------+

.. _robust-optimization-add-on:

Robust Optimization Add-on
--------------------------

AIMMS offers a commercial Robust Optimization Add-on (RO) to incorporate
uncertainty (e.g. development of the energy price) into your model.
AIMMS RO considers data uncertainties against whose realizations the
solution is required to remain feasible. This uncertainty may occur in
any part of the model data. Partial feasibility can be included by
adding probabilities to constraints (e.g. the chance that demand is met
is at least 95%). 

You can add this add-on upon purchase of your AIMMS licenses, or add it
later; please be advised that the RO Add-on recommends an AIMMS license
that also contains the CPLEX Solver.

Note: This Robust Optimization add-on was built in co-operation with
professor Aharon Ben-Tal and the Technion Institute.

.. _supported-math-program-types:

Supported Math Program Types
----------------------------

If you would like to extend the power of AIMMS (beyond the open source
COIN-OR solvers and AOA algorithm) with commercial solvers, we offer you
the possibility to add commercial solvers to AIMMS. If you already have
a license for one of the available additional solvers (in the form of a
callable library), you can also request a *Solver Link* and use your
existing solver license with AIMMS.

+--------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| Solver | LP  | MIP | QP  | MIQP | QCP | MIQCP | NLP | MINLP | MCP | MPCC | GO  | CP  |
+========+=====+=====+=====+======+=====+=======+=====+=======+=====+======+=====+=====+
| CBC    | ✔   | ✔   |     |      |     |       |     |       |     |      |     |     |
+--------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| IPOPT  | ✔   |     | ✔   |      | ✔   |       | ✔   |       |     |      |     |     |
+--------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| AOA    |     |     |     | ✔    |     | ✔     |     | ✔     |     |      |     |     |
+--------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+

+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| Commercial Solver | LP  | MIP | QP  | MIQP | QCP | MIQCP | NLP | MINLP | MCP | MPCC | GO  | CP  |
+===================+=====+=====+=====+======+=====+=======+=====+=======+=====+======+=====+=====+
| CPLEX\*           | ✔   | ✔   | ✔   | ✔    | ✔   | ✔     |     |       |     |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| GUROBI\*          | ✔   | ✔   | ✔   | ✔    | ✔   | ✔     |     |       |     |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| ODH-CPLEX\*       |     | ✔   |     | ✔    |     | ✔     |     |       |     |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| CP Optimizer\*    |     |     |     |      |     |       |     |       |     |      |     | ✔   |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| CONOPT\*          | ✔   |     | ✔   |      | ✔   |       | ✔   |       |     |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| Knitro\*          | ✔   |     | ✔   |      | ✔   |       | ✔   | ✔     | ✔   | ✔    |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| SNOPT             | ✔   |     | ✔   |      |     |       | ✔   |       |     |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| MINOS             | ✔   |     | ✔   |      |     |       | ✔   |       |     |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| BARON^            |     | ✔   | ✔   | ✔    | ✔   | ✔     | ✔   | ✔     |     |      | ✔   |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+
| PATH              |     |     |     |      |     |       |     |       | ✔   |      |     |     |
+-------------------+-----+-----+-----+------+-----+-------+-----+-------+-----+------+-----+-----+

\* Includes the use of parallel threads without any extra charge


.. _math-program-types-explanation:

Math Program Types Explanation
------------------------------

+---------------+---------------------------------+
| Abbreviations |    Mathematical Program Type    |
+===============+=================================+
| LP            | Linear Program                  |
+---------------+---------------------------------+
| MIP           | Mixed Integer Program           |
+---------------+---------------------------------+
| QP            | Quadratic Program               |
+---------------+---------------------------------+
| MIQP          | Mixed Integer Quadratic Program |
+---------------+---------------------------------+
| QCP           | Quadratically Constrained       |
|               | Program                         |
+---------------+---------------------------------+
| MIQCP         | Mixed Integer Quadratically     |
|               | Constrained Program             |
+---------------+---------------------------------+
| NLP           | NonLinear Program               |
+---------------+---------------------------------+
| MINLP         | Mixed Integer NonLinear Program |
+---------------+---------------------------------+
| MCP           | Mixed Complementarity Program   |
+---------------+---------------------------------+
| MPCC          | Mathematical Program with       |
|               | Complementarity Constraints     |
+---------------+---------------------------------+
| GO            | Global Optimalization           |
+---------------+---------------------------------+
| CP            | Constraint Program              |
+---------------+---------------------------------+

.. _lp-and-mip-solver-features:

LP and MIP Solver Features
--------------------------

+------------------+-------+--------+-----+
| General Features | CPLEX | GUROBI | CBC |
+==================+=======+========+=====+
| Handle           | ✔     | ✔      | ✔   |
| updates          |       |        |     |
+------------------+-------+--------+-----+
| Tuning           | ✔     | ✔      |     |
| tool             |       |        |     |
+------------------+-------+--------+-----+
| Benders          | ✔     |        |     |
| decomposition    |       |        |     |
|                  |       |        |     |
+------------------+-------+--------+-----+
| Network          | ✔     |        |     |
| algorithm        |       |        |     |
+------------------+-------+--------+-----+
| Multiple         | ✔     | ✔      |     |
| models           |       |        |     |
+------------------+-------+--------+-----+
| Parallel         | ✔     | ✔      |     |
| solver           |       |        |     |
| sessions         |       |        |     |
+------------------+-------+--------+-----+
| Ranged           | ✔     | ✔      | ✔   |
| constraints      |       |        |     |
+------------------+-------+--------+-----+
| Modeling         | ✔     |        |     |
| assistance       |       |        |     |
+------------------+-------+--------+-----+
| Presolve         | ✔     |        |     |
| status           |       |        |     |
| information      |       |        |     |
+------------------+-------+--------+-----+
| Solve MPS        | ✔     | ✔      | ✔   |
| file             |       |        |     |
+------------------+-------+--------+-----+

+---------------+-------+--------+-----+
|  LP Features  | CPLEX | GUROBI | CBC |
+===============+=======+========+=====+
| Barrier       | ✔     | ✔      | ✔   |
+---------------+-------+--------+-----+
| Barrier       | ✔     | ✔      | ✔   |
| crossover     |       |        |     |
+---------------+-------+--------+-----+
| Parallel      | ✔     | ✔      |     |
| solving       |       |        |     |
| barrier       |       |        |     |
+---------------+-------+--------+-----+
| Concurrent    | ✔     | ✔      |     |
| LP            |       |        |     |
+---------------+-------+--------+-----+
| Load basis    | ✔     | ✔      | ✔   |
+---------------+-------+--------+-----+
| IIS           | ✔     | ✔      |     |
+---------------+-------+--------+-----+
| Range RHS     | ✔     | ✔      |     |
+---------------+-------+--------+-----+
| Range         | ✔     | ✔      |     |
| objective     |       |        |     |
+---------------+-------+--------+-----+
| Extreme/      | ✔     | ✔      |     |
| unbounded     |       |        |     |
| ray           |       |        |     |
+---------------+-------+--------+-----+
| Farkas        | ✔     | ✔      |     |
| infeasibility |       |        |     |
| proof         |       |        |     |
+---------------+-------+--------+-----+
| Subgradient   | ✔     | ✔      |     |
| sensitivity   |       |        |     |
+---------------+-------+--------+-----+

+-----------------+-------+--------+-----+
|  MIP Features   | CPLEX | GUROBI | CBC |
+=================+=======+========+=====+
| Parallel        | ✔     | ✔      |     |
| solving MIP     |       |        |     |
+-----------------+-------+--------+-----+
| Concurrent      |       | ✔      |     |
| MIP             |       |        |     |
+-----------------+-------+--------+-----+
| Non-traditional | ✔     | ✔      |     |
| search          |       |        |     |
|                 |       |        |     |
+-----------------+-------+--------+-----+
| Callback        | ✔     | ✔      |     |
| incumbent       |       |        |     |
| (intermediate   |       |        |     |
| solutions)      |       |        |     |
+-----------------+-------+--------+-----+
| Callback        | ✔     |        |     |
| branch          |       |        |     |
+-----------------+-------+--------+-----+
| Callback        | ✔     |        |     |
| candidate       |       |        |     |
+-----------------+-------+--------+-----+
| Callback        | ✔     | ✔      |     |
| heuristic       |       |        |     |
+-----------------+-------+--------+-----+
| Callback        | ✔     | ✔      |     |
| user cut        |       |        |     |
+-----------------+-------+--------+-----+
| Callback        | ✔     | ✔      |     |
| lazy            |       |        |     |
| constraint      |       |        |     |
+-----------------+-------+--------+-----+
| User cut        | ✔     |        |     |
| pool            |       |        |     |
+-----------------+-------+--------+-----+
| Lazy            | ✔     | ✔      |     |
| constraint      |       |        |     |
| pool            |       |        |     |
+-----------------+-------+--------+-----+
| Indicator       | ✔     | ✔      |     |
| constraints     |       |        |     |
+-----------------+-------+--------+-----+
| SOS 1           | ✔     | ✔      |     |
+-----------------+-------+--------+-----+
| SOS 2           | ✔     | ✔      |     |
+-----------------+-------+--------+-----+
| Solution        | ✔     | ✔      |     |
| pool            |       |        |     |
+-----------------+-------+--------+-----+
| MIP start       | ✔     | ✔      | ✔   |
+-----------------+-------+--------+-----+
| Variable        |       | ✔      |     |
| hints           |       |        |     |
+-----------------+-------+--------+-----+
| Solution        | ✔     | ✔      |     |
| improvement     |       |        |     |
| heuristic       |       |        |     |
+-----------------+-------+--------+-----+
| Feasibility     | ✔     | ✔      | ✔   |
| pump            |       |        |     |
+-----------------+-------+--------+-----+
| RINS            | ✔     | ✔      | ✔   |
| heuristic       |       |        |     |
+-----------------+-------+--------+-----+

+---------------------+-------+--------+-----+
| Nonlinear  Features | CPLEX | GUROBI | CBC |
+=====================+=======+========+=====+
| QP                  | ✔     | ✔      |     |
+---------------------+-------+--------+-----+
| MIQP                | ✔     | ✔      |     |
+---------------------+-------+--------+-----+
| QCP                 | ✔     | ✔      |     |
+---------------------+-------+--------+-----+
| MIQCP               | ✔     | ✔      |     |
+---------------------+-------+--------+-----+
| SOCP (second        | ✔     | ✔      |     |
| order cone)         |       |        |     |
+---------------------+-------+--------+-----+
| MISOCP              | ✔     | ✔      |     |
| (integer            |       |        |     |
| SOCP)               |       |        |     |
+---------------------+-------+--------+-----+
| Non-convex          | ✔     | ✔      |     |
| QP & MIQP           |       |        |     |
+---------------------+-------+--------+-----+
| Non-convex          |       | ✔      |     |
| QCP & MIQCP         |       |        |     |
+---------------------+-------+--------+-----+
