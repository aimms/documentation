WebUI System Library
********************

When preparing your AIMMS model for use with the WebUI, you have to add the WebUI system library (as described in the `Getting Started <getting-started.html>`_ section). This library offers functionality that you can call yourself from your AIMMS model. This library uses the prefix :token:`webui`.

requestPerformWebUIDialog
=========================

You can call the procedure :token:`webui::requestPerformWebUIDialog` to display a message dialog in a WebUI page. Along with the message you can also display buttons which you can bind to custom actions.

Arguments
---------

This procedure has the following aguments:

* :token:`title`: A string parameter which contains the text to be displayed as the title of the dialog box.
* :token:`message`: A string parameter which contains the message to be displayed in the dialog box.
* :token:`actions`: A set containing custom actions. The elements of this set are represented as buttons in the message dialog and their text is the same as the action names. When an action is selected (i.e. its corresponding button is clicked), it invokes the :token:`onDone` procedure with the corresponding action as an argument.
* :token:`onDone`: A reference to a procedure in the predeclared set AllProcedures. The procedure should have a single input string parameter as argument. When a user selects an action, the onDone procedure is invoked with the action name as its argument.

Example
-------

As an example, the following code will display the dialog in the picture below it and will call the procedure :token:`PerformAction(TheAction)` upon clicking one of its buttons (with :token:`TheAction` being an input string parameter argument):

.. code::

    MyActions := data { Yes, No, Cancel };
    webui::requestPerformWebUIDialog("Save", "Do you want to save your data?", MyActions, 'PerformAction');

.. image:: images/savedialog.jpg
    :align: center

Remarks
-------

* When you just want to send a message to the user, you should provide a single action (e.g. :token:`Actions := {'OK'}`) and you can use :token:`''` for the :token:`onDone` argument. In this case, no procedure is called, and the user can just close the 'dialog' by pressing the single action (or pressing the return/space key, which will press the default (last, highlighted) button).
* You can use a translation file (e.g. ‘WebUI/resources/languages/<dialog_actions>.properties’) to provide translations for the various internal action names, containing, for example: :token:`discard-and-continue = Discard and continue`.