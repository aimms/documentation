Introduction
============

Data warehouses offer a central storage location for large-scale corporate data with the specific aim to enable smarter decision making through analytics workloads such as machine learning, deep learning or optimization. Contrary to regular transactional database applications that insert new, or modify existing, database records one at a time, analytics workloads typically require bulk data extracted from the data warehouse to operate on, and the solutions to business problems they produce similarly insert bulk data back into the data warehouse. 

Data warehouses support such workflows by offering their storage solutions with integrated compute capabilities, that can efficiently extract bulk data from, or insert bulk data into the data warehouse. For the data transfer with applications they typically use compact open-source data formats such as Parquet, AVRO or ORC.  

The Snowflake library follows this workflow and uses the Azure Data Lake Storage integrated with every AIMMS Cloud account as an intermediate storage area for the Parquet files shared between an AIMMS application and a Snowflake account.  

Adding the Snowflake library to your model
---------------------------------------------

The Snowflake component is provided in the form of a library `Snowflake` in the AIMMS Library Repository, which is accessible from within the Library Manager within your model. After selecting the :token:`Snowflake` library from the Library Manager, it will be downloaded from the AIMMS Library Repository, and added to your model.

To add the Snowflake library to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. Select `Snowflake` from the list to add the library to your model, or select a specific version to upgrade from a previous version you already installed before. 

This will download the Snowflake library from the library repository, cache it on your local machine and add a reference to it in your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

Configuring the Snowflake library
---------------------------------

In order to use the Snowflake library, you need to supply some configuration data necessary to access Snowflake. The Snowflake library reads its configuration from the file :token:`api-init/Snowflake.txt`, for which you can use the following template.

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

		sf::RSAPrivateKeyPath := "";
		sf::RSAAccountIdentifier := "";
		sf::RSAUser := "";
		sf::RSAPublicKeyFingerprint := "";

		sf::api::OAuth2APIClient := '';
		sf::api::APIServer := "";
		sf::api::RequestResponseFilePrefix := "##";
		sf::api::RequestTracing := 0;

		sf::SFRole := "";
		sf::SFWarehouse := "";
		sf::DBName := "";
		sf::DBSchema := "";
		sf::ExecutionTimeout := 0;

		dex::dls::StorageAccount := "";
		dex::dls::StorageAccessKey := "";
		dex::dls::ContainerSASQueryString := "";

		sf::StorageContainer := "";

If you're using an `external OAuth identity provider to access a Snowflake instance <https://docs.snowflake.com/en/user-guide/oauth-ext-overview>`_, then you need to add the OAuth data for the `Snowflake` API client to the configuration. Native Snowflake OAuth support is not supported by the Snowflake library. Snowflake provides extensive documentation how to set up external OAuth authorization for various identity providers. Understanding how to set this up successfully may require some level of understanding how these identity providers deal with authorizing APIs for client applications. 

Alternatively, if you're using `key-pair authentication to access a Snowflake instance <https://docs.snowflake.com/en/developer-guide/sql-api/authenticating#using-key-pair-authentication>`_, you need to provide the path to the file containing the private RSA key, the finger print of the public key, as well as the Snowflake account id and user you wish to authorize through the key-pair. In either case, the library will take care of adding the appropriate bearer token and authorization headers to your requests, to authorize it using your selected method. 

For accessing the Snowflake data warehouse, you need to specify your assigned role in Snowflake, the warehouse to use for executing your SQL statements, as well as the database name and schema in which the tables live you want to access. 

Finally, you need to configure the account information of the DLS storage account you wish to use as the intermediate storage area between you AIMMS application and your Snowflake data warehouse. If you're running the AIMMS application in the AIMMS cloud, then the account information for the integrated DLS account is already available in the AIMMS session, and you do not need to provide this. If you're testing from within the AIMMS IDE on your desktop, you do need to provide this information.

At least you should specify the container in the DLS account to be used for the intermediate storage of Parquet files. The Snowflake library assumes that the container you specify for this already exists inside your DLS account. 

Using the Snowflake library
---------------------------

The Snowflake provides three main methods:
- `sf::ExecuteStatement` to directly execute a SQL statement 
- `sf::GenerateAndLoadParquetIntoSFTable` to generate and insert data into a table your Snowflake data warehouse
- `sf::GenerateAndLoadParquetFromSFTable` to download and load the data into the model that is the result of a SQL query executed in the Snowflake data warehouse

Executing SQL statements
++++++++++++++++++++++++

With the `sf::ExecuteStatement` method, you can execute an SQL statement within the schema configured in your Snowflake configuration. This can be either a DDL or a DML statement, according to the syntax described in the `Snowflake SQL reference <https://docs.snowflake.com/en/sql-reference-commands>`_. By default, the Snowflake server will try to execute the statement synchronously for 45 seconds, you can override this by setting a `timeout` indicating how long you wish to wait for the statement to complete (at most 45 seconds). If the statement does not complete within the indicated timeout, then the function will return a statement handle, which can be queried for the execution status of the SQL statement.

If the statement has been executed successfully, the return code of the procedure will be 200, if the statement is still in progress, the procedure will return 202. In case of failure, the procedure will return a 400 or 500 status code.

If one or more SQL statements are still in progress, you can call the function `sf::WaitForSQLStatements`. This function will return 1 if all SQL execution requests marked as still in progress have completed within the given timeout, or 0 otherwise.

Uploading data to Snowflake
+++++++++++++++++++++++++++

To upload data to Snowflake you can use the function `sf::GenerateAndLoadParquetIntoSFTable`. 

Uploading data to Snowflake executes the following three steps:
- generate a Parquet file using the given mapping `mappingName`
- upload the generated Parquet file to intermediate storage in the Azure DLS storage that comes with the AIMMS cloud platform
- execute a SQL statement `sqlString` to insert the data into a Snowflake table `tableName` from the intermediate Parquet file stored in Azure DLS

The mapping `mappingName` can either be a hand-crafted mapping, or a mapping generated by the Data Exchange library from identifier annotations. In the latter case you can use the function `sf::GenerateTableCreateStatements` to obtain `CREATE TABLE` statements for Snowflake, that you can execute to create a matching table in the configured Snowflake schema. The generated `CREATE TABLE` statements are stored in the string parameter `sf::TableCreateStatement`.

When not specified through the optional `sqlString` argument, the function will execute the following SQL statement by default

	.. code::
	
		copy into __TABLE__ from __BLOB__ credentials=(azure_sas_token=__SASTOKEN__) file_format=(type = parquet) match_by_column_name=case_insensitive

The tokens `__TABLE__`, `__BLOB__` and `__SASTOKEN__` will be replaced by the `tableName` argument and URL of the intermediate Parquet file and an associated SAS token generated by the Snowflake library. Optionally, you can provide your own `sqlString` argument where you can specify a custom `copy into statement <https://docs.snowflake.com/en/sql-reference/sql/copy-into-table>`_, where `__TABLE__`, `__BLOB__` and `__SASTOKEN__` will be expanded as for the default statement. You can specify your own SQL statements, for instance, in case you want to add, for instance, an additional scenario column before inserting it in a Snowflake table.

The function will return any 200 status code of the execution of the SQL statement, or 0 in case of any failure. If the status is 201, you can call `sf::WaitForSQLStatements` to wait for the completion of the executed SQL statement as before.

Downloading data from Snowflake
+++++++++++++++++++++++++++++++

To download data from Snowflake you can use the function `sf::GenerateAndLoadParquetFromSFTable`. 

Uploading data to Snowflake executes the following three steps:
- execute a SQL statement `sqlString` to select data from a Snowflake table `tableName` into an intermediate Parquet file stored in the Azure DLS storage that comes with the AIMMS cloud platform
- downloaded the generated Parquet file from Azure DLS
- read the generated Parquet file using the given mapping `mappingName`

The mapping `mappingName` can either be a hand-crafted mapping, or a mapping generated by the Data Exchange library from identifier annotations. 

When not specified through the optional `sqlString` argument, the function will execute the following SQL statement by default

	.. code::
	
		copy into __BLOB__ from __TABLE__ credentials=(azure_sas_token=__SASTOKEN__) file_format=(type = parquet) header=true overwrite=true single=true max_file_size=1073741824

The tokens `__TABLE__`, `__BLOB__` and `__SASTOKEN__` will be replaced by the `tableName` argument and URL of the intermediate Parquet file and an associated SAS token generated by the Snowflake library. Optionally, you can provide your own `sqlString` argument where you can specify a custom `copy into statement <https://docs.snowflake.com/en/sql-reference/sql/copy-into-table>`_, where `__TABLE__`, `__BLOB__` and `__SASTOKEN__` will be expanded as for the default statement. 

The function will return any `2XX` status code of the execution of the SQL statement, or 0 in case of any failure. If the status is 201, you can call `sf::WaitForSQLStatements` to wait for the completion of the executed SQL statement as before.

.. spelling:word-list::

    htm