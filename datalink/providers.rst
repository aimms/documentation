Providers
*********

Provider cooperate with the datalink to import and export data to various types of data sources, such as Excel files, CSV files, ...

Setup
=====

It is the responsibility of the provider to fetch the names of the columns from the data source and link it the the mapping of DataLink. Instead of calling the provider, we pass to DataLink the location of the provider, such that DataLink can ask for it itself. The provider has a public string parameter :token:`DataLink` that is automatically set when the library is loaded. Only this string parameter has to be passed as 'Provider' in the read-write attributes of the call to DataRead or DataWrite.

Since there are many kinds of data sources they may have specific features and requirements that have to be set in attributes. It is possible that not all features are supported. The attributes are set by the table and column attribute arguments that are assigned to the data mapping. When the provider is connected in the DataRead or DataWrite call, they are passed on to the provider. The documentation of the specific provider should indicate which features can be set and how they can be used.

.. _LinkXLSProvider:

XLSProvider
===========

The XLSProvider can be used for excel files with extension xls or xlsx. The file, or workbook in excel terminology, is the data source. Each worksheet in the file represents a table and the sheet's name is the table name. The first nonempty line in any tables is used to find the names of the columns. 

Because of a limitation in the xls files, table names can not be longer than 31 characters.

Note: AIMMS also has an other library for dealing with excels files called AimmsXLLibrary. This can be used to address the content of a spreadsheet using spreadsheet's notation for cells using letter-number combinations. The XLSProvider does not use this and instead uses the names-of-columns formalism from DataLink. 

.. seealso::

    https://techblog.aimms.com/2016/06/07/how-to-use-the-aimms-excel-library/

.. todo:: 

    So why using XLSProvider then ??
    

.. _LinkCSVProvider:

CSVProvider
===========

The CSVProvider can be used for comma separated value files. These are normal text files in which on each line data is separated by a specific character like a comma. Typically the extension :token:`.csv` is used.

A directory is the data source, and it can contain one or more csv files that represent the tables. The file names are the names of the tables. The first line in each file *must* contain the names of the columns.

Because all values must be translated to a string in order to write a csv file column attributes can be controlled how many decimals of the numerical values are printed. The CSVProvider uses column attribute:

* Width: This is an integer value that indicates how many characters are printed for the particular column.
* Precision: This is an integer value that indicates with how many decimals floating punt numbers are written. 
 
Note: The Calender format in AIMMS is send in an internal binary format to DataLink. The current CSVProvider cannot translate this into a string that is needed for the CSV format.