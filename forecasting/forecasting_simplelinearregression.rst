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

Example
-------

    Suppose that we are looking at cost data for producing one type of
    machine. The number of units produced is an independent variable and the
    total production costs is a dependent variable. For this situation,
    consider the following observations data: 

    .. code-block:: aimms

        		Set sObservationsSet {
        			SubsetOf: Integers;
        			Index: i_ob;
        			Definition: data{1..10};}

        		Parameter MachinesProd {
        			IndexDomain: i_ob;
        			Definition: {
        				data{
        					1 : 10,
        					2 : 20,
        					3 : 30,
        					4 : 40,
        					5 : 45,
        					6 : 50,
        					7 : 60,
        					8 : 55,
        					9 : 70,
        					10 : 40
        				}}}    

        		Parameter CostOfMachinesProd {
        			IndexDomain: i_ob;
        			Definition: {
        				data{
        					1 :  257.40,
        					2 :  601.60,
        					3 :  782.00,
        					4 :  765.40,
        					5 :  895.50,
        					6 : 1133.00,
        					7 : 1152.80,
        					8 : 1132.70,
        					9 : 1459.20,
        					10 :  970.10}}}   

    With the
    declarations and the data as specified, the following function call:

    .. code-block:: aimms

        forecasting::SimpleLinearRegressionVCR( 
                         xIndepVarValue        :  MachinesProd, 
                         yDepVarValue          :  CostOfMachinesProd, 
                         LRcoeff               :  Coeff, 
                         VariationComp         :  VariationMeasure, 
                         yEstimates            :  CostEstimate, 
                         eResiduals            :  CostError);

    will result in the following output data: 

    .. code-block:: aimms

          Coeff := data
          {
          0  :  164.87790700,     ! Intercept Coefficient of Regression Line
          1  :   17.85933555      ! Slope Coefficient of Regression Line
          }

          VariationMeasure := data
          {
          SST        :  1021762.50100,          ! Sum of Squares Total
          SSE        :    61705.34367,          ! Sum of Squares Error
          SSR,       :   960057.15730,          ! Sum of Squares Regression
          Rsquare,   :        0.9396089173,     ! Coefficient of Determination
          MultipleR, :        0.9693342650,     ! Sample Linear Correlation
          Se         :       87.8246432300,     ! Standard Error
          }

    .. code-block:: aimms

          CostEstimate  := data
          { 
             1  :   343.4712625,
             2  :   522.0646179,
             3  :   700.6579734,
             4  :   879.2513289,
             5  :   968.5480066,
             6  :  1057.8446840,
             7  :  1236.4380400,
             8  :  1147.1413620,
             9  :  1415.0313950,
            10  :   879.2513289
          }

          CostError  := data
          { 
            1  :   -86.07126246,
            2  :    79.53538206,
            3  :    81.34202658,
            4  :  -113.85132890,
            5  :   -73.04800664,
            6  :    75.15531561,
            7  :   -83.63803987,
            8  :   -14.44136213,
            9  :    44.16860465,
           10  :   90.84867110
          } 

    The cost data observations, the cost estimates and the
    resulting simple linear regression line can be graphically displayed as
    shown in the following figure (where the cost figures on the y-axis are
    scaled by a factor 1000):

    |image|

    .. |image| image:: images/SLR_Ex_Graph.png

.. spellcheck::
​​​​​​​
    SimpleLinearRegression