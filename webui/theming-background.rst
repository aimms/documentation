.. _webui_theming_background:

Theming Background
============

All available properties are listed in logical groups in the :token:`base-theme-<AIMMS version>.css` file, located in a subfolder of the AIMMS installation folder:

:token:`C:\\Users\\<your name>\\AppData\\Local\\AIMMS\\IFA\\Aimms\\<your AIMMS version>\\WebUIDev\\www\\resources\\css`

This documentation section is not meant to be a copy of the comments and hints found in there, but should instead provide some background on what you can expect from the choices that were made in that file. The file is always up-to-date for the release it came with; this documentation page might be slightly incomplete or even incorrect.

So the first rules for understanding theming are:
 - double-check with the base theme file
 - always use the DevTools in Chrome for understanding which properties are applied and for verification of and experimenting with their current value.

For inspiration and examples, please also refer back to `Theming <theming.html>`_.

Naming conventions
----------------------

All property names include parts or prefixes that signal what kind of items they apply to. In general:

* :token:`color` is for plain color values. Hex, rgba, hsl, named, references to other css custom properties.

* :token:`bg` is for background. Often, but unfortunately not always, applied to background properties. When it is, you can successfully use background images, patterns, gradients, layered background. Some styling will insert the value as if it was a plain color value though. For example, background colors of buttons are re-used in some locations but not all location accept something like a gradient. You'll notice these locations fail to theme properly then, falling back to ours defaults.

* :token:`text` refers to color of real text, mostly. But is sometimes still used as a color reference to create inverted-color areas for things that are related. The color of :token:`--color_text_edit-select-link` is often used for other things than editable text. But those things *are* all related to being editable.

* fdfdfdf

The sections
----------------------

Color palettes for data
----------------------


Unused sections
----------------------
