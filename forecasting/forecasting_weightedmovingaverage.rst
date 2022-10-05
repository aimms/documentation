.. aimms:function:: forecasting::WeightedMovingAverage(dataValues, estimates, noObservations, weights, noAveragingPeriods, ErrorMeasures, Residuals)

forecasting::WeightedMovingAverage
==================================

The weighted moving average procedure is a time series forecasting
procedure. Essentially, this procedure forecasts by taking the weighted
average over the last :math:`N` observations.

Mathematical Formulation
------------------------

Using the notation for observations and estimates given in
:ref:`chapter:time-series-forecasting`, the estimates are defined as:

.. math:: e_t = \sum_{j=1,\tau=t-(N+1)+j}^N {w_j \tilde y}_\tau \mspace{4mu}\mspace{4mu}\mspace{4mu} \textrm{ where } {\tilde y}_\tau = \left\{ \begin{array}{ll} y_1 & \textrm{ if } \tau < 1 \\ y_\tau & \textrm{ if } \tau \in \{1 .. T \} \\ e_\tau & \textrm{ if } \tau > T \end{array} \right.

Function Prototype
------------------

To provide the error measures and residuals only when you need them,
there are three flavors of the ``WeightedMovingAverage`` procedure
provided:

.. code-block:: aimms

        forecasting::WeightedMovingAverage(
                ! Provides the estimates, 
                ! but not the error measures nor the residuals
                dataValues,              ! Input, parameter indexed over time set
                estimates,               ! Output, parameter indexed over time set
                noObservations,          ! Scalar input, length history
                weights,                 ! Input, parameter  
                noAveragingPeriods)      ! Scalar input, averaging length

.. code-block:: aimms

        forecasting::WeightedMovingAverageEM(  
                ! Provides estimates and error measures, but not the residuals
                dataValues,              ! Input, parameter indexed over time set
                estimates,               ! Output, parameter indexed over time set
                noObservations,          ! Scalar input, length history
                weights,                 ! Input, parameter  
                noAveragingPeriods,      ! Scalar input, averaging length
                ErrorMeasures)           ! Output, indexed over forecasting::ems

.. code-block:: aimms

        forecasting::WeightedMovingAverageEMR( 
                ! Provides estimates, error measures, and residuals
                dataValues,              ! Input, parameter indexed over time set
                estimates,               ! Output, parameter indexed over time set
                noObservations,          ! Scalar input, length history
                weights,                 ! Input, parameter  
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

    *weights*
        Specifies the weights. The weights should be indexed over a subset of
        :aimms:set:`Integers`: :math:`\{ 1 .. N\}`, in the range :math:`[0,1]` and sum to 1.

    *noAveragingPeriods*
        Specifies the number of values used to compute a single average. This
        parameter corresponds to :math:`N` in the mathematical notation above.

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
