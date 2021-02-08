Standard Data Exchange format
*****************************

The Data Exchange library allows you to flexibly map any JSON, XML format, and CSV or Excel sheet onto appropriate identifiers in your AIMMS model. Although not difficult, creating such mappings may considerable time to create. In this section we will describe how to create *standard Data Exchange formats* for JSON, XML, CSV and Excel based on the identifiers in your model, just by specifying which identifiers to take together in a single table through annotations specific to the Data Exchange library.

To introduce the concepts behind these standardized Data Exchange formats offered by the Data Exchange library, we'll describe a generic pattern used by many customers to set up application databases with their models, which we will use as a base for constructing the standardized formats.

Commonly used principles in setting up application databases
============================================================

Application databases for AIMMS models, typically group identifiers with an identical domain into a single relational table, with a separate column in the primary key of the table for each index in the shared index domain and a non-primary column for every multi-dimensional identifier. To allow for storing multiple datasets/scenarios in such a table, typically an additional *dataset/scenario* key is added to the primary key of the table. Typically, the dataset/scenario key is shared among multiple tables. 

When exchanging data with such an application database, typically, the data for an dataset/scenario is read from, or written to, the tables holding the data for these datasets/scenarios *in its entirety*. Replacing the data of individual rows or columns within a dataset/scenario, may lead to consistency problems with application instances that have already read the data in the dataset/scenario prior to updating individual rows/columns. Thus, even when only some data is changed, creating a complete new dataset seems a much easier and safer approach, especially as it is fairly easy to clean up old and, potentially, replaced datasets. In case updating individual rows and columns is essential, the use of `CDM <../cdm/index.html>`_ seems to be the more appropriate solution to make sure that data between multiple sessions is properly synced.

Design principles of standard Data Exchange format
==================================================

Thus, we arrive a common and generic framework that will allow to exchange almost any data with an AIMMS model:

* *datasets* to organize a number of tables holding data describing a particular functional aspect of an application
* *tables* to hold the data of one or more instances of datasets for a number of AIMMS identifiers with an identical domain, where the *columns* either hold the dataset instance, and the indices and values of the identifiers represented in the table.

Once all potential tables and datasets have been specified, it is fairly easy to generate Data Exchange mappings to read or write JSON, XML, CSV or Excel files that contain the data of single tables, all tables in a single datasets, or all data associated with all datasets. 

Example
-------

The following JSON data contains the data of an instance of two datasets, each containing two tables.

.. code-block:: json

    {
      "dataSets": {
        "DataSet1": {
          "instance" : "data of 07-09-2020"
          "tables": {
            "Table1": [
              { "i":"i1", "j":1, "pn": 10.0, "ps": "a value"},
              { "i":"i1", "j":2, "pn": 20.1, "ps": "another value"}
            ],
            "Table2": [
              { "i":"i1", "j":1, "k":3, "qn": 10.0, "qs": "a value"},
              { "i":"i1", "j":2, "k":4, "qn": 20.1, "qs": "another value"}
            ]
          }
        },
        "DataSet2": {
          "instance" : "data of 07-09-2020"
          "tables": {
            "Table3": [
              { "i":"i1", "rn": 10.0, "rs": "a value"},
              { "i":"i2", "rn": 20.1, "rs": "another value"}
            ],
            "Table4": [
              { "i":"i1", "k":3, "sn": 10.0, "ss": "a value"},
              { "i":"i1", "k":4, "sn": 20.1, "ss": "another value"}
            ]
          }
        }
      }
    }
    
Uses of the standard Data Exchange format
=========================================

The standard Data Exchange format discussed above is flexible enough to support a range of scenarios for integrating an AIMMS model into the wider IT landscape:

* The format allows a standardized approach from calling external APIs from within an AIMMS model using the `HTTP Client library <../htppclient/index.html>`_. When calling web services to call Python or R scripts, e.g., to apply ML/AI algorithms to data passed from the model, or to retrieve results from applying ML/AI algorithms to external data retrieved from these scripts, the format can be easily read into, or generated from, Pandas in Python or dataframes in R. 
* The format would be the natural candidate to call AIMMS models through a REST API, as it can be readily generated from any environment.
* Based on the concepts of datasets and tables, it easy to generate an application database from the model annotations, and to create a web service that allows data exchange with such an application database using the standard format.

Generating the mapping files from annotations
=============================================

To create the mapping between multi-dimensional identifiers and datasets, tables and column names, you can use the following model annotations:

* :token:`dex::Dataset`
* :token:`dex::TableName`
* :token:`dex::ColumnName`

Through the :token:`dex::TableName` annotation you can indicate for multi-dimensional identifiers and/or sections of multi-dimensional identifiers, to which table they should belong. The Data Exchange library will verify that all identifiers share a common index domain, and return an error if this is not the case. You can use the :token:`dex::ColumnName` annotation to indicate a columnname for multi-dimensional identifiers and indices. If you don't specify an explicit column name, the Data Exchange library will use the identifier name as the implicit column name. Instead of using annotations, you can also directly set the column name for specific identifiers via the identifier :token:`dex::ColumnName`.

By assigning the :token:`dex::Dataset` annotation to specific identifiers or sections of identifiers, the Data Exchange library will deduce the mapping between datasets and tables. Typically one would assign the :token:`dex::TableName` and :token:`dex::Dataset` to sections of identifiers with identical domains. If any identifier is both mapped to a table and a dataset, the combination will be assigned to :token:`dex::DatasetTableMapping`. Instead of using the :token:`dex::Dataset` annotation, you can also assign 1 to specific combinations of tables and datasets in the identifier :token:`dex::DatasetTableMapping` directly. 

You can generate the mappings based on the above annotations and/or the manually assigned values to the identifiers :token:`dex::ColumnName` and :token:`dex::DatasetTableMapping`, by calling the procedure :js:func:`dex::GenerateDatasetMappings`.
This will generate Data Exchange mappings in the subfolder :token:`Mappings/Generated` in the main project folder. The following mappings will become available for every :token:`<dataset>`  and :token:`<table>`:

.. csv-table:: 
   :header: "Mapping", "Description"
   :widths: 100, 1000
   
    :token:`JSONDataset`, all tables for all datasets in a single JSON file
    :token:`XMLDataset`, all tables for all datasets in a single XML file
    :token:`Generated/<dataset>-Excel`, all tables for dataset :token:`<dataset>` in a single Excel file (one sheet per table)
    :token:`Generated/<dataset>-<table>-JSON-Sparse`, table :token:`<table>` in dataset :token:`<dataset>` in a single sparse JSON file (only non-default data)
    :token:`Generated/<dataset>-<table>-JSON-Dense`, table :token:`<table>` in dataset :token:`<dataset>` in a single dense JSON file (also default data)
    :token:`Generated/<dataset>-<table>-JSON-RowOriented`, table :token:`<table>` in dataset :token:`<dataset>` in a single row-oriented JSON file (array of row arrays)
    :token:`Generated/<dataset>-<table>-JSON-ColumnOriented`, table :token:`<table>` in dataset :token:`<dataset>` in a single column-oriented JSON file (array of column arrays)
    :token:`Generated/<dataset>-<table>-XML-Sparse`, table :token:`<table>` in dataset :token:`<dataset>` in a single sparse XML file (indices as attributes; values as elements; only non-default data)
    :token:`Generated/<dataset>-<table>-XML-SparseAttribute`, table :token:`<table>` in dataset :token:`<dataset>` in a single sparse XML file (indices and values as elements; only non-default data)
    :token:`Generated/<dataset>-<table>-XML-Dense`, table :token:`<table>` in dataset :token:`<dataset>` in a single dense XML file (indices as attributes; values as elements; also default data)
    :token:`Generated/<dataset>-<table>-XML-DenseAttribute`, table :token:`<table>` in dataset :token:`<dataset>` in a single dense XML file (indices and values as elements; also default data)
    :token:`Generated/<dataset>-<table>-CSV`, table :token:`<table>` in dataset :token:`<dataset>` in a single CSV file


