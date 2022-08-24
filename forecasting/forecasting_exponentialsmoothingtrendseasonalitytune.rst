.. aimms:function:: forecasting::ExponentialSmoothingTrendSeasonalityTune(dataValues, noObservations, alpha, beta, gamma, periodLength, alphaLow, alphaUpp, betaLow, betaUpp, gammaLow, gammaUpp)

.. _forecasting::ExponentialSmoothingTrendSeasonalityTune:

forecasting::ExponentialSmoothingTrendSeasonalityTune
=====================================================

The :aimms:func:`forecasting::ExponentialSmoothingTrendSeasonalityTune` procedure
is a time series forecasting helper procedure of :aimms:func:`forecasting::ExponentialSmoothingTrendSeasonality` by computing
the :math:`\alpha`, :math:`\beta`, and :math:`\gamma` for which the mean
squared error is minimized.

Function Prototype
------------------

    .. code-block:: aimms

            forecasting::ExponentialSmoothingTrendSeasonalityTune(    
            ! Provides the alpha for which the mean squared error is minimized.
                  dataValues,      ! Input, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar output,  
                  beta,            ! Scalar output,  
                  gamma,           ! Scalar output,  
                  periodLength,    ! Scalar input, length of season
                  alphaLow,        ! Optional input, default 0.01
                  alphaUpp,        ! Optional input, default 0.99          
                  betaLow,         ! Optional input, default 0.01
                  betaUpp,         ! Optional input, default 0.99          
                  gammaLow,        ! Optional input, default 0.01
                  gammaUpp)        ! Optional input, default 0.99          

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
        beta, gamma] :math:`\alpha`, :math:`\beta`, and :math:`\gamma` are
        scalar output parameters of this procedure. The values for
        :math:`\alpha`, :math:`\beta`, and :math:`\gamma` are such that the mean
        squared error of the estimates returned by :aimms:func:`forecasting::ExponentialSmoothingTrendSeasonality` are minimized.

    *periodLength*
        Specifies the period length.

    *alphaLow*
        Lowerbound on :math:`\alpha`, default 0.01.

    *alphaUpp*
        Upperbound on :math:`\alpha`, default 0.99.

    *betaLow*
        Lowerbound on :math:`\beta`, default 0.01.

    *betaUpp*
        Upperbound on :math:`\beta`, default 0.99.

    *gammaLow*
        Lowerbound on :math:`\gamma`, default 0.01.

    *gammaUpp*
        Upperbound on :math:`\gamma`, default 0.99.

.. note::

    -  In order to use this function, the AIMMSForecasting system library
       needs to be added to the application.

    -  Please note that this function performs an optimization step; a
       nonlinear programming solver should be available and, in an AIMMS PRO
       environment, it should be run server side.
