AIMMS PRO API
*************

AIMMS PRO REST API
------------------

This is the newest implementation of the PRO API, following modern REST API design principles. It is described `here <rest-api.html>`.

AIMMS PRO Java/C# API
---------------------

This is the legacy API where client libraries are provided by AIMMS. We envision that the functionality provided by this API will eventually be supported by the AIMMS PRO REST API.

The AIMMS PRO API allows you to build custom Apps in Java or C# code using the AIMMS PRO platform e.g. submit ‘solve jobs’ from these Apps. Next to AIMMS Windows and Web Apps, this means you can now deploy AIMMS inside Apps, ideal for e.g. closed loop optimization. In addition, the AIMMS PRO API allows you to perform most tasks supported by the AIMMS PRO job request manager. For details, please visit `AIMMS PRO API Documentation <http://download.aimms.com/aimms/PROAPI/frames.html?frmname=topic&frmfile=index.html>`_.

The AIMMS PRO API is tightly coupled with the PRO version. You can download the latest PRO API via the Help – Getting Started menu on the AIMMS PRO Portal. 

.. seealso::

    Some examples about `how to use the AIMMS PRO API <https://how-to.aimms.com/C_Deployment/Sub_PRO_API/index.html>`__
    
    - `Start a Job via PRO API using Java <https://how-to.aimms.com/Articles/98/98-starting-job-aimms-pro-api-java.html>`__
    - `Start a Job via PRO API using C# <https://how-to.aimms.com/Articles/98/98-starting-job-aimms-pro-api-csharp.html>`__
   

.. toctree::
    :maxdepth: 1

    rest-api
