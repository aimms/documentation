Library Repository
******************

The AIMMS Library Repository is accessible from within the Library Manager within your model. It provides a growing number of generic libraries you can add to your model.

To add a library from the Library Repository to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. 

If you select a library here, it will downloaded from the library repository, cached on your local machine and added as reference to your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

.. toctree::
    :maxdepth: 1
    
    cdm/index
    datalink/index
    httpclient/index
    rlink/index
    unit-test/index