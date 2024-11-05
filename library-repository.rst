.. image:: Images/library-bulleted-list-128.png
   :scale: 100
   :align: right
   :alt: AIMMS Library Repository

Library Repository
******************

The AIMMS Library Repository is accessible from within the Library Manager within your model. It provides a growing number of generic libraries you can add to your model.

To add a library from the Library Repository to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. 

If you select a library here, it will downloaded from the library repository, cached on your local machine and added as reference to your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

.. important::
   Please note that when using these libraries on AIMMS PRO, it needs access to the AIMMS library repository (URL:  https://library-repository.aimms.com/aimmslibs.all , port number: 443). 
   You may check/adjust firewall settings on the AIMMS PRO server in the case when AIMMS PRO is not able to access the AIMMS Library Repository. 
   
   For an AIMMS PRO without access to our repository, the libraries must be included in the ``.aimmspack`` file. You can just select "Library Repository (local copy)" when doing the "Select Files for Export".

.. toctree::
   :maxdepth: 1
   
   general-library/getting-started
   axll/index
   cdm/index
   dataexchange/index
   datalink/index
   emailclient/index
   forecasting/index
   guardserversession/index
   httpclient/index
   rlink/index
   snowflake/index
   unit-test/index
   

.. note::
   
   We use `Amazon Cloudfront <https://aws.amazon.com/cloudfront/details/>`_ to distribute the AIMMS libraries in the fastest way. This means content is served from a server that is closest to where AIMMS is attempting to download the library, therefore there is no single IP address associated with the AIMMS library repository. There is however a list of `IP ranges that Amazon uses for CloudFront <https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/LocationsOfEdgeServers.html>`_. 

