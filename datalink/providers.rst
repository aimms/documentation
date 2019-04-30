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

        https://techblog.aimms.com/2016/06/07/how-to-use-the-aimms-excel-library/


Reading and Writing
-------------------

Reading
    The first non-empty row is considered the header containing the names of the columns. 
    The content of all cells in this row is converted to a string and matched against the column names in the data map. If a match is found we have a valid column.

    Reading the data happens row by row and only those cells are read that are in valid columns. Empty rows are skipped and the whole sheet is read to the end.

Writing
    The header with the column names is written in column 1, starting at cell A1. Then al data is written row by row under the column names in header.


.. tip::

    Reading ignores all columns that are not valid, and so it is possible to use these columns for comments and other information that should not be read.


Limitations
-----------


Table Name
    Because of a limitation in the xls files, table names can not be longer than 31 characters.

Formula
    A cell can contain a formula and Excel will show the computed value. DataLink does not support formula and will see this as an error.




.. 
    Limitation in nmae
    The XLSProvider can be used for excel files with extension xls or xlsx. The file, or workbook in excel terminology, is the data source. Each worksheet in the file represents a table and the sheet's name is the table name. The first nonempty line in any tables is used to find the names of the columns. 
    Because of a limitation in the xls files, table names can not be longer than 31 characters.
    The XLSProvider does not use this and instead uses the names-of-columns formalism from DataLink. 






.. todo:: 

    So why using XLSProvider then ??
    

.. _LinkCSVProvider:

CSVProvider
===========

The CSVProvider can be used for Comma Separated Value (CVS) files with extension :token:`.csv`. These are normal text files in which a specific character calle the separator is used to split each line data into column elements. The default separator is the comma and in can be changed in specifying  :ref:`ReadWriteAttributes`.

Data source
    The directory containing the csv files. To specify the current directory

Table name    
    File name of the CSV file minus the extension :token:`.csv`.


The permissions of the file system determine the permission to read or write and trying to do so without the proper permission results in an error.



.. tip:: 
    In some languages the comma is used as decimal "period", so a more language independent separator would be the semi colon :token:`;`.


Reading and Writing
-------------------

bla

Limitations
-----------

DataTime
    The Calender format in AIMMS is send in an internal binary format to DataLink. The current CSVProvider cannot translate this into a string that is needed for the CSV format, so DateTime is not supported yet.

.. 
    separator
    width hegth
    data time
    directory (may also be period)



.. 
    A directory is the data source, and it can contain one or more csv files that represent the tables. The file names are the names of the tables. The first line in each file *must* contain the names of the columns.

.. 
    Because all values must be translated to a string in order to write a csv file column attributes can be controlled how many decimals of the numerical values are printed. The CSVProvider uses column attribute:

.. 
    * Width: This is an integer value that indicates how many characters are printed for the particular column.
    * Precision: This is an integer value that indicates with how many decimals floating punt numbers are written. 

.. 
    Note: The Calender format in AIMMS is send in an internal binary format to DataLink. The current CSVProvider cannot translate this into a string that is needed for the CSV format.

..  
    Provider cooperate with the datalink to import and export data to various types of data sources, such as Excel files, CSV files, ...

..  
    Setup
    =====

..  
    It is the responsibility of the provider to fetch the names of the columns from the data source and link it the the mapping of DataLink. Instead of calling the provider, we pass to DataLink the location of the provider, such that DataLink can ask for it itself. The provider has a public string parameter :token:`DataLink` that is automatically set when the library is loaded. Only this string parameter has to be passed as 'Provider' in the read-write attributes of the call to DataRead or DataWrite.

.. 
    Since there are many kinds of data sources they may have specific features and requirements that have to be set in attributes. It is possible that not all features are supported. The attributes are set by the table and column attribute arguments that are assigned to the data mapping. When the provider is connected in the DataRead or DataWrite call, they are passed on to the provider. The documentation of the specific provider should indicate which features can be set and how they can be used.
