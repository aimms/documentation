.. aimms:function:: forecasting::ExponentialSmoothingTrend(dataValues, estimates, noObservations, alpha, beta, ErrorMeasures, Residuals)

forecasting::ExponentialSmoothingTrend
======================================

The exponential smoothing with trend procedure is a time series
forecasting procedure. This procedure is an extension from the
exponential smoothing whereby the forecast also captures a trend. The
reader interested in the mathematical background is referred to:

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
        in :ref:`chapter:time-series-forecasting`.

    *alpha*
        Specifies the weighting factor for the observation. This parameter
        corresponds to :math:`\alpha` in the mathematical notation above.

    *beta*
        Specifies the weighting factor for the change in observation.

    *ErrorMeasures*
        The error measures as presented in :ref:`chapter:time-series-forecasting`.

    *Residuals*
        The residuals as presented in :ref:`chapter:time-series-forecasting`.

.. note::

    In order to use this function, the ``Forecasting`` system library needs
    to be added to the application.

Example
-------

To further understand about this procedure and library, please use the `Demand Forecasting <https://how-to.aimms.com/Articles/550/550-demand-forecasting.html>`_ example. 


