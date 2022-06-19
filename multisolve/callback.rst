.. _callback_mode:

Callback 
=======================



This is referred to in the remainder of this document as: the callback mode is ``'generate'``. 
The alternative callback mode is ``'modify'``, whereby the callback procedures are responsible for updating the LP matrix as needed.
In practice, the easier callback mode for the application developer is the callback mode ``'generate'``; 
as in this mode the AIMMS Matrix Generator will ensure a GMP is generated consistent with the data in the model identifiers.

.. tip:: From a software engineering point of view, it makes sense to start with the callback mode ``'generate'``; 
       this mode permits the model builder to focus on adding code to update the model identifiers only.
       If it turns out that relatively significant time is spent in the generation of GMP's, 
       the alternative callback mode ``'modify'`` can be considered.


This library supports two modes, called callback modes:

*   **modify**

    In this mode, the callback procedures are responsible for modifying the coefficients of a GMP as needed.
    This mode is tuned towards efficiency; costly matrix generation steps are avoided, 
    and there is choice in starting points for efficient execution.

*   **generate**

    In this mode, the callback procedures are responsible for creating a new GMP for every solve.
    This mode is tuned towards modeling efficiency; 

