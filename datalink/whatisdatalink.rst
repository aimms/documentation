

What is DataLink
****************

DataLink is a data inporter/exporter library for AIMMS that assumes that the data in the source is organized into tables. 
With this library we want the AIMMS developer to be able to read and write data from different types of sources using the same approach. This can be difficult because the tables do not contain enough information to be read into AIMMS identifiers.

The problem with tables
=======================


A table is a collection of data organised in columns. All columns have a name, which are specified in the header (as convention we will always show header values in bold).

.. csv-table:: The FirstnameLastname table
   :header: "firstname", "lastname", "age"
   :widths: 20, 20, 10

   "Alice", "Smith", 40
   "Bob", "Johnson", 20

When we look at the "structure" of this table we see that we have 3 columns named "firstname", "lastname" and "age". The first two columns have string values and the last column has a numeric value. We can make another table with two string columns and one numerical column.

.. csv-table:: The NameCity table
   :header: "firstname", "city", "age"
   :widths: 20, 20, 10

   "Alice Smith", "Paris", 40
   "Bob Johnson", "Londom", 20


Besides the column names there are no differences between these two tables except for the data. But when we do look at the data and interpret it's meaning, we could see that there is still a difference. In the FirstnameLastname table we need both firstname and lastname otherwise the age would not have any meaning. 

AIMMS being a modeling language, this is excactly the kind of information that is important. In our AIMMS model we do need identifiers that model the relation between the columns of the table. So we could have in AIMMS the sets :token:`S_Firstname` with index :token:`I_Firstname` and  :token:`S_Lastname` with index :token:`I_Lastname`. Also we could have a parameter :token:`P_Age(I_Firstname,I_Lastname)`. Then we could do the reading and reading the first row of the table would be equivalent of doing

.. code-block:: aimms

    P_Age('Alice','Smith') := 40; 

Here we see also that the values :token:`Alice` and :token:`Smith` should alreday be present in the sets before we can actually do the assignment.


Blabla

.. code-block:: aimms

    P_Age2('Alice Smith') := 40; 
    SP_City('Alice Smith') := "Paris";




Aimms needs that :pink:`information` to know how the 
here we have a parameter P_Age(i_Firstname, i_Lastname)


The DataLink solution
=====================





Reading and Writing
===================

+---------+----------------------+-------------+
| 1       |  :token:`Countries`  |  **3**      |
+---------+----------------------+-------------+

Reading means that we have to choose a source, a datamap and tell which provider to use.

.. code-block:: aimms

    dl::DataRead(
        "InputFile.xlsx",                   ! Choose a source
        "TheDataMap",                       ! Pick a data map  
        {'Provider' : 'xlsprov::DataLink'}  ! Pick a provider
    );




All providers have a string identifier called :token:`DataLink` containing the location of the binary file (the code) that has to run to transfer the data. All we have to do to specify a provider is to pass this string as attribute 'Provider' to DataLink. DataLink then can call this code to do the actual reading and writing.


And writing

.. code-block:: aimms

    dl::DataWrite(
        "InputFile.xlsx",                   ! Choose a source
        "TheDataMap",                       ! Pick a data map  
        {'Provider' : 'xlsprov::DataLink'}  ! Pick a provider
    );


Installation and setup
======================

To use DataLink only two things are needed:

* The DataLink library should be added to the project.
* A provider library should be added to the project.

The libraries are made available in through the AIMMS library repository, and can be installed from the **AIMMS Library Manager**.

The use of DataLink always takes two steps:

* **Step 1** is the configuration. The provider has to be specified and also the mapping of identifiers to column names has to be specified. Optionally extra column and table attributes can be set depending of the kind of provider.
* **Step 2** is the call to DataRead or DataWrite. This is when the data is transfered between AIMMS and the data source.

All providers have a string identifier called :token:`DataLink` containing the location of the binary file (the code) that has to run to transfer the data. All we have to do to specify a provider is to pass this string as attribute 'Provider' to DataLink. DataLink then can call this code to do the actual reading and writing.





