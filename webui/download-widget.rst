Download Widget
---------------

The Download widget allows you to download a file created by the underlying AIMMS model (running on the PRO server) to your local computer.

.. image:: images/download-prepare.png
    :align: center

In the WebUI, you should simply press the button at the right of the Download widget. That starts the AIMMS procedure that creates/prepares the file to be downloaded. If that is finished, the default download functionality of your browser is used for downloading the file immediately. In case the AIMMS procedure takes longer (longer than 10 seconds), the WebUI shows a 'Busy' state. After that, the text on the download widget changes from 'Prepare download' into 'File ready to download'. The button text changes to 'Get', such that you can now manually start the actual download.

Creating a Download Widget
++++++++++++++++++++++++++

After adding a (blank) Download widget to your WebUI page, you have to provide it an AIMMS procedure, just as with the Upload widget. You can do this in the options editor of the Download widget. This procedure needs to have the following prototype/arguments:

.. code::

    MyFirstDownloadProc(FileLocation, statusCode, statusDescription);

All three arguments need to be of type :token:`Output`. The :token:`FileLocation` and the :token:`statusDescription` should be of type 'String Parameter' and the :token:`statusCode` of type 'Parameter'.

FileLocation
^^^^^^^^^^^^

This procedure should create the file to be downloaded and it should make sure that it will be located in the right location (not a subfolder of these locations) which is 

* the main AIMMS project folder in development mode and 
* the temporary PRO folder in case the project is started via PRO. 

In order to know where this temporary PRO folder is, you should use the following pre-defined function when creating your file (available in the WebUI library):

.. code::

    webui::GetIOFilePath(FileLocation);

This function makes sure that the path of your file is extented to take the temporary PRO folder into account when executed on PRO. To make your file available to the Download widget, you have to make sure that your file is actually in the resulting file location (for example, by using the :token:`FileCopy` function in AIMMS). You have to pass the name of the created file to the :token:`FileLocation` argument of your procedure.

StatusCode
^^^^^^^^^^

The :token:`StatusCode` argument should be filled as follows:

.. code::

    statusCode := webui::ReturnStatusCode('CREATED');

The pre-defined function :token:`webui::ReturnStatusCode` has a number of possible arguments (:token:`OK`, :token:`CREATED`, :token:`BAD_REQUEST`, :token:`UNAUTHORIZED`, :token:`CONFLICT` and :token:`ERROR`). Because your procedure is expected to create a file, the status :token:`CREATED` is expected if all goes well. You can use one of the other status codes to signal that something went wrong when creating your file.

StatusDescription
^^^^^^^^^^^^^^^^^

The :token:`StatusDescription` argument can be used to provide a human-readable description of the status. It allows you to pass your own error messages in case the creation of the file didn't succeed.

Example
+++++++

So, a sample procedure may look like this:

.. code::

    ReportName := webui::GetIOFilePath("MyReport.txt");
    write Import, ReportName to file TheFile; ! Actualy create a report

    FileLocation := "MyReport.txt";

    if FileExists(ReportName) then
       StatusCode := webui::ReturnStatusCode('CREATED');
       StatusDescription := "All perfect!";
    else
       ! Somehow the file could not be created
       statusCode := webui::ReturnStatusCode('ERROR');
       statusDescription := "Something went wrong when creating the file."
    endif;

with string parameter ReportName defined as

.. code::

    webui::GetIOFilePath("MyReport.txt")

Please note that the file is NOT automatically deleted for you when running WebUI in AIMMS developer mode. It will be in case WebUI is running under PRO, as the temporary PRO folder is deleted some time after a session is closed. Note as well that you cannot delete the report from the download procedure itself (at the end), as at the point of deletion, the filename would not have been passed to the WebUI yet, meaning you would be just about to start a download of a file that you have already deleted. 

Please also note that if you need to use folder names in your model, use forward slashes to separate them. This ensures that your WebUI using this model is also capable of running on Linux.