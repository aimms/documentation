Constraint Programming
=======================
Constraint Programming (CP) is the process of solving a system of constraints of various types over a set of unknown discrete variables possibly along with an objective function to be maximized or minimized.  Part of the attraction of Constraint Programming is that it enables the capturing of many structures observed in reality in a very natural manner using e.g. ‘AllDifferent’ and ‘Sequence’ constraints, element valued variables and the Resource and Activity concepts.

AIMMS for Constraint Programming
----------------------------------------------------
Besides the general benefits of using AIMMS, there are specific functionalities that make AIMMS an excellent tool for modeling CP problems:

* The AIMMS modeling language is based on algebraic notation to naturally capture the constraint programming structures frequently used.
* The AIMMS modeling language support special scheduling constructs to allow schedulers to formulate their problem in a manner that is natural to them.
* The AIMMS GUI supports Gantt charts and a rich set of other object to visualize and interact with resulting schedules and solutions.
* The AIMMS generator provides several automatic reformulations to generate input to a growing set of advanced solution algorithms.

Constraint Programming Solvers
-----------------------------------
Standard Solvers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AIMMS supports the solver :doc:`CP Optimizer <../solvers/cp-optimizer>` to solve constraint programming models.

Open Solver Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The AIMMS :doc:`Open Solver Interface <../solvers/open-solver-interface>` allows solver developers to link their own mixed integer programming solvers to AIMMS themselves.

Constraint Programming Application Examples
--------------------------------------------
Allocations Problems
Bridge Building
Circuit Verification
Job Shop Scheduling
Nurse Scheduling
Pegboard Planning
Sport Scheduling
Vehicle Routing
Workforce Optimization
