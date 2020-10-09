Introduction
============

The HTTP Client library provides you with a low-level `API <api.html>`_ to create and execute HTTP requests (over both plain TCP/HTTP and secure SSL/TLS/HTTPS connections). You can use this library download files from the web, or call REST APIs of web services required by your model. The library provides you with complete freedom to programmatically construct an HTTP request with all headers required for the service that you want to call.

The library does *not* create request bodies, nor does it interpret and translate response bodies into AIMMS data. The latter is left completely to your AIMMS model. 


.. tip::

    For processing the body the `Data Exchange Library <..\dataexchange\index.html>`_  can be used. It can handle different types, like JSON, XML and CSV.

..
    * **XML**, you can use the XML functionality in AIMMS to translate the XML response into AIMMS data
    * **CSV**, you can use the `Datalink library <..\datalink\index.html>`_ to translate the CSV response into AIMMS data

Adding the HTTP Client library to your model
--------------------------------------------

The HTTP Client component is provided in the form of a library :token:`HTTPClient` in the AIMMS Library Repository, which is accessible from within the Library Manager within your model. After selecting the :token:`HTTPClient` library from the Library Manager, it will be downloaded from the AIMMS Library Repository, and added to your model.

To add the HTTP Client library to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. Select HTTPClient from the list to add the library to your model, or select a specific version to upgrade from a previous version you already installed before. 

..
    This will download the HTTPClient library from the library repository, cache it on your local machine and add a reference to it in your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

Example
-------

The following example shows the implementation of the :js:func:`web::downloadFile` method implemented in the HTTP Client library. It demonstrates the lower-level native methods used to 

* create the HTTP request to perform the file retrieval
* set various HTTP headers and library options
* set the method to retrieve the response body into a given *destination* file name 
* execute the query, and
* close the HTTP request

    .. code-block:: aimms

        ! Setup the web-request
        web::request_create(requestId);
        web::request_setURL(requestId, url);
        if (username <> "" ) then
            ! see https://en.wikipedia.org/wiki/Basic_access_authentication
            web::base64_encode( userName + ":" + password, authorization);
            myHttpHeaders[ 'Authorization' ] := "Basic " + authorization;
            web::request_setHeaders(requestId, myHttpHeaders);
        endif;
        web::request_setResponseBody(requestId, 'File', destination);

        web::request_getOptions(requestId, myClientOptions);
        myClientOptions['requestTimeout'] := "30"; ! 30 seconds
        web::request_setOptions(requestId, myClientOptions);

        ! invoke the web-request
        web::request_invoke(requestId, responseCode);
        if (responseCode <> 200) then
            raise error "Web Request failed ";
        endif;

        web::request_close(requestId);

        
.. tip::

    More examples can be found in our `HTTP Library HowTo <https://how-to.aimms.com/C_Developer/Sub_Connectivity/sub_http/index.html>`_.

Limitations
-----------

The library does not support compression (see also :js:func:`web::request_setHeaders`).

