Comparison with other tools
===============================

.. rubric:: Development tools

There are several tools available that can, in principle,
be used as a development environment for analytic decision support
applications. The most well-known are:

-  spreadsheets,

-  databases,

-  programming languages, and

-  multidimensional modeling languages.

.. rubric:: Comparison

Spreadsheets, databases and programming languages all have their
strengths as development tools for a large variety of applications.
Advanced modeling systems such as AIMMS should not be seen as a complete
replacement for these three development environments, but rather as a
tool specifically designed for developing analytic decision support
applications. The following paragraphs outline the advantages and
disadvantages of each of these tools with respect to their suitability
as a development environment.

.. rubric:: Spreadsheet

If you are a fervent spreadsheet user, it seems only natural to build
your applications on top of a spreadsheet. However, this may not
always be the best choice. A spreadsheet approach works well when:

-  you don't need to specify a large number of relationships,

-  there are only a few procedures to be written,

-  the size of your data sets remains stable,

-  the need to add or remove dimensions is limited, and

-  you will carry out all the maintenance activities yourself.

When this is not the case, the AIMMS approach may offer a suitable
alternative, because:

-  specifying a large number of (often similar) relationships can be
   done using indexed identifiers and definitions for these identifiers,

-  adding and managing both internal and external procedures is a
   straightforward task using the AIMMS language and model editor,

-  modifying the size of any (index) set in AIMMS is natural, as there
   is a complete separation between structure and data,

-  adding or removing dimensions takes place in the language and does
   not require the copying of cells or creating more worksheets, and

-  not only can the structure of the entire model be made visible, but
   also the model editor allows someone else to create customized
   overviews of model structure for further maintenance.

.. rubric:: Database

If you are a fervent database user, it seems only natural to build your 
applications using a language such as C/C++, Python or
R on top of a database such as *Microsoft Access*, *MySQL*, *PostgreSQL*, *SQL Server* or *Oracle*.
However, this may not always be the best choice. Using a database
approach works well when:

-  all of the data for your application is already stored in a database,

-  the end-user GUI requires relatively little programming,

-  speed of data transfer is not crucial,

-  there is a limited need to link to external solvers, and

-  maintenance is carried out by yourself or another experienced
   programmer.

When this is not the case, the AIMMS approach may offer a suitable
alternative, because:

-  data transfer works well not only for data stored in a database, but
   also for data in text and case files,

-  the compact modeling language combined with the point-and-click GUI
   builder minimizes the amount of programming required,

-  internal data transfer during (the sparse) execution is extremely
   fast and does not require the repeated transfer of data between
   external programs,

-  standard links to solvers are built into AIMMS, and

-  compact and simple data structures on the one hand, and
   point-and-click GUI construction on the other hand, help ease
   maintenance.

.. rubric:: Programming language

If you are a fervent programmer, it seems only natural to build your
applications using languages such as C/C++, Python or even Fortran. However, this
may not always be the best choice. Using a programming language works
well when:

-  efficient data structures require relatively little effort,

-  there are many procedures to be written,

-  development times are not crucial,

-  there is a limited need to link to external programs, and

-  maintenance is carried out by yourself or another experienced
   programmer.

When this is not the case, the AIMMS approach may offer a suitable
alternative, because:

-  the standard multidimensional data structures in AIMMS require no
   special effort, and are efficient since all data storage and data
   manipulations are carried out in a sparse manner,

-  writing procedures in AIMMS is at least as easy as in a programming
   language: their control structures are similar, and AIMMS has the
   advantage that no special data structures are required,

-  specially developed tools for the construction of programs and GUIs
   minimize development time,

-  standard links to databases and solvers are built into AIMMS, and

-  compact and simple data structures on the one hand, and
   point-and-click GUI construction on the other, help to ease
   maintenance.

.. rubric:: Comparison summary

:ref:`table:intro.tools` summarizes the most important issues that
determine the suitability of the above development tools as a
development environment for applications. The table focuses on

-  the initial development effort to create an application,

-  the subsequent time required for product maintenance (extremely
   important due to the permanently changing nature of
   applications), and

-  the openness of the environment with respect to data entry formats
   and third party components.

A '+' indicates that the product scores well in this area, a '-'
indicates that it does not perform well in this area.

.. _table:intro.tools:

.. table::   Comparison of development tools

	+----------------------+------------------+------------------+----------+----------------------------+
	| Building tool        | Development time | Maintenance time | Openness | Suitability as a tool      |
	+======================+==================+==================+==========+============================+
	| Spreadsheet          | \+               | \--              | ++       | \+                         |
	+----------------------+------------------+------------------+----------+----------------------------+
	| Database             | \+               | \-               | \+       | \+                         |
	+----------------------+------------------+------------------+----------+----------------------------+
	| Programming language | \-               | \-               | ++       | ++                         |
	+----------------------+------------------+------------------+----------+----------------------------+
	| AIMMS                | ++               | ++               | \+       | ++                         |
	+----------------------+------------------+------------------+----------+----------------------------+   

  
.. rubric:: Developer quote 
 
In support of the comparison in :ref:`table:intro.tools`, the following
quote, from one of our customers, clearly expresses the advantages of using
AIMMS as a development environment for applications.

   *"Software development requires four tasks: definition, design,*
   *implementation and testing. When using AIMMS, the focus is on*
   *definition. The result is an implementation which can be immediately*
   *tested. I now spend the majority of my time working on the customer's*
   *problem, and verifying that we have got the requirements correct. My*
   *job is now that of an applications engineer, rather than a software*
   *engineer. One of our customers stated that our recent project with*
   *them (using AIMMS) was the first software project in their history*
   *not to have a single "Software Functionality Problem Report"*
   *generated."*
