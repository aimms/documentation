CDM implementation details
**************************

In order to use CDM effectively, some knowledge of the internal working of CDM and its underlying database design may be useful. In this section we will, at a global level, describe the underlying principles on which CDM is implemented.

General CDM database structure
==============================

The general database structure of a CDM database consists of two parts

* a collection of generic CDM tables around which every CDM database is built
* a collection of app-specific tables holding the actual application data

Generic CDM database structure
------------------------------

When you create a CDM database for an AIMMS app for the first time, the CDM service will generic CDM database schema containing tables that define

* the defined categories and their contents in terms of AIMMS identifiers (:token:`cat` and :token:`catmap` tables)
* the authorization profiles and their underlying permissions (:token:`auth` and :token:`permission` tables)
* general key-value pairs used to identify the particular CDM database (:token:`kvtable` table)
* all branches and the ensuing tree of revisions (:token:`rev`, :token:`revbranchmap` and :token:`currentbranch` tables)
* the (versioned) table definitions related with all AIMMS identifiers stored in the particular CDM database (:token:`revdatadef` table)
* the mapping declaring for which identifiers data is stored in which revisions (:token:`revdatamap` table)

App-specific database structure
-------------------------------

Next to that, when you actually create the categories, the CDM service will create app-specific tables to store

* element names and their global CDM numbering for all root sets (:token:`ns_<setname>` tables)
* the actual version-specific root set membership changes and data changes for scalar multi-dimensional identifiers (:token:`data_<identifiername>_<version>` tables)

CDM element spaces
==================

Central to the working of CDM is how element spaces, or the element numbering of root sets in your model, is maintained in CDM. Root set element numbering is key to all data storage of multi-dimensional data, as every domain tuple will be stored in terms of  the central CDM root set element numbering.

Only a single *global* element namespace table will be created for every root set used in your CDM categories will be defined in the CDM database, and the element numbering defined in it will be used for all dependent data tables for all categories and on all branches. 

Notice that the element namespace tables do not define the actual membership of root set elements in their respective root sets. Root set membership is something that can change over time, and hence, for every root set, there is also a regular data table which holds the branch- and revision-specific set membership status for root set elements. Namespace tables are only used for maintaining the global and unalterable mapping from set element name to set element numbering.

Related to the global element space numbering, is the issue of renaming root set elements in CDM-managed apps, which is discussed in full detail `here <config.html#renaming-elements>`_

Multi-dimensional data in CDM
=============================

All version-specific data storage is arranged in CDM through data tables defined for every root set, subset, and scalar and multi-dimensional identifiers in any of your CDM categories. 

Dealing with structural changes
-------------------------------

Whenever CDM detects a structural change for the identifiers in your model, it will create a new version of the data table for that specific identifier. Any old version of data tables will remain intact, as to not disturb any data history that is stored in those tables. 

Use of central element numbering
--------------------------------

For any domain or set range of a set or multi-dimensional identifier, the CDM service will create columns holding the element numbers of, and using foreign keys into, the respective namespace tables of the root sets referenced in such columns. The use of element numbers instead of element names, allows for efficient indexing of the data tables, which is key for being able to run the queries retrieving the data contents at a particular revision in the revision tree in an efficient manner.

Storing version-specific change sets
------------------------------------

Whenever changing data for a CDM-managed identifier in your model, the CDM library will collect all individual data and membership changes for such identifiers, and set those to the CDM service. Subsequently, the CDM service will *add* these changes to the corresponding data tables, along with the revision number during which the changes were recorded. This means that the CDM database will only insert new data into any data table, and will *never* overwrite existing data. This property is the key element in storing the complete change history of all CDM-managed identifiers in your model.

Retrieving version-specific change sets
---------------------------------------

When checking out data at, or pulling changes for, a specific (set of) revisions in the CDM database, the CDM service will generate SQL queries that will efficiently retrieve a snapshot consisting of the latest changed values for all tuples over the range(s) of revisions that represent the entire requested checkout or pull. This snapshot is subsequently sent back to the CDM client requesting the snapshot, who will then integrate those changes in the currently held values for those identifier tuples. Potentially, when the local data set already holds changes compared to the latest retrieved data, this may lead the CDM library to have to perform a conflict resolution algorithm to reconcile any local changes with the remote changes being handled.

Dealing with inactive data
==========================

By default, :js:func:`cdm::CheckoutSnapshot` will not download inactive data, i.e., data for elements in root sets for which there is still historic parametric data, but which are not any longer part of the root sets at the selected revision. Downloading inactive data may result in data unexpectedly appearing again in identifiers when deleted set elements are re-added to the set again. This may also happen when the added set element is committed to the CDM database, and the data is checked out again. You can prevent this behavior when `more carefully deleting <config.html#deleting-elements>`_ the parametric data for elements to be deleted.

Filtering out inactive data
---------------------------

When checking out data, the CDM service will create temporary tables for all root sets involved in the checkout, representing the *current root set membership* at the revision being checked out. These temporary tables will be used to filter only active set elements for all domain and range sets of all other multi-dimensional data tables being retrieved. At the end of the checkout, all temporary tables created during the checkout will be deleted.

Shadow identifiers
==================

When adding CDM support to your model through the call to :token:`cdm::ConnectToApplicationDB`, the CDM library will various *shadow identifiers* for every identifier in your model managed through CDM. 

All shadow identifiers created by the CDM library are part of the :token:`CDMRuntime` library, which uses the :token:`cdmrt::` suffix. Within the :token:`CDMRuntime` libraries various types of shadow identifiers are created, all grouped by CDM category. The various types of shadow identifiers, defined in the runtime library, are

* :token:`CommittedIdentifiers` and :token:`CommittedRevisionIdentifiers` (:token:`cdmrt::ci::` and :token:`cdmrt::cri::` prefixes)
* :token:`DeltaOutIdentifiers` and :token:`DeltaOutRevisionIdentifiers` (:token:`cdmrt::doi::` and :token:`cdmrt::dori::` prefixes)
* :token:`DeltaInIdentifiers` and :token:`DeltaInRevisionIdentifiers` (:token:`cdmrt::dii::` and :token:`cdmrt::diri::` prefixes)
* :token:`ConflictResolutionIdentifiers` (:token:`cdmrt::cri::` prefix)
* :token:`ValueLogIdentifiers` and :token:`ValueLogDomainIdentifiers` (:token:`cdmrt::vli::` and :token:`cdmrt::vldi::` prefixes)

Shadow identifier domains and ranges
------------------------------------

Note that all shadow identifiers in the CDM runtime library are always defined over the root sets of the respective domain and/or range sets of the actual identifiers. That is, as long as the root sets hold the correct values, shadow identifiers will never be subject to any domain or subset conditions that the actual CDM-managed identifiers are subject to, allowing the shadow identifiers to already hold data values, when the actual identifiers would not currently allow such because the domain identifiers or subsets used in the domain and range of the actual identifiers do not hold the correct values yet.

The actual values
-----------------

The actual identifiers in the model hold the current values of the CDM-managed identifier. These values are either 

* obtained by checking out data or pulling changes from the CDM database, or
* entered or modified by the end-user of the session at hand. 

Committed values
----------------

The committed values and committed revisions identifiers hold the currently checked out or latest pulled in values of the corresponding identifier, as well as the revision during which this latest value was assigned. These identifiers are used by the CDM library to detect any local changes of the actual values stored in the model compared to the latest values retrieved from the CDM database.

Delta Out values
----------------

The delta out and delta out revision identifier are used by the CDM library to (temporarily) store the individual changes between the actual identifiers in your model, and the committed value identifiers. These stored changes are both used 

* when committing changes to the CDM database, as well as
* during the conflict resolution phase when pulling in changes and merging branches.

Delta In values
---------------

The delta in and delta in revision identifier are used by the CDM library when handling any incoming changes passed from the CDM service 

* during a checkout out, or  
* when pulling in changes after some other user committed a change set.

Because the domain and range sets of the delta in identifiers are always defined over root sets, they will already be able hold incoming values when the domain conditions on the actual identifiers would prevent the actual identifiers to hold the identical values. The only pre-condition here is that the corresponding root sets are already holding the correct values prior to handling all multi-dimensional data.

Conflict Resolution values
--------------------------

The conflict resolution identifiers are defined color parameters that are used by the `conflict resolution UI <dtd.html#merging-branches-and-resolving-conflicts>`_ to indicate particular tuples and values have conflicts in the conflict resolution page.

Value Log identifiers
---------------------

The value log and value log domain identifiers are used by the CDM library to hold the collection of historic values retrieved from the CDM database when calling the function :js:func:`cdm::GetValuesLog`. Compared to the actual identifiers all value log identifiers hold one extra dimension, namely the :token:`cdm::rev` index, to allow these identifiers to hold the values for several revisions, as requested in the call to :js:func:`cdm::GetValuesLog`. These identifiers are primarily intended to be used directly in the end-user UI to display the historic values of an actual value also displayed in the same end-user UI.

Data read sequence
==================

When checking out a revision or pulling changes, the CDM service and library will cooperate to handle the incoming data as follows.

* When handling a checkout or pull request, the CDM service will send one or more packets to the CDM client containing, for the range of revisions being served:

  * the element name-number mapping for all set elements being added 
  * the collection of multi-dimensional data values representing the latest state of the identifiers due to being changed
* Upon reception, the client will 

  * extend all root sets with all newly added elements, 
  * update the internal mapping of central CDM element numbering to local session element numbering
  * using this mapping, assign the collection of passed changes in multi-dimensional data to the corresponding *delta-in* shadow identifiers
* Assign all values of the *delta-in* identifiers to the *committed* identifiers
* If the actual identifiers in the model differ from the values stored in the *committed* shadow identifiers

  * store the changes between these two in the *delta-out* shadow identifiers
  * detect whether there are conflicts in the values stored in *delta-in* and *delta-out* identifiers
  * if so, apply the conflict resolution method identified by :token:`cdm::SelectedConflictResolutionMethod` to resolve the conflicts. This will lead to a *sub-collection* of the original tuples in the *delta-in-revision* identifiers still having a non-zero value, these tuples represent the tuples for which the conflict resolution method indicated that the remote change should prevail over the local change. If there was no data conflict, this will be true for all tuples passed from the CDM service.
* Finally, set all actual values to the value stored in the *delta-in* identifiers for all tuples for which the *delta-in-revision* identifier holds a non-zero value. 

As a result, the actual identifiers will still hold the local changes for all tuples where the conflict resolution method selected decided to let the local changes prevail over the remote changes.

Data read sequence when merging branches
========================================

When merging branches, a variation of the algorithm for the ordinary `read sequence <impl.html#data-read-sequence>`_ will be used:

* Determine the revision where the current branch of the given category split off from the selected branch to merge into the current branch
* Retrieve the values of that revision and store these in the *committed* shadow identifiers
* Store the values of the head revision of the current branch into the actual identifiers, without also updating the *committed* identifiers
* Retrieve the changes since the branch point until the head of the selected branch and store these in the *delta-in* identifiers
* Now check for conflicts as described above, and assign the remaining changes in *delta-in* to the actual identifiers
* Restore the *committed* identifiers to hold the values of the head of the current branch

The actual identifiers will now hold the values that are the result of merging both branches. When committing, the change set will hold all changes that are the result of the merge compared to the head of the current branch.