.. aimms:function:: forecasting::ExponentialSmoothing(dataValues, estimates, noObservations, alpha, ErrorMeasures, Residuals)

.. _forecasting::ExponentialSmoothing:

forecasting::ExponentialSmoothing
=================================

The exponential smoothing procedure is a time series forecasting
procedure. This procedure forecasts by weighted average of an
observation and a previous forecast.

Mathematical Formulation
------------------------

    Using the notation in :numref:`table:notation-observation-estimation`, the estimates are defined as:

    .. math:: e_t = \alpha y_{t-1} + ( 1 - \alpha ) e_{t-1}

    \ To initialize this sequence, we take

    .. math:: \begin{array}{l} e_0 = y_1 \\ y_0 = y_1 \end{array}

    To calculate the forecasts for :math:`t\geq T+2`, we take :math:`y_t`
    for all :math:`t \in \{T+1 \ldots T+H \}` to be equal to :math:`e_t`.
    This results in :math:`y_t = y_{t-1}` for all
    :math:`t \in \{T+2 \ldots T+H \}`; which is graphically depicted as a
    horizontal line. The weighting factor :math:`\alpha` is a parameter in
    the range :math:`(0,1)`; high values of :math:`\alpha` give more weight
    to recent observations.

Function Prototype
------------------

    To provide the error measures and residuals only when you need them,
    there are three flavors of the ``ExponentialSmoothing`` procedure
    provided:

    .. code-block:: aimms

            forecasting::ExponentialSmoothing(    
            ! Provides the estimates, but not the error measures nor the residuals
                  dataValues,      ! Input, parameter indexed over time set
                  estimates,       ! Output, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha)           ! Scalar input, weight of observation

    .. code-block:: aimms

            forecasting::ExponentialSmoothingEM(  
            ! Provides estimates and error measures, but not the residuals
                  dataValues,      ! Input, parameter indexed over time set
                  estimates,       ! Output, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar input, weight of observation
                  ErrorMeasures)   ! Output, indexed over forecasting::ems

    .. code-block:: aimms

            forecasting::ExponentialSmoothingEMR( 
            ! Provides estimates, error measures, and residuals
                  dataValues,      ! Input, parameter indexed over time set
                  estimates,       ! Output, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar input, weight of observation
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

    *ErrorMeasures*
        The error measures as presented in :ref:`chapter:time-series-forecasting`.

    *Residuals*
        The residuals as presented in :ref:`chapter:time-series-forecasting`.

.. note::

    In order to use this function, the AIMMSForecasting system library needs
    to be added to the application.

Example
-------

    With declarations and data as specified in :numref:`table:sample-input-data` the call:

    .. code-block:: aimms

                forecasting::ExponentialSmoothing(
                    dataValues         :  p_dat,
                    estimates          :  p_est,
                    noObservations     :  91,
                    alpha              :  0.3);



    This can be
    graphically displayed as:

    |image|

    .. |image| image:: images/ES2021.png
