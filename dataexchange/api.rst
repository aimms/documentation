The Data Exchange API
*********************

The following functions you can use within your model, are exposed by the Data Exchange library.

.. js:function::  dex::AddMapping(mappingName,mappingFile)

    Parses :token:`mappingFile` to create a mapping called :token:`mappingName`.
    
    :param mappingName: the name of the mapping to be created
    :param mappingFile: the relative path to the mapping file to be parsed.
    
.. js:function::  dex::ReadFromFile(dataFile,mappingName,emptyIdentifiers,emptySets,resetCounters)

    Reads data from file :token:`dataFile` into model identifiers using mapping :token:`mappingName`. Note that the identifiers used in the :token:`included-mapping` and :token:`write-filter` will not be emptied, regardless of the :token:`emptyIdentifiers` argument. When the mapping contains an the :token:`included-mapping` or the :token:`iterative-existing` attributes, emptying sets is likely to cause problems, unless the domain sets referred in these attributes are defined.
    
    :param dataFile: the relative path to the data file to be read
    :param mappingName: the name of the mapping to be used
    :param emptyIdentifiers: indicates whether all identifiers referred in the mapping should be emptied prior to reading the file
    :param emptySets: indicates whether all domain and range sets referred in the mapping should be emptied prior to reading the file
    :param resetCounters: indicates whether to reset all counters for :token:`iterative-binds-to` indices prior to reading the file

.. js:function::  dex::WriteToFile(dataFile,mappingName,pretty)

    Writes file :token:`dataFile` from data in model identifiers using mapping :token:`mappingName`.
    
    :param dataFile: the relative path to the data file to write to
    :param mappingName: the name of the mapping to be used for writing
    :param pretty: indicates whether to use a pretty writer (enhances readibility at the cost of bigger file size)


.. js:function::  dex::ReadAllMappings

    Read all mappings contained in the folder :token:`Mappings` and store all successfully read mappings in the set :token:`dex::Mappings`.
    
.. js:function::  dex::ReadAnnotations

    Read all :token:`dex::Dataset`, :token:`dex::TableName`, and :token:`dex::ColumnName` annotations specified in the model, and use these annotations to fill the identifiers 
    
    * :token:`dex::Datasets` 
    * :token:`dex::Tables`
    * :token:`dex::Columns`
    * :token:`dex::DatasetTableMapping`
    * :token:`dex::ColumnName`
    * :token:`dex::DatasetTableColumnName`
    * :token:`dex::DatasetTableColumnIndex`
    * :token:`dex::DatasetTableColumnIdentifier`
    
    When every table can needs to be included in just a single dataset, you can uniquely specify the dataset-table mapping using annotations only. If tables need to be included in multiple datasets, you can manually modify the identifier :token:`dex::DatasetTableMapping` to add any table to the datasets you wish to include them in. 
    
.. js:function::  dex::GenerateDatasetMappings

    Generate standardized table and Excel sheet mappings based on the :token:`dex::Dataset`, :token:`dex::TableName`, and :token:`dex::ColumnName` annotations. The generated mappings will be stored in the :token:`Mappings/Generated` subfolder of the project folder. All generated mappings will automatically be added to the set of available mappings, and can be directly used to read and write the standardized JSON, XML, CSV or Excel data sources based on the data exchange annotations.

    You can influence how mappings will be generated through:
    
    * :token:`dex::DatasetDenseMappings`: when a row will be written, determines wither all columns in that row will be written (default), or only the columns containing a non-default value
    * :token:`dex::DatasetXMLAttributeMappings`: determines whether the generated XML format will write all values as XML attribute values (default) or as element values. Indices will always be written as XML attributes.
    
    You can use the generated mappings directly with the functions :js:func:`dex::WriteToFile` and :js:func:`dex::ReadFromFile` as with any manually created mapping.