Advanced Algorithms for Mathematical Programs
==============================================

The solve statement in AIMMS offers a convenient way to execute all necessary steps to generate and solve a single instance of a mathematical program in one simple statement. For most applications, this level of control over the individual steps required to execute the generation and solution process is sufficient. However, for advanced applications, you may need a finer-grained level of control, e.g. to

* work with multiple, differing, instances of a single symbolic mathematical program,
* manipulate the individual rows and columns and the coefficient matrix of a mathematical program instance, for example to efficiently implement a column generation scheme,
* use optimization callbacks that allow you to monitor and guide the behavior of the solver,*
* work with a repository of solutions associated with a mathematical program instance, for instance as a means to store multiple starting solutions or, within a solver callback, to setup and update a collection of incumbents of a mixed integer model, or
* start multiple solver sessions for a mathematical program instance, either locally or remotely.

For this AIMMS offers the Generated Mathematical Program (GMP) library, a set of procedures that allows you to gain fine-grained control over the generation, manipulation and solution of a mathematical program instance, and allows you to manage a collection of solutions and solver sessions associated with such mathematical program instances.

With every mathematical program declared as part of your model, the GMP library allows you to associate

* one or more Generated Math Program instances (GMPs), and with each GMP
* a conceptual matrix of coefficients that can be manipulated,
* a repository of initial, intermediate or final solutions, and
* a pool of local or remote solver sessions.

For a full description of the advanced algorithm functionalities in AIMMS see :doc:`lr:optimization-modeling-components/implementing-advanced-algorithms-for-mathematical-programs/index`.

Customizable Open Algorithms
----------------------------
AIMMS Outer Approximation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Outer approximation is a well-known basic approach to solve :doc:`Mixed Integer Nonlinear Programming <../math-program/mixed-integer-nonlinear-programming>` models. The underlying algorithm is an interplay between two solvers, namely one for solving :doc:`mixed integer linear <../math-program/mixed-integer-programming>` models and one for solving :doc:`nonlinear <../math-program/nonlinear-programming>` models. Our open implementation of the :doc:`Outer Approximation Algorithm <aoa>` allows users to fine-tune it to their specific model.

Benders Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
An algorithm to solve stochastic models using a stochastic Benders approach and a module to visualize stochastic scenario trees is included with AIMMS. The Benders decomposition algorithm can be faster for stochastic models than solving the deterministic equivalent with a linear programming solver. Our open implementation allows modelers to fine-tune it to their specific stochastic model and to use advanced features of the GMP library to solve multiple sub-problems in parallel, which may drastically reduce the total solution time.

Parallel solver sessions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The AIMMS GMP library also supports the activation of parallel solver sessions, allowing an application to solve multiple mathematical programs in parallel on one computer. For advanced optimization applications in which multiple independent mathematical programs can be solved simultaneously, this may dramatically increase the application performance on multi-processor computer or multi-core processors.

Multi-Start Solve for Nonlinear Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
A multi-start algorithm for :doc:`nonlinear programming <../math-program/nonlinear-programming>` problems is also available in AIMMS. This algorithm randomly generates starting points, groups these into clusters, calls a nonlinear programming solver for each cluster and reports back the best feasible solution as its final solution. The algorithm can also report all feasible solutions found. The AIMMS multi-start algorithm is a user-customizable procedure within the `GMP library <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/index.html>`_, allowing modelers to adapt the algorithm to their own needs.

The multi-start algorithm may increase the chance of finding a good final solution. Multi-start increases the total solving time, but this may be limited by using the advanced features of the GMP library such as parallel/distributed solver sessions to solve problems with different starting points in parallel.

Advanced Algorithms Functional Examples
-----------------------------------------
Distributed Solver Sessions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This example illustrates AIMMS’ capabilities for solving two or more optimization programs in parallel by using distributed solver sessions. To show the benefits of this approach, this example should be run on a multi-processor machine. The underlying model is based on the Cutting Stock example.

Distributed Solver Sessions Example

Nested Solve
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This example illustrates the nested solve that can be done in AIMMS using a GMP callback. The problem discussed in this example is a single commodity uncapacitated fixed charge network flow problem (UFC). In this solution approach we will provide CPLEX with cuts to come to a solution faster. Cuts are constraints that cut away part of the feasible region of the LP-relaxation. AIMMS uses a callback procedure that solves another MIP problem to provide these cuts to CPLEX.

* `Nested Solve Example <https://github.com/aimms/examples/tree/master/Functional%20Examples/Nested%20Solve>`_

Advanced Algorithms Application Examples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* `Cutting Stock <https://github.com/aimms/examples/tree/master/Modeling%20Book/Cutting%20Stock>`_
* `File Merge <https://github.com/aimms/examples/tree/master/Modeling%20Book/File%20Merge>`_
* `Gate Assignment <https://github.com/aimms/examples/tree/master/Application%20Examples/Gate%20Assignment>`_
* `Power System Expansion <https://github.com/aimms/examples/tree/master/Modeling%20Book/Power%20System%20Expansion>`_
* `Power System Expansion using Robust Optimization <https://github.com/aimms/examples/tree/master/Functional%20Examples/Power%20System%20Expansion%20RO>`_