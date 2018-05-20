Slider Widget
-------------

The slider widget allows you to show an intuitive slider with which the user of the WebUI page can specify scalar values between specified boundaries. Please note that the parameter that you specify does not necessarily need to be a scalar one: you can use multi-dimensional parameters, which you can then slice to select a specific fixing of the indices.

.. image:: images/sliderwidget_v1.jpg
    :align: center
    
Features
++++++++

There are a number of options that you have to specify, in order to make the slider work:

* With the *min* option, you can specify the minimum value that the user is allowed to select with the slider.
* With the *max* option, you can specify the maximum value that the user is allowed to select with the slider.
* With the *step* option, you can specify the step size that is used when sliding the value.

.. image:: images/slideroptions.jpg
    :align: center

.. important
    Please be aware of the implications of specific combinations of these values. For example, if you have a *min* value of 1, a *max* value of 29 and a *step* value of 10, a value like 25 can never be selected, neither can 29. Only 1, 11, 21 can be selected.

