Publishing on AIMMS PRO
=======================

By publishing an AIMMS WebUI app on the AIMMS PRO platform, the application is made available to the PRO end users. The steps of this process can be summarized as follows:

#. Create and test your AIMMS app with WebUI, such that it is ready to be published. Please remember to `prepare the model for solving on PRO <../pro/basic-workflow.html>`_, including automatically loading the results upon solve completion (in case your model does require a solve).
#. Go to *File* menu of the AIMMS development environment and select *Export End User Project*. This command exports your project as an .aimmspack file which can be used for publishing. In the *Select Files for Export* pop-up dialog shown during the export, please make sure that you include the WebUI subfolder of your project in the exported .aimmspack. Also, if your model contains a startup case, please make sure to include the 'Data' subfolder as well. 
#. Make sure that (the latest version of) PRO 2 has been `installed <../pro/install.html>`_ on your server (or on your local machine, if you want to test the app locally) and you have proper access to it. Also, please check that an AIMMS PRO-package has been `published on PRO <../pro/aimms-man.html>`_. 
#. Now open your `PRO portal <../pro/admin.html>`_ and `publish your app <../pro/appl-man.html>`_ by uploading the .aimmspack file which you saved in step 2, using the correct AIMMS PRO Package.
#. After publishing it, you can launch the app from the AIMMS PRO portal and the WebUI of the app will be opened in your browser.

Example Projects
-----------------

In our GitHub repository, some WebUI example projects are available. To run an example, please perform the following steps:

#. Download the example project from the `WebUI-Examples GitHub repository <https://github.com/aimms/WebUI-Examples>`_. 
#. Unzip the downloaded application. 
#. Start a recent AIMMS version and open the .aimms project file. 
#. Once the project is opened, start the WebUI by pressing the *WebUI button* on the toolbar.