Image Widget
------------

The Image Widget allows you to display an image on your WebUI page. To do so, you have to specify the *Contents* option on the miscellaneous tab in the option editor of the widget. 
Here you can specify either a literal name of an image file in your image folder, or a string parameter in your AIMMS model which contains the name of an image in this folder. 
If you specify the literal name of the image file, make sure **not** to use quotes around the filename.

The images themselves should be stored in the *resources*/*images* `sub-folder <folder.html#resouces#images>`_. 
This folder is not created by default, so you need to create it yourself the very first time that you need it.

Please keep in mind that on Linux the casing of the image files should be correct, otherwise your images will not display. Also, keep in mind that you need to specify the full name of the image, including the filename extension (like .jpg, ...). When you have set your Windows explorer to not show file extensions, this could easily lead to the latter situation.

.. image:: images/Image-View.png
    :align: center
    