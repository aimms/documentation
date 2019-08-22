Text Widget
==============

.. |link-button| image:: images/link-button.png

.. |exit-button| image:: images/exit-button.png

.. |image-button| image:: images/image-button.png

With the Text Widget, you can show text in the WebUI, style it, insert images in between and around it and let the text or images link to other pages, both internal and external.

An example of what a text widget could look like can be seen below.

.. image:: images/text-widget-example.png
    :align: center

Widget menu
--------------

When in edit mode, the text widget’s menu looks as follows:

.. image:: images/text-widget-menu.png
    :align: center


From left to right, the buttons can be used to change font size, to make text bold, italic, underlined, strikethrough and/or colored, to change the background color of a piece of text, to create links, to insert images, to create lists and bullet points and to change text alignment.

Inserting images
------------------------

Firstly, the image must be placed into the *WebUI*/*resources*/*images* `sub-folder <folder.html#resouces#images>`_ of your *MainProject* directory. To insert an image, click on the ‘Image’ button |image-button| and copy the complete image name (including the image type/file extension) into the box that pops up. If done correctly, you should be able to see a preview of the image. Then click ‘Insert’ to insert the image into the text box. 

.. note:: Please keep in mind that on Linux the casing of the image files should be correct, otherwise your images will not display. Also, please remember to specify the full name of the image, including the filename extension (like .jpg, .png etc). In particular, this is important to keep in mind in case your Windows Explorer is set to hide file extensions.

Creating links
---------------------

In a Text Widget it is possible to add links to internal pages or to external URL pages.

To create a link within a text widget, select the part of the text or an image you want to make a link out of and press the ‘Link’ |link-button| button. 

For creating a link to another (internal) page within your WebUI app, type ‘/[AIMMS project name]/[Page name]’ (for example '/Text App/Welcome Page', if you want to link to a page named 'Welcome Page' inside an app called 'Text App') into the box that pops up and click ‘Done’. 

If you want to create a link to an external URL page, simply paste the external page’s URL into the box.

To change or remove a link, move your cursor to the left or right of the link and follow the menu that pops up.

Lastly, to exit the text widget's editing mode, click the |exit-button| in the top right of the text box.