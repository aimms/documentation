The Data Exchange API
*********************

.. js:function::  dex::AddMapping(mappingName,mappingFile)

    Parses :token:`mappingFile` to create a mapping called :token:`mappingName`.
    
    :param mappingName: the name of the mapping to be created
    :param mappingFile: the relative path to the mapping file to be parsed.
    
.. js:function::  dex::ReadFromFile(dataFile,mappingName,emptyIdentifiers,resetCounters)

    Reads data from file :token:`dataFile` into model identifiers using mapping :token:`mappingName`.
    
    :param dataFile: the relative path to the data file to be read
    :param mappingName: the name of the mapping to be used
    :param emptyIdentifiers: indicates whether all identifiers referred in the mapping should be emptied prior to reading the file
    :param resetCounters: indicates whether to reset all counters for :token:`iterative-binds-to` indices prior to reading the file

.. js:function::  dex::WriteToFile(dataFile,mappingName,pretty)

    Writes file :token:`dataFile` from data in model identifiers using mapping :token:`mappingName`.
    
    :param dataFile: the relative path to the data file to write to
    :param mappingName: the name of the mapping to be used for writing
    :param pretty: indicates whether to use a pretty writer (enhances readibility at the cost of bigger file size)


.. js:function::  dex::ReadAllMappings

    Read all mappings contained in the folder :token:`Mappings` and store all successfully read mappings in the set :token:`dex::Mappings`.