.. _webui_understanding_theming:

Understanding Theming
=====================

All available properties are listed in (mostly) logical groups in the :token:`base-theme-<AIMMS version>.css` file, located in a subfolder of the AIMMS installation folder:

:token:`C:\\Users\\<your name>\\AppData\\Local\\AIMMS\\IFA\\Aimms\\<your AIMMS version>\\WebUIDev\\www\\resources\\css`

This documentation section is not meant to be a copy of the comments and hints found in there, but should instead provide some background on what you can expect from the choices that were made in that file. The file is always up-to-date for the release it came with; this documentation page might be slightly incomplete or even incorrect, depending on what version was just released or what version you are using yourself. Please keep that in mind.

The first steps for grasping the available theming options are:
 - Use the DevTools in Chrome for understanding which properties are applied to *any* part of the user interface. The Developer tools allow you to verify and experiment with the current value of anything.
 - Double-check the availability of what you are trying to 'theme' within the base theme file of your AIMMS release

For inspiration and examples, please also refer back to `Theming <theming.html>`_.

Naming conventions
------------------

All property names include parts or prefixes that signal what kind of items they apply to. In general:

* :token:`color` usually is for plain color values. Hex, rgba, hsl, named, references to other css custom properties.

* :token:`bg` is sometimes added, or used by itself. Often, but unfortunately not always, applied to background properties. When it is, you can successfully use background images, patterns, gradients, layered background. Some styling will insert the value as if it was a plain color value though. For example, background colors of buttons are re-used in some locations but not all locations accept something like a gradient. You'll notice these locations fail to theme properly then, falling back to our defaults or even lacking normal styling.

* :token:`text` refers to color of real text, mostly. But is sometimes still used as a (background) color reference to create inverted-color areas for things that are related. For example, the color of :token:`--color_text_edit-select-link` is often used for other things than just editable text. But those things *are* all related to being editable.

* :token:`border`, :token:`box-shadow`, :token:`border-radius` and :token:`font` all refer to what you can expect out of these when thinking of the similarly named css properties. So they accept the shorthand notation or the multiple arguments that might be applicable for those css properties.

Sections in the base theming file
---------------------------------

Generic properties
^^^^^^^^^^^^^^^^^^
This section lists the css custom properties that will influence the theme of parts of your application that are pretty much always visible. Areas like the application header (menu, icons, logo), the background color ('canvas') upon which the widgets or the widgets' contents are drawn, colors of dividing lines/borders and drop shadows.

Text colors could be called generic too, but given their importance and impact, they get their own section.

Whenever items specifically belong to a certain function, a widget, or a type of widget, they are placed in a separate section.

Text properties
^^^^^^^^^^^^^^^
The :token:`text_default` color is used extensively throughout the WebUI. It should be the color that works best on the color you specify for the widget background, as part of the generic properties.

Similarly, the color of text that needs to indicate that it can be edited, selected or that it can be clicked to perform a certain operation is determined by the :token:`text_edit-select-link` property.

Although default text hardly ever can be hovered (or is no longer default text and has its own theme properties like the header menu), some places like the footer contain links that are not styled as links but do respond to hovering. For which we have :token:`text_hover`.

:token:`inverted` is used in places where the default 'dark text on light background' of the default theme needs to be switched around. Which means that if you change the color of the default text to something light (because you also changed the widget background to something dark), then it is probably wise to also change these inverted colors. Especially since, as standard, they are not set up to inherit from the widget canvas.

The :token:`text_high-contrast` and two :token:`.._unobtrusive` properties are both meant for text that either needs to stand out or do exactly the opposite. High contrast text has quite a number of applications. Unobtrusive text only a few (the filter dialog, chart legends).

Button properties
^^^^^^^^^^^^^^^^^
These properties are mostly self-explanatory. You can influence the border, background and text color of both primary and secondary buttons, in hovered, active and disabled states.

As mentioned before, the (dark, active-looking) color of the primary button's background is used in some other places that have similar, button-like features or for which an 'inverted' look is required and where use of  :token:`edit-select-link` with :token:`widget-canvas` felt inappropriate. Examples are Item actions, Widget header icons in certain states, Page Actions and parts of the Date Picker.

Widget properties
^^^^^^^^^^^^^^^^^
Like the buttons, the colors of the widget header have a large impact on the visual theme of your application. Most properties here are targeting the header, with the remainder being either global (widget canvas), or related to the message you get within widgets that haven't received/processed any displayable data yet.

The drop shadow for the widget, by default inheriting its value from the :token:`box-shadow_medium` property, was created as a separate property (:token:`box-shadow_widget`) so you can easily create a theme that has no shadows around widgets but still retains the (functional) drop shadows that are present on many 'pop-up' elements like dialogs, tooltips and drop-down menus. Or you can simply turn the shadow into a single pixel border that clearly outlines the widgets.

Table properties
^^^^^^^^^^^^^^^^
The list of table properties is not as long as it might have been. Because with this many elements that need to be displayed in several states, there are plenty of small things that could have their own property.

Instead, the table mostly relies on already available theming for regular, editable and disabled text. It only adds a few properties for the color of the 'borders' on the cell while focused/unfocused, plus a color of text that is intended to make text as legible as possible while editing: :token:`focus-cell-text_while-editing`.

Moreover, there are 4 properties that have the :token:`color_overlayed` prefix and which are applied to either backgrounds or borders. All of them share the fact that they are intended to interact with the color beneath them: by default they (very mildly) darken the colors for which they are an overlay.

The main reason for this is to take away the need to having to specify a lot of individual colors for all of the cells and dividers when you decide to change something as basic as the widget canvas color. Because due to the overlay these background and borders will just change along to create a nice tint of the underlying canvas, instead of being a harsh, fully opaque gray color. Please note: in order for this effect to continue to work when you specify your own 'overlay colors', do make sure that they really are a *very* transparent color. And if your widget background is dark instead of light, these transparent colors will need to be the exact opposite.

Chart properties
^^^^^^^^^^^^^^^^
Like tables, charts pick up many theme settings from generic properties, like colors for the data labels, legends and tooltips which are mainly based on the different generic text colors. But a few properties related to the axes, the labels used near it and the grid beneath a chart are available to make the charts match your needs.

And again similar to tables: the lines that make up the grid and the axis themselves (lines and labels) are set up using some transparency, all deriving from :token:`--color_text-default`. If you set that one correctly, the charts will follow accordingly

Side Panel properties
^^^^^^^^^^^^^^^^^^^^^
Side Panels, and specifically their tabs, can be made to stand out from the main page by changing their background and text colors for each of their 3 states: regular, active and while hovering. By default, these are inheriting from the widget canvas and primary button colors, keeping them in line.

The contents of Side Panels should be considered to represent a page, including all the theming properties that normally apply to that with one important exception: there is no page canvas color within the side panel, so when combined with the lack of padding, the widget canvas blends in with the similarly white 'side panel canvas'.

If you would really want the Side Panel to have a different canvas (for everything), you could redefine the widget canvas not on :token:`:root`, but specifically within one of the side panel container elements. For example:

.. code-block:: CSS

    .sidepanel-container {
    --color_bg_widget-canvas: floralwhite;
    }

Both widgets and the panel itself will change their background color, within the side panels only.

Workflow properties
^^^^^^^^^^^^^^^^^^^
Being a real part of the page and not a really separate structure, the items of the workflow by default inherit their main (background) colors from the widget canvas. Although you can still redefine them to make the Workflow stand out if you wanted to.

The other properties apply to the background (:token:`color_bg_workflow_`) and the text (:token:`color_workflow_`), in the four different states that an item may have:

* *_current*, meaning that this item represents the page content that is currently visible.

* *_active*, reflecting that these items are available for navigating to them. Applies to both parent and child items, except for parent items that are in a collapsed state or which have no children.

* *_inactive*, for those items that are not (yet) available for navigation. Could also be seen as *disabled*.

* *_error*, for any item that needs to signal that the page it represents has issues with its content. When such a page is also 'current', it will adopt the *_error_current* color for its background (and still use the *_current* for background).

Within the step items, the icons' background, color and border again differ between the state of the item:

* for *error* states, `color_workflow_error` is used for the border and the icon, along with the text color of a 'current' item for a background.

* for *inactive* states, border and icon are changed to `color_workflow_inactive`.

* for any other state `color_bg_workflow_icon` will be used for the background, `color_workflow-icon-border` for the border around it, while the icon itself uses the text color of an active workflow item: `color_workflow_active`.

Font properties
^^^^^^^^^^^^^^^
The font properties allow you to refer to a different font family, by name. This value will be used for the elements mentioned in the inline documentation, falling back to AIMMS' default fonts if you accidentally break the definition.

In order to be able to link to a font family by name, you will need to use a custom style sheet to either:

* define a new :token:`@font-face` with a correct source (which could be files in your own application resource folder, or a fully qualified online URL).

* use a css :token:`@import` to basically do the same, but probably using the pre-defined style sheets from resources like Google Font, Font Library or Adobe fonts.

In either case you will still need to define the name of the family for the appropriate theming property. Make sure you take into consideration how custom fonts will influence the (first load) performance of your application and whether the legibility does not suffer at the various sizes and widths that are in use for the WebUI (because, for now, you cannot influence the sizing of the fonts).

Color palettes for data
^^^^^^^^^^^^^^^^^^^^^^^
Although complicated to perform any changes on, the Data Coloring section comes with inline documentation that describes all the requirements correctly.

Having said that, the more general advice that applies here is:

* if you plan to change the entire palette, you will probably succeed best by applying a 'shift' across the entire range:

  * literally, that would mean you either rotate all color indices, or

  * that you apply a similar change to all HSL values. Like equally rotating the Hue. Or altering the saturation

* if you want to step away from everything, and do not care about keeping a valid set of colors that works with the transparency index feature, you could

  *  redefine the whole set. As long as you change each of the 16 colors, there will be no surprises. Fall back to a duplicate set of 8x2 or 4x4 if you want to (visually) reduce the amount of colors.

  * step away from colors through theming and just apply custom annotations, which you style in a custom style sheet. However, that *does* mean you will need to take care of applying to the correct background, stroke, fill etc. properties, potentially different for each chart type.

The "Unused" section
^^^^^^^^^^^^^^^^^^^^
At the bottom of the base theming file you will find a few properties that make sense to have available for theming, but for which we have not done a correct implementation yet. These properties would influence the sizing of elements for which we currently sometimes expect a certain, fixed size. Meaning that some layouts and functionality would be in jeopardy.

If you see a use-case for having the "unused" properties available for your theming, please reach out to the team to make us aware of the need to plan those improvements. Which is equally true for all other suggestions on how to improve the usability of Theming.

.. spelling:word-list::

    themable
    URLs
    hsl
    rgba