Download Widget
---------------

The Download widget allows you to download a file created by the underlying AIMMS model (running on the PRO server) to your local computer.

.. image:: images/download-prepare.png
    :align: center

In the WebUI, you should simply press the button at the right of the Download widget. That starts the AIMMS procedure that creates/prepares the file to be downloaded. If that is finished, the default download functionality of your browser is used for downloading the file immediately. In case the AIMMS procedure takes longer (longer than 10 seconds), the WebUI shows a 'Busy' state. After that, the text on the download widget changes from 'Prepare download' into 'File ready to download'. The button text changes to 'Get', such that you can now manually start the actual download.