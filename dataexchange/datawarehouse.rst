Data warehouses
===============

Data warehouses offer a central storage location for large-scale corporate data with the specific aim to enable smarter decision making through analytics workloads such as machine learning, deep learning or optimization. Contrary to regular transactional database applications that insert new, or modify existing, database records one at a time, analytics workloads typically require bulk data extracted from the data warehouse to operate on, and the solutions to business problems they produce similarly insert bulk data back into the data warehouse. 

Data warehouses support such workflows by offering their storage solutions with integrated compute capabilities, that can efficiently extract bulk data from, or insert bulk data into the data warehouse. For the data transfer with applications they typically use compact open-source data formats such as Parquet, AVRO or ORC.  

The DEX library follows this workflow and uses the Azure Data Lake Storage integrated with every AIMMS Cloud account as an intermediate storage area for the Parquet files shared between an AIMMS application and various data warehouse implementations. 

Configuring the Snowflake data warehouse
----------------------------------------

In order to use the Snowflake data warehouse in DEX, you need to supply some configuration data necessary to access Snowflake. The Snowflake library reads its configuration from the file :token:`api-init/Snowflake.txt`, for which you can use the following template.

	 .. code::
	 
		dex::oauth::APIClients := data { Snowflake };
		dex::oauth::APIClientStringData('Snowflake',dex::oauth::apidata) := data { 
			authorizationEndpoint : "", 
			tokenEndpoint : "", 
			openIDEndpoint : "",
			clientId : "", 
			clientSecret : "", 
			scope: "offline_access"
		};

		dex::sf::RSAPrivateKeyPath := "";
		dex::sf::RSAAccountIdentifier := "";
		dex::sf::RSAUser := "";
		dex::sf::RSAPublicKeyFingerprint := "";

		dex::sf::api::OAuth2APIClient := '';
		dex::sf::api::APIServer := "";
		dex::sf::api::RequestResponseFilePrefix := "##";
		dex::sf::api::RequestTracing := 0;
		
		dex::sf::SFRole := "";
		dex::sf::SFWarehouse := "";
		dex::sf::DBName := "";
		dex::sf::DBSchema := "";
		dex::sf::StorageStage := "";
		dex::sf::ExecutionTimeout := 0;

		dex::sf::StorageContainer := "";

If you're using an `external OAuth identity provider to access a Snowflake instance <https://docs.snowflake.com/en/user-guide/oauth-ext-overview>`_, then you need to add the OAuth data for the `Snowflake` API client to the configuration. Native Snowflake OAuth support is not supported by the Snowflake library. Snowflake provides extensive documentation how to set up external OAuth authorization for various identity providers. Understanding how to set this up successfully may require some level of understanding how these identity providers deal with authorizing APIs for client applications. 

Alternatively, if you're using `key-pair authentication to access a Snowflake instance <https://docs.snowflake.com/en/developer-guide/sql-api/authenticating#using-key-pair-authentication>`_, you need to provide the path to the file containing the private RSA key, the finger print of the public key, as well as the Snowflake account id and user you wish to authorize through the key-pair. In either case, the library will take care of adding the appropriate bearer token and authorization headers to your requests, to authorize it using your selected method. 

For accessing the Snowflake data warehouse, you need to specify your assigned role in Snowflake, the warehouse to use for executing your SQL statements, as well as the database name and schema in which the tables live you want to access. By default the Snowflake library will communicate the direct Azure Blob Storage URLs in the SQL statement to Snowflake, but if you defined an external stage for this in your Snowflake schema, you can set ``sf::StorageStage`` to the name of the external stage you created, after which the Snowflake library will use this stage for all blob references.

Finally, you need to configure the account information of the DLS storage account you wish to use as the intermediate storage area between you AIMMS application and your Snowflake data warehouse. If you're running the AIMMS application in the AIMMS cloud, then the account information for the integrated DLS account is already available in the AIMMS session, and you do not need to provide this. If you're testing from within the AIMMS IDE on your desktop, you do need to provide this information.

At least you should specify the container in the DLS account to be used for the intermediate storage of Parquet files. The Snowflake functionality assumes that the container you specify for this already exists inside your DLS account. 

Using the Snowflake library
---------------------------

The Snowflake provides three main methods:
- `dex::sf::ExecuteStatement` to directly execute a SQL statement 
- `dex::sf::GenerateAndLoadParquetIntoTable` to generate and insert data into a table your Snowflake data warehouse
- `dex::sf::GenerateAndLoadParquetFromTable` to download and load the data into the model that is the result of a SQL query executed in the Snowflake data warehouse

Executing SQL statements
++++++++++++++++++++++++

With the `dex::sf::ExecuteStatement` method, you can execute an SQL statement within the schema configured in your Snowflake configuration. This can be either a DDL or a DML statement, according to the syntax described in the `Snowflake SQL reference <https://docs.snowflake.com/en/sql-reference-commands>`_. By default, the Snowflake server will try to execute the statement synchronously for 45 seconds, you can override this by setting a `timeout` indicating how long you wish to wait for the statement to complete (at most 45 seconds). If the statement does not complete within the indicated timeout, then the function will return a statement handle, which can be queried for the execution status of the SQL statement.

If the statement has been executed successfully, the return code of the procedure will be 200, if the statement is still in progress, the procedure will return 202. In case of failure, the procedure will return a 400 or 500 status code.

If one or more SQL statements are still in progress, you can call the function `dex::sf::WaitForSQLStatements`. This function will return 1 if all SQL execution requests marked as still in progress have completed within the given timeout, or 0 otherwise. You can call the function `dex::sf::StatementsAllExecutedSuccessfully` to check that all statements that have completed all executed successfully.

Uploading data to Snowflake
+++++++++++++++++++++++++++

To upload data to Snowflake you can use the function `sf::GenerateAndLoadParquetIntoTable`. 

Uploading data to Snowflake executes the following three steps:
- generate a Parquet file using the given mapping `mappingName`
- upload the generated Parquet file to intermediate storage in the Azure DLS storage that comes with the AIMMS cloud platform
- execute a SQL statement `sqlString` to insert the data into a Snowflake table `tableName` from the intermediate Parquet file stored in Azure DLS

The mapping `mappingName` can either be a hand-crafted mapping, or a mapping generated by the Data Exchange library from identifier annotations. In the latter case you can use the function `dex::sf::GenerateTableCreateStatements` to obtain `CREATE TABLE` statements for Snowflake, that you can execute to create a matching table in the configured Snowflake schema. The generated `CREATE TABLE` statements are stored in the string parameter `dex::sf::TableCreateStatement`.

When not specified through the optional `sqlString` argument, the function will execute the following SQL statement by default

	.. code::
	
		copy into __TABLE__ __COLUMNS__ from __QUERY__ __SETTINGS__

The tokens `__TABLE__`, `__COLUMNS__`, `__QUERY__` and `__SETTINGS__` will be replaced by the `tableName` argument and URL of, or a stage reference to, the `columns_` and `query_` arguments and a collection of settings set by the DEX library. 
The `query_` argument defaults to `__BLOB__`, which will be replaced by the SAS URL of the intermediate Parquet file, but you can replace it by a select statement from the data in the intermediate Parquet file. Optionally, you can provide your own `sqlString` argument where you can specify a custom `copy into table statement <https://docs.snowflake.com/en/sql-reference/sql/copy-into-table>`_, where `__TABLE__`, `__BLOB__`, `__COLUMNS__`, `__QUERY__` and `__SETTINGS__` will be expanded as for the default statement. You can specify your own SQL statements, for instance, in case you want to add, for instance, an additional scenario column before inserting it in a Snowflake table.

The function will return any 200 status code of the execution of the SQL statement, or 0 in case of any failure. If the status is 201, you can call `dex::sf::WaitForSQLStatements` to wait for the completion of the executed SQL statement as before.

Downloading data from Snowflake
+++++++++++++++++++++++++++++++

To download data from Snowflake you can use the function `dex::sf::GenerateAndLoadParquetFromTable`. 

Uploading data to Snowflake executes the following three steps:
- execute a SQL statement `sqlString` to select data from a Snowflake table `tableName` into an intermediate Parquet file stored in the Azure DLS storage that comes with the AIMMS cloud platform
- downloaded the generated Parquet file from Azure DLS
- read the generated Parquet file using the given mapping `mappingName`

The mapping `mappingName` can either be a hand-crafted mapping, or a mapping generated by the Data Exchange library from identifier annotations. 

When not specified through the optional `sqlString` argument, the function will execute the following SQL statement by default

	.. code::
	
		copy into __BLOB__ from __QUERY__ __SETTINGS__

The tokens `__QUERY__`, `__BLOB__` and `__SETTINGS__` will be replaced by the `tableName` argument and URL of the intermediate Parquet file and a collection of settings set by the Snowflake library. By default, `__QUERY__` will be expanded to `__TABLE__`, if you do not provide a select query to copy from yourself. Optionally, you can provide your own `sqlString` argument where you can specify a custom `copy into location statement <https://docs.snowflake.com/en/sql-reference/sql/copy-into-location>`_, where `__QUERY__`, `__TABLE__`, `__BLOB__` and `__SETTINGS__` will be expanded as for the default statement. 

The function will return any `2XX` status code of the execution of the SQL statement, or 0 in case of any failure. If the status is 201, you can call `dex::sf::WaitForSQLStatements` to wait for the completion of the executed SQL statement as before.

.. note::

	The default replacement text for `__SETTINGS__` is obtained from the string parameters ``dex::sf::DefaultSettingsR`` and ``dex::sf::DefaultSettingsW``. These settings also contain a token `__CREDENTIALS__` which will be substituted with the setting to pass a SAS token generated by the DEX library, or be left empty in case an external stage has been specified via ``dex::sf::StorageStage``. 

.. spelling:word-list::

    htm