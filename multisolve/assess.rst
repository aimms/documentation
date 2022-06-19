Assess 
============================================

This library is most effective for batches of solving mathematical programs, whereby 

*   there are several solves that can be executed simultaneously, 

*   increasing the number of threads per solve does not improve significantly the time needed for that solve, and 

*   the solving time by the solution algorithm (solver) dominates the time needed by the AIMMS Execution Engine for other tasks to execute the batch.

This library requires access to a solver with support for `asynchronous solves <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_solversession-procedures-and-functions/gmp_solversession_asynchronousexecute.html>`_. 

The purpose of this article is to help you predict the speedup of integrating the multi-solve library to your project.

Understanding the sub components of AIMMS relevant to multiSolve
-----------------------------------------------------------------

Within a single AIMMS process, there is:

*   at most one AIMMS Execution Engine active, and

*   there are 0, 1, or more solvers active.

The following tasks relevant to using the multiSolve library occur within the AIMMS Execution Engine.

#.  Obtaining the data for every instance to be solved.

#.  Generating or modifying a GMP corresponding to the data instance at hand.

#.  Obtaining the solution of a solved GMP, and storing that in the data structures of the application.

To predict the speed up of using multiSolve, it is important to know and compare the

#.  time needed to execute the above three tasks, dubbed EngineTime below, and

#.  time needed to solve a GMP, dubbed SolveTime below.

Knowing the EngineTime and the SolveTime
-----------------------------------------

In this section, two situations are considered:

#.  Your application uses a solve statement to solve mathematical programs.

#.  Your application uses GMP technology to generate mathematical programs.

Determining the Enginetime and the SolveTime starting with a solve statement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A `solve statement <https://documentation.aimms.com/language-reference/optimization-modeling-components/solving-mathematical-programs/the-solve-statement.html#the-solve-statement>`_ combines the time to generate a mathematical program and the time needed to actually solve that mathematical program.
The time needed to generate is part of the EngineTime. The time needed to actually solve, is the SolveTime.
The following techniques can be used to separate these two portions:


#.  Make the solve statement, two statements using the GMP technology. 
    Then do a run using the AIMMS Profiler. In more detail:

    First declare the element parameter ``ep_gmp``, with range :aimms:set:`AllGeneratedMathematicalPrograms`  . 
    
    Then replace a solve statement like:

    .. code-block:: aimms 

        solve myMathProg ;

    with 

    .. code-block:: aimms 

        ep_gmp := gmp::instance::generate( myMathProg );
        gmp::instance::solve( ep_gmp );

    A run with an AIMMS Profiler on, may then give the following:

    

#.  Check the suffices of a Mathematical Program

#.  Check the solver log file for the time needed by the solver, and the time needed to generate is the time for the solve statement minus the time reported by the solver.

Determining the Enginetime and the SolveTime when using GMP technology.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



#.  When your application is using GMP functionality to generate and/or modify Generated Mathematical Programs: 

    #.  Callback Generate mode

    #.  Callback Modify mode




Comparing the EngineTime and the SolveTime
------------------------------------------

Consider the following three situations comparing EngineTime and SolveTime:

#.  EngineTime >> SolveTime (EngineTime is relatively significantly more than the SolveTime).  
    In this situation the improvement to the wall clock time will be relatively small.

#.  EngineTime ~ SolveTime (EngineTime is comparable to SolveTime).
    In this situation, effectively there is one solver running in parallel to the AIMMS Execution Engine; as soon as the AIMMS Execution Engine is able to handle a next instance, the solver will be ready to handle the solving of a new instance.
    The speed up will likely be almost a factor of 2.

    To illustrate consider the following graph on CPU load:

    .. image:: images/cpu-load-executing-blend-with-multi-solve-generate.png
        :align: center

    The olive colored top line is the CPU load of all processes during the session, the purple colored bottom is the CPU load by the entire AIMMS process (so including the solves active).

    To create this graph, the Blend example was solved in ``generate`` callback mode.  
    In this mode, it takes significant time to generate a new GMP, and the EngineTime time becomes comparable to SolveTime.
    During that AIMMS Session, the Windows Utility PerfMon was used to measure the CPU load.

    Remarks on the graph:

    #.  At second 35 the first GMP is generated and solved for another ten seconds or so.  This is actually outside the use of multiSolve.

    #.  At second 51, the multi solve becomes active, first generating and then combining generation and solving.

#.  EngineTime << SolveTime (EngineTime is significantly less than the SolveTime).
    In this situation, there can be up to eight solver session active while the AIMMS Execution Engine is actually waiting of one of them to finish.

    .. image:: images/cpu-load-executing-blend-with-multi-solve-modify.png
        :align: center

    The olive colored top line is the CPU load of all processes during the session, the purple colored bottom is the CPU load by the entire AIMMS process (so including the solves active).

    To create this graph, the Blend example was solved in ``modify`` callback mode.  
    In this mode, it hardly takes time for AIMMS Execution Engine to provide a new GMP based on the new objective coefficients, 
    enabling it to start up several  solves before the first  solve finishes.

    Remarks on the graph:

    #.  At second 25 the first GMP is generated and solved for another ten seconds or so.  This is actually outside the use of multiSolve.

    #.  At second 38, the multi solve becomes active, first generating and then combining generation and solving. 
        Clearly, the CPU load is much higher than in the previous graph, as there are now several solves active at the same time.


.. perfmon
.. Saving data to %systemdrive%\PerfLogs\Admin\A2
.. 
.. Youtube explain on perfmon
.. https://www.youtube.com/watch?v=wpSif29l778
.. 
.. https://stackoverflow.com/questions/1984186/what-is-private-bytes-virtual-bytes-working-set#:~:text=Working%20Set%20is%20the%20non,Private%20Bytes%20and%20standby%20list.


References
-----------

#.  `An introduction to perfmon for using it in practice <https://www.youtube.com/watch?v=wpSif29l778>`_

.. spelling::

    multiSolve

.. items to add
.. - purpose: make effective use of the multitude of execution threads that are available
.. - 
.. - uses async solve
.. - uses solvers that are supported by async solve
.. - 
