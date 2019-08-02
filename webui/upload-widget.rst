Upload Widget
-------------

The Upload widget and the related :doc:`download-widget` achieve complementary tasks.

With the Upload Widget, end-users can upload a file to the AIMMS PRO server, which can then be further processed by the AIMMS model. This is very useful for Web Apps that depend on user specific data that is not yet available on the server (e.g. Excel data input). 

.. image:: images/Upload-View.png
    :align: center

    
Creating an Upload Widget
++++++++++++++++++++++++++

After adding a (blank) Upload widget to your WebUI page, you need to link it with an AIMMS procedure using the options editor of the Upload widget. This procedure needs to have the following arguments in the exact way as below. 

.. code::
    
    Procedure MyFirstUploadProc {
        Arguments: (FileLocation,StatusCode,StatusDescription);
        StringParameter FileLocation {
            Property: Input;
        }
        Parameter StatusCode {
            Property: Output;
        }
        StringParameter StatusDescription {
            Property: Output;
        }
    }

.. warning::

    Please note that the latter two (output) arguments should have the exact names as stated, as they are treated in a special way in the underlying procedure call mechanism.

    
FileLocation
^^^^^^^^^^^^

The upload widget always copy the file to be uploaded in the below listed folders depending on which AIMMS environment you are using. ``FileLocation`` contains the name of the uploaded file. 

* the main AIMMS project folder in developer mode 
* the temporary PRO folder, if the project is launched from a PRO server (or the AIMMS Cloud)

However, to access a just-uploaded file with name ``FileLocation`` in the temporary PRO folder, you will need to know the path of that "PRO temporary" folder and append it before the file name. This can be done by using the pre-defined function :token:`webui::GetIOFilePath` after assigning a string value to ``FileLocation``.

.. code::

    webui::GetIOFilePath(FileLocation);

The above function returns a string value with the absolute path to the file ``FileLocation`` if you are using it from PRO and returns the unchanged file name if you are in Developer mode. By using this returned value as the location for the file to be created by your procedure, you will make it available for the download widget. 

.. note::

    In case you want to be able to download a previously uploaded file through the download widget, you can copy that file into the appropriate location. You can use the :token:`FileCopy` function as below to do that 

    .. code::

        FileCopy(FileLocation, webui::GetIOFilePath(FileLocation));
    
StatusCode
^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^

The :token:`StatusDescription` argument can be used to display custom text as the status messages in the Upload widget. 


Example
+++++++

An example for the body of the Upload procedure is shown below. This particular example shows how to upload and read a text file. An example AIMMS project which illustrates the usage of this procedure can be downloaded from :download:`here <resources/DownloadWidgetExample.7z>`.


.. code::
    
    UploadLocation := webui::GetIOFilePath(FileLocation); ! we store the location of the file in string parameter UploadLocation
    
    sp_TextOfUploadedFile := FileRead(UploadLocation); ! reading the file UploadLocation into an string parameter

    if sp_TextOfUploadedFile <> '' then ! checking if the previous read statement was successful or not
    
       StatusCode := webui::ReturnStatusCode('OK'); ! if successful, statusCode is set to 'OK' which will trigger the WebUI to show the message bellow in a grey box
       StatusDescription := "File was uploaded and read successfully"; ! displaying the status message, and logging it in the webui messages
       
    else    !if previous read statement was not successful 
       
       statusCode := webui::ReturnStatusCode('ERROR'); ! setting the statusCode to 'ERROR' 
       statusDescription := "Could not read the file or the file is empty."; !displaying a custom error message 
       
    endif;

When executed through the upload widget, this procedure will let you upload a file at ``UploadLocation`` and read it in a string parameter ``sp_TextOfUploadedFile``. 

The name of the uplaoded file will be appended with a random "big" number, to be sure to not overwrite any other file on the server. 
If you've uploaded "*MyExcel.xlsx*", the uploaded file name could be "*MyExcel-1564733452728.xlsx*"

If launched from PRO, the file name will still remain the same but the value for UploadLocation will be "temporary PRO path + MyExcel-1564733452728.xlsx"

Note that this uploaded file is NOT automatically deleted if you are running WebUI in AIMMS developer mode. If you want to delete this file after an upload, you should use the function :token:`FileDelete` as below. 

.. code::

    FileDelete(UploadLocation)

This step is not required on PRO as the temporary PRO folder in which the file is created will be automatically deleted sometime after the session is ended. 

.. tip::

	If you need to use folder names in your model, use forward slashes to separate them. This ensures that your project will be able to be executed on a Linux server

