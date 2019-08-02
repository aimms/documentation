Download Widget
====================

The Download widget and the related :doc:`upload-widget` achieve complementary tasks.

.. image:: images/Download-View.png
    :align: right

The Download widget allows you to download a file created by the underlying AIMMS model (running on a PRO server) to your local computer.
In WebUI, pressing the button to the right of the download widget starts the AIMMS procedure that creates/prepares the file to be downloaded. 
When this process is finished, the default download functionality of your browser is used to let you download the file. 

.. note::
    
    In case the AIMMS procedure to create the file to be downloaded takes longer than 10 seconds, WebUI shows a 'Busy' state. 
    
By default, the status message displayed on the download widget changes from 'Prepare download' to 'File ready to download'. 
The button text changes to 'Get' and you can now start the file download by clicking on it. 

Creating a Download Widget
-------------------------------

After adding a (blank) Download widget to your WebUI page, you need to link it with an AIMMS procedure using the options editor of the Download widget. This procedure needs to have the following arguments in the exact way as below. 

.. code::
    
    Procedure MyFirstDownloadProc {
        Arguments: (FileLocation,statusCode,statusDescription);
        StringParameter FileLocation {
            Property: Output;
        }
        Parameter statusCode {
            Property: Output;
        }
        StringParameter statusDescription {
            Property: Output;
        }
    }

FileLocation
^^^^^^^^^^^^^^

The download widget always looks for the file to be downloaded in the below listed folders depending on which AIMMS environment you are using and ``FileLocation`` contains the name of the file you want to download. 

* the root folder of the AIMMS project if in Developer mode 
* the temporary PRO folder, if the app is launched from a PRO server (or AIMMS Cloud)

However, to create a file with name ``FileLocation`` in the temporary PRO folder, you will need to know the path of that folder and append it before the file name. This can be done by using the pre-defined function :token:`webui::GetIOFilePath` after assigning a string value to ``FileLocation``.

.. code::

    webui::GetIOFilePath(FileLocation);

The above function returns a string value with the absolute path to the file ``FileLocation`` if you are using it from PRO and returns the unchanged file name if you are in Developer mode. By using this returned value as the location for the file to be created by your procedure, you will make it available for the download widget. 

In case you want to be able to download a previously created file through the download widget, you will need to copy that file into the appropriate location. You can use the :token:`FileCopy` function as below to do that 

.. code::

    FileCopy(FileLocation, webui::GetIOFilePath(FileLocation));
    
StatusCode
^^^^^^^^^^^^

The :token:`StatusCode` argument should be filled as follows:

.. code::

    statusCode := webui::ReturnStatusCode('CREATED');

The pre-defined function :token:`webui::ReturnStatusCode` has the below possible arguments 

    * :token:`OK`
    * :token:`CREATED` 
    * :token:`BAD_REQUEST`
    * :token:`UNAUTHORIZED` 
    * :token:`CONFLICT`
    * :token:`ERROR` 
    
As your procedure is expected to create a file, the status :token:`CREATED` is expected if all goes well. You can use one of the other status codes to signal that something went wrong when creating your file.

.. note::

    Please note that those status codes are standard HTTP status codes. For further reference, please go to https://en.wikipedia.org/wiki/List_of_HTTP_status_codes 

StatusDescription
^^^^^^^^^^^^^^^^^^^

The :token:`StatusDescription` argument can be used to display custom text as the status messages in the download widget. 

Example
----------

An example for the body of the download procedure is shown below. This particular example shows how to create a text file containing the final path of :token:`FileLocation`. An example AIMMS project which illustrates the usage of this procedure can be downloaded from :download:`here <resources/DownloadWidgetExample.7z>`.


.. code::
    
    ! we want to download a file - MyDownloadFile.txt
    FileLocation := "MyDownloadFile.txt"; 
    
    ! we store the location of the file in string parameter FinalLocation
    FinalLocation := webui::GetIOFilePath(FileLocation); 
    
    ! writing the string parameter FinalLocation to a text file
    write FinalLocation to file FinalLocation; 

    ! checking if the previous write statement was successful or not
    if FileExists(FinalLocation) then 
    
       ! if successful, statusCode is set to 'CREATED' which will trigger the download widget to show the Get button
       StatusCode := webui::ReturnStatusCode('CREATED');
       ! displaying the status message as All perfect instead of the default "File ready to download"
       StatusDescription := "All perfect!"; 
       
    else    !if previous write statement was not successful 
       
       ! setting the statusCode to 'ERROR' and the download widget will not show the Get button anymore
       statusCode := webui::ReturnStatusCode('ERROR'); 
       !displaying a custom error message 
       statusDescription := "Something went wrong when creating the file."; 
       
    endif;

When executed through the download widget, this procedure will let you download a file named MyDownloadFile.txt with FinalLocation := "MyDownloadFile.txt" as its content. If launched from PRO, the file name will still remain same but the value for FinalLocation will be "temporary PRO path + MyDownloadFile.txt"

Note that this generated file is NOT automatically deleted if you are running WebUI in AIMMS developer mode. If you want to delete this file after a download, you should use the function :token:`FileDelete` as below. 

.. code::

    FileDelete(FinalLocation)

This step is not required on PRO as the temporary PRO folder in which the file is created will be automatically deleted sometime after the session is ended. 

.. tip::

	If you need to use folder names in your model, use forward slashes to separate them. This ensures that your project will be able to be executed on a Linux server