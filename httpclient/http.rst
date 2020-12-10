
.. _What_is_HTTP:

What is HTTP?
=============

HTTP  (`HyperText Transfer Protocol <https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol>`_) originally was developed as a protocol for the World Wide Web that described how browsers fetch web pages and images from servers. Nowadays, its use case is generalized as one of the standardized ways information systems interact over the internet and exchange data. 

An HTTP server is the system that has some resources and waits for an incoming HTTP request. An HTTP client is a program that can retrieve a resource from an HTTP server by making such request. In order to do so the HTTP client must follow these 4 steps: 

1. Connect to the server
2. Send the request message
3. Wait for the response 
4. Process the response message

After the response, the connection can be closed or a new request can be made.


The URL
-------

The URL (Uniform Resource Location) may be very familiar because it is prominently visible in the address bar of a browser. Its purpose is twofold: it first specifies to which server to connect and how; and secondly may tell the server which particular resource to retrieve. In a way this gives each resource available on the internet a unique ID, and so instead of URL the term URI (`Uniform Resource Identifier <https://en.wikipedia.org/wiki/Uniform_Resource_Identifier>`_) is often used.

To break down the URL in its different functional parts we use the example from the `wikipedia page about URI: <https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Syntax>`_

.. code-block:: text 

    https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top


From the right to the left we see:

Fragment
    ``top``

    Everything after the ``#`` is not send to the server. The fragment is used to specify a secondary action like a browser jumping to a section on a page *after* the page has been received.

Query
    ``tag=networking&order=newest``

    Following the ``?`` is the query. This is a set of key-value pairs that specify *what* to retrieve from the server. The pairs are separated by ``&`` and there is a ``=`` between the key and value.

Path
    ``/forum/questions/``

    The path specifies *what* to retrieve from the server as a directory or filename.

Authority
    - ``123``    is the port number
        
    - ``www.example.com`` is the host
        
    - ``john.doe`` is the userinfo
        
    The host is essential. It tells which server to use. Optionally we can specify a specific port number. This is an number from 0 to 65535 following the ``:`` after the host. The userinfo is rarely used.

Scheme
    ``https``

    The scheme is either ``http`` or its secure counterpart ``https``. Typically you always want to use https, unless you run a server locally on your machine. The schema is always followed by ``://``.


All parts of the URL are optional, except for the host in the authority and the scheme. For the scheme there are only two possible values. For the host the set of valid characters is limit to alpha numerical characters plus the ``.`` and ``-``. Instead of a host name we can use the `IP address <https://en.wikipedia.org/wiki/IP_address>`_.

For the path and query more characters are allowed. Characters that are not allowed should be percent encode, which means that the *code point* of the character is spelled out as hexadecimal value preceded by a ``%``.


.. _HTTPClient_WhatIsHTTP_RequestAndResponseMessages:

Request and response messages 
-----------------------------

The request and response messages are the streams of bytes to and from the server. 


Request
^^^^^^^

The **request line** is the first line of the request message. If we take the example from the `The URL`_ section, the request line could look like:

.. code-block:: text 

    GET /forum/questions/?tag=networking&order=newest HTTP/1.1

This starts with a `request method <https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods>`_ like GET, POST, PUT or DELETE, followed by the path and/or query from the URL. It ends with the HTTP version. Note that the request line is processed by the server, so the connection already has been established based on the other parts of the URL. 

After the request line we may add a **header** to the request message. These are lines consisting of a header field with a value, that allows the client to provide the server with extra information. This only makes sense when client and server agree upon the meaning of the header fields. That's why usually only fields from the standard list of `HTTP Header Fields <https://en.wikipedia.org/wiki/List_of_HTTP_header_fields>`_ are used. 

Let's add a header to our example:

.. code-block:: text  

    GET /forum/questions/?tag=networking&order=newest HTTP/1.1
    Host: www.example.com:123
    Connection: close

This header has two header fields. ``Host`` takes the value of the host and port number from the URL.
Although the connection between client and server have been established, it is still good practice to add this information to the message. This way in between network nodes like firewalls can take a peek to see where this message is going. 
The field ``Connection`` tells the server that after completion the connection can be closed.

If the header ends with a blank line a **body** can be appended to the request message. The body can be anything, and often this just is a file attached to the message.

Let's remove the query from our example and replace it with a JSON body:

.. code-block:: text  

    GET /forum/questions/ HTTP/1.1
    Host: www.example.com:123
    Connection: close
    Content-Length: 38
    Content-Type: application/json
    
    {"tag":"networking","order":"newest"}

Here the last line is the body and it looks like JSON. We have added the header fields ``Content-Length`` and ``Content-Type`` to the header, to provide the server with relevant information about the body. The content type should be take from the standard list of  `Media types <https://en.wikipedia.org/wiki/Media_type#Common_examples>`_.


Response
^^^^^^^^

The header and body of the response are similar to the request, although the header fields are taken from the `HTTP Response Fields <https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Response_fields>`_ list. 
Different is the **response line**, the first line of the response message. It could look like this:

.. code-block:: text

    HTTP/1.0 200 OK

Here we see that it starts with the protocol used by the server. This may be a different version of HTTP than used in the request. If the server downgrades the protocol it indicates that it only will use features from that version.

The ``200`` is the **status code** and the ``OK`` is the **status message**. This is the server indicating whether the request has been fulfilled, and if not, what went wrong.
The status code is always a 3 digit number and its meaning can be looked up in the `List of HTTP status codes <https://en.wikipedia.org/wiki/List_of_HTTP_status_codes>`_. The status codes are grouped according to:

2xx success
    The resource is returned as requested.

3xx redirection
    The resource is returned from a different location (remember that HTTP was intended for web pages with links that can still point to old locations of resources).

4xx client errors
    The request has not been fulfilled because something was wrong with the request. This can be that a resource is requested that does not exit (like Error 404 "File Not Found" in browsers), or that you are not authorized to access the resource.

5xx server errors
    The request has not been fulfilled because something went wrong in the server.


.. warning::

    Always check the status code. Without the status code you cannot know whether the response contains what you expect.




