Azure Data Lake Storage
***********************

Every AIMMS Cloud account is equipped with an Azure Data Lake Storage account. This storage account can be used for storing application data as, for instance, a collection of Parquet files. The use of Parquet files can serve as a faster replacement for storing application data in a database. Storing multiple scenarios of application data can be easily accomplished by storing each scenario as a separate collection of Parquet files in a separate directory in a Data Lake Storage file system. 

Many applications are able to deal with Parquet files, and as such they can serve as an ideal method for data integration with other applications. Data warehouses such as Databricks are built on top of the Parquet format, and Snowflake has integrated support for importing and exporting data through Parquet files. Tools such as PowerBI can directly access Azure Data Lake Storage and work with the data offered in Parquet files.

Because of the ease of use, easy capabilities for integration, performance and space efficiency every AIMMS Cloud account has been equipped with a Azure Data Lake Storage account. The Data Exchange library offers an easy-to-use collection of functions to create file systems within the account, and upload and download collections of files from within AIMMS.

File systems
------------

Within a single Azure Data Lake Storage account, multiple file systems can be created. These file systems can be mounted as an HDFS volume in platforms such as Apache Spark, or be directly connected to PowerBI for reporting. 

You can create file systems for multiple purposes, such as

- a storage area for the application data and/or scenario data used by the AIMMS application itself. Ideally, you would make such a file system readable and writable only to the AIMMS application itself.
- an import area where external applications can write datasets to be used by an AIMMS application. This area would need to be writable to external applications.
- an export area where the AIMMS application can write datasets to be used by external applications. This area would need to be readable to external applications.

Authorization
-------------

The easiest way to provide access to file systems within Azure Data Lake Storage is through `SAS tokens <https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview>`_. SAS tokens will allow you to set permissions for an entire storage account, for individual file systems, or even directories within Data Lake Storage file systems. The Data Exchange library will create SAS tokens for you, given an account name and access key. The DLS functions allow the use of multiple storage accounts at the same time, which you can add through the function ``dex::dls::AddAccountInfo``.

The Data Exchange library offers a number of functions to create SAS tokens to generate either Account or Service SAS tokens, with various permissions and lifetimes. As only Service SAS tokens allow limiting access to a single file system or directory within a file system, we advise to only distribute Service SAS tokens to setting up data integration with external applications.

In the AIMMS Cloud, the Data Exchange library will automatically extract the storage account name and access key of the Data Lake Storage account associated with your AIMMS Cloud account to create SAS tokens for an entire storage account or for a specific container in the storage account. These will be added for use with the DLS functions with the ``default`` account name.

When developing on your desktop, you can provide, via the file `api-init/Data_Lake_Storage.txt`, either 

- a (longer-lived) account SAS token or a service SAS token for a specific container through the string parameters `dex::dls::AccountSASQueryString` or `dex::dls::ContainerSASQueryString` (recommended), or 
- a storage account name and access key to any Data Lake Storage account through the string parameter `dex::dls::StorageAccount` and `dex::dls::StorageAccessKey` to allow the Data Exchange library to create these SAS tokens themselves. 

Managing file systems
---------------------

Once the authorization details of your Data Lake Storage account have been configured, the Data Exchange library offers a number of functions to create, delete and list all the file systems in your Data Lake Storage accounts. This will allow you to create one or more file systems for different purposes as described above.

Transferring files
------------------

Once you have a file system ready, the Data Exchange library offers a collection of functions to upload or download a single file, or the contents of an entire directory of files to/from a path within a file system within your Data Lake Storage account. 

Support for storing data of generated datasets in DLS as a collection of Parquet files
--------------------------------------------------------------------------------------

The Data Exchange library introduced the datasets generated from model annotations as a convenient way to store your application data in various row-based formats. Given the large amounts of data typically involved with optimization models, we prefer Parquet for storing application data, given its compact storage, fast reading and writing, and its wide usability because of its open source nature. To store and exchange application data in an easily shareable way, the DEX library provides an easy way to generate all data in a dataset as Parquet files and upload them to Azure Data Lake storage in a single call, and, conversely, download Parquet files from Azure Data Lake storage and read the data into the model.

For any given generated dataset in your model, you can call one of the functions

- `dex::dls::WriteDataSetByTable(dataset, instance)`
- `dex::dls::WriteDataSetByInstance(dataset, instance)`

to let the Data Exchange library generate a collection of Parquet files for an `instance` of the given dataset `dataset` from the current data in your model, and store them in the configured Azure Data Lake storage. These functions differ in the way they organize the data in Azure Data Lake storage. Both work from a container in the configured Azure Data Lake storage, pointed to by either `dex::dls::DatasetsByTable` or `dex::dls::DatasetsByInstance`, respectively. Inside this container, Parquet files are organized as follows:

- `<dataset>/<table>/<instance>.parquet`
- `<dataset>/<instance>/<table>.parquet`

Conversely, you can read back the data associated with an instance of a generated dataset through the functions

- `dex::dls::ReadDataSetByTable(dataset, instance)`
- `dex::dls::ReadDataSetByInstance(dataset, instance)`

You can use these functions to create a very easy-to-use storage scheme for your application data, which can also be used very easily to exchange data with other applications by providing them with a SAS token to your Azure Data Lake storage container.
