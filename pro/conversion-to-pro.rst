Conversion Guidelines
=====================

Because part of the execution of your project is now disconnected from the computer of the end-user, you must keep in mind that the PRO-enabled project itself, and more specifically, the procedure that is to be run on the server (i.e. the procedure that contains the call to :token:`pro::DelegateToServer`), will be subject to certain limitations. Below you will find guidelines for the constructs to avoid when PRO-enabling your model, and ways around certain limitations.

Constructs to Avoid
-------------------

When preparing your AIMMS project for PRO, there are a couple of things you must not forget to ensure that your project is compatible with running in PRO:

* Do not use any of the dialog functions for output (e.g. :any:`DialogMessage`, :any:`DialogError`, etc.) in any procedure that is being run on the server, because server-side sessions do not provide any graphical output back to the client.
* Do not use any of the dialog functions for input (e.g. :any:`DialogAsk`) in any procedure that is being run on the server, because the client session will not be able to display these questions.
* Do not read anything from OpenOffice spreadsheets via the AIMMS spreadsheet functions in any procedure that is being run on the server, as this product will most likely not be available on the server where your application will be executed, and will only work on a user desktop.
* hen reading/writing from/to Excel spreadsheets however, please use the `AIMMSXLLibrary <https://documentation.aimms.com/aimmsxllibrary/>`_  (``axll::``) functions. This way, an Excel does not have to be installed on the server in order to perform these functions.
* Do not refer to absolute file or directory paths to store or retrieve persistent information in any procedure that is being run on the server, as these files will most probably not be available on the server where your model will be executed.
* Do not use the user management built into AIMMS itself. AIMMS PRO is already offering user management; using the user management in AIMMS will lead to a duplicated login sequence on the client side, and will prevent server sessions to start altogether.
* Do not remove the :any:`maininitialization` procedure in your project, because to function correctly, AIMMS PRO requires this procedure.
* Do not call :token:`pro::DelegateToServer` or other methods from the PRO client library, before the procedure :token:`pro::LibraryInitialization` has been called by AIMMS during project startup. That means that you should not use any PRO functionality in :any:`maininitialization` or in the :any:`libraryinitialization` methods of other libraries that are part of your application, unless you have made sure that :token:`pro::LibraryInitialization` has been called explicitly.
* Do not enter absolute paths in the :token:`SOURCE FILE` attribute of sections and modules of your model, as installation locations of both AIMMS and your project will be different from the stand-alone scenario. Specifically, if you want to include a predefined AIMMS module, do not enter the absolute installation path of AIMMS but rather use the environment variable :token:`%AIMMSMODULES%`.
* Do not use the :any:`ExitAimms` statement when using your app with the AIMMS WebUI. When you close the WebUI, PRO will take care of properly closing AIMMS in the background.
 
 
Symptoms When You Violate These Limitations
-------------------------------------------

When publishing your model, AIMMS PRO will perform a verification run of your model. If your model contains any of the above constructs, this may lead to a publication failure with unexpected or no error messages at all. For instance, when your MainInitialization procedure contains a dialog box, your model will hang indefinitely waiting for input, and will eventually time out without any relevant information as to what caused the failure.

Application Experience
----------------------

To create a complete application experience, use a custom menu bar for your application, where you leave out

* the **File-Close Project** menu item. You do not want end-users to be able to close your project and end up in the stripped down installation free end-user AIMMS.
* the **Tools-License Configuration** menu item. You do not want end-users to be able to make modifications to the license configuration for PRO-enabled applications.
* the **Settings-Solver Configuration** menu item. You do not want end-users to be able to make modifications to the solver configuration of the PRO application, even though the PRO end-user license actually does not allow the usage of any of the solvers.
