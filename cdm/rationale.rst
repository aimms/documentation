Introduction
************

In this section we will describe the aspects that make multi-user support for scenario planning applications different from most other database applications.


Characteristics of multi-user scenario planning applications
============================================================

You may wonder what actually makes a scenario planning application different from any other database application. Typically, a user of a regular database application changes the data in the database by modifying data in a sequence of one or more forms in the user interface of the database application. The ensuing changes are then validated and committed back to the database in a single transaction. The data shown in the forms can usually be directly related to particular rows in a one or more tables of the database, which are read before displaying the form, and written back to the database upon closing the form, in a single transaction.

Scenario planning applications typically involve some form of computation to compute output data from input data, and are characterized by providing an end-user with the capability to *play* with the underlying data of the application to get a feel for the sensitivities of the outputs with regards to changes made to the inputs. In AIMMS, this capability is implemented by loading *all* of the relevant application data into the app, from whatever sources this data is coming. As a result, an end-user can make changes to any input data and observe the results on the output data, without prematurely bothering any other user with such changes. Only when the end-user is satisfied with the result, should the changes in the input data be written back to the database to be shared with other users.

The problem with this approach, compared to a regular database application, is that the relation of the data in the application with particular records in the database changes from tracking just a *local* set of data used in a form, to tracking changes in the *global* collection of data of the entire application. For instance, when the application includes an optimization model, any change to input data may lead to infeasibilities of the optimization model, which may need further adaptations to data in various other areas of the application for the model to become feasible again. In order to share such a collection of changes efficiently with other users, the application must be able to track changes throughout the application data individually, and know exactly which corresponding database records to update.

Internally, the data structures employed by AIMMS to store all application data provide no possibility to track changes. The CDM library adds this capability by introducing shadow identifiers for all identifiers in the model to be tracked, and moreover, automatically generates an application database to stores these changes.

Different types of scenario planning applications
=================================================

We usually distinguish three different types of scenario planning applications, operational, tactical and strategic. For each of these types, the multi-user requirements are somewhat different.

* For *operational* applications, as far as data is concerned, there is typically only a single version of the truth, namely the current operational data. The key multi-user feature here is to make changes by any user visible to all other users of the application with the least amount of delay possible. Typically, such changes do not involve optimization, or otherwise just local optimization models involving only the data that's being changed by the user at hand. A transaction would entail the user's manual changes, potentially together with further changes that are the result of a local optimization. Application-wide optimization runs involving all data of the application are typically run in a different mode on a snapshot of all the available data at a particular point in time.

* For *tactical* supply chain applications where optimization is used to compute optimal periodical plans, multiple planners may create multiple scenarios based off the plan of the current period in order to determine the proper parameters for their area of responsibility for the plan of the next period. In this case, the scenarios contain the relevant transactional information and are the result of multiple experiments with the planning model. The overall planning for the next period is composed by merging the inputs of the final scenarios of all planners, and resolving the problems that arise from merging their individual inputs.

* For *strategic* applications, decision makers typically make changes to the input data and verify the result of the strategic model, and repeat changes to the data until the results of the model are satisfactory. A transaction would entail the entirety of changes necessary to lead to a satisfactory result.

Comparison to version control systems
=====================================

In fact, the way changes need to be tracked in scenario planning applications is more reminiscent of *version control systems* used by software developers than it is of database applications. 

* When developing an application, developers may have to make changes to multiple source files before getting to a next working version of the application, where a change in a single source file may cause changes in a lot of other source files, for instance because of a change to an interface. A version control system will track the individual changes in all of these source files, and allows the developer to commit them to a repository in a single commit. 

* If developers want to implement a new feature, they usually do this on a feature branch, which will be merged back into the main branch upon completion of the feature. At that time, the sources on the main branch may have changed compared to the location where the feature branch originated, and might need the developer to resolve the ensuing conflicts when merging back the feature branch.

AIMMS CDM as a version control system
=====================================

Because of these similarities, AIMMS CDM actually implements a *version control* system on the set and multi-dimensional data contained in an AIMMS model. It consists of

* the  *CDM service* that hosts the application-specific data repository in a relational database.
* a *model library* that implements the client-side version control functionality, such as tracking the individual changes in the actual data in the AIMMS app compared to a given revision of the data in the repository, and interfaces with the CDM service to implement all common version control actions such as

  * checking out a revision of the data
  * committing changes to the data repository
  * pulling changes of revisions that are not yet merged into the current data of the model
  * rolling back changes
  * cherry-picking data changes from particular revisions into the current data of the model
  * creating branches
  * merging data changes from one branch into another branch
  * resolving conflicts that may occur when when pulling changes or merging branches

In addition to version control, AIMMS CDM offers users *live collaboration* capabilities by 

* allowing any changes to the data to be automatically committed as soon as they occur
* notifying all users connected to the CDM service of any commit made to the repository, in order to allow them to automatically pull the changes of these commits into their current data.

.. _data_intro

What data to manage using AIMMS CDM
===================================

Data of an AIMMS model can come from various sources such as 

* ERP systems
* corporate databases
* Excel sheets,
* ...

Many users starting with AIMMS CDM in their AIMMS apps are uncertain which data in their model to manage using CDM. As a rule of thumb, you should consider the data that is actually owned by the AIMMS app, that is, that data for which the AIMMS app is the authoritative application for changing that data. So, do not manage historical data obtained from an ERP system through CDM as well, as the ERP system is the authoritative source. However, if corrections to the historical data are not to be stored in the ERP system, the AIMMS app could be the authoritative source for such corrections, and you could use CDM as the storage engine. 

The same is true for the core planning data that users change through the app itself, and for which the AIMMS app serves as the authoritative source for other applications. Other applications wanting to use to the data managed by AIMMS planning apps, will typically will want to work with approved snapshots of the versioned data managed by CDM. Such snapshots can be made available through regular databases.

For the outputs and other derived data of an AIMMS apps, the situation is a bit more diffuse. Typically, the derived data such as outputs or intermediate data derived from base app data can be recomputed given a certain revision of the inputs, and there is no value in tracking the individual changes to individual users for all time, which is what CDM basically offers. Such outputs can be stored in a variety of ways that are more suitable, e.g. in a database, case or Parquet files stored in cloud storage, or in a data warehouse that is accessible by other applications as well.


.. note::

	As of version 25.2, CDM has special provisions for dealing with external and derived data, as described in :ref:`external_data`.

Complementary to regular databases
==================================

You should not see AIMMS CDM as a replacement for regular databases, but rather as a complementary tool:

* CDM allows you to turn decision-support apps developed in AIMMS in true *multi-user* applications. CDM is good at keeping track of individual changes to the planning data for which the app is the authoritative source of information, and thus making such changes auditable. CDM is not intended as a tool to *share* data with other applications, as CDM stores all data as a collection of *change sets* rather than a collection of relational tables that represent the current state of the data managed by the scenario planning application. 

* Databases are the prime tool to exchange data of a CDM-managed AIMMS app with external applications. Decision support apps typically work on data snapshots that are provided *periodically* by external applications, and provide back snapshots of their output data after these have been approved as part of the main process implemented by the CDM-managed app. This separation provides stability to both the CDM-managed scenario planning app, and the external apps that depend on its outcomes, while allowing the main users of the decision support app the ability to do what-if analysis on the problem at hand, without having to worry about the disturbing the external applications that depend on it.
