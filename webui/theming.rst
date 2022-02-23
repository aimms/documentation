Theming
============

With `CSS Styling <css-styling.html>`_ you can style your WebUI app any way you like. This flexibility does have a drawback though: it (obviously) requires CSS knowledge and you have to know quite some details about the DOM-tree that AIMMS is using for displaying WebUI apps, in order to target specific parts of the WebUI for styling. With *theming* we offer you a different way of styling your app. It requires less detailed knowledge than regular CSS styling, while still offering a way to make your apps look the way you want in most cases. Should you still require some additional tweaking after theming your app, you can just use the regular CSS styling side-by-side with it.


How To Use Theming
----------------------

Setting up WebUI theming is quite straightforward. It requires just one :token:`.css` file in the 

:token:`MainProject/WebUI/resources/css/`

subfolder. You can name this file as you like. It should contain a series of *themable properties*, which you can assign your own values. These properties are listed in logical groups in THIS (PROVIDE DOWNLOAD LINK) file, which you can use as a base for your work. Each group and property is commented, to give you an idea for which part of the WebUI you can influence the appearance by changing its value. The values assigned in this file are the values that are used by default in the WebUI AIMMS theme.


An Example
----------------------

As an example of the usage of theming, suppose that you would like to change the background color of your WebUI app and the coloring of the buttons. In the default AIMMS theming, part of an app could look like this:

    .. image:: images/Theming-buttons-1.jpg
        :align: center

To accomplish the change, you should create a file (let's call it :token:`yellow_theme.css`) in the subfolder mentioned above. In the file, it requires just these lines:

.. code-block:: CSS

    :root {
    /* Global app properties */
    --color_bg_app-canvas: yellow;

    /* Button properties */
    --color_text_button_primary: #0768a9;
    --color_bg_button_primary: #ffcc00;
    }

to change the appearance of the app fragment into this:

    .. image:: images/Theming-buttons-2.jpg
        :align: center

As you see, it is a matter of selecting the right properties for your theming wishes and assigning them the right values to get the effect that you are after. For these values, you are not restricted to 'simple' values, like the color names/numbers above. It is perfectly possible to use, for example, the CSS-function :token:`linear-gradient()`. This :token:`.css` file:

.. code-block:: CSS

    :root {
    /* Global app properties */
    --color_bg_app-canvas: linear-gradient(
        to bottom right,
        #ffffff 0%,
        #ffcc00,
        #0768a9 100%
    );

    /* Button properties */
    --color_text_button_primary: #0768a9;
    --color_bg_button_primary: #ffcc00;
    }

will result in the following WebUI theme:

    .. image:: images/Theming-gradient.jpg
        :align: center

Or, by adding a specific border value like this:

.. code-block:: CSS

  --border_button_primary: 4px dotted blue;

the example above will change into the following:

    .. image:: images/Theming-border-dots.jpg
        :align: center



Obviously it is a matter of taste whether you deem these last two examples beautiful, but it does illustrate that with changing just a handful of theming property settings, you can achieve far-going effects.


Value Inheritance
----------------------

Since WebUI theming is based on CSS, it is also possible to use inheritance of property values using CSS's :token:`var` function. For example, if you want to color the background of the widget headers the same as the default text, you can write:

.. code-block:: CSS

  --color_bg_widget-header: var(--color_text_default);

