Using the HTTP Client
=====================




Request Management
------------------


A **request** is something that can perform :ref:`the 4 steps <What_is_HTTP>` for an HTTP request.
The HTTP Client Library can maintain a collection of requests (just think about them as tabs in a browser). You can add requests to this collection, manipulate them, invoke them and, when no longer needed, discard them,
In :ref:`Request Management <HTTPClient_API_RequestManagement>` we see the three functions, ``request_create``, ``request_close`` and ``request_invoke`` that are important in the life cycle of a request.

request_create
    When creating a request a string parameter has to be passed. The HTTPClient will assign a unique ID to this parameter. This ID has to be used every time when addressing this specific request. 

request_close
    The request can be closed if it is no longer needed. This will delete all data associated with this request.

request_invoke    
    This is the raison d'être of the request. We want to send the request to the server. Before the request is send a final check is performed to see if the URL is specified and everything is conform the specifications of HTTP. If a check fails an error is given and the request is **not** send. If all checks pass the request will be send and after waiting for the response, it returns with the status code from the server.


For the manipulation of the request :ref:`setter and getter <HTTPClient_API_RequestGettersAndSetters>` can be used. These are functions that all start with ``request_`` and have the unique ID, given by ``request_create``, as the first argument. These functions can be used to specify what resource to retrieve and how, and also inspect the response.

A typical life cycle of a request would look like:

    .. code-block:: aimms

        web::request_create(requestId);                                ! add a new request

        web::request_setURL(requestId, "http://localhost/file.txt" );  ! manipulate request
        web::request_invoke(requestId, statusCode );                   ! invoke request
        ! check statusCode and process response

        web::request_close(requestId);                                 ! discard request



The URL
-------

The most important setter from :ref:`Request Getters and Setters <HTTPClient_API_RequestGettersAndSetters>` is the function ``request_setURL``. Without it the request cannot be invoked. 
The second argument of this function is the url string.
Because of its importance, this url string will be cleaned and corrected to always end up with a valid URL. If that is not possible the url string is rejected and the URL stays unspecified.   

Cleaning
    Redundant elements are removed.

Example:

.. code-block:: aimms

    web::request_setURL(requestId, "   http://localhost   " ); ! whitespace will be trimmed


Correcting
    Missing essential parts of the URL can be filled in and parts that don't make sense can be removed. A warning will be given when parts are removed. Also if needed characters are percent encoded. 

Example:    

.. code-block:: aimms

    web::request_setURL(requestId, "example.com/the path?a=1&b2&c=3" ); 

In the resulting URL the missing schema ``https`` is filled in and the  erroneous item ``b2`` is omitted from the query. The space in the path is percent encoded:

.. code:: text

    https://example.com/the%20path?a=1&c=3    


Rejecting
    Some errors cannot be corrected. Typically this happens when there are illegal characters in the host name. The HTTPClient cannot guess the correct name, so it will reject the url string. A warning will be given because the request cannot be invoked.

Example:

.. code-block:: aimms

    web::request_setURL(requestId, "example,com" ); ! comma in host is not allowed



The query string
^^^^^^^^^^^^^^^^

In :ref:`Utility Function <HTTPClient_API_UtilityFunctions>` we see the function ``query_format`` that can help us to generate a query string. As input it has a one dimensional string parameter and as output a string. The index values form the keys and the parameter values the values in the query string.

Example:

.. code-block:: aimms

    SP_url= "http://localhost";                                        ! the base url
    S_QueryKey := DATA { name, order };                                ! set of keys

    SP_Query := DATA { name : "Bob", order : "beer" };                 ! query as parameter

    web::query_format(SP_Query, SP_formattedQuery);                    ! make the query string

    web::request_setURL(requestId, SP_url + "?" + SP_formattedQuery ); ! don't forget the "?"
    web::request_getURL(requestId, SP_check_url);                      ! check URL

Then the value of ``SP_check_url`` is:

.. code:: text

    http://localhost?name=Bob&order=beer    

.. note::

    The query will not check if the result makes sense as set of key value pairs (i.e. ``?a=1&a=2&a=3``). This is still correct HTTP and in such case the server should, if it cannot handle this, return an error status code.   


The Bodies
----------

Both the request and response message can have a body and the functions ``request_setRequestBody`` and ``request_setResponseBody`` can be used for this. The second argument of these function is the type. ``None`` or ``File``. In case of type File, the third argument is the filename.

None
    This is the default body type for both request and response. If the response message happens to have a body, then this body will be ignored. Usually the response body is the resource we are after, so body type None is hardly ever useful for a response.  

File
    In case of the request, the file is appended to the request message. In case of a response, the body is written to this file.

Example:

.. code-block:: aimms

    web::request_setRequestBody(requestId, 'File', "request.txt");
    web::request_setResponseBody(requestId, 'File', "response.txt");


.. note::

    The bodies have to be specified **before** invoke is called. This also holds for the response!



The Headers
-----------


:ref:`Request and response messages <HTTPClient_WhatIsHTTP_RequestAndResponseMessages>` can have headers. These are key value pairs, which in AIMMS can be represented as a one dimensional string parameter. 


* ``request_setHeaders`` can be used to set the header of the request.
* ``request_getHeaders`` can be used to retrieve the header of the request.
* ``request_getResponseHeaders`` can be used to retrieve the header of the response. This is only available when invoke has returned.


When invoke is called some default values for the request header are added. This can be shown experimentally. In the following code all parameters are one dimensional string parameters. ``SP_myHeader`` contains all header fields we want to set.

.. code-block:: aimms

    web::request_setHeaders(requestId,SP_myHeader);             ! set the header
                
    ! check it (Before)
    web::request_getHeaders(requestId,SP_reqHeadBefore);
    web::request_getResponseHeaders(requestId,SP_resHeadBefore);
                
    ! send request
    web::request_invoke(requestId, p_statusCode);
                
    ! check it again (After)
    web::request_getHeaders(requestId,SP_reqHeadAfter);
    web::request_getResponseHeaders(requestId,SP_resHeadAfter);

After running this code we see:

SP_reqHeadBefore 
    This is the request header before invoke is called. It is the same as ``SP_myHeader``, the values we have set it to. 

SP_resHeadBefore
    This is the response header before invoke. It is empty and a warning will tell that this header is not available yet. 

SP_reqHeadAfter
    This is the request header after invoke. We see that it has more element than ``SP_reqHeadBefore`` (I.e. header field ``Host``). During invoke these values were added.     

SP_resHeadAfter
    This is the response header after invoke. This is completely filled in by the server.   


.. note::

    When the request has a body then the ``Content-Length`` header field is automatically added. The ``Content-Type`` is not added and may have to be set using ``request_setHeaders``.