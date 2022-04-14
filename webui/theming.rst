Theming
============

With `CSS Styling <css-styling.html>`_ you can style your WebUI app any way you like. This flexibility does have a drawback though: it (obviously) requires CSS knowledge and you have to know quite some details about the DOM-tree that AIMMS is using for displaying WebUI apps, in order to target specific parts of the WebUI for styling. With *theming* we offer you a different way of styling your app. It requires less detailed knowledge than regular CSS styling, while still offering a way to make your apps look the way you want in most cases. Should you still require some additional tweaking after theming your app, you can just use the regular CSS styling side-by-side with it.


How To Use Theming
----------------------

Setting up WebUI theming is quite straightforward. It requires just one :token:`.css` file in the 

:token:`MainProject/WebUI/resources/css/`

subfolder of your AIMMS project. You can name this file as you like. It should contain a series of *themable properties*, which you can assign your own values. These properties are listed in logical groups in the :token:`base-theme-<AIMMS version>.css` file, which you can use as a base for your work. It is located in a subfolder of the AIMMS installation folder:

:token:`C:\\Users\\<your name>\\AppData\\Local\\AIMMS\\IFA\\Aimms\\<your AIMMS version>\\WebUIDev\\www\\resources\\css`

Each group and property is commented, to give you an idea for which part of the WebUI you can influence the appearance by changing its value. The values assigned in this base file are the values that are used by default in the WebUI AIMMS theme. Please note that in your :token:`.css` file, you do not have to specify properties from the base file which you do not want to change. This will also make sure that you will benefit from the effect of potential future updates to the default values in the base file.


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

Obviously, using a function like :token:`linear-gradient()`, it needs to make sense. That means that it can only be applied to background coloring options, but not to, say, text coloring options. 

For borders, for example, by adding a specific border value like this:

.. code-block:: CSS

  --border_button_primary: 4px dotted blue;

the example above will change into the following:

    .. image:: images/Theming-border-dots.jpg
        :align: center



Obviously it is a matter of taste whether you deem these last two examples beautiful, but it does illustrate that with changing just a handful of theming property settings, you can achieve far-reaching effects.


A Special Case: the Application Logo
-------------------------------------

Theming offers you the possibility to easily specify a logo for your application. It will be displayed to the left of the application name in the menu bar. It has a special 'rule' for specifying the location of the image that you want to use as a logo. As an example, take this specification:

.. code-block:: CSS

  --bg_app-logo: 8px 50% / 35px 35px no-repeat url(/app-resources/resources/images/icon.gif);

Aside from the values which define the size and positioning here, the :token:`url` part requires some explanation. Obviously, the image that is referred to is called :token:`icon.gif` in this example. The path, however, is perhaps less intuitive. If you want to refer to an image file somewhere in your project folder structure, you must include the :token:`/app-resources/` part. In terms of your project folder structure, this points to the :token:`MainProject\\WebUI` subfolder. Anything after this should follow the sub-path in your project folder. So, in the case of the example above, the image file is located in the :token:`MainProject\\WebUI\\resources\\images` folder of the AIMMS project.

Next to using a location relative to your project folder, it is also possible to use an image that resides somewhere on the web. In that case, you can simply specify the precise URL of its location in the :token:`url`. So, for example:

.. code-block:: CSS

  --bg_app-logo: 8px 50% / 35px 35px no-repeat url(https://www.aimms.com/wp-content/themes/aimms/images/logo-aimms.svg);

Will show the AIMMS logo which is displayed on our website. That is, if you don't forget to reserve some space for it with the :token:`--spacing_app-logo_width`.


Value Inheritance
----------------------

Since WebUI theming is based on CSS, it is also possible to use inheritance of property values using CSS's :token:`var` function. For example, if you want to color the background of the widget headers the same as the default text, you can write:

.. code-block:: CSS

  --color_bg_widget-header: var(--color_text_default);

Next to this kind of inheritance, it is also possible to 'inherit' from the standard AIMMS color palette. In same folder as the base theme example file, in the :token:`global-custom-prop-constants.css` file, these colors are listed for your reference. So, for example:

.. code-block:: CSS

 --color_bg_widget-header: var(--COLOR_AIMMS-YELLOW-DARK);

Would display the background of your widget headers in the standard AIMMS dark yellow color.


Moving From Custom CSS/Theming
------------------------------

Many clients have their apps styled using custom CSS. We advise you to move to the new AIMMS Theming, since it offers better maintainability and probably also backward compatibility in the future. The best way to migrate is to put aside all your existing custom CSS files by moving them somewhere outside your project folder, to keep as backup. From this 'clean' state, start theming your app as explained above. If, after that, you are not fully satisfied with the result, you can re-visit your previous custom CSS to see whether selected parts of it can be re-used to fill the gap.