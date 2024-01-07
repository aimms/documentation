Introduction
============

Data warehouses offer a central storage location for large-scale coorporate data with the specific aim to enable smarter decision making through analytics workloads such as machine learning, deep learning or optimization. Contrary to regular transactional database applications that insert new, or modify existing, database records one at a time, analytics workloads typically require bulk data extracted from the data warehouse to operate on, and the solutions to business problems they produce similarly insert bulk data back into the data warehouse. 

Data warehouses support such workflows by offering their storage solutions with integrated compute capabilities, that can efficiently extract bulk data from, or insert bulk data into the data warehouse. For the data transfer with applications they typically use compact open-source data formats such as Parquet, AVRO or ORC.  

The Snowflake library follows this workflow and uses the Azure Data Lake Storage integrated with every AIMMS Cloud account as an intermediate storage area for the Parquet files shared between an AIMMS application and a Snowflake account.  

Adding the Snowflake library to your model
---------------------------------------------

The Snowflake component is provided in the form of a library `Snowflake` in the AIMMS Library Repository, which is accessible from within the Library Manager within your model. After selecting the :token:`Snowflake` library from the Library Manager, it will be downloaded from the AIMMS Library Repository, and added to your model.

To add the Snowflake library to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. Select `Snowflake` from the list to add the library to your model, or select a specific version to upgrade from a previous version you already installed before. 

This will download the Snowflake library from the library repository, cache it on your local machine and add a reference to it in your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

Configuring the Snowflake library
---------------------------------

In order to use the Snowflake library, you need to supply some configuration data necessary to access Snowflake. The Snowflake library reads its configuration from the file token:`api-init/Snowflake.txt`, for which you can use the following template.

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

If you're using an `external OAuth identity provider to access a Snowflake instance <https://docs.snowflake.com/en/user-guide/oauth-ext-overview>`, then you need to add the OAuth data for the `Snowflake` API client to the configuration. Native Snowflake OAuth support is not supported by the Snowflake library. Snowflake provides extensive documentation how to set up external OAuth authorization for various identity providers. Understanding how to set this up successfully may require some level of understanding how these identity providers deal with authorizing APIs for client applications. 

Alternatively, if you're using `key-pair authentication to access a Snowflake instance <https://docs.snowflake.com/en/developer-guide/sql-api/authenticating#using-key-pair-authentication>`, you need to provide the path to the file containing the private RSA key, the finger print of the public key, as well as the Snowflake account id and user you wish to authorize through the key-pair. In either case, the library will take care of adding the appropriate bearer token and authorization headers to your requests, to authorize it using your selected method. 

For accessing the Snowflake data warehouse, you need to specifiy your assigned role in Snowflake, the warehouse to use for executing your SQL statements, as well as the database name and schema in which the tables live you want to access. 

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

With the `sf::ExecuteStatement` method, you can execute an SQL statement in the schema configured in your Snowflake configuration. This can be either a DDL or a DML statement, according to the syntax described in the `Snowflake SQL reference <https://docs.snowflake.com/en/sql-reference-commands>`. By default, the Snowflake server will try to execute the statement synchronously for 45 seconds, you can override this by setting a `timeout` indicating how long you wish to wait for the statement to complete (at most 45 seconds). If the statement does not complete within the indicated timeout, then the function will return a statement handle, which can be queried for the execution status of the SQL statement.

.. spelling:word-list::

    htm