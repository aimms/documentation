.. aimms:function:: forecasting::ExponentialSmoothingTune(dataValues, noObservations, alpha, alphaLow, alphaUpp)

.. _forecasting::ExponentialSmoothingTune:

forecasting::ExponentialSmoothingTune
=====================================

The :aimms:func:`forecasting::ExponentialSmoothingTune` procedure is a time series
forecasting helper procedure of :aimms:func:`forecasting::ExponentialSmoothing` by computing the
:math:`\alpha` for which the mean squared error is minimized.

Function Prototype
------------------

    .. code-block:: aimms

            forecasting::ExponentialSmoothingTune(    
            ! Provides the alpha for which the mean squared error is minimized.
                  dataValues,      ! Input, parameter indexed over time set
                  noObservations,  ! Scalar input, length history
                  alpha,           ! Scalar output, weight of observation 
                                   ! that minimizes mean squared error
                  alphaLow,        ! Optional input, default 0.01
                  alphaUpp)        ! Optional input, default 0.99          

Arguments
---------

    *dataValues*
        A one dimensional parameter containing the observations for the first
        :math:`T` elements of the time set.

    *noObservations*
        Specifies the number of elements that belong to the history of the time
        set. This parameter corresponds to :math:`T` in the notation presented
        in :numref:`table:notation-observation-estimation`.

    *alpha*
        Upon return it provides the weighting factor :math:`\alpha` for which
        the mean squared error is minimized when using :aimms:func:`forecasting::ExponentialSmoothing` on the same
        ``dataValues``.

    *alphaLow*
        Lowerbound on :math:`\alpha`, default 0.01.

    *alphaUpp*
        Upperbound on :math:`\alpha`, default 0.99.

.. note::

    -  In order to use this function, the AIMMSForecasting system library
       needs to be added to the application.

    -  Please note that this function performs an optimization step; a
       nonlinear programming solver should be available and, in an AIMMS PRO
       environment, it should be run server side.
