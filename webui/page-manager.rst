Page Manager 
============

.. |page-manager| image:: images/PageManager_snap1.png

.. |dots| image:: images/PageManager_snap3.png

.. |pencil| image:: images/PageManager_snap3_1.png

.. |eye| image:: images/PageManager_snap3_2.png

.. |hidden| image:: images/PageManager_snap3_3.png

.. |bin| image:: images/PageManager_snap3_4.png

.. |home| image:: images/PageManager_snap3_5.png

.. |wizard| image:: images/PageManager_snap3_6.png

.. |plus| image:: images/plus.png

.. |kebab|  image:: images/kebab.png

.. |addpage|  image:: images/addpage.png

.. |sidepanel|  image:: images/sidepanel.png

.. |dialog|  image:: images/dialogicon.png 

A WebUI app can consist of multiple pages. To see the list of available pages in your WebUI, press the ‘hamburger’ icon |page-manager| on the top left position of your browser window. The Page Manager will open rendering the page tree structure: 

.. image:: images/PageManager_snap6.png
    :align: center

You can add your pages here and structure them in a tree. You can access your pages by clicking on their name 

* in the Page Manager, or 
* in the `Page Menu <page-menu.html>`_

Please note that the *new* Page Menu and Page Manager are available in AIMMS 4.40+. From AIMMS 4.45 onwards, the Page Manager can also be used when running your WebUI app on PRO.

You can expand a subtree by clicking on the 'arrow' ">" in front of a parent page. You can collapse it by clicking on the "v" in front of the parent page. The pages in the Page Manager will always be visible in the `Page Menu <page-menu.html>`_, unless the `visibility of a page <#change-the-visibility-of-a-page>`_ is set to either 'false' or 0. 

The Page Navigator can be used in combination with the Page Menu, but there are a number of settings in the Application Options editor with which you can define how you want this to work:

* *Sidebar Open By Default* Use this option to specify whether the Page Manager sidebar should be visible upon opening the WebUI app.
* *Page Manager Hidden* Use this option to specify whether you want to offer the Page Manager to your end users or not.
* *Page Menu Hidden* Use this option to specify whether you want to offer the (horizontal) Page Menu to your end users or not.

When running on PRO, only the add/rename/delete options are offered to the end-user (i.e. the visibility-toggling and the wizard-creation options are left out).

Details on creating and managing various pages can be accessed using the following scheme: 

.. toctree::

   webui-classic-pages
   webui-grid-pages
   side-panels
   dialog-pages