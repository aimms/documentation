DataLink Library
*****************


.. 
    Motivation, why do we want data link


Data comes in many different flavors and each piece of software defines its own particular format tailored to its own particular need. If we have data stored in such format and we want to use it in an AIMMS model, we somehow need to import this.
We could create custom importers for all flavors but that would be infeasible.

Furthermore there is a catch when using custom importers (and also exporters). In order to access the external data, somehow you have to ask for the data in the source in the language of that particular format. In the Aimms model parts will be  very specific not just for the format, but also for the data source itself. So even changing the data source may require the model to be modified.

 


DataLink is created with the idea that if we define a broad family of data sources we can make a more general importer/exported for data. 



This reduces the amount of code that has to be written, and makes it possible to present users with a more uniform approach to deal with many of these "different" sources.

DataLink is made for data sources that are organized as a collection of tables, consisting of named columns. Examples of such sources include relational databases, excel files, or directories containing CSV files.  

+----------------------------------------+
|    " *Use the Source, Luke!* "         |
|    -- :strike:`Yoda` DataLink          |
+----------------------------------------+

.. 
    An excel file, where the spreadsheets are arranged that the form columns A directory containing CSV (Comma SeParated Values) file A relational database Dataframes in a scripting language


.. 
    AIMMS DataLink is a library that allow different types of data sources to read and write data into AIMMS. Think about it as the USB socket on a computer that allows different devices to communicate with that computer. The data source is assumed to have a database like structure consisting of tables with columns. DataLink then makes it possible to specify a mapping between the names of these columns and the names of identifiers in the AIMMS model.

.. 
    DataLink needs a second library, a so called provider, that is specific for the kind of data source. i.e. for using an Excel file the XLSProvider is needed. The provider does not have to be called by the user, instead the location of the code that actually read or writes to the data source has to be passed to DataLink. DataLink then calls this code to when the user calls :js:func:`DataRead` or :js:func:`DataWrite` function from DataLink.





.. toctree::

   whatisdatalink
   datamap
   readandwrite
   getschema
   automation
   providers
   practicaltips
   examples
   version
