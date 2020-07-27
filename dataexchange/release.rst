Release Notes
*************

The first public release of the DataExchange library was version 1.0.0.18, release date July 10, 2020. 

New Features and Bug Fixes
--------------------------
1.0.0.24 [27-07-2020]
    - Name attributes used at mapping locations where no name is needed for a child elemen are now warned against when reading a mapping
    - Name-regex attributes used at mapping locations where no name is needed for a child element now result in an error
    - Boolean values in a JSON file are now correctly mapped onto integer, double and string parameters. During a write the value will be output according to the AIMMS storage type.

1.0.0.22 [23-07-2020]
    - Changed name of :token:`dense-write` attribute to :token:`force-dense` to indicate that attribute is not only used during write.

1.0.0.21 [21-07-2020]
    - Upgraded internally used library because of performance issue
    
1.0.0.18 [10-07-2020]
    - Initial public release of the DataExchange library