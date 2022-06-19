Steps
=========================================================================

Many Operations Research (OR) problems are solved by solving a single Mathematical Program (MP).
However, for some OR problems, it is needed that multiple Mathematical Programs are solved. 
Solving a single MP is then called a solve step.
A typical example is to first solve a given problem to feasibility, and then to optimality.
This library uses solve steps, or just steps, to cater for multi step OR problems.

As an aside, there are also OR problems that do not require an MP to be solved.
This library is of no use for such OR problems, and therefore these OR problems are not considered here.

Consider the following overview of multiple data instances, whereby handling a data instance requires a sequence of multiple solve steps.

.. figure:: images/multi-var-multi-step.png
    :align: center

Remarks:

*   As there is  a dependency between ``Var 1, step 1`` and ``Var 1, step 2``, they cannot be solved in parallel.

*   As there is no dependency between ``Var 1, step 1`` and ``Var 2, step 1``, they can be solved in parallel.



