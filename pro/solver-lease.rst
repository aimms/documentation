Using Solver leases instead of DelegateToServer
-------------------------------------------------

.. note::

	This feature is ONLY available on the AIMMS Cloud Platform starting with AIMMS 4.57 or higher for WebUI applications.

On the AIMMS Cloud platform it takes several seconds (typically about 5-8 seconds) to spin up a solver session at the server. The solve itself might however take only 2 or 3 seconds or even less. Obviously the overhead involved with starting a new solver session is way bigger then actual solve time. In order to solve this problem we introduced the notion of temporarily leasing a solver license in your running WebUI session to execute the solving inside that WebUI session. This removes the overhead of starting a solve session and the involved case-io.

However, beware that using the solver lease is not a general replacement for using DelegateToServer calls. The most important difference with the DelegateToServer call is that leasing a solver can fail because there are no licenses available at that moment. With DelegateToServer your job would then queued and executed whenever the appropriate resources become available. With the solver lease model, the solve would just fail immediately. Another difference with DelegateToServer is that running the leased solver is a blocking call, i.e. the user-interface will not be updated when that solve is running.

Solver lease concepts
++++++++++++++++++++++++++++++++++++++++++++

In general the way solver leasing works is:

1. Try to acquire a solver lease within a specified amount of time (acquireTimeout) for a certain amount of time (leaseMaxDuration).
2. Run the solve. 
3. Release the lease.

The PRO library provides this basic functionality through the procedures:

.. code::
	
	pro::solverlease::AcquireSolverLease(acquireTimeout, leaseMaxDuration, jobDescription);
	pro::solverlease::ReleaseSolverLease();

The solver lease might expire during the solve. The solve will then be interrupted and an error will be raised. It might also be that there were no licenses available while you were trying to acquire it, but it did not get one within the specified amount of time. In that case also an error will be raised. In both these scenarios your solve failed and an error was raised, the app developer needs to decided on how to proceed next. Show an error to the user, fall back to some default data etc. If the developer does not use the block-on-error clause to capture these events, the runtime error will be propagated further down the error handling path.

When the leased solve is running, it is also visible in the PRO portal at the Jobs page, as if it were any other Job. Similarly any privileged user can also terminate that Job, resulting in an error being raised in the WebUI session that is running a solve using the previously acquired solver lease. When the session is terminated the solver lease is also marked as released.

Limits and best practice
++++++++++++++++++++++++++++++++++++++++++++

Currently both the *acquireTimeout* and *leaseMaxDuration* must have a value in the range [1,60] seconds and the *jobDescription* (see below) cannot be longer then 255 characters. These timeout values are intended to be so (relatively) low indicating the typical use case for using solver leases instead of DelegateToServer. 

+--------------------+-------------------------------+---------------+
| Argument           | Limitation                    | Best practise |
+--------------------+-------------------------------+---------------+
| *acquireTimeout*   | in the range [1,60] (seconds) | 1             |
+--------------------+-------------------------------+---------------+
| *leaseMaxDuration* | in the range [1,60] (seconds) | 5             |
+--------------------+-------------------------------+---------------+
| *jobDescription*   | <= 255 characters             | _             |
+--------------------+-------------------------------+---------------+

Typically usage would however be way lower; an *acquireTimeout* of 1 second and *leaseMaxDuration* of 5 seconds is more along the lines of intended usage. There might be some edge cases in which you would want to set these values higher. 

.. tip::
    
    As a rule of thumb, if the actual solve time is less then 10 seconds you probably want to use solver leases instead of the DelegateToServer call. 

If you have a high user volume on your server and often you need to do a solve, you might be better of doing a DelegateToServer call. The WebUI session will be blocked in the busy state while running the leased solve. 

If you do want to provide feedback on progress to the end user during the solve your only option is the DelegateToServer (with a waitForCompletion set to 0).


Specifying the solve using solver leases
++++++++++++++++++++++++++++++++++++++++++++

In the AIMMS PRO Library we provide a wrapper procedure called 'pro::solverlease::solveModel' that neatly wraps the underlying solver-lease primitives, solving and error handling in one go. As an example, you could use it like this:

.. code:: 

    pro::solverlease::solveModel(
        mathematicalProgrammingProblem :  'myMathProgram', 
        selectedSolver                 :  'Cplex 12.8', 
        solveMode                      :  'replace', 
        acquireTimeout                 :  3, 
        leaseMaxDuration               :  10, 
        jobDescription                 :  "MyDescription");
        
where all arguments are optional except the mathematicalProgrammingProblem argument. The solveMode and selecteSolver are the only options that need to be specified in the SOLVE statement (see chapter 15.3 in the Language Reference) explicitly for AIMMS to pick up. Other options can be set using the BLOCK statement:

.. code:: 

    block where  relative_optimality_tolerance := 0.05, relative_convergence_tolerance := 1e-07;

        pro::solverlease::solveModel(
            mathematicalProgrammingProblem :  'myMathProgram', 
            selectedSolver                 :  'Cplex 12.8', 
            solveMode                      :  'replace', 
            acquireTimeout                 :  3, 
            leaseMaxDuration               :  10, 
            jobDescription                 :  "MyDescription");
        
    endblock;
