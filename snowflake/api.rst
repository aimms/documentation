Snowflake API
================

.. js:function::  sf::ExecuteSQLStatement(stmt,timeout)

    Execute a SQL statement `stmt` in the configured schema of the configured Snowflake instance. By default, the function will wait for a maximum of 50 seconds for the execution of the statement to complete. If the execution is completed, the function will return a code of 200, if the execution is still in progress, the function will return 202. In case of any failure the function will return 0. If the execution is still in progress, you can call the function `sf::WaitForSQLStatements` to wait for any SQL statements still in progress.
    
    :param stmt: SQL statement to be executed (upto 64KB characters)
    :param timeout: time to wait for the statement execution to complete (default 50 seconds)

.. js:function::  sf::WaitForSQLStatements(timeout)

    Wait for `timeout` seconds for all outstanding SQL statements that are still in progress to complete. The function returns 1 if all statements have completed, or 0 otherwise.
        
    :param timeout: time in seconds to wait for all outstanding statements still in progress to complete
   
.. js:function::  sf::GenerateAndLoadParquetIntoSFTable(mappingName,tableName,timeout,sqlString)

    The function will generate an intermediate Parquet file using the DEX mapping `mappingName`, store the Parquet file in the Azure Data Lake Storage account that comes with every AIMMS cloud account, and insert the data contained in the table `tableName` in the configured schema of the Snowflake instance connected to. The default `sqlString` executed will assume that the table will just have all the fields contained in the Parquet file, but you can specify any Snowflake SQL statement to provide a customized insert statement. The function will wait `timeout` seconds for the execution of the SQL statement to complete. If the statement is still in progress on return (202 return code), you can call `sf::WaitForSQLStatements` to wait for the completion of the insert statement.
    
    :param mappingName: name of a DEX mapping used to generate a Parquet file to upload from the current model data
    :param tableName: name of the table in the configured Snowflake schema to insert the data in the generated Parquet file to
    :param timeout: time to wait for the Snowflake insert statement to complete (default 50 seconds)
    :param sqlString: optional string argument containing the SQL statement to execute.
   
.. js:function::  sf::GenerateAndLoadParquetFromSFTable(mappingName,tableName,timeout,sqlString,emptyIdentifiers,emptySets)

    The function will execute the `sqlString` statement to generate a Parquet file from Snowflake select statement. The default statement will generate a Parquet file from all fields in the Snowflake table `tableName`. The function will wait `timeout` seconds for the execution of the SQL statement to complete. If the statement is still in progress on return (202 return code), you can call `sf::WaitForSQLStatements` to wait for the completion of the insert statement. After the statement has completed, the data in the generated Parquet file will be read into the current model data using the DEX mapping `mappingName`.
    
    :param mappingName: name of a DEX mapping used to read the generated Parquet file into the current model data
    :param tableName: name of the table in the configured Snowflake schema the contents of which will be used to generate the intermediate Parquet file
    :param timeout: time to wait for the Snowflake select statement to complete (default 50 seconds)
    :param sqlString: optional string argument containing the SQL select statement to execute.
    :param emptyIdentifiers: optional 0/1 argument indicating whether all identifiers in the mapping should be emptied prior to reading the Parquet file
    :param emptySets: optional 0/1 argument indicating whether all sets used in the mapping should be emptied prior to reading the Parquet file
    
.. js:function::  sf::GenerateTableCreateStatements

    When you are using DEX model annotations to create the Parquet mapping, then you can use this function to generate a Snowflake create table statement that exactly matches the generated Parquet file mapping. The generated statements are stored in the string parameter `sf::TableCreateStatements`.
    
    
