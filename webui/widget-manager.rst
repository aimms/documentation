.. |pencil-blue| image:: images/pencil-blue_v1.png

.. |pencil-grey| image:: images/pencil-grey.png

.. |plus-widget| image:: images/plus-widget.png

Widget Manager
**************

You can access the Widget Manager by pressing the pencil icon |pencil-blue| in the `(blank)WebUI Menu Bar <menu-bar.html>`_.

Adding a widget
================

In order to put a new widget on your page:

* Press the Widget Manager button |pencil-grey| next to the page title |pencil-blue|.
* The widget manager will open from the left. This widget manager lists all widgets that are present on the page. 
* By pressing the big |plus-widget| at the bottom of this list, the Add Widget wizard will pop-up. This wizard allows you to specify the contents, the name and the widget-type (e.g. table, bar chart). 

.. image:: images/addwidgetwizard_v1.png
    :align: center

.. tip::

    Since the widget database is shared for all pages of your application, please make sure that the names for all pages and widgets are unique throughout your application. 

Custom Position
===============

The position of a widget on a page is automatically determined based on the widget order in the list of widgets, and the widget size. However, you can also take a widget out of this natural flow, and instead position it exactly where you want it. To do so, you need to turn on the *Custom Position* setting for a widget:

* Open the Widget sidebar by pressing the Edit Page button |pencil-grey| next to the page title |pencil-blue|.
* Click on the widget and tick the *Custom Position* option. 

.. image:: images/sticky-widget.png
    :align: center

A widget with a *Custom Position* is placed on top of the widget list. To position it where you want, drag the widget (using its title bar) to your preferred location, where it will stay.

Because custom positioned widgets are taken out of the natural flow, they also do not get repositioned on other screens like the other widgets. Keep this in mind when making a WebUI for multiple screensizes.

If you want a group of widgets to stick together, please use the `Group Widget <group-widget.html>`_

Using the Search Boxes
======================

The WebUI offers you a search box in various widgets. For example, there is one in the MultiSelect widget, the Table widget and the Scalar widget. This search box is very flexible and offers some nice functionality. In this topic, we'll explain what's possible.

The simple behavior of the search box is to just enter some text (or numbers). All possible items that contain this text are found and presented in a small list below your search box. Please note: the current maximum number of search results is 100. Should the item that you are looking for not be included in these 100 results, you should refine your search further. In the search box of the dropdown list, the currently selected item is always put on top of the list of search results (even if it doesn't contain the currently entered search criteria!). This allows you to reselect the original value, and lets you easily remember the currently selected value.

A step further is to use so-called regular expressions in your search terms. Regular expressions offer a lot of possibilities (a good quickstart is offered `here <http://www.regular-expressions.info/quickstart.html>`_. Some of the more useful features are listed below:

* The '|' character functions as an 'or' operator. So, searching for 'aap|noot' will result in all strings that contain the substring 'aap' or 'noot'.
* The '[]' characters function as a 'whichever one of these' operator. So, searching for 'l[ae]g' will result in all strings that contain the substrings 'lag' or 'leg'.
* The '.' character acts as a 'one character wildcard'. So, searching for 'b.t' will result in all strings that contain the substrings 'bit', 'bat', 'bet', 'bqt', 'b#t', etc.
* The '^' character marks the start of a string. So, searching for '^a', will result in all strings that start with the letter 'a'.
* The '$' character marks the end of a string. So, searching for 'a$' (note the position of the '$'), will result in all strings ending with the letter 'a'. Combining the latter two special characters enable you to look for a specific word: searching for '^hello$' will only find the string 'hello', not all strings which contain 'hello' as a substring.

A minor downside of offering regular expressions is that some characters are regarded as 'special characters'. For example, if you want to search for an item that contains the substring '|', simply searching for '|' doesn't work. In these cases, you need to prefix the character with a backslash. So, in the example here, you should look for '\|'.

The searches that you can perform are case-insensitive. So, looking for 'A' will return all items that contain either 'a' or 'A' as a substring.

Locking Editors
===============

By default, all users of a published WebUI application on a PRO server can edit this application by changing widgets, options, layout, etc. If you want to disallow certain users from editing a published WebUI application, you can do so by specifying a value for the *UI Editable* option in the application options editor (the big cog-wheel icon in the top-right of your WebUI). This option can be set to :token:`true` or :token:`false` (or :token:`1` or :token:`0`). You can also specify an AIMMS model identifier here, so it's completely up to you, as an app developer, on how to program the conditions under which the editor should be locked or not for specific users.

Locking the editors will still allow the 'locked' users to change data and to create/compare cases, but they won't be able to change the application's UI structure. Furthermore, this option only affects published WebUI apps on PRO: when developing your WebUI locally, this setting does not affect the options editors, so you can just continue to make changes to your widgets when you are still developing the app.

Adding Tooltips
===============

Almost all widgets that the WebUI offers, support tooltips. These tooltips have a default value (for example, when hovering over a Table cell, its value is displayed). However, they can also be completely user-defined, giving you maximum freedom in determining their content. In order to create your user-defined tooltips, you should add an auxiliary identifier to your AIMMS model, called :token:`X_Tooltips`, where :token:`X` is the name of an existing identifier that is displayed in the widget(s) for which you want to override the default tooltips. This auxiliary identifier must have the same index domain as the corresponding model identifier. For example, consider the following table, which shows aircraft types for specific flights:

.. image:: images/defaulttooltip.jpg
    :align: center

As you can see, hovering over the cell with value 'A319' just shows this value in the default tooltip. In order to change that, in addition to the displayed :token:`AircraftType(a1, a2, dt)` identifier, the auxiliary :token:`AircraftType_Tooltips(a1, a2, dt)` identifier is added to the model. When using the following definition:

.. code::

    FormatString("Flight from %e to %e is operated by the %e aircraft type", a1, a2, AirCraftType(a1, a2, dt))

the result when hovering over the same cell as above looks like this:

.. image:: images/userdefinedtooltip.jpg
    :align: center


