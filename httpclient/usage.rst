Using the HTTP Client
=====================




Synchronous Request Management
------------------------------


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



Asynchronous Request Management
-------------------------------

One issue with the ``request_invoke`` call is that the round trip to the server may take a while. During this time AIMMS is blocked and cannot do anything. This not only slows down the model, it can also make WebUI apps feel less snappy.

To overcome this we can cut the request in two:

1. Send the request using :any:`web::request_invoke_async`
2. Process the response using a user defined callback procedure.


A typical asynchronous request could look like:

.. code-block:: aimms

    web::request_create(sp_requestId);                                   ! a new request
    web::request_setURL(sp_requestId, "http://localhost/file.txt" );     ! set the url
    web::request_setResponseBody(sp_requestId, 'File', "response.txt");  ! result in this file 
    web::request_invoke_async( sp_requestId , "MyCallBack" );            ! invoke async request

Here we see that the create and setters are used in the same way as with ``request_invoke``. In this example we set the response body that can be retrieved in the callback. For the callback we have to make a procedure with name "MyCallBack".

.. code-block:: aimms

    Procedure MyCallBack {
        Arguments: (requestId,responseCode);
        Body: {     
            if (responseCode <> 200) then
                ! something is wrong
                raise error "responseCode <> 200 => Web Request Failed " + requestId;
            else
                ! assume resbodytype is 'File' then resbody is the filename
                web::request_getResponseBody(requestId, resbodytype, resbody);
                ! read the file
                sp_response := fileread(resbody) ;
            endif;
            web::request_close(requestId);    ! we don't need it anymore so close it
        }
        StringParameter requestId {
            Property: Input;
        }
        Parameter responseCode {
            Property: Input;
        }
        StringParameter resbody;
        StringParameter resbodytype;
    }

In this callback function we use the ``responseCode`` to check if the server send us what we have requested. If not there is something wrong. If the ``responseCode`` is 200 we use the getter ``request_getResponseBody`` to find out it which file the response body is written so we can read it. After the callback we no longer need this request so we can close it in the callback.

The wait functions
^^^^^^^^^^^^^^^^^^

The purpose of :any:`web::request_invoke_async` is to allow AIMMS do something else instead of waiting for the response. This can create the situation that AIMMS is too busy to call the callbacks. For this reason also two waiter functions have been introduced.

wait_for_response
    This waiter has as argument a timeout in seconds. It will return immediately with value 1 if it handles at least one callback. If it does timeout without handling any callbacks it will return 0. 

wait_for_the_response
    This is a specific waiter. If we cannot continue unless the callback of a certain request is handles, we can use this function.

Note that the following calls are functionally equivalent. They only differ in where it is waiting for the response.

.. code-block:: aimms

    web::request_invoke_async(sp_requestId, "MyCallBack" );
    web::wait_for_the_response(sp_requestId);                  ! here it waits for the response


and

.. code-block:: aimms

    web::request_invoke(sp_requestId, statusCode);            ! here it waits for the response
    MyCallBack(sp_requestId, statusCode);   


This also shows that it is very easy to turn synchronous calls into asynchronous calls. First clean up the response handling into a "callback" procedure. Then change the second situation into the first. Finally we can squeeze other things between :any:`web::request_invoke_async` and ``wait_for_the_response`` to make good use of the "waiting time".


.. _LinkConfigReqPoolSize:

Configuration
^^^^^^^^^^^^^

The number of asynchronous requests that can run simultaneously is limited by the request pool size. When the request pool is full all subsequent calls to :any:`web::request_invoke_async` will be placed in a queue. As soon as a slot is free in the request pool, the next request from the queue is placed in the pool and called.

For example, if ``ReqPoolSize`` is 4 and one does 10 asynchronous requests, only the first 4 are invoked immediately and the other 6 are queued. These 6 will be picked up when a thread has completed the request, until all requests are done.

The default value of the request pool size is 4. The value can be changed using ``web::setConfig`` :

.. code-block:: aimms

    StringParameter sp_ClientConfig {
        IndexDomain: web::cc;
        InitialData: Data{ 'ReqPoolSize' : "6"};
    }
    web::setConfig(sp_ClientConfig)

Note that increasing the request pool size has immediate effect. However, if one decreases the size of the pool while it is full, the pool shrinks only when all already running calls are finished.



The URL
-------

The most important setter from :ref:`Request Getters and Setters <HTTPClient_API_RequestGettersAndSetters>` is the function ``request_setURL``. Without it the request cannot be invoked. 
The second argument of this function is the URL string.
Because of its importance, this URL string will be cleaned and corrected to always end up with a valid URL. If that is not possible the URL string is rejected and the URL stays unspecified.   

Cleaning
    Redundant elements are removed.

Example:

.. code-block:: aimms

    web::request_setURL(requestId, "   http://localhost   " ); ! white space will be trimmed


Correcting
    Missing essential parts of the URL can be filled in and parts that don't make sense can be removed. A warning will be given when parts are removed. Also if needed characters are percent encoded. 

Example:    

.. code-block:: aimms

    web::request_setURL(requestId, "example.com/the path?a=1&b2&c=3" ); 

In the resulting URL the missing schema ``https`` is filled in and the  erroneous item ``b2`` is omitted from the query. The space in the path is percent encoded:

.. code:: text

    https://example.com/the%20path?a=1&c=3    


Rejecting
    Some errors cannot be corrected. Typically this happens when there are illegal characters in the host name. The HTTPClient cannot guess the correct name, so it will reject the URL string. A warning will be given because the request cannot be invoked.

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

.. spelling::

    raison
    d'être