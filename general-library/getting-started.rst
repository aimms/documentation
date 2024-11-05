Getting Started with AIMMS Library Repositories
*****************************************************

How to Add a Library from the Repository?
===========================================

Adding a library from the repository to your AIMMS model is really easy. Make sure you have your model saved and pages/cases and/or editors closed before installing. With your AIMMS model open, go to :menuselection:`File > Library Manager`:

.. image:: images/getting-started-1.png
   :scale: 50
   :align: center

|

This will open a new window, in which you can choose for :menuselection:`Add Library from Repository...`:

.. image:: images/getting-started-2.png
   :scale: 50
   :align: center

|

This will open a screen in which you can select and install available libraries. By default the most recent version of the library will be installed, but by double-clicking on the ``+`` before each library you can see all the available versions and select another version for download:

.. image:: images/getting-started-3.png
   :scale: 50
   :align: center

|

If you are replacing an existing version of the library you will be asked for confirmation. If any codependent libraries are necessary, these will automatically be installed. Always try to keep your libraries up to date by regularly checking if newer versions are available.

After clicking :menuselection:`Ok` for confirmation you will get a notification that all currently opened pages, cases and/or editors will be closed.

The libraries you install are immediately available in your model.

How to Use a Library from the Repository?
===========================================

Once the library is added to your model you can start using the procedures and functions that come with it. Every library has a prefix; when you start typing this prefix (including the double ``::``), the auto-complete will help you finding the function you need. To find the prefix of a chosen library, you can double-click on the library and see what is written under the 'prefix' item:

.. image:: images/getting-started-5.png
   :scale: 50
   :align: center

|

Once you start typing this prefix, you will automatically get the options listed:

.. image:: images/getting-started-6.png
   :scale: 50
   :align: center

|

For every library a documentation page is available to provide you with more library-specific information.
 
How to Delete a Library from the Repository?
=============================================

If you want to delete a library from the repository, go to :menuselection:`File > Library Manager`, select the library you want to delete, and press the delete button:

.. image:: images/getting-started-4.png
   :scale: 50
   :align: center

|

The library is now deleted from the model. If you have used any of the functions from a deleted library in a procedure these will give an error during execution. 

