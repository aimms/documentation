.. aimms:function:: forecasting::ExponentialSmoothingTrend(dataValues, estimates, noObservations, alpha, beta, ErrorMeasures, Residuals)

.. _forecasting::ExponentialSmoothingTrend:

forecasting::ExponentialSmoothingTrend
======================================

The exponential smoothing with trend procedure is a time series
forecasting procedure. This procedure is an extension from the
exponential smoothing whereby the forecast also captures a trend. The
reader interested in the mathematical background is referred to

-  https://www.otexts.org/book/fpp
-  http://en.wikipedia.org/wiki/Exponential_smoothing

Function Prototype
------------------

    To provide the error measures and residuals only when you need them,
    there are three flavors of the ``ExponentialSmoothingTrend`` procedure
    provided:

    .. code-block:: aimms

            forecasting::ExponentialSmoothingTrend(    
            ! Provides the estimates, but not the error measures nor the residuals
                  dataValues,      ! Input, parameter indexed over time set
                  estimates,       ! Output, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar input, weight of observation
                  beta)            ! Scalar input, weight of change in observation

    .. code-block:: aimms

            forecasting::ExponentialSmoothingTrendEM(  
            ! Provides estimates and error measures, but not the residuals
                  dataValues,      ! Input, parameter indexed over time set
                  estimates,       ! Output, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar input, weight of observation
                  beta,            ! Scalar input, weight of change in observation
                  ErrorMeasures)   ! Output, indexed over forecasting::ems

    .. code-block:: aimms

            forecasting::ExponentialSmoothingTrendEMR( 
            ! Provides estimates, error measures, and residuals
                  dataValues,      ! Input, parameter indexed over time set
                  estimates,       ! Output, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar input, weight of observation
                  beta,            ! Scalar input, weight of change in observation
                  ErrorMeasures,   ! Output, indexed over forecasting::ems
                  Residuals)       ! Output, parameter indexed over time set

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
        in :numref:`table:notation-observation-estimation`.

    *alpha*
        Specifies the weighting factor for the observation. This parameter
        corresponds to :math:`\alpha` in the mathematical notation above.

    *beta*
        Specifies the weighting factor for the change in observation.

    *ErrorMeasures*
        The error measures as presented in :ref:`chapter:time-series-forecasting`.

    *Residuals*
        The residuals as presented in :ref:`chapter:time-series-forecasting`.

Example
-------

    With declarations and data as specified in :numref:`table:sample-input-data` the call:

    .. code-block:: aimms

                forecasting::ExponentialSmoothingTrend(
                    dataValues         :  p_dat,
                    estimates          :  p_est,
                    noObservations     :  91,
                    alpha              :  0.3,
                    beta               :  0.3);



    This can be
    graphically displayed as:

    |image|

    .. |image| image:: images/EST2021.png
