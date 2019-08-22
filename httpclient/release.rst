Release Notes
*************

The first public release of HTTPClient was version 1.0.0.3, release date December 13, 2017. 


New Features and Bug Fixes
--------------------------
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




