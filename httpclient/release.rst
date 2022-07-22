HTTPClient Library Release Notes
**********************************

The first public release of HTTPClient was version 1.0.0.3, release date December 13, 2017. 


New Features and Bug Fixes
--------------------------
1.2.0.64 [19-07-2022]
    - No change (internal: resolve issues new build system)

1.2.0.55 [09-07-2022]
    - No change (internal: prepare for new build system)

1.2.0.44 [17-05-2021]
    - Relax strictness for URL query

1.2.0.41 [14-05-2021]
    - Prevent double ``url_encoding`` for parts of the URL
    - Protect web::base64_decode for invalid input
    - Handle double equal signs in URL query differently

1.2.0.36 [04-03-2021]
    - Fix threading issue in :any:`web::request_invoke_async` method
    - Added  :any:`web::setConfig` method

1.2.0.6 [19-01-2021]
    - Fix hanging issue on connection error

1.2.0.1 [18-12-2020]
    - Added  :any:`web::request_invoke_async` method
    - Added  :any:`web::wait_for_response` method
    - Added  :any:`web::wait_for_the_response` method

1.1.0.8 [18-12-2020]
    - Fix empty response header issue

1.1.0.6 [09-12-2020]
    - Fix binary body issue 

1.1.0.1 [09-10-2020]
    - New code base 

1.0.2.179 [05-10-2020]
    - Fix chunked encoding issue
    - Fix URL percent encoding bug

1.0.2.175 [30-09-2020]
    - Major rewrite of implementation
    - Improved error and warning messages

1.0.2.40 [25-09-2019]
    - Fixed an issue with parsing chunked HTTP responses that did not close the connection
    - Added web::request_generate_curl method
    
1.0.2.35 [23-09-2019]
    - Fixed an issue with POST-ing bodies bigger than 1 MB in size
    
1.0.2.34 [30-07-2019]
    - Fixed an issue with parsing (invalid) HTTP responses from servers that do not include the status text in the status line

1.0.2.33 [22-07-2019]
    - Fixed an issue with retrieving long string values (>255 characters) from AIMMS identifiers

1.0.2.30 [14-05-2019]
    - Added support for release notes

1.0.2.26 [31-01-2019]
    - Fixed numbering issue in library repository
    
1.0.2.25 [08-11-2018]
    - Fixed the way path and host headers were generated in HTTP request
    
1.0.2.24 [02-10-2018]
    - Fixed an issue with chunked decoding
    
1.0.2.22 [20-09-2018]
    - Added support for VC2017

1.0.2.9 [12-07-2018]
    - Added Content-Type to the HttpHeader set
    - Added Content-Length header to request when an input file is specified
    - Fixed issue with not writing received data to files
    
1.0.2.5 [31-05-2018]
    - Allowed access to response headers
    - Do not implicitly close request after invoke
    - Allowed re-use of request by reading response also when discarded

1.0.2.4 [06-04-2018]
    - Added support for chunked HTTP transfer encoding
    
1.0.2.1 [26-03-2018]
    - Added ``clientOptions`` to library interface
    
1.0.1.1 [09-02-2018]
    - Added ``requestTimeout`` to the web download file example

1.0.0.5 [13-12-2017]
    - Initial public release of HTTPClient library




