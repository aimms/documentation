Release Notes
*************

The first public release of DataLink was version 1.0.0.106, release date January 16, 2018. 

New Features and Bug Fixes
--------------------------
1.1.1.2 [14-05-2019]
    - Added support for release notes

1.1.1.1 [01-04-2019]
    - Adapted DataLink for RLink 1.1

1.1.0.4 [06-03-2019]
    - Support for new data map with possibility of column-header transformations
    - Added support for Unicode paths in provider names

1.0.1.125 [11-02-2019]
    - Matched version of ``libxl`` being used to that used in AimmsXLLibrary to prevent errors when using both libraries
    - Fixed an error where data of element parameters was not read correctly
    - Fixed an error where empty cells in an Excel spreadsheet lead to copying last read value
    - Incorrect mapping could lead to datalink crash
    - DataLink could crash on an Excel sheet with row headers but no actual data

1.0.0.106 [16-01-2018]
    - Initial public release of the DataLink library