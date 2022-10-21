AIMMS PRO API
*************

Currently we provide two APIs to PRO: the 'Java/C# API' which has been available for many years and the new 'PRO REST API server', released 2022. We recommend the use of the PRO REST API Server for all new applications, because it has more functionality and typically requires less time to implement. Also the 'Java/C# API' will be deprecated in the near future.

AIMMS PRO REST API
------------------

This is the newest implementation of the PRO API, following modern REST API design principles,. Our goal of this REST API Services is to give you ‘programmatic access’ to our AIMMS PRO Cloud Platform. The AIMMS PRO REST API allows users to securely interact with the AIMMS PRO Cloud Platform via a REST interface. This API is designed following the `OpenAPI Specification <https://swagger.io/specification/>`_ such that you can automatically generate your client code. It is available only on our Azure Cloud Platform.

AIMMS PRO REST API also supports all the functionality provided by our existing AIMMS PRO Java/C# API. Please consider switching to this newest REST API if you are already using our Azure Cloud Platform.

As of now we support following services(functionality) through AIMMS PRO REST API,

    - `Running Tasks <https://documentation.aimms.com/pro/rest-api.html#crud-on-tasks>`__
    - `Managing Users and Groups <https://documentation.aimms.com/pro/rest-api.html#managing-users-and-groups>`__
    - `Managing Apps <https://documentation.aimms.com/pro/rest-api.html#managing-apps>`__
    - `Managing AIMMS <https://documentation.aimms.com/pro/rest-api.html#managing-aimms>`__
 
For more details, please visit `AIMMS PRO REST API Documentation <rest-api.html>`__.


AIMMS PRO Java/C# API
---------------------

This is the legacy API where client libraries are provided by AIMMS. We envision that the functionality provided by this API will eventually be supported by the AIMMS PRO REST API.

The AIMMS PRO API allows you to build custom Apps in Java or C# code using the AIMMS PRO platform e.g. submit ‘solve jobs’ from these Apps. Next to AIMMS Windows and Web Apps, this means you can now deploy AIMMS inside Apps, ideal for e.g. closed loop optimization. In addition, the AIMMS PRO API allows you to perform most tasks supported by the AIMMS PRO job request manager. For details, please visit `AIMMS PRO API Documentation <http://download.aimms.com/aimms/PROAPI/frames.html?frmname=topic&frmfile=index.html>`__.

The AIMMS PRO API is tightly coupled with the PRO version. You can download the latest PRO API via the Help – Getting Started menu on the AIMMS PRO Portal. 

.. seealso::

    Some examples about `how to use the AIMMS PRO API <https://how-to.aimms.com/C_Deployment/Sub_PRO_API/index.html>`__
    
    - `Start a Job via PRO API using Java <https://how-to.aimms.com/Articles/98/98-starting-job-aimms-pro-api-java.html>`__
    - `Start a Job via PRO API using C# <https://how-to.aimms.com/Articles/98/98-starting-job-aimms-pro-api-csharp.html>`__
   

.. toctree::
    :maxdepth: 1

    rest-api
