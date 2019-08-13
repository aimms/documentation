Writing your first custom widget
================================

In this tutorial you will learn how to create your very first custom widget for AIMMS Web UI.
The goal is to leave out much of the technical details and underlying design and only explain the
essential things in order to get you up-and-running as soon as possible.

Before we begin - Prerequisites
-------------------------------

To make the most out of this tutorial, it is important that you meet a couple of prerequisites.

First of all, we are going to assume that you already familiarized yourself a bit with the AIMMS WebUI.
Both with the end-usage and the app-development. That you have a recent AIMMS and that you have it
running in your set-up.

Since this is a (software) development tutorial, we are also assuming that you have experience in writing
software in a generic programming language, and, that you have a basic knowledge on HTML5 technologies
(HTML5 DOM, CSS, Javascript, and the likes). It is also beneficial, however not required, if you are
familiar with `jQuery <http://jquery.org>`_ and, to lesser extent,
`jQuery UI <https://jqueryui.com>`_, as AIMMS WebUI is built on top of these technologies.

Let's start - A quick introduction to AWF
+++++++++++++++++++++++++++++++++++++++++

Extending the AIMMS WebUI by writing your own widgets is not a complicated task. It is useful to have at least a basic understanding of what is involved. Let's look at those key components now. For the sake of simplicity we will only concentrate on the stuff that is running in the browser, which we will call
the *AIMMS WebUI Runtime*.

The *AIMMS WebUI Runtime* is built in a (soon to be open source) framework called AWF: The AIMMS Widget Framework.

In its core, *AWF* is a generic framework for managing the lifecycle of widgets.

A *widget*, here, is a small portion of generic and reusable GUI-code used to display or interact 
with information from a model. A widget has a DOM element associated with it, through which the display of, or interaction with, the information of
such a model takes place.

The *lifecycle* of a widget starts whenever it is instantiated by AWF and stops whenever a widget
is unloaded or deleted. A widget can be manipulated *during* its lifecycle through the AWF Option
Mechanism (we will explore options in a later tutorial). As an option value changes, the widget responds to
such a change by updating its associated DOM element. Likewise, if the associated DOM element changes, it
can update its option values and thereby make changes in a model.

The basic components of a widget
++++++++++++++++++++++++++++++++

In AWF, a widget consists of two parts:
 
* the widget *itself*, and,
* a widget *factory*.
 
The widget itself
^^^^^^^^^^^^^^^^^

The widget itself has the responsibility of keeping its associated DOM element synchronized with the underlying
model. This means that it typically creates child DOM elements under its associated DOM element, that it will
listen to (value) changes in the underlying model and that it will update the created DOM elements accordingly.
Some widgets also contain a facility to change the value(s) (i.e. the data) of the underlying model. In which
case this is also the responsibility of the widget itself.

.. note::

    In software engineering this is often called a `model-view-controller <http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller>`_ (MVC) software pattern, but, as promised, in this tutorial we will refrain from such a theoretical approach.
    
The widget factory
^^^^^^^^^^^^^^^^^^

The widget factory is mainly responsible for starting and terminating the lifecycle of a widget whenever AWF
requests this. This means that it takes care of widget construction and destruction.

It also plays a role in exposing the type of widgets that it can construct to AWF (i.e. registration of widget
types), and, in which conditions it can do so. (For instance, a factory may indicate to AWF that it can construct
a map widget, but that it does not support switching from a chart widget to a map widget, as this generally
does not make sense.)

Finally, a widget factory takes care of registering the primary options and option types of the to-be-constructed 
widget.

A final note on Widgets, Factories and AWF
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It is good to know that a widget *itself* interacts with AWF on a *per-widget basis* (for instance,
only a single widget is informed when its model changes), and that a widget *factory* interacts with AWF
on a global level (all factories will be notified when AWF requests that a widget is constructed).
What this means exactly, and what the implications are, will be explained in later tutorials. For now, just keep
this distinction in mind.

Your first custom widget
++++++++++++++++++++++++

We are now ready to start creating our first custom widget. We will develop this widget within a running
WebUI app (in development mode), as we think this is the most convenient way (but feel free to use whatever
works for you). The WebUI app that we will be using for this, is the NetworkData app from the WebUI-Examples
repository on GitHub.com.

First, we will set up the NetworkDataApp. If you already have the NetworkData app on your filesystem, you
can skip this step. If you do not, then you will have to retrieve it from the WebUI-Examples repository
on GitHub. There are two ways to do this: by using Git, or as a zip-file. To keep it simple we'll just
download as zip.

Go to the `AIMMS WebUI Example page <https://github.com/aimms/WebUI-Examples>`_, then
locate and press the *Download ZIP* button in the lower-right corner. Extract the .zip file somewhere
on your computer.

Now start AIMMS and open the NetworkData app in AIMMS. The app is located in
:token:`/NetworkTestApp/src/main/aimms/NetworkData`. 
Start the WebUI as you would normally do from the *tools* menu.
    
Open `Google Chrome <http://www.google.com/chrome/>`_ and go to
`http://localhost:12001/app/home/ <http://localhost:12001/app/home/>`_ to see if the application
works correctly. (You should see a map with blue dots highlighting several cities in The Netherlands.) If all
looks fine, then we are now ready to start creating our first custom widget.

To actually start creating our first custom widget, go to the AIMMS project folder (the folder containing
:token:`NetworkData.aimms` and :token:`MainProject/`) and create the following folder structure and files:

* :token:`MainProject/WebUI/resources/javascript/my-widget/`
* :token:`MainProject/WebUI/resources/javascript/my-widget/factory.js`
* :token:`MainProject/WebUI/resources/javascript/my-widget/jquery.aimms.my-widget.js`

First we will write the widget:

.. code-block:: javascript       

    // jquery.aimms.my-widget.js
    
    jQuery.widget('ui.aimms_my_widget', AWF.Widget.create({
        _create: function() {
            this.element
                .find('.awf-dock.center')
                .append('&lt;div>Hello AIMMS!&lt;/div>')
            ;
        }
    }));

This is about as basic an AWF Widget can be. It just shows some static text: *Hello AIMMS!*. Close
observers will also notice that an AWF Widget derives from a `jQuery UI <http://jqueryui.com/>`_ 
widget, so most of that documentation will also apply. If you do not know
`jQuery <https://jquery.org/>`_ and/or jQuery UI yet, do not worry just ignore it for now.

After that, we create the factory:

.. code-block:: javascript

    // factory.js

    AWF.Bus.subscribe({
        onCollectTypes: function(collectedTypes, contextElQ) {
            if(!contextElQ || contextElQ.awf.tags("placeable-widget-container")) {
                collectedTypes.push("my-widget");
            }
        },

        onInitializeTags: function(elQ, type) {
            if (type === "my-widget") {
                elQ.awf.tags(["placeable"], 'add');
            }
        },

        onDecorateElement: function(elQ, type) {
            if(type === "my-widget") {
                elQ.aimms_my_widget();
            }
        },
    });

To see our new widget in action, we first create a new page to work on. Click the navigation icon in the top-left
of the screen and add a new page by clicking on the **+** button, give it a name *my-widget-page*
and then press **enter**.
 
After we have created the page, navigate to the page by clicking on it in the navigation menu. After the page
finishes loading (which should be rather quickly, since the page is still empty), we add a new widget to the page.
Open the widget manager (pencil icon) and add a new widget by clicking on the **+** button in the bottom left.
 
The widget creation wizard will now open. If you have previously familiarized yourself with AIMMS WebUI usage, this
should be familiar. Skip the *Contents* and *Name* fields for now, and open the drop-down next to
*Type*. Try to locate *my-widget* in the list... Wait a minute! It's not there!
 
So what just happened? When developing widgets for AIMMS WebUI, you must be aware, that we have optimized AIMMS WebUI
for End-user usage. When you navigate to a new page using the navigation menu, AIMMS WebUI will not reload itself
from disk, it will *only* load the contents of the new page. Therefore until we reload the whole browser
page, it will not pick up any changes in your JavaScript code.
 
Now that we know that our new widget has not been loaded yet, press **F5** (or use the reload button) so that
AIMMS WebUI reloads *with* our new widget.
 
When we now press the **+** button in the widget manager and try to locate our *my-widget*
in the drop-down list of the *Type* field, we will see it's there.
 
Let's create our new widget. Select *my-widget* as the type, *my-new-widget* as its name. Leave the
*Contents* empty for now. Click on the *Add widget* button.
 
Success! Congratulations, you have now created your first AWF Widget! Let's dive into the code a bit to understand
what we have just done.
 
We'll look at the widget code once more, but this time it is annotated with comments:
        
.. code-block:: javascript

    // jquery.aimms.my-widget.js

    // Create a base AWF Widget and register it as a jQuery UI widget:
    jQuery.widget('ui.aimms_my_widget', AWF.Widget.create({
        _create: function() {                      // Every jQuery UI widget has a
                                                   // _create function that is called
                                                   // when the widget is created.
            this.element                           // this.element is associated to
                                                   // the DOM element to which a
                                                   // widget is tied.
                .find('.awf-dock.center')          // Every AWF Widget has a couple of
                                                   // designated anchor points to
                                                   // insert custom DOM elements.
                .append('&lt;div>Hello AIMMS!&lt;/div>') // At the selected center anchor
                                                   // point, we insert our DOM element.
            ;
        }
    }));

Then we look at the factory code. Remember, it is the factory's responsibility
to communicate with AWF on the availability and actual construction of widgets.
The code, which now also has been annotated:

.. code-block:: javascript 
        
    // factory.js

    // AWF.Bus.subscribe is the means to hook up your widget's factory to AWF
    AWF.Bus.subscribe({
        // This is called by AWF to figure out which widgets are available
        // and what basic characteristics they have. Since the AIMMS WebUI
        // itself is also built using AWF and not all of those widgets are
        // meant to be put inside a WebUI page, we respond only if either
        // there is no contextElQ or it has a tag called "placeable-widget-container"
        onCollectTypes: function(collectedTypes, contextElQ) {
            if(!contextElQ || contextElQ.awf.tags("placeable-widget-container")) {
                collectedTypes.push("my-widget");
            }
        },

        // This is called by AWF to initialize some generic characteristics
        // of a widget. In this case, we indicate that the widget placeable,
        // so that the framework can treat/recognize it as such.
        onInitializeTags: function(elQ, type) {
            if (type === "my-widget") {
                elQ.awf.tags(["placeable"], 'add');
            }
        },

        // This is called by AWF to indicate to any factory that a widget of
        // the specified type is to be constructed on the given DOM element.
        // Typically a factory only responds to such a request for a specific
        // type.
        onDecorateElement: function(elQ, type) {
            if(type === "my-widget") {
                elQ.aimms_my_widget();
            }
        },
    });

So there you have it, your first AWF Widget. Next time we will extend the functionality
of this widget with dynamic content.
