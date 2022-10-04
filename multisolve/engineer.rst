:orphan:

Engineer
====================

To transform your application to utilize the multiSolve library may be daunting, especially if your application has evolved over time and several developers have contributed to its success.
That is why a best practice is presented in this chapter, 

*   that permits you and your team to make small steps,

*   have each step verified before going to the next step, and 

*   whereby the end result is effective use of the multiSolve library.

Summary of steps
-------------------------

First a summary of the steps:

#.  Separate data set(s) that contain the multiple instances, with their verified solutions.
    And ensure that the version of the project you are working with produces these verified solutions.

#.  Separate into separate procedures:

    #.  Obtaining input data

    #.  Generating matrix

    #.  Solving 

    #.  Retrieving and storing solution

    #.  Verify solution

    Your algorithm should now have the following structure:

    .. code-block:: aimms 
        :linenos:

        for (i,j,k) | bp_combinationWorthAnalyzing(i,j,k) do
            pr_getInput(i,j,k);
            pr_genMatrix(i,j,k);
            pr_solve(i,j,k);
            pr_storeSolution(i,j,k);
            pr_verifySolution(i,j,k);
        endfor ;

#.  Transform to single index, say ``i_instance``, using techniques similar to composite objects.

    .. code-block:: aimms 
        :linenos:

        for i_instance do
            pr_getInput(i_instance);
            pr_genMatrix(i_instance);
            pr_solve(i_instance);
            pr_storeSolution(i_instance);
            pr_verifySolution(i_instance);
        endfor ;

    whereby, ``pr_getInput(i_instance)`` begins with:

    .. code-block:: aimms 
        :linenos:

        ep_i := ep_comboI(i_instance);
        ep_j := ep_comboJ(i_instance);
        ep_k := ep_comboK(i_instance);
        
        ! the original pr_getInput procedure.

#.  Use multiSolve with 1 parallel session.

#.  Use multiSolve with multiple parallel sessions.

#.  Use multiSolve with provide mode ``modify``.

.. Story
.. ------
.. 
.. To make this chapter concrete, an example is provided that 



.. spelling::

    multiSolve














