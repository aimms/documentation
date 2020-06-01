Solvers
=======

AIMMS, as a complete optimization modeling system, comes with all
functionality to develop and create complete optimization applications.
This means that a large set of mathematical model types (Linear, Mixed
Integer, Nonlinear, Mixed Integer Nonlinear, etc.) can be formulated
within AIMMS. AIMMS uses solvers to optimize mathematical models.
Depending on the solvers available with your license, you are able to
solve the models at a requested performance (high and medium performance
solvers do exist for most model types).

The standard license of AIMMS includes the world-class solver
`CPLEX <https://www.aimms.com/english/developers/resources/solvers/cplex>`__.
The installation package of AIMMS also has
the `COIN-OR <http://www.coin-or.org/>`__ solvers CBC (LP/MIP) and IPOPT
(NLP) included; these two solvers are not owned or serviced by the AIMMS
company – they are by the open source community – but can be also used
by any AIMMS user. This set of solvers, together with the freely
available `Advanced
Algorithms <https://www.aimms.com/english/developers/resources/solvers/mathematical-programming/advanced-algorithms/>`__
set of AIMMS such as AIMMS Outer Approximation, Benders Decomposition
and more – offers a great start for creating optimization applications.
Of course, the set of solvers available in a license can be extended by
other `commercial solver
add-ons <https://www.aimms.com/english/developers/licensing/solver-extensions/>`__.

All solvers are connected to AIMMS by using the `AIMMS Open Solver
Interface <https://www.aimms.com/english/developers/resources/solvers/osi>`__,
which link solvers through a collection of C++ interfaces.

Contents
--------

-  `Available Solvers in
   AIMMS <https://www.aimms.com/english/developers/resources/solvers/#available-solvers>`__
-  `Robust Optimization
   Add-on <https://www.aimms.com/english/developers/resources/solvers/#robust-optimization-add-on>`__
-  `Supported Math Program
   Types <https://www.aimms.com/english/developers/resources/solvers/#supported-math-program-types>`__
-  `Math Program Types
   Explanation <https://www.aimms.com/english/developers/resources/solvers/#math-program-types-explanation>`__
-  `LP and MIP Solver
   Features <https://www.aimms.com/english/developers/resources/solvers/#lp-and-mip-solver-features>`__

.. _available-solvers:

Available Solvers in AIMMS
--------------------------

+----------------------------------+----------------------------------+
| Solver                           | Description                      |
+----------------------------------+----------------------------------+
| `AOA <ht                         | White box AIMMS Outer            |
| tps://www.aimms.com/english/deve | Approximation module for solving |
| lopers/resources/solvers/aoa>`__ | mixed integer nonlinear          |
|                                  | programming                      |
+----------------------------------+----------------------------------+
| `BARON <https                    | Branch-And-Reduce Optimization   |
| ://www.aimms.com/english/develop | solver for global optimization   |
| ers/resources/solvers/baron/>`__ |                                  |
+----------------------------------+----------------------------------+
| `CBC <ht                         | Open source linear programming / |
| tps://www.aimms.com/english/deve | mixed integer programming solver |
| lopers/resources/solvers/cbc>`__ | at COIN-OR                       |
+----------------------------------+----------------------------------+
| `CONOPT <https                   | Large-scale nonlinear            |
| ://www.aimms.com/english/develop | programming solver from Arki     |
| ers/resources/solvers/conopt>`__ | Consulting                       |
+----------------------------------+----------------------------------+
| `CPLEX <http                     | High performance linear          |
| s://www.aimms.com/english/develo | programming / mixed integer      |
| pers/resources/solvers/cplex>`__ | programming solver from IBM ILOG |
+----------------------------------+----------------------------------+
| `CP                              | State-of-the-art constraint      |
| Optimizer <https://www           | programming solver from IBM ILOG |
| .aimms.com/english/developers/re |                                  |
| sources/solvers/cp-optimizer>`__ |                                  |
+----------------------------------+----------------------------------+
| `GUROBI <https                   | High performance linear          |
| ://www.aimms.com/english/develop | programming / mixed integer      |
| ers/resources/solvers/gurobi>`__ | programming solver from Gurobi   |
|                                  | Optimization                     |
+----------------------------------+----------------------------------+
| `IPOPT <http                     | Open source Interior Point       |
| s://www.aimms.com/english/develo | optimizer for large-scale        |
| pers/resources/solvers/ipopt>`__ | nonlinear optimization at        |
|                                  | COIN-OR                          |
+----------------------------------+----------------------------------+
| `KNITRO <https                   | Large-scale nonlinear            |
| ://www.aimms.com/english/develop | programming solver from Artelys  |
| ers/resources/solvers/knitro>`__ |                                  |
+----------------------------------+----------------------------------+
| `MINOS <http                     | Nonlinear programming solver     |
| s://www.aimms.com/english/develo | from Stanford University         |
| pers/resources/solvers/minos>`__ |                                  |
+----------------------------------+----------------------------------+
| `ODH-CPLEX <https://             | High performance mixed integer   |
| www.aimms.com/english/developers | programming solver from          |
| /resources/solvers/odh-cplex>`__ | Optimization Direct              |
+----------------------------------+----------------------------------+
| `PATH <htt                       | Newton-based solver for solving  |
| ps://www.aimms.com/english/devel | mixed complementarity            |
| opers/resources/solvers/path>`__ | programming                      |
+----------------------------------+----------------------------------+
| `SNOPT <http                     | Nonlinear programming solver     |
| s://www.aimms.com/english/develo | from Stanford University         |
| pers/resources/solvers/snopt>`__ |                                  |
+----------------------------------+----------------------------------+
|                                  |                                  |
+----------------------------------+----------------------------------+

Robust Optimization Add-on
--------------------------

AIMMS offers a commercial Robust Optimization Add-on (RO) to incorporate
uncertainty (e.g. development of the energy price) into your model.
AIMMS RO considers data uncertainties against whose realizations the
solution is required to remain feasible. This uncertainty may occur in
any part of the model data. Partial feasibility can be included by
adding probabilities to constraints (e.g. the chance that demand is met
is at least 95%).  

You can add this add-on upon purchase of your AIMMS licenses, or add it
later; please be advised that the RO Add-on recommends an AIMMS license
that also contains the CPLEX Solver.

Note: This Robust Optimization add-on was built in co-operation with
professor Aharon Ben-Tal and the Technion Institute.

Supported Math Program Types
----------------------------

If you would like to extend the power of AIMMS (beyond the open source
COIN-OR solvers and AOA algorithm) with commercial solvers, we offer you
the possibility to add commercial solvers to AIMMS. If you already have
a license for one of the available additional solvers (in the form of a
callable library), you can also request a *Solver Link* and use your
existing solver license with AIMMS.

+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| *     | `     | `MIP  | *     | **M   | **    | **MI  | `NLP  | `     | **    | **M   | *     | `CP < |
| *Solv | LP <h |  <htt | *QP** | IQP** | QCP** | QCP** | <http | MINLP | MCP** | PCC** | *GO** | https |
| er ** | ttps: | ps:// |       |       |       |       | s://w |  <htt |       |       |       | ://ww |
|       | //www | www.a |       |       |       |       | ww.ai | ps:// |       |       |       | w.aim |
|       | .aimm | imms. |       |       |       |       | mms.c | www.a |       |       |       | ms.co |
|       | s.com | com/e |       |       |       |       | om/en | imms. |       |       |       | m/eng |
|       | /engl | nglis |       |       |       |       | glish | com/e |       |       |       | lish/ |
|       | ish/d | h/dev |       |       |       |       | /deve | nglis |       |       |       | devel |
|       | evelo | elope |       |       |       |       | loper | h/dev |       |       |       | opers |
|       | pers/ | rs/re |       |       |       |       | s/res | elope |       |       |       | /reso |
|       | resou | sourc |       |       |       |       | ource | rs/re |       |       |       | urces |
|       | rces/ | es/so |       |       |       |       | s/sol | sourc |       |       |       | /solv |
|       | solve | lvers |       |       |       |       | vers/ | es/so |       |       |       | ers/c |
|       | rs/li | /mixe |       |       |       |       | nonli | lvers |       |       |       | onstr |
|       | near- | d-int |       |       |       |       | near- | /mixe |       |       |       | aint- |
|       | progr | eger- |       |       |       |       | progr | d-int |       |       |       | progr |
|       | ammin | progr |       |       |       |       | ammin | eger- |       |       |       | ammin |
|       | g>`__ | ammin |       |       |       |       | g>`__ | nonli |       |       |       | g>`__ |
|       |       | g>`__ |       |       |       |       |       | near- |       |       |       |       |
|       |       |       |       |       |       |       |       | progr |       |       |       |       |
|       |       |       |       |       |       |       |       | ammin |       |       |       |       |
|       |       |       |       |       |       |       |       | g>`__ |       |       |       |       |
+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+
| `C    | **✔** | **✔** |       |       |       |       |       |       |       |       |       |       |
| BC <h |       |       |       |       |       |       |       |       |       |       |       |       |
| ttps: |       |       |       |       |       |       |       |       |       |       |       |       |
| //www |       |       |       |       |       |       |       |       |       |       |       |       |
| .aimm |       |       |       |       |       |       |       |       |       |       |       |       |
| s.com |       |       |       |       |       |       |       |       |       |       |       |       |
| /engl |       |       |       |       |       |       |       |       |       |       |       |       |
| ish/d |       |       |       |       |       |       |       |       |       |       |       |       |
| evelo |       |       |       |       |       |       |       |       |       |       |       |       |
| pers/ |       |       |       |       |       |       |       |       |       |       |       |       |
| resou |       |       |       |       |       |       |       |       |       |       |       |       |
| rces/ |       |       |       |       |       |       |       |       |       |       |       |       |
| solve |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/cb |       |       |       |       |       |       |       |       |       |       |       |       |
| c>`__ |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `     | **✔** |       | **✔** |       | **✔** |       | **✔** |       |       |       |       |       |
| IPOPT |       |       |       |       |       |       |       |       |       |       |       |       |
|  <htt |       |       |       |       |       |       |       |       |       |       |       |       |
| ps:// |       |       |       |       |       |       |       |       |       |       |       |       |
| www.a |       |       |       |       |       |       |       |       |       |       |       |       |
| imms. |       |       |       |       |       |       |       |       |       |       |       |       |
| com/e |       |       |       |       |       |       |       |       |       |       |       |       |
| nglis |       |       |       |       |       |       |       |       |       |       |       |       |
| h/dev |       |       |       |       |       |       |       |       |       |       |       |       |
| elope |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/re |       |       |       |       |       |       |       |       |       |       |       |       |
| sourc |       |       |       |       |       |       |       |       |       |       |       |       |
| es/so |       |       |       |       |       |       |       |       |       |       |       |       |
| lvers |       |       |       |       |       |       |       |       |       |       |       |       |
| /ipop |       |       |       |       |       |       |       |       |       |       |       |       |
| t>`__ |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `A    |       |       |       | **✔** |       | **✔** |       | **✔** |       |       |       |       |
| OA <h |       |       |       |       |       |       |       |       |       |       |       |       |
| ttps: |       |       |       |       |       |       |       |       |       |       |       |       |
| //www |       |       |       |       |       |       |       |       |       |       |       |       |
| .aimm |       |       |       |       |       |       |       |       |       |       |       |       |
| s.com |       |       |       |       |       |       |       |       |       |       |       |       |
| /engl |       |       |       |       |       |       |       |       |       |       |       |       |
| ish/d |       |       |       |       |       |       |       |       |       |       |       |       |
| evelo |       |       |       |       |       |       |       |       |       |       |       |       |
| pers/ |       |       |       |       |       |       |       |       |       |       |       |       |
| resou |       |       |       |       |       |       |       |       |       |       |       |       |
| rces/ |       |       |       |       |       |       |       |       |       |       |       |       |
| solve |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/ao |       |       |       |       |       |       |       |       |       |       |       |       |
| a>`__ |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+

+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| **    | `     | `MIP  | *     | **M   | **    | **MI  | `NLP  | `     | **    | **M   | *     | `CP < |
| Comme | LP <h |  <htt | *QP** | IQP** | QCP** | QCP** | <http | MINLP | MCP** | PCC** | *GO** | https |
| rcial | ttps: | ps:// |       |       |       |       | s://w |  <htt |       |       |       | ://ww |
| Solve | //www | www.a |       |       |       |       | ww.ai | ps:// |       |       |       | w.aim |
| rs ** | .aimm | imms. |       |       |       |       | mms.c | www.a |       |       |       | ms.co |
|       | s.com | com/e |       |       |       |       | om/en | imms. |       |       |       | m/eng |
|       | /engl | nglis |       |       |       |       | glish | com/e |       |       |       | lish/ |
|       | ish/d | h/dev |       |       |       |       | /deve | nglis |       |       |       | devel |
|       | evelo | elope |       |       |       |       | loper | h/dev |       |       |       | opers |
|       | pers/ | rs/re |       |       |       |       | s/res | elope |       |       |       | /reso |
|       | resou | sourc |       |       |       |       | ource | rs/re |       |       |       | urces |
|       | rces/ | es/so |       |       |       |       | s/sol | sourc |       |       |       | /solv |
|       | solve | lvers |       |       |       |       | vers/ | es/so |       |       |       | ers/c |
|       | rs/li | /mixe |       |       |       |       | nonli | lvers |       |       |       | onstr |
|       | near- | d-int |       |       |       |       | near- | /mixe |       |       |       | aint- |
|       | progr | eger- |       |       |       |       | progr | d-int |       |       |       | progr |
|       | ammin | progr |       |       |       |       | ammin | eger- |       |       |       | ammin |
|       | g>`__ | ammin |       |       |       |       | g>`__ | nonli |       |       |       | g>`__ |
|       |       | g>`__ |       |       |       |       |       | near- |       |       |       |       |
|       |       |       |       |       |       |       |       | progr |       |       |       |       |
|       |       |       |       |       |       |       |       | ammin |       |       |       |       |
|       |       |       |       |       |       |       |       | g>`__ |       |       |       |       |
+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+=======+
| `CPLE | **✔** | **✔** | **✔** | **✔** | **✔** | **✔** |       |       |       |       |       |       |
| X <ht |       |       |       |       |       |       |       |       |       |       |       |       |
| tps:/ |       |       |       |       |       |       |       |       |       |       |       |       |
| /www. |       |       |       |       |       |       |       |       |       |       |       |       |
| aimms |       |       |       |       |       |       |       |       |       |       |       |       |
| .com/ |       |       |       |       |       |       |       |       |       |       |       |       |
| engli |       |       |       |       |       |       |       |       |       |       |       |       |
| sh/de |       |       |       |       |       |       |       |       |       |       |       |       |
| velop |       |       |       |       |       |       |       |       |       |       |       |       |
| ers/r |       |       |       |       |       |       |       |       |       |       |       |       |
| esour |       |       |       |       |       |       |       |       |       |       |       |       |
| ces/s |       |       |       |       |       |       |       |       |       |       |       |       |
| olver |       |       |       |       |       |       |       |       |       |       |       |       |
| s/cpl |       |       |       |       |       |       |       |       |       |       |       |       |
| ex>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `G    | **✔** | **✔** | **✔** | **✔** | **✔** | **✔** |       |       |       |       |       |       |
| UROBI |       |       |       |       |       |       |       |       |       |       |       |       |
|  <htt |       |       |       |       |       |       |       |       |       |       |       |       |
| ps:// |       |       |       |       |       |       |       |       |       |       |       |       |
| www.a |       |       |       |       |       |       |       |       |       |       |       |       |
| imms. |       |       |       |       |       |       |       |       |       |       |       |       |
| com/e |       |       |       |       |       |       |       |       |       |       |       |       |
| nglis |       |       |       |       |       |       |       |       |       |       |       |       |
| h/dev |       |       |       |       |       |       |       |       |       |       |       |       |
| elope |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/re |       |       |       |       |       |       |       |       |       |       |       |       |
| sourc |       |       |       |       |       |       |       |       |       |       |       |       |
| es/so |       |       |       |       |       |       |       |       |       |       |       |       |
| lvers |       |       |       |       |       |       |       |       |       |       |       |       |
| /guro |       |       |       |       |       |       |       |       |       |       |       |       |
| bi>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `OD   |       | **✔** |       | **✔** |       | **✔** |       |       |       |       |       |       |
| H-CPL |       |       |       |       |       |       |       |       |       |       |       |       |
| EX <h |       |       |       |       |       |       |       |       |       |       |       |       |
| ttps: |       |       |       |       |       |       |       |       |       |       |       |       |
| //www |       |       |       |       |       |       |       |       |       |       |       |       |
| .aimm |       |       |       |       |       |       |       |       |       |       |       |       |
| s.com |       |       |       |       |       |       |       |       |       |       |       |       |
| /engl |       |       |       |       |       |       |       |       |       |       |       |       |
| ish/d |       |       |       |       |       |       |       |       |       |       |       |       |
| evelo |       |       |       |       |       |       |       |       |       |       |       |       |
| pers/ |       |       |       |       |       |       |       |       |       |       |       |       |
| resou |       |       |       |       |       |       |       |       |       |       |       |       |
| rces/ |       |       |       |       |       |       |       |       |       |       |       |       |
| solve |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/od |       |       |       |       |       |       |       |       |       |       |       |       |
| h-cpl |       |       |       |       |       |       |       |       |       |       |       |       |
| ex>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `CP   |       |       |       |       |       |       |       |       |       |       |       | **✔** |
| Optim |       |       |       |       |       |       |       |       |       |       |       |       |
| izer  |       |       |       |       |       |       |       |       |       |       |       |       |
| <http |       |       |       |       |       |       |       |       |       |       |       |       |
| s://w |       |       |       |       |       |       |       |       |       |       |       |       |
| ww.ai |       |       |       |       |       |       |       |       |       |       |       |       |
| mms.c |       |       |       |       |       |       |       |       |       |       |       |       |
| om/en |       |       |       |       |       |       |       |       |       |       |       |       |
| glish |       |       |       |       |       |       |       |       |       |       |       |       |
| /deve |       |       |       |       |       |       |       |       |       |       |       |       |
| loper |       |       |       |       |       |       |       |       |       |       |       |       |
| s/res |       |       |       |       |       |       |       |       |       |       |       |       |
| ource |       |       |       |       |       |       |       |       |       |       |       |       |
| s/sol |       |       |       |       |       |       |       |       |       |       |       |       |
| vers/ |       |       |       |       |       |       |       |       |       |       |       |       |
| cp-op |       |       |       |       |       |       |       |       |       |       |       |       |
| timiz |       |       |       |       |       |       |       |       |       |       |       |       |
| er>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `C    | **✔** |       | **✔** |       | **✔** |       | **✔** |       |       |       |       |       |
| ONOPT |       |       |       |       |       |       |       |       |       |       |       |       |
|  <htt |       |       |       |       |       |       |       |       |       |       |       |       |
| ps:// |       |       |       |       |       |       |       |       |       |       |       |       |
| www.a |       |       |       |       |       |       |       |       |       |       |       |       |
| imms. |       |       |       |       |       |       |       |       |       |       |       |       |
| com/e |       |       |       |       |       |       |       |       |       |       |       |       |
| nglis |       |       |       |       |       |       |       |       |       |       |       |       |
| h/dev |       |       |       |       |       |       |       |       |       |       |       |       |
| elope |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/re |       |       |       |       |       |       |       |       |       |       |       |       |
| sourc |       |       |       |       |       |       |       |       |       |       |       |       |
| es/so |       |       |       |       |       |       |       |       |       |       |       |       |
| lvers |       |       |       |       |       |       |       |       |       |       |       |       |
| /cono |       |       |       |       |       |       |       |       |       |       |       |       |
| pt>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `K    | **✔** |       | **✔** |       | **✔** |       | **✔** | **✔** | **✔** | **✔** |       |       |
| nitro |       |       |       |       |       |       |       |       |       |       |       |       |
|  <htt |       |       |       |       |       |       |       |       |       |       |       |       |
| ps:// |       |       |       |       |       |       |       |       |       |       |       |       |
| www.a |       |       |       |       |       |       |       |       |       |       |       |       |
| imms. |       |       |       |       |       |       |       |       |       |       |       |       |
| com/e |       |       |       |       |       |       |       |       |       |       |       |       |
| nglis |       |       |       |       |       |       |       |       |       |       |       |       |
| h/dev |       |       |       |       |       |       |       |       |       |       |       |       |
| elope |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/re |       |       |       |       |       |       |       |       |       |       |       |       |
| sourc |       |       |       |       |       |       |       |       |       |       |       |       |
| es/so |       |       |       |       |       |       |       |       |       |       |       |       |
| lvers |       |       |       |       |       |       |       |       |       |       |       |       |
| /knit |       |       |       |       |       |       |       |       |       |       |       |       |
| ro>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `     | **✔** |       | **✔** |       |       |       | **✔** |       |       |       |       |       |
| SNOPT |       |       |       |       |       |       |       |       |       |       |       |       |
|  <htt |       |       |       |       |       |       |       |       |       |       |       |       |
| ps:// |       |       |       |       |       |       |       |       |       |       |       |       |
| www.a |       |       |       |       |       |       |       |       |       |       |       |       |
| imms. |       |       |       |       |       |       |       |       |       |       |       |       |
| com/e |       |       |       |       |       |       |       |       |       |       |       |       |
| nglis |       |       |       |       |       |       |       |       |       |       |       |       |
| h/dev |       |       |       |       |       |       |       |       |       |       |       |       |
| elope |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/re |       |       |       |       |       |       |       |       |       |       |       |       |
| sourc |       |       |       |       |       |       |       |       |       |       |       |       |
| es/so |       |       |       |       |       |       |       |       |       |       |       |       |
| lvers |       |       |       |       |       |       |       |       |       |       |       |       |
| /snop |       |       |       |       |       |       |       |       |       |       |       |       |
| t>`__ |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `     | **✔** |       | **✔** |       |       |       | **✔** |       |       |       |       |       |
| MINOS |       |       |       |       |       |       |       |       |       |       |       |       |
|  <htt |       |       |       |       |       |       |       |       |       |       |       |       |
| ps:// |       |       |       |       |       |       |       |       |       |       |       |       |
| www.a |       |       |       |       |       |       |       |       |       |       |       |       |
| imms. |       |       |       |       |       |       |       |       |       |       |       |       |
| com/e |       |       |       |       |       |       |       |       |       |       |       |       |
| nglis |       |       |       |       |       |       |       |       |       |       |       |       |
| h/dev |       |       |       |       |       |       |       |       |       |       |       |       |
| elope |       |       |       |       |       |       |       |       |       |       |       |       |
| rs/re |       |       |       |       |       |       |       |       |       |       |       |       |
| sourc |       |       |       |       |       |       |       |       |       |       |       |       |
| es/so |       |       |       |       |       |       |       |       |       |       |       |       |
| lvers |       |       |       |       |       |       |       |       |       |       |       |       |
| /mino |       |       |       |       |       |       |       |       |       |       |       |       |
| s>`__ |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `BARO |       | **✔** | **✔** | **✔** | **✔** | **✔** | **✔** | **✔** |       |       | **✔** |       |
| N <ht |       |       |       |       |       |       |       |       |       |       |       |       |
| tps:/ |       |       |       |       |       |       |       |       |       |       |       |       |
| /www. |       |       |       |       |       |       |       |       |       |       |       |       |
| aimms |       |       |       |       |       |       |       |       |       |       |       |       |
| .com/ |       |       |       |       |       |       |       |       |       |       |       |       |
| engli |       |       |       |       |       |       |       |       |       |       |       |       |
| sh/de |       |       |       |       |       |       |       |       |       |       |       |       |
| velop |       |       |       |       |       |       |       |       |       |       |       |       |
| ers/r |       |       |       |       |       |       |       |       |       |       |       |       |
| esour |       |       |       |       |       |       |       |       |       |       |       |       |
| ces/s |       |       |       |       |       |       |       |       |       |       |       |       |
| olver |       |       |       |       |       |       |       |       |       |       |       |       |
| s/bar |       |       |       |       |       |       |       |       |       |       |       |       |
| on>`_ |       |       |       |       |       |       |       |       |       |       |       |       |
| _\ ** |       |       |       |       |       |       |       |       |       |       |       |       |
| \ ^** |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| `PAT  |       |       |       |       |       |       |       |       | **✔** |       |       |       |
| H <ht |       |       |       |       |       |       |       |       |       |       |       |       |
| tps:/ |       |       |       |       |       |       |       |       |       |       |       |       |
| /www. |       |       |       |       |       |       |       |       |       |       |       |       |
| aimms |       |       |       |       |       |       |       |       |       |       |       |       |
| .com/ |       |       |       |       |       |       |       |       |       |       |       |       |
| engli |       |       |       |       |       |       |       |       |       |       |       |       |
| sh/de |       |       |       |       |       |       |       |       |       |       |       |       |
| velop |       |       |       |       |       |       |       |       |       |       |       |       |
| ers/r |       |       |       |       |       |       |       |       |       |       |       |       |
| esour |       |       |       |       |       |       |       |       |       |       |       |       |
| ces/s |       |       |       |       |       |       |       |       |       |       |       |       |
| olver |       |       |       |       |       |       |       |       |       |       |       |       |
| s/pat |       |       |       |       |       |       |       |       |       |       |       |       |
| h>`__ |       |       |       |       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+

^: Includes the use of parallel threads without any extra charge

Math Program Types Explanation
------------------------------

+----------------------------------+----------------------------------+
| ** Abbreviations**               | ** **\ `Mathematical Program     |
|                                  | Type <https://www.aimms.com/     |
|                                  | english/developers/resources/sol |
|                                  | vers/mathematical-programming#ma |
|                                  | thematical-programming-types>`__ |
+==================================+==================================+
| ** **\ `LP <https://www.aimms    |  Linear Program                  |
| .com/english/developers/resource |                                  |
| s/solvers/linear-programming>`__ |                                  |
+----------------------------------+----------------------------------+
| ** **                            |  Mixed Integer Program           |
| \ `MIP <https://www.aimms.com/en |                                  |
| glish/developers/resources/solve |                                  |
| rs/mixed-integer-programming>`__ |                                  |
+----------------------------------+----------------------------------+
| ** QP**                          |  Quadratic Program               |
+----------------------------------+----------------------------------+
| ** MIQP**                        |  Mixed Integer Quadratic Program |
+----------------------------------+----------------------------------+
| ** QCP**                         |  Quadratically Constrained       |
|                                  | Program                          |
+----------------------------------+----------------------------------+
| ** MIQCP**                       |  Mixed Integer Quadratically     |
|                                  | Constrained Program              |
+----------------------------------+----------------------------------+
| *                                |  NonLinear Program               |
| * **\ `NLP <https://www.aimms.co |                                  |
| m/english/developers/resources/s |                                  |
| olvers/nonlinear-programming>`__ |                                  |
+----------------------------------+----------------------------------+
| ** **\ `MINLP <ht                |  Mixed Integer NonLinear Program |
| tps://www.aimms.com/english/deve |                                  |
| lopers/resources/solvers/mixed-i |                                  |
| nteger-nonlinear-programming>`__ |                                  |
+----------------------------------+----------------------------------+
| ** MCP**                         |  Mixed Complementarity Program   |
+----------------------------------+----------------------------------+
| ** MPCC**                        |  Mathematical Program with       |
|                                  | Complementarity Constraints      |
+----------------------------------+----------------------------------+
| ** GO**                          |  Global Optimalization           |
+----------------------------------+----------------------------------+
| *                                |  Constraint Program              |
| * **\ `CP <https://www.aimms.com |                                  |
| /english/developers/resources/so |                                  |
| lvers/constraint-programming>`__ |                                  |
+----------------------------------+----------------------------------+

LP and MIP Solver Features
--------------------------

+----------------+----------------+----------------+----------------+
| **General      | `CPLEX         | `GUROBI        |  `C            |
| Features**     |  <https://www. | <https://www.a | BC <https://ww |
|                | aimms.com/engl | imms.com/engli | w.aimms.com/en |
|                | ish/developers | sh/developers/ | glish/develope |
|                | /resources/sol | resources/solv | rs/resources/s |
|                | vers/cplex>`__ | ers/gurobi>`__ | olvers/cbc>`__ |
+================+================+================+================+
| **Handle       | Y              | Y              |  Y             |
| updates**      |                |                |                |
+----------------+----------------+----------------+----------------+
| **Tuning       | Y              | Y              |                |
| tool**         |                |                |                |
+----------------+----------------+----------------+----------------+
| **Benders      | Y              |                |                |
| d              |                |                |                |
| ecomposition** |                |                |                |
+----------------+----------------+----------------+----------------+
| **Network      | Y              |                |                |
| algorithm**    |                |                |                |
+----------------+----------------+----------------+----------------+
| **Multiple     | Y              | Y              |                |
| models**       |                |                |                |
+----------------+----------------+----------------+----------------+
| **Parallel     | Y              | Y              |                |
| solver         |                |                |                |
| sessions**     |                |                |                |
+----------------+----------------+----------------+----------------+
| **Ranged       | Y              | Y              |  Y             |
| constraints**  |                |                |                |
+----------------+----------------+----------------+----------------+
| **Modeling     | Y              |                |                |
| assistance**   |                |                |                |
+----------------+----------------+----------------+----------------+
| **Presolve     | Y              |                |                |
| status         |                |                |                |
| information**  |                |                |                |
+----------------+----------------+----------------+----------------+
| **Solve MPS    | Y              | Y              |  Y             |
| file**         |                |                |                |
+----------------+----------------+----------------+----------------+

+----------------+----------------+----------------+----------------+
| **LP           | `CPLEX         | `GUROBI        |  `C            |
| Features**     |  <https://www. | <https://www.a | BC <https://ww |
|                | aimms.com/engl | imms.com/engli | w.aimms.com/en |
|                | ish/developers | sh/developers/ | glish/develope |
|                | /resources/sol | resources/solv | rs/resources/s |
|                | vers/cplex>`__ | ers/gurobi>`__ | olvers/cbc>`__ |
+================+================+================+================+
| **Barrier**    | Y              | Y              |  Y             |
+----------------+----------------+----------------+----------------+
| **Barrier      | Y              | Y              |  Y             |
| crossover**    |                |                |                |
+----------------+----------------+----------------+----------------+
| **Parallel     | Y              | Y              |                |
| solving        |                |                |                |
| barrier**      |                |                |                |
+----------------+----------------+----------------+----------------+
| **Concurrent   | Y              | Y              |                |
| LP**           |                |                |                |
+----------------+----------------+----------------+----------------+
| **Load basis** | Y              | Y              |  Y             |
+----------------+----------------+----------------+----------------+
| **IIS**        | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **Range RHS**  | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **Range        | Y              | Y              |                |
| objective**    |                |                |                |
+----------------+----------------+----------------+----------------+
| **Ext          | Y              | Y              |                |
| reme/unbounded |                |                |                |
| ray**          |                |                |                |
+----------------+----------------+----------------+----------------+
| **Farkas       | Y              | Y              |                |
| infeasibility  |                |                |                |
| proof**        |                |                |                |
+----------------+----------------+----------------+----------------+
| **Subgradient  | Y              | Y              |                |
| sensitivity**  |                |                |                |
+----------------+----------------+----------------+----------------+

+----------------+----------------+----------------+----------------+
| **MIP          | `CPLEX         | `GUROBI        |  `C            |
| Features**     |  <https://www. | <https://www.a | BC <https://ww |
|                | aimms.com/engl | imms.com/engli | w.aimms.com/en |
|                | ish/developers | sh/developers/ | glish/develope |
|                | /resources/sol | resources/solv | rs/resources/s |
|                | vers/cplex>`__ | ers/gurobi>`__ | olvers/cbc>`__ |
+================+================+================+================+
| **Parallel     | Y              | Y              |                |
| solving MIP**  |                |                |                |
+----------------+----------------+----------------+----------------+
| **Concurrent   |                | Y              |                |
| MIP**          |                |                |                |
+----------------+----------------+----------------+----------------+
| **N            | Y              | Y              |                |
| on-traditional |                |                |                |
| search**       |                |                |                |
+----------------+----------------+----------------+----------------+
| **Callback     | Y              | Y              |                |
| incumbent      |                |                |                |
| (intermediate  |                |                |                |
| solutions)**   |                |                |                |
+----------------+----------------+----------------+----------------+
| **Callback     | Y              |                |                |
| branch**       |                |                |                |
+----------------+----------------+----------------+----------------+
| **Callba       | Y              |                |                |
| ck candidate** |                |                |                |
+----------------+----------------+----------------+----------------+
| **Callback     | Y              | Y              |                |
| heuristic**    |                |                |                |
+----------------+----------------+----------------+----------------+
| **Callback     | Y              | Y              |                |
| user cut**     |                |                |                |
+----------------+----------------+----------------+----------------+
| **Callback     | Y              | Y              |                |
| lazy           |                |                |                |
| constraint**   |                |                |                |
+----------------+----------------+----------------+----------------+
| **User cut     | Y              |                |                |
| pool**         |                |                |                |
+----------------+----------------+----------------+----------------+
| **Lazy         | Y              | Y              |                |
| constraint     |                |                |                |
| pool**         |                |                |                |
+----------------+----------------+----------------+----------------+
| **Indicator    | Y              | Y              |                |
| constraints**  |                |                |                |
+----------------+----------------+----------------+----------------+
| **SOS 1**      | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **SOS 2**      | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **Solution     | Y              | Y              |                |
| pool**         |                |                |                |
+----------------+----------------+----------------+----------------+
| **MIP start**  | Y              | Y              |  Y             |
+----------------+----------------+----------------+----------------+
| **Variable     |                | Y              |                |
| hints**        |                |                |                |
+----------------+----------------+----------------+----------------+
| **Solution     | Y              | Y              |                |
| improvement    |                |                |                |
| heuristic**    |                |                |                |
+----------------+----------------+----------------+----------------+
| **Feasibility  | Y              | Y              |  Y             |
| pump**         |                |                |                |
+----------------+----------------+----------------+----------------+
| **RINS         | Y              | Y              |  Y             |
| heuristic**    |                |                |                |
+----------------+----------------+----------------+----------------+

+----------------+----------------+----------------+----------------+
| **Nonlinear    | `CPLEX         | `GUROBI        |  `C            |
| Features**     |  <https://www. | <https://www.a | BC <https://ww |
|                | aimms.com/engl | imms.com/engli | w.aimms.com/en |
|                | ish/developers | sh/developers/ | glish/develope |
|                | /resources/sol | resources/solv | rs/resources/s |
|                | vers/cplex>`__ | ers/gurobi>`__ | olvers/cbc>`__ |
+================+================+================+================+
| **QP**         | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **MIQP**       | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **QCP**        | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **MIQCP**      | Y              | Y              |                |
+----------------+----------------+----------------+----------------+
| **SOCP (second | Y              | Y              |                |
| order cone)**  |                |                |                |
+----------------+----------------+----------------+----------------+
| **MISOCP       | Y              | Y              |                |
| (integer       |                |                |                |
| SOCP)**        |                |                |                |
+----------------+----------------+----------------+----------------+
| **Non-convex   | Y              | Y              |                |
| QP & MIQP**    |                |                |                |
+----------------+----------------+----------------+----------------+
| **Non-convex   |                | Y              |                |
| QCP & MIQCP**  |                |                |                |
+----------------+----------------+----------------+----------------+
