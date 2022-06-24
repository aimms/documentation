API
================

.. js:function:: multiSolve::pr_multiSolve

    Repeatedly solves small variations of a GMP, when possible in parallel.

    :param ep_baseGMP: 

        Input. The GMP to base variations on.

        To use the ``'generate'`` provide mode, provide the empty element.
        
        To use the ``'modify'`` provide mode, use the GMP on which modifications can be made.
        This GMP should contain a feasible solution on position 1 of its solution repository.

    :param ep_onProvideGMP: 

        Input. 
        A callback procedure which is called when a new instance of the mathematical program needs to be provided.

        This callback procedure implements:

        #.  Business logic to update the model identifiers for the next instance.

        #.  Logic to either:

            *   translate these changes to changes in the base GMP (``'modify'`` provide mode), or

            *   create a GMP based on the model identifiers.

        This callback has the following arguments:

        #.  ``ep_gmp``: InOut. The GMP to generate or make modifications to.

        #.  ``ep_handle``: Output. 
            An element parameter with range :aimms:set:`Integers`.  
            The value of this element parameter will be supplied to the callback procedure ``ep_onRetrieveSolution`` when this instance is solved.

        **Return value** This procedure returns:

        *   1: if the GMP is to be solved.

        *   0: if there is no more work to be started.

    :param ep_onRetrieveSolution: 

        Input. 
        A callback procedure which is called when a step is solved.

        This callback procedure implements:
        
        #.  Reading the solution from the finished solver session to the model parameters.
            The procedure ``multiSolve::pr_storeSolutionInModelVariables`` can be called for this purpose.

        #.  Logic to copy the relevant part of the solution to the application parameters.

        #.  Optionally, logic to copy relevant statistics about the solution obtained.

        #.  When a next solve step is to be executed, logic to ``'modify'`` or ``'generate'`` a GMP for that next step.

        This callback has the following arguments:

        #.  ``ep_gmp``: InOut. If a next step is to be executed, upon return of this callback, 
            this GMP should contain the matrix to be solved.

        #.  ``ep_finishedSolverSession``: Input. 
            Optionally, the modeler can use this solver session to obtain solution and statistics about the solve.

            The solution in the solver session can be copied to the model variables using the procedure ``multiSolve::pr_storeSolutionInModelVariables``. 
            Prior to calling this procedure, you can restore index sets used in the model variables 
            when the matrix was generated.

        #.  ``ep_handle``: Input. 
            An element parameter with range :aimms:set:`Integers`.  
            The value of this element parameter identifies the instance solved to the business logic.

        #.  ``ep_step``: Input.
            An element parameter with range :aimms:set:`Integers`. 
            Upon completion of the first step, this element parameter has the value ``'1'``.

        **Return value** This procedure returns:

        *   1: if there is a next step for the OR problem for the data instance at hand.

        *   0: if there are no more steps to be executed for the OR problem at hand.


    :param p_maxParallelGMPs: 

        Optional, range { 1 .. }, default 1.

        The maximum number of GMPs that are solved in parallel.

    :param p_maxThreadsPerSolve: 

        Optional, range { 1 .. }, default 1.

        The maximum number of threads used to solve a single GMP.

        Please ensure that ``p_maxParallelGMPs`` X ``p_maxThreadsPerSolve`` <= the number of logical cores on your computer.

    :param p_startingSolutionMethod: 

        Optional, range { 0 .. 3 }, default 2. Interpretation:

        0.  Do not tamper with the starting solution. 
            This might be a good strategy, because it permits the solver to crash a good corner point to use as starting point when using the simplex method.

        #.  Use solution of worker as starting solution.  In other words, the starting solution will not be overwritten.

        #.  Use solution of base GMP as starting solution.

        #.  Use values of model variables as starting solution. 
            This starting solution method permits the ``ep_onProvideGMP`` callback to provide a tailored starting solution.

.. js:function:: multiSolve::pr_storeSolutionInModelVariables

    Procedure to retrieve the solution from a finished solver session and store that solution in the model variables.
    To be called in a ``ep_onRetrieveSolution`` callback.

    :param ep_finishedSolverSession:

.. js:function:: multiSolve::pr_cleanup

    Procedure to cleanup a GMP and solver session prior to regenerating one.
    To be called in a ``ep_onRetrieveSolution`` callback only when the provide mode is ``'Generate'``.

    :param ep_finishedGmp: The GMP that is no longer needed.

    :param ep_finishedSolverSession: The solver session that is no longer needed.

