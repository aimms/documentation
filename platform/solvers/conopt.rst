CONOPT
==========
CONOPT Solver for Nonlinear Programming
---------------------------------------
CONOPT is an efficient large-scale :doc:`Nonlinear Programming (NLP) <../math-program/nonlinear-programming>` solver. AIMMS can compute exact second order derivatives, which can be used by CONOPT to solve certain classes of nonlinear programming models much more efficiently.

Good alternatives for CONOPT are :doc:`Knitro <knitro>`, :doc:`IPOPT <ipopt>`, and :doc:`SNOPT <snopt>`. These often complement CONOPT. If CONOPT finds it difficult to solve a problem, then Knitro, IPOPT, or SNOPT might be able to solve it (and vice versa). If all four solvers fail then this indicates that the model is very difficult or very poorly scaled.

About CONOPT
-------------
CONOPT is developed and supported by `ARKI Consulting & Development, A/S <http://www.conopt.com>`_.

CONOPT Supported Versions
--------------------------
Multiple versions of CONOPT are included in AIMMS. In general, the new version is faster than the old version, but there are some cases where the old version (3.14V) is faster than the new version (4.0).

AIMMS supports CONOPT 3.14V, 4.0 and 4.1.