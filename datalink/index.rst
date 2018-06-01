DataLink Library
*****************

AIMMS DataLink is a library that allow different types of data sources to read and write data into AIMMS. Think about it as the USB socket on a computer that allows different devices to communicate with that computer. The data source is assumed to have a database like structure consisting of tables with columns. DataLink then makes it possible to specify a mapping between the names of these columns and the names of identifiers in the AIMMS model.

DataLink needs a second library, a so called provider, that is specific for the kind of data source. i.e. for using an Excel file the XLSProvider is needed. The provider does not have to be called by the user, instead the location of the code that actually read or writes to the data source has to be passed to DataLink. DataLink then calls this code to when the user calls :js:func:`DataRead` or :js:func:`DataWrite` function from DataLink.

.. toctree::

   config
   providers
   examples

