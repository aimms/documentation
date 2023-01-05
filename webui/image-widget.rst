Image Widget
============

The Image Widget allows you to display an image on your WebUI page. To do so, you have to specify the *Contents* option on the miscellaneous tab in the option editor of the widget. 
Here you can specify either a literal name of an image file in your image folder, or a string parameter in your AIMMS model which contains the name of an image in this folder. 
If you specify the literal name of the image file, make sure **not** to use quotes around the filename.

If you plan to change the image that is displayed in the Image widget dynamically, you will have to use a string parameter. Specifying a literal value is useful only for static images.

The images themselves should be stored in the *WebUI*/*resources*/*images* `sub-folder <webui-folder.html#resouces#images>`_ of your *MainProject* directory. 
This sub-folder is not created by default, so you need to create it yourself the very first time that you need it.

.. note:: Please keep in mind that on Linux the casing of the image files should be correct, otherwise your images will not display. Also, please remember to specify the full name of the image, including the filename extension (like .jpg, .png etc). In particular, this is important to keep in mind in case your Windows Explorer is set to hide file extensions.

.. image:: images/Image-View.png
    :align: center

You may want to update the image used in the widget with a new image. There are two ways you can achieve this.

#. Update the string parameter specified in the *Contents* of the image widget with the new image name.
#. Overwrite the image with the new image while retaining the original image name, for example, DiaplayImage.jpg. Please refer to the How-To article on `Refreshing an Image widget without changing the file name <https://how-to.aimms.com/Articles/512/512-image-widget-refresh.html>`_ for more details.

If your image does not completely fit the area that is reserved for it, you can use the option 'Image "object-fit" (css)'. You can use this option with the values none, cover, contain, fill and scale-down, which are explained in this `article <https://www.w3schools.com/css/css3_object-fit.asp>`_.