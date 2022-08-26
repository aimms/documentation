.. aimms:function:: forecasting::MovingAverage(dataValues, estimates, noObservations, noAveragingPeriods, ErrorMeasures, Residuals)

forecasting::MovingAverage
==========================

The moving average procedure is a time series forecasting procedure.
Essentially, this procedure forecasts by taking the average over the
last :math:`N` observations.

Mathematical Formulation
------------------------

    Using the notation for observations and estimates given in
    :ref:`chapter:time-series-forecasting`, the estimates are defined as:

    .. math:: e_t = \sum_{\tau=t-1-N}^{t-1} {\tilde y}_\tau / N \mspace{4mu}\mspace{4mu}\mspace{4mu} \textrm{ where } {\tilde y}_\tau = \left\{ \begin{array}{ll} y_1 & \textrm{ if } \tau < 1 \\ y_\tau & \textrm{ if } \tau \in \{1 .. T \} \\ e_\tau & \textrm{ if } \tau > T \end{array} \right.

Function Prototype
------------------

    To provide the error measures and residuals only when you need them,
    there are three flavors of the ``MovingAverage`` procedure provided:

    .. code-block:: aimms

            forecasting::MovingAverage(    ! Provides the estimates, but not the
                                           ! error measures nor the residuals
                  dataValues,              ! Input, parameter indexed over time set
                  estimates,               ! Output, parameter indexed over time set
                  noObservations,          ! Scalar input, length history
                  noAveragingPeriods)      ! Scalar input, averaging length

    .. code-block:: aimms

            forecasting::MovingAverageEM(  ! Provides estimates and error measures, 
                                           ! but not the residuals
                  dataValues,              ! Input, parameter indexed over time set
                  estimates,               ! Output, parameter indexed over time set
                  noObservations,          ! Scalar input, length history
                  noAveragingPeriods,      ! Scalar input, averaging length
                  ErrorMeasures)           ! Output, indexed over forecasting::ems

    .. code-block:: aimms

            forecasting::MovingAverageEMR( ! Provides estimates, error measures,
                                           ! and residuals
                  dataValues,              ! Input, parameter indexed over time set
                  estimates,               ! Output, parameter indexed over time set
                  noObservations,          ! Scalar input, length history
                  noAveragingPeriods,      ! Scalar input, averaging length
                  ErrorMeasures,           ! Output, indexed over forecasting::ems
                  Residuals)               ! Output, parameter indexed over time set

    Here, the time set is a set that encompasses both the history and the
    horizon.

Arguments
---------

    *dataValues*
        A one dimensional parameter containing the observations for the first
        :math:`T` elements of the time set.

    *estimates*
        A one dimensional parameter containing the estimates for all elements in
        the time set.

    *noObservations*
        Specifies the number of elements that belong to the history of the time
        set. This parameter corresponds to :math:`T` in the notation presented
        in :ref:`chapter:time-series-forecasting`.

    *noAveragingPeriods*
        Specifies the number of values used to compute a single average. This
        parameter corresponds to :math:`N` in the mathematical notation above.

    *ErrorMeasures*
        The error measures as presented in :ref:`chapter:time-series-forecasting`.

    *Residuals*
        The residuals as presented in :ref:`chapter:time-series-forecasting`.

Example
-------

    .. code-block:: aimms
       :caption: Sample declarations and input data for the time series calculation 

            Parameter p_dat {
                IndexDomain: d;
            }
            Parameter p_est {
                IndexDomain: d;
            }
            Calendar dayCalendar {
                Index: d;
                Parameter: e_d;
                Unit: day;
                BeginDate: "2014-01-01";
                EndDate: "2014-02-14";
                TimeslotFormat: "\%m-\%d";
            }

            p_dat := data 
                { 2021-04-01 :  51.10642965,
                  2021-04-02 :  27.60599782,
                  2021-04-03 :  16.03268625,
                  2021-04-04 :  26.10554902,
                  2021-04-05 :  48.06161391,
                  2021-04-06 :  60.34104792,
                  2021-04-07 :  52.39190944,
                  2021-04-08 :  65.66566651,
                  2021-04-09 :  51.24847398,
                  2021-04-10 :  51.36570967,
                  2021-04-11 :  46.46609789,
                  2021-04-12 :  70.39085997,
                  2021-04-13 :  76.68721154,
                  2021-04-14 :  80.14613849,
                  2021-04-15 :  88.96799795,
                  2021-04-16 :  76.54330882,
                  2021-04-17 :  64.38929735,
                  2021-04-18 :  69.26673854,
                  2021-04-19 :  92.13033562,
                  2021-04-20 :  90.98918536,
                  2021-04-21 : 102.01117650,
                  2021-04-22 : 114.16659006,
                  2021-04-23 :  88.33833073,
                  2021-04-24 :  85.07193353,
                  2021-04-25 :  81.87063295,
                  2021-04-26 :  97.34112080,
                  2021-04-27 : 116.06439032,
                  2021-04-28 : 130.44323927,
                  2021-04-29 : 134.98483389,
                  2021-04-30 : 111.78381884,
                  2021-05-01 :  99.76879398,
                  2021-05-02 : 111.74898391,
                  2021-05-03 : 132.44822726,
                  2021-05-04 : 133.59745130,
                  2021-05-05 : 145.18487079,
                  2021-05-06 : 157.17676218,
                  2021-05-07 : 138.70319733,
                  2021-05-08 : 124.59203057,
                  2021-05-09 : 132.35266707,
                  2021-05-10 : 143.77651023,
                  2021-05-11 : 157.29236502,
                  2021-05-12 : 162.13763982,
                  2021-05-13 : 181.94439347,
                  2021-05-14 : 157.32205347,
                  2021-05-15 : 148.50174552,
                  2021-05-16 : 151.50916024,
                  2021-05-17 : 175.31375259,
                  2021-05-18 : 183.26770992,
                  2021-05-19 : 199.71036477,
                  2021-05-20 : 197.91545822,
                  2021-05-21 : 173.42132247,
                  2021-05-22 : 175.18059184,
                  2021-05-23 : 171.37888563,
                  2021-05-24 : 184.77698064,
                  2021-05-25 : 199.33880154,
                  2021-05-26 : 206.92693548,
                  2021-05-27 : 219.11082111,
                  2021-05-28 : 208.17415048,
                  2021-05-29 : 198.72685861,
                  2021-05-30 : 193.30014815,
                  2021-05-31 : 199.99333572,
                  2021-06-01 : 229.97957132,
                  2021-06-02 : 231.35536393,
                  2021-06-03 : 239.21711421,
                  2021-06-04 : 220.82911277,
                  2021-06-05 : 210.07199075,
                  2021-06-06 : 213.66820120,
                  2021-06-07 : 235.89342661,
                  2021-06-08 : 250.32160873,
                  2021-06-09 : 240.60041550,
                  2021-06-10 : 263.07689380,
                  2021-06-11 : 245.09345343,
                  2021-06-12 : 228.35135754,
                  2021-06-13 : 234.19846592,
                  2021-06-14 : 257.27352280,
                  2021-06-15 : 263.26828859,
                  2021-06-16 : 270.95785737,
                  2021-06-17 : 287.71719703,
                  2021-06-18 : 276.33433316,
                  2021-06-19 : 256.71038776,
                  2021-06-20 : 267.03125312,
                  2021-06-21 : 276.41613338,
                  2021-06-22 : 288.65643549,
                  2021-06-23 : 296.75512424,
                  2021-06-24 : 306.44049646,
                  2021-06-25 : 288.09017282,
                  2021-06-26 : 264.31431890,
                  2021-06-27 : 287.37534925,
                  2021-06-28 : 301.79845935,
                  2021-06-29 : 304.71238328,
                  2021-06-30 : 311.76177832 } ;

    .. code-block:: aimms

                    forecasting::MovingAverage(
                        dataValues         :  p_dat, 
                        estimates          :  p_est, 
                        noObservations     :  91, 
                        noAveragingPeriods :  5);


    This can be
    graphically displayed as:

    |image|

    Here the history is from ``2021-04-01`` till ``2021-06-30`` and the horizon is from ``2021-07-01`` till ``2021-07-31``.

    .. |image| image:: images/MA2021.png

.. spellcheck::
    ​​
    MovingAverage