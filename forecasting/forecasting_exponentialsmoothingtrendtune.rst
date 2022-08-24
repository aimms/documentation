.. aimms:function:: forecasting::ExponentialSmoothingTrendTune(dataValues, noObservations, alpha, beta, alphaLow, alphaUpp, betaLow, betaUpp)

.. _forecasting::ExponentialSmoothingTrendTune:

forecasting::ExponentialSmoothingTrendTune
==========================================

The :aimms:func:`forecasting::ExponentialSmoothingTrendTune` procedure is a time
series forecasting helper procedure of :aimms:func:`forecasting::ExponentialSmoothingTrend` by computing the
:math:`\alpha` and :math:`\beta` for which the mean squared error is
minimized.

Function Prototype
------------------

    .. code-block:: aimms

            forecasting::ExponentialSmoothingTrendTune(    
            ! Provides the alpha for which the mean squared error is minimized.
                  dataValues,      ! Input, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar output,  
                  beta,            ! Scalar output,  
                  alphaLow,        ! Optional input, default 0.01
                  alphaUpp,        ! Optional input, default 0.99          
                  betaLow,         ! Optional input, default 0.01
                  betaUpp)         ! Optional input, default 0.99          

Arguments
---------

    *dataValues*
        A one dimensional parameter containing the observations for the first
        :math:`T` elements of the time set.

    *noObservations*
        Specifies the number of elements that belong to the history of the time
        set. This parameter corresponds to :math:`T` in the notation presented
        in :numref:`table:notation-observation-estimation`.

    *alpha,*
        beta] :math:`\alpha` and :math:`\beta` are scalar output parameters of
        this procedure. The values for :math:`\alpha` and :math:`\beta` are such
        that the mean squared error of the estimates returned by :aimms:func:`forecasting::ExponentialSmoothingTrend` are
        minimized.

    *alphaLow*
        Lowerbound on :math:`\alpha`, default 0.01.

    *alphaUpp*
        Upperbound on :math:`\alpha`, default 0.99.

    *betaLow*
        Lowerbound on :math:`\beta`, default 0.01.

    *betaUpp*
        Upperbound on :math:`\beta`, default 0.99.

.. note::

    -  In order to use this function, the AIMMSForecasting system library
       needs to be added to the application.

    -  Please note that this function performs an optimization step; a
       nonlinear programming solver should be available and, in an AIMMS PRO
       environment, it should be run server side.
