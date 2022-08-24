Simple Linear Regression
*************************

Notational Conventions for Simple Linear Regression
---------------------------------------------------

For simple linear regression we follow the conventions below.

Observations and Estimates
^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``AimmsForecasting`` library uses as input data observations for the
independent variable and the dependent variable. It provides estimates
for the coefficients of the simple linear regression line.

.. _table:notation-observation-data-SLR:

.. table:: Simple Linear Regression notation 

    ======================================== ======================================================
    :math:`N`                                number of observations
    :math:`x_i, i \in \{1\ldots N\}`         observations of the independent variable
    :math:`y_i, i \in \{1\ldots N\}`         observations of the dependent variable
    :math:`\bar{x}=(1/N)\sum_{i=1}^{N}x_{i}` average of the independent observations
    :math:`\bar{y}=(1/N)\sum_{i=1}^{N}y_{i}` average of the dependent observations
    :math:`\hat{y}_i, i \in \{1\ldots N\}`   predictions of the dependent variable
    :math:`\beta_{0}, \beta_{1}`             coefficients of the linear relationship (random)
    :math:`\hat{\beta}_{0}, \hat{\beta}_{1}` coefficients of the linear regression line (estimates)
    :math:`e_i, i \in \{1\ldots N\}`         error (residual) for observation data points
    ======================================== ======================================================

Linear Relationship
^^^^^^^^^^^^^^^^^^^

The linear relationship between :math:`x_i` and :math:`y_i` is modeled
by the equation:

.. math:: y_i = \beta_{0} + \beta_{1}x_i + \epsilon_i

where :math:`\epsilon_i` is an error term which averages out to 0 for
every :math:`i`.

Linear Regression
^^^^^^^^^^^^^^^^^

The random :math:`\beta_{0}` and :math:`\beta_{1}` are estimated by
:math:`\hat{\beta}_{0}` and :math:`\hat{\beta}_{1}`, such that the
prediction for :math:`y_i` is given by the equation:

.. math:: \hat{y}_i = \hat{\beta}_{0} + \hat{\beta_{1}}x_i 
   :label: SLR-line

So, the predictions based on simple linear regression corresponding to
the observation data points :math:`(x_i,y_i)` are provided in
:math:`\hat{y}_i, i \in \{1\ldots N\}`.

Residuals
^^^^^^^^^

The error (residual) :math:`e_i` for the data point :math:`i` is the
difference between the observed :math:`y_i` and the predicted
:math:`\hat{y}_i`, so
:math:`e_i = y_i - \hat{\beta}_0 - \hat{\beta}_1x_i`. In order to obtain
the residuals, the user will need to provide a one-dimensional parameter
declared over the set of observations.

Variation Components
^^^^^^^^^^^^^^^^^^^^

Given the values of the observations, the estimates, and the
residuals, several components of variation can be computed, such as
**sum of squares total** = SST, **sum of squares error** = SSE, and
**sum of squares regression** = SSR, which are defined as follows:

.. math:: SST = \sum_{i=1}^{N}(y_i - \bar{y})^2

.. math:: SSE = \sum_{i=1}^{N}(y_i - \hat{y}_i)^2 = \sum_{i=1}^{N}e_i^2

.. math:: SSR = \sum_{i=1}^{N}(\hat{y}_i - \bar{y})^2

These components of variation satisfy the relation :math:`SST = SSE + SSR`.

Furthermore, it is also possible to compute the **coefficient of
determination** = :math:`R^2`, the **sample linear correlation** =
:math:`r_{xy}`, and the **standard error of the estimate** =
:math:`s_e`, which are defined as follows:

.. math:: R^2 = \frac{SSR}{SST}

.. math:: r_{xy} = \left\{ \begin{array}{ll} +\sqrt{R^2} & \textrm{ if } \hat{\beta}_1 \geq 0 \\ -\sqrt{R^2} & \textrm{ if } \hat{\beta}_1 \leq 0 \end{array} \right.

.. math:: s_e = \sqrt{\frac{SSE}{N-2}}

Predeclared Index ``vcs``
^^^^^^^^^^^^^^^^^^^^^^^^^

The linear regression functions return the values of the line
coefficients in a parameter declared over the index ``forecasting::co``
declared as follows: 

.. code-block:: aimms

               Set LRcoeffSet{
                   Index: co;
                   Definition: {
                     data {
                       0,      ! Intercept Coefficient of Regression Line
                       1       ! Slope Coefficient of Regression Line
                     }
                   }
                 }

Whenever one of the linear regression
functions communicates back components of variations, it uses
identifiers declared over the index ``forecasting::vcs`` declared as
follows: 

.. code-block:: aimms

               Set VariationCompSet {
                   Index: vcs;
                   Definition: {
                      data {
                          SST,       ! Sum of Squares Total
                          SSE,       ! Sum of Squares Error
                          SSR,       ! Sum of Squares Regression
                          Rsquare,   ! Coefficient of Determination
                          MultipleR, ! Sample Linear Correlation Rxy
                          Se         ! Standard Error
                         }
                     }
                   }

In order to obtain the variation components, the
user will need to provide a parameter indexed over ``forecasting::vcs``
to the linear regression functions.

AIMMS supports the following function for simple linear regression:

.. toctree::
   :maxdepth: 1

   forecasting_simplelinearregression