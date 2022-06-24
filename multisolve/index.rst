MultiSolve Library
******************

To reduce the overall time for solving a multitude of mathematical program instances, you may want to use the multiSolve library.
In so doing

#.  the multiSolve library makes effective use of the logical processors on your machine, and

#.  the multiSolve library makes a clear separation between the logic to:

    A.  handle the parallelizing of solving mathematical programs, and

    #.  the business logic of 

        a.  obtaining the data for the mathematical program and re-instantiate, and

        #.  using the solutions of those mathematical programs.

.. In AIMMS, a mathematical program instance is made concrete via a Generated Mathematical Program, GMP for short.

The documentation of this library first acquints you with the library architecture via a :doc:`Hello world <hello>` example.
Next, the two :doc:`provide modes<provide>` explain the two modes to provide a GMP; one to make use of the library with minimal effort, 
the other to get the most out of the library.\
Finally, as we all know, solving an Operations Research problem may require multiple solve :doc:`steps <steps>`.

.. At that point, you probably want to :doc:`assess <assess>` whether the multiSolve library is of use to your project.


Of course the library documentation would not be complete without the appendices:
:doc:`functional description (API) <api>`,
:doc:`references <refs>`, and 
:doc:`release notes <release>`.

.. toctree::
    :maxdepth: 1
    
    hello
    provide
    steps
    api
    refs
    release

..    assess


.. spelling::

    multiSolve
    acquints