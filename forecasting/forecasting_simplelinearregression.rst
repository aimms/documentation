.. aimms:function:: forecasting::SimpleLinearRegression(xIndepVarValue, yDepVarValue, LRcoeff, VariationComp, yEstimates, eResiduals)

forecasting::SimpleLinearRegression
===================================

The simple linear regression procedure computes the regression line
coefficients based on the values of the observations for the independent
and the dependent variables. If desired, the values for variation
components and the residuals can be returned as well.

Mathematical Formulation
------------------------

Using the notation for observations and estimates given in
:ref:`chapter:notation-observation-data-SLR`, the estimates of the coefficients of the linear regression line
are determined as follows:

.. math:: \hat{\beta}_1 = \frac{\sum_{i=1}^{N}(x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^{N}(x_i - \hat{x})^2}

.. math:: \hat{\beta}_0 = \bar{y} - \hat{\beta}_1\bar{x}

These values provide the minimum in :math:`\hat{\beta}_0`,
:math:`\hat{\beta}_1` of the function

.. math:: F(\hat{\beta}_0,\hat{\beta}_1) = \sum_{i=1}^{N}e_i^2 = \sum_{i=1}^{N}(y_i - \hat{\beta}_0 - \hat{\beta}_1x_i)^2 )

Therefore, the values :math:`\hat{\beta}_0` and :math:`\hat{\beta}_1`
given above are called the **least squares estimates** of
:math:`\beta_0` and :math:`\beta_1`. With these coefficients, the
regression line :eq:`SLR-line` is called the **least squares regression
line**. Every least squares regression line has the following two
properties:

-  It passes through the point :math:`(\bar{x},\bar{y})`

-  :math:`\sum_{i=1}^{N} e_i = 0`

Function Prototype
------------------

In order to provide the variation components and residuals only when
needed, there are three flavors of the ``SimpleLinearRegression``
procedure provided:

.. code-block:: aimms

    forecasting::SimpleLinearRegression( ! Provides the estimates of the line coefficients, but not the variation components nor the residuals
        xIndepVarValue,              ! Input, parameter for independent
        yDepVarValue,                ! Input, parameter for dependent
        LRcoeff)                     ! Output, parameter for line coefficients

.. code-block:: aimms

    forecasting::SimpleLinearRegressionVC( ! Provides the estimates of the line coefficients and the variation components
        xIndepVarValue,                ! Input, parameter for independent
        yDepVarValue,                  ! Input, parameter for dependent
        LRcoeff,                       ! Output, parameter for line coefficients
        VariationComp)                 ! Output, parameter variation components	

.. code-block:: aimms

    forecasting::SimpleLinearRegressionVCR( ! Provides the estimates of the line coefficients, the variation components and the residuals
        xIndepVarValue,                 ! Input, parameter for independent
        yDepVarValue,                   ! Input, parameter for dependent
        LRcoeff,                        ! Output, parameter for line coefficients
        VariationComp,                  ! Output, parameter variation components
        yEstimates,                     ! Output, parameter for estimates
        eResiduals)                     ! Output, parameter for residuals

Arguments
---------

    *xIndepVarValue*
        A one dimensional parameter containing the observations for the
        independent variable

    *yDepVarValue*
        A one dimensional parameter containing the observations for the
        dependent variable

    *LRcoeff*
        A one dimensional parameter for storing the coefficients of the
        regression line

    *VariationComp*
        A one dimensional parameter for storing the values of the variation
        components

    *yEstimates*
        A one dimensional parameter for storing the values of the estimates

    *eResiduals*
        A one dimensional parameter for storing the values of the residuals

.. note::

    In order to use this function, the ``Forecasting`` system library needs
    to be added to the application.

Example
-------

To further understand about this procedure and library, please use the `Demand Forecasting <https://how-to.aimms.com/Articles/550/550-demand-forecasting.html>`_ example. 
