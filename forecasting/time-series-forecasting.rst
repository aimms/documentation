Time Series Forecasting
*************************

For time series forecasting, such as **Moving Average** and
**Exponential Smoothing**, we follow the notational conventions below.

Observations and Estimates
--------------------------

The ``AIMMSForecasting`` library uses as input observations made in the
history. It provides estimates over both the history and the horizon. A
single set and index is used to index both the history and the
estimates, this set is called the **time set**. In addition, you will
need to specify the number of elements that belong to the history. The
corresponding mathematical notation is:

.. _chapter:time-series-forecasting:

.. table:: Time Series Forecasting Notation

   ====================================== ======================
   :math:`T`                              number of observations
   :math:`H`                              length of horizon
   :math:`\{1\ldots T+H\}`                time set
   :math:`t`                              index in time set
   :math:`y_t, t \in \{1\ldots T\}`       observation
   :math:`e_t, t \in \textrm{ time set }` estimate
   ====================================== ======================

The forecasts are provided in :math:`e_t`, :math:`t \in \{T+1 \ldots T+H\}`.

Residuals
----------

The residual, :math:`r_t` where :math:`t \in \{1\ldots T\}`, is the
difference between the corresponding observation :math:`y_t` and
estimate :math:`e_t`. To obtain the residuals, you will need to provide
a parameter declared over the time set.

Error Measures
--------------

From the residuals, error measures such as Mean Absolute Deviation
(MAD), Mean Absolute Percentage Error (MAPE), and Mean Squared Deviation
(MSD) can be computed.

Predeclared Index ``ems``
--------------------------

Whenever one of the time series forecasting functions communicates the
error measures, it uses identifiers declared over the index
``forecasting::ems``, declared as follows:

.. code-block:: aimms
    :linenos:

            Set ErrorMeasureSet {
                Index: ems;
                Definition: {
                    data {
                        MAD,  ! Mean Absolute Deviation
                        MAPE, ! Mean Absolute Percentage Error (provided as fraction)
                        MSE   ! Mean Squared Error
                    }
                }
            }

To obtain the error measures, you will need to provide a parameter indexed over ``forecasting::ems`` to the time series forecasting functions.
Note that the MAPE is a fraction, in order to use it as a percentage, you can use the predeclared quantity ``SI_unitless``.
For instance, given the declarations:

.. code-block:: aimms
    :linenos:

            Quantity SI_Unitless {
                BaseUnit: -;
                Conversions: % -> - : # -> # / 100;
                Comment: "Expresses a dimensionless value.";
            }
            Parameter myMAPE {
                Unit: %;
            }
            Parameter myErrorMeasures { 
                IndexDomain: forecasting::ems;
            }

The following statements:

.. code-block:: aimms
    :linenos:

            myMAPE := myErrorMeasures('MAPE') ;
            display myErrorMeasures, myMAPE ;

The output may look as follows:

.. code-block:: aimms
    :linenos:

            myErrorMeasures := data { MAPE : 0.417092,  MAD : 1.785714,  MSE : 3.982143 } ;
            myMAPE := 41.709184 [%] ;

