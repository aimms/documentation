Providers
*********

The provider is a library from the library repository that is responsible for translating the data source specific format into something that DataLink understands. In the AIMMS model DataLink functions are called and DataLink will use the provider to read and write in the particular format of the data source. So the provider cannot act on its own, it always needs DataLink. For installation see :ref:`LinkDataLinkInstallation`.

Providers are not used directly and so they can be used following the instruction via DataLink. Still, not all providers may behave the same. Because they all have to deal with the peculiarities of the specific format, not all features are guaranteed to work. Some providers may have some limitations. Also it may not be apparent directly how the source is translated to the schema of tables with column names. The extra information about specific providers are given below.


.. _LinkXLSProvider:

XLSProvider
===========

The XLSProvider can read and write Excel files:

XLS
    Files with extension :token:`xls` were used by Excel until 2007.

XLSX
    Files with extension :token:`xlsx` are based on Open Office XML format and are used by Excel since 2007.    


Each worksheet is considered a table and the name of the sheets are the table names. 

.. note::

    AIMMS also has an other library for dealing with excels files called AimmsXLLibrary. This can be used to address the content of a spreadsheet using spreadsheet's notation for cells using letter-number combinations. DataLink does not use those letter-number combinations except in some error messages.

    .. seealso::

        https://how-to.aimms.com/C_Developer/Sub_Connectivity/sub_excel_csv/index.html


Reading and Writing
-------------------

Reading
    The first non-empty row is considered the header containing the names of the columns. 
    The content of all cells in this row is converted to a string and matched against the column names in the data map. If a match is found we have a valid column.

    Reading the data happens row by row and only those cells are read that are in valid columns. Empty rows are skipped and the whole sheet is read to the end.

Writing
    The header with the column names is written in column 1, starting at cell A1. Then all data is written row by row under the column names in header.


.. tip::

    Reading ignores all columns that are not valid, and so it is possible to use these columns for comments and other information that should not be read.


Limitations
-----------


Table Name
    Because of a limitation in the xls files, table names can not be longer than 31 characters.

Formula
    A cell can contain a formula and Excel will show the computed value. DataLink does not support formula and will see these cells as an errors.



.. todo:: 

    So why using XLSProvider then ??
    

.. _LinkCSVProvider:

CSVProvider
===========

The CSVProvider can be used for Comma Separated Value (CVS) files with extension :token:`.csv`. These are normal text files in which a specific character call the separator is used to split each line data into column elements. The default separator is the comma and in can be changed in specifying  :ref:`ReadWriteAttributes`.

Data source
    The directory containing the csv files. To specify the current directory use a dot. 

Table name    
    File name of the CSV file minus the extension :token:`.csv`.


The permissions of the file system determine the permission to read or write and trying to do so without the proper permission results in an error.



.. tip:: 
    In some languages the comma is used as decimal "period", so a more language independent separator would be the semi colon :token:`;`.


Reading and Writing
-------------------

Reading
    The first row is considered to be the header. Then the file is read line by line, where each line is split into separate values using the separator. This means that strings do not have to be between quotes. If however the value contains the separator character then the values must be enclosed between quotes.

Writing
    All values are converted to strings and written line by line with the separator character between them. The result can be controlled using the :token:`Width` and :token:`Precision` column attributes (see :ref:`LinkAddClassicDataMap` or :ref:`LinkNewDataMap` about how to specify column attributes). The width is the number of characters of the value (so it forms the column width). The precision attribute is different for strings and numerical value:

    Strings:
        The precision defines the max number of characters. If the actual value has more characters it gets truncated.

    Numeric:
        The precision defines the number of decimals.



Limitations
-----------

DataTime
    The Calender format in AIMMS is send in an internal binary format to DataLink. The current CSVProvider cannot translate this into a string that is needed for the CSV format, so DateTime is not supported yet.

