DataExchange Library Release Notes
************************************

The first public release of the DataExchange library was version 1.0.0.18, release date July 10, 2020. 

New Features and Bug Fixes
--------------------------
1.1.0.25 [08-02-2021]
    - Introduce new RowOrientedObjectNode and ColumnOrientedObjectNode for JSON mappings, that are both faster and more compact. 
    - Introduce :token:`max-string-size` attribute to allow string parameters to hold strings of up to 8KB (default 1KB).
    - When mapping from/to JSON, the memory used for storing the JSON object in memory would not be returned to the system.
    
1.1.0.19 [17-08-2020]
    - The library could crash when writing to a workbook with a duplicate sheet name.

1.1.0.18 [12-08-2020]
    - The library could crash because of using a different version of the libxl.dll (used to actually read and write to Excel files) than the AimmsXLLibrary.

1.1.0.12 [06-10-2020]
    - Added support for reading from and writing to tables in sheets in Excel workbooks
    - Added support for automatically generating standard Data Exchange mappings from model annotations
    - Added new mapping attributes :token:`dense-children`, :token:`included-mapping` and :token:`value`.
    
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
