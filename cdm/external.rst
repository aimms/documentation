.. _external_data

Dealing with external and derived data
======================================

As discussed in :ref:`data_intro` CDM is designed to manage multi-user data that is owned and managed by an AIMMS scenario planning application, and you should refrain of storing large-scale

- external data such as data imported in the app from e.g. external databases, APIs or ERP systems. Such external data typically is quite large and the app should typically use the latest version of such data. Maintaining multiple versions of such data is not the responsibility of the AIMMS application, but rather of the external system from which the data originates.
- derived data and optimization results that can be computed on the basis of the core data managed by the AIMMS scenario planning app and the external data sourced elsewhere. 

Both these types of data are typically quite sizeable, and directly using CDM to store many versions of such data in the CDM database will considerably slow down the retrieval of the core data owned and managed by the app itself, especially if the number of versions of this data grows over time. 

At the same time we realize that CDM offers a number of very convenient features that makes it very easy to write multi-user scenario planning applications, notably its capability to notify all users working independently on their own or shared scenarios of updates of data shared by all users. For that reason, we have introduced an extensions that allow you to efficiently and flexibly store external and derived data outside of CDM while retaining its capability to notify other users of updates to such data.

Different types of data
-----------------------

To support external and derived data in scenario planning apps, CDM distinguishes three types of data:

- `Managed` data, the core data in an AIMMS scenario planning app, which is stored completely in the CDM database and fully managed by CDM
- `ExternalSource` data, any data that is sourced or stored completely externally of CDM, e.g. in external databases, case or Parquet files stored in cloud storage, or in a datawarehouse, and *that should be immutable to the AIMMS scenario planning application*. This could be external data that cannot be changed inside the app, but also derived or output data that must not be changed once generated.
- `ManagedExternalSource` data, any data that is sourced or stored externally of CDM, but to which the user of the scenario planning application can still make changes to, which changes are then managed by CDM. One can think of master data, where the user can temporarily fix errors before it is fixed in new official version of the master data, or where missing master data that is necessary for the planning task at hand can be temporarily added to the collection of master data before it is added to the official master data. For `ManagedExternalSource` data, CDM will store any such changes to external data in CDM, while the main data will need to be imported thru a different means.

Specifying the CDM identifier mode
----------------------------------

For any identifier that is part of a CDM category, you can set its data mode through the ``cdm::CDMMode`` attribute, which can hold exactly one of the following values:
- `Managed` (default)
- `ExternalSource`
- `ManagedExternalSource`

Whenever a CDM category contains one or more `ExternalSource` or `ManagedExternalSource` identifiers, you need to specify an *external data read* procedure for that category. You need to specify an external data read procedure by assigning it the predefined identifier ``cdm::ExternalDataReadProcedure(cdm::cat)``. Any external data read procedure should be a procedure 
- without any arguments, and 
- returning 1 upon successfully reading external data, -1 when no changes are made to the external data, or 0 in case of an error when reading external data.

The idea behind external data read procedures is that the category does not contain the external data itself, but rather a reference to the `location` where the external data can be retrieved, e.g.
- a container name or URL in cloud storage where the a case file or a collection of Parquet files containing the external data can be found, or 
- a unique scenario name that you can use to retrieve the external data from a database or data warehouse.

To assign external data read procedures, the set ``cdm::Categories`` should be filled prior to assigning the external read procudures. We therefore suggest that you use the following sequence to initialize it:

.. aimms::
	cdm::ProcessAnnotations;
	
	cdm::ExternalDataReadProcedure(cdm::cat) := data {
		'MasterData' : 'ReadMasterData', 
		...
	};

Checking out a category with external data
------------------------------------------

When you checkout a category with external data, CDM will
- first checkout all the `Managed` identifiers into the model, among which could be an identifier holding the unique references to the location of the external data
- then call the external data read procedure that you specified, and in which you can use the reference to the external data to use e.g. the DEX library to read the contents of all `ExternalSource` and `ManagedExternalSource` identifiers in your model,
- upon success will store the current content of all `ManagedExternalSource` identifiers in the committed shadow identifiers, and 
- finally will make sure that any overrides present in the CDM database will be applied to the `ManagedExternalSource` identifiers.

Committing changes and additions to `ManagedExternalSource` identifiers
-----------------------------------------------------------------------

When you make changes to `ManagedExternalSource` identifiers in your application, upon commit, CDM will create a minimal change set containing all the changed data, and create CDM label numbers for only those set elements that are involved in the changes and for which no CDM label numbers are available yet. CDM will never create CDM label numbers for elements in your `ManagedExternalSource` data that are not used in the change set, thus minimizing the amount of changes stored in the CDM database. 

Updating the `ExternalSource` and `ManagedExternalSource` data
--------------------------------------------------------------

Updates to external source data are typically implemented thru, for instance, by
- running a daily (or hourly) task that retrieve a new version of data from external systems or APIs and store these as a single AIMMS case file, or a collection of Parquet files in a container in cloud storage, 
- offloading a compute-heavy computation of derived data (such as a forecast) that can be used by all user sessions, to a task that will store the result as a AIMMS case file or collection of Parquet files in cloud storage, or
- storing the solution of a solver session or optimization task for a particular scenario in a case file, or a collection of Parquet files if the solution also needs to be shared with other applications.
 
After storing the external data, the task or solver session can just update the new location to a dedicated `Managed` identifier in the same category and commit this to CDM, after which all other sessions will be notified of the new version of the external source data and can load these into their own session data. 

Resetting `ManagedExternalSource` data
--------------------------------------

When new managed external source data is read, some of the overrides applied to it and stored in CDM may become superfluous. For instance, because the errors in master data that are temporarily overridden by temporary fixes managed thru CDM, have been fixed in the official external master data. In such cases, you can undo the overrides, by calling the function :js:func:`cdm::ResetToBase` on any *individual* identifier value you want to reset. CDM does not provide does any mechanism to discover which values have been fixed in the external source data, but leaves the discovery of such fixes up that need to be reset to the base value to the application. Only when you commit the data that has been reset to base, CDM will call the external read procedure to retrieve the external values that needs to be restored.

Determining whether or not to read external data
------------------------------------------------

When checking out, pulling changes or locally committing data after a commit to the CDM database, your external data read procedure will be called for a category with managed external source identifiers. In this procedure you must determine whether or not it is necessary to read the external data based on the values of one or more managed identifiers in the category. One such identifier should hold the reference to the data to be read, and normally detecting a change in the reference could be a sufficient trigger to actually read the external data. 

However, when external data is reset to its base value, the external data should be re-read even if the reference is not changed. One approach to accomplish this is to also store the value of an ever-increasing counter in the category, and read the data if the previous value of the counter is unequal to the value of the counter at the time of calling of the external data read procedure.
 