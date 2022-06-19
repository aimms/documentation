Callback 
=======================

.. image:: https://img.shields.io/badge/AIMMS_4.86-ZIP:_MultiSolveModifyHello-blue
   :target: :download:`MultiSolveModifyHello.zip <downloads/MultiSolveModifyHello.zip>`

:download:`AIMMS 4.86 MultiSolveModifyHello.zip <downloads/MultiSolveModifyHello.zip>`

The multiSolve library supports two modes, called callback modes:

#.  **generate**

    In this mode, the callback procedures are responsible to create a GMP for every solve.
    This is easily achieved by calling :aimms:func:`GMP::Instance::Generate` after updating
    the model sets and parameters for the data instance at hand.

    An example of using this mode is given in the previous chapter :doc:`Hello <hello>`.

#.  **modify**

    In this mode, after updating the model sets and parameters the GMP is not generated completely. 
    Instead the last GMP is reused and the callback procedure is responsible for modifying this GMP
    to obtain a GMP that reflects the changes in the model sets and parameters.

    An example of using this mode is presented in this chapter.

The story and results are the same as in the previous chapter.


The call
----------

The call to ``multiSolve::pr_multiSolve`` is almost the same.  
The differences are highlighted and discussed below:

.. code-block:: aimms
    :linenos:
    :emphasize-lines: 3,4,9

    Procedure MainExecution {
        Body: {
            ep_baseGMP := gmp::Instance::Generate( mp_transport );
            gmp::Instance::Solve( ep_baseGMP );
            
            multiSolve::pr_multiSolve(
                ep_onNextSessionInstance      :  'pr_modifyInstance', 
                ep_onSessionInstanceCompleted :  'pr_retrieveSolution', 
                ep_baseGMP                    :  ep_baseGMP, ! Using the modify call back mode. 
                p_maxParallelGMPs             :  2,
                p_maxThreadsPerSolve          :  1, 
                ep_startingSolutionMethod     :  multiSolve::ep_startingSolutionMethod_last);
        }
        ElementParameter ep_baseGMP {
            Range: AllGeneratedMathematicalPrograms;
        }
    }

Remarks:

*   Line 3,4: In modify callback mode, the multiSolve library makes modification upon modification.
    As a starting point, a base GMP needs to be provided.  This is by making one call to 
    :aimms:func:`GMP::instance::Generate` and solving it.

*   Line 9: To indicate the use of ``'modify'`` callback mode, the GMP is passed that is constructed on lines 3,4.

Generate the instance
-----------------------

.. code-block:: aimms 
    :linenos:
    :emphasize-lines: 22-31

    Procedure pr_modifyInstance {
        Arguments: (ep_gmp,ep_handle);
        Body: {
            p_iter += 1 ;
            if p_iter > p_maxNoInstances then 
                ep_handle := '' ;
            
                ! As there is no more data, this procedure can indicate to
                ! the multiSolve library that it can stop new solve sequences. 
                p_procedureReturnCode := 0 ; 
            else
                ! Which instance are going to solve.
                ep_handle := element( s_instances, p_iter );
            
                ! Update model parameters for this variation.
                p_supply(i_src)  := p_supplyInst(i_src,  ep_handle) ;
                p_demand(i_trgt) := p_demandInst(i_trgt, ep_handle) ;
            
                ! The GMP to be solved is a small variation of the last solved GMP
                ! Instead of regenerating the entire GMP, only some coefficients 
                ! are modified.  This is signiicantly faster, but can be more involved.
                gmp::Row::SetRightHandSideMulti(
                    GMP     :  ep_gmp, 
                    binding :  i_src, 
                    row     :  c_respectSupply(i_src), 
                    value   :  p_supply(i_src));
                gmp::Row::SetRightHandSideMulti(
                    GMP     :  ep_gmp, 
                    binding :  i_trgt, 
                    row     :  c_meetDemand(i_trgt), 
                    value   :  p_demand(i_trgt));

                ! Indicating there is data, and a GMP is created ready to solve.
                p_procedureReturnCode := 1;
            endif ;
            return p_procedureReturnCode ;
        }
        DeclarationSection Argument_declarations {
            ElementParameter ep_gmp {
                Range: AllGeneratedMathematicalPrograms;
                Property: InOut;
            }
            ElementParameter ep_handle {
                Range: Integers;
                Property: Output;
            }
        }
        DeclarationSection Local_declarations {
            Parameter p_procedureReturnCode;
        }
    }

Remarks:

*   Lines 22-31 replace the single call to ``gmp::instance::generate``. 
    The RHS's of two symbolic constraints need to updated to the latest values of supply and demand.

.. tip:: From a software engineering point of view, it makes sense to start with the callback mode ``'generate'``; 
       this mode permits the model builder to focus on adding code to update the model identifiers only.
       If it turns out that relatively significant time is spent in the generation of GMP's, 
       the alternative callback mode ``'modify'`` can be considered.

.. spelling::

    multiSolve

