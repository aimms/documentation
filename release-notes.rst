AIMMS Release Notes
=====================

.. topic:: Hotfix Releases

   We release Hotfixes for severe bugs as soon as possible after internal testing. For less severe bugs, we may combine several fixes into a single release.

This page provides details of changes made in each AIMMS version. For an overview of our feature releases, see `New Features <https://www.aimms.com/support/new-features/>`__.

#############
AIMMS 25.9
#############



AIMMS 25.9.2 Release (December 08, 2025 - build 25.9.2.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The PRO library has a new function GetServiceAccess. This function takes a service port and returns a URI and bearer token, which can be used to access a service that is running inside the aimms session.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The attribute Defines Identifiers of a procedure now accepts multiple lines.
-  Starting a solve from within WebUI could give an error in the IDE if the Math Program Inspector window was still open. Now it closes the Math Program Inspector automatically.
-  In recent AIMMS versions, the function InvestmentConstantPeriodicPayment was not using the specified units of the passed in arguments, which resulted in unexpected values.
-  When used in a multidimensional expression, the function Element could lead to an error if the passed set is empty.

--------------





AIMMS 25.9.1 Release (November 26, 2025 - build 25.9.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 13.0 has been added. Gurobi 13.0 comes with performance improvements for all model types.
-  The Solvers General option 'Infeasibility finder postsolve' has been added. It can be used to print the IIS in case the LP model solved during the postsolve turns out to be infeasible. Analyzing this IIS can help with improving the robustness of the model.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Using an empty set or the empty element in a constraint or variable definition could lead to a severe error during generation.

--------------


#############
AIMMS 25.8
#############



AIMMS 25.8.3 Release (November 20, 2025 - build 25.8.3.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Running a procedure that changes an ordered set could sometimes result in a crash when at the same time the content of that set was accessed from within a WebUI widget.

--------------





AIMMS 25.8.2 Release (November 13, 2025 - build 25.8.2.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Updated the AIMMS cloud image to use a recent version of curl (see https://curl.se/) to download the PRO bootstrapper images.

--------------





AIMMS 25.8.1 Release (November 06, 2025 - build 25.8.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The AIMMS memory manager can now use the Microsoft mimalloc (see https://github.com/microsoft/mimalloc) general purpose allocator which in several circumstances results in less memory fragmentation and usage over time. This is an opt-in option that can be specified in the option editor in AIMMS by searching for 'mimalloc'.

--------------


#############
AIMMS 25.7
#############



AIMMS 25.7.8 Release (October 28, 2025 - build 25.7.8.14).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some rare situation, the WebUI did not show the correct data of an identifier. This was caused by an earlier procedure call in which the identifier was assigned new values via multiple statements but the end result was that the data was not different from the original data.
-  Fixed running the post install script in the AIMMS self extracting archive installer for linux.
-  The AIMMS Presolver did not always handle indicator constraints correctly, which could result in a crash in the solver.
-  Having a File identifier in the selection of identifiers in a Write statement was causing a crash.

--------------





AIMMS 25.7.7 Release (October 03, 2025 - build 25.7.7.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed an issue in which the dropdown of an element parameter (that had been defined over an indexed set) showed wrong values after elements had been removed from some of the ranges (i.e. the indexed sets) of this element parameter.
-  In some rare situations, internal garbage collection that may run prior to running a solve, could lead to faulty data being displayed in WebUI.
-  An execution error in a defining procedure during a case load sequence could result in a 'severe internal error' message and the case load was interrupted.

--------------





AIMMS 25.7.6 Release (October 01, 2025 - build 25.7.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The AIMMS Linux rpm package now depends on libgfortran instead of gfortran. This incorrect dependency was introduced in AIMMS 25.7.5.

--------------





AIMMS 25.7.5 Release (October 01, 2025 - build 25.7.5.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Reverted a change to the value of the 'Name' attribute in .rpm files to lower case again.
-  Removed dependency on gcc-toolset-11-runtime from Linux rpm packages as it is not needed and causes problems installing on recent Linux distributions.
-  If a declaration of a set is changed into a set relation, then the OrderBy attribute is no longer applicable. However, if it was specified before, this could result in a crash.
-  An indexed set with an orderBy: user, could result in a crash during a case save.

--------------





AIMMS 25.7.4 Release (September 24, 2025 - build 25.7.4.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Since version 25.5, sometimes during a load case, sets that have an orderBy specified are not read from the case at all.

--------------




AIMMS 25.7.3 Release (September 19, 2025 - build 25.7.3.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The .rpm file for the Linux version of AIMMS was not present in previous release.

--------------



AIMMS 25.7.2 Release (September 17, 2025 - build 25.7.2.6).
------------------------------------------------------------------------------------------

Please skip this version and download 25.7.3.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  All AIMMS installers are now consistently digitally signed. We discovered that a change in our installer packaging (SFX) caused last artifacts to be published without a valid signature. We've corrected the process and added safeguards in our build pipeline to prevent unsigned releases.

--------------





AIMMS 25.7.1 Release (September 16, 2025 - build 25.7.1.0).
------------------------------------------------------------------------------------------

Please skip this version and download 25.7.3.

AIMMS Improvements
+++++++++++++++++++++++++

-  The procedure :any:`GMP::SolverSession::Delete` has been added. It replaces the procedure GMP::Instance::DeleteSolverSession, which has become deprecated.
-  The procedures :any:`GMP::SolverSession::SetOptionValue` and :any:`GMP::SolverSession::GetOptionValue` can now also be used for several Solvers General options, including 'Time limit'.
-  The procedure :any:`GMP::SolverSession::SetOptionValue` can now be used to set a small set of options, including 'Time limit', inside a callback procedure of Gurobi 12.0.
-  The new math program generator has a new option move_nonvar_level_within_bounds which makes sure that a variable with a nonvar status uses a level value that is within the current lower and upper bound. With this option switched on the new math program generator behaves more like the old generator.
-  The new math program generator now uses the option eliminate_nonvar_columns to decide whether variables are just frozen or are eliminated from the math program.
-  The new math program generator has a new option equal_bounds_imply_nonvar which makes sure that variables for which the lower bound equals the upper bound are now treated as if the nonvar status is larger than 0. With this option switched on the new math program generator behaves more like the old generator.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The predefined parameters CurrentMatrixRowCount, CurrentMatrixColumnCount and CurrentMatrixBlockSizes are now filled properly when using the new generator.
-  Updated the application used to make the installation free / SFX image because there was an issue with spaces in the extracting path.
-  The partial regeneration of a math program is disabled for the new math program generator.
-  A domain restriction on a simple set is no longer supported and leads to a compilation error. If a model has a domain restriction on a simple set and that set also has a definition then you can easily add the restriction as a $ condition in the definition.  For a simple set without a definition the restriction was allowed in earlier AIMMS versions but it did not have any effect.

--------------


#############
AIMMS 25.6
#############



AIMMS 25.6.1 Release (September 03, 2025 - build 25.6.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The solver COPT has been upgraded to version 7.2.
-  The Help is now available online (as part of the User's Guide). Requesting Help on options in the Project Settings dialog box will now open a page in the online documentation.

--------------


#############
AIMMS 25.5
#############



AIMMS 25.5.7 Release (September 02, 2025 - build 25.5.7.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The previous 25.5.6.2 release by accident reverted the fix in 25.5.5.7 for working with stored procedures in MySQL. In this release that fix is added again.

--------------





AIMMS 25.5.6 Release (September 01, 2025 - build 25.5.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An error in a unit expression was not always positioned at the correct location in the text.
-  Added MySQL ODBC 9.4 driver to our cloud AIMMS image. The default is (when you have specified the driver to be 'MySQL' in the connection string) to use the MySQL ODBC 9.4 driver. You can fall back to the old driver by using the value 'MySQL8.0' for the driver, in case of compatibility issues.

--------------





AIMMS 25.5.5 Release (August 28, 2025 - build 25.5.5.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An external procedure or external function for which the body call attribute is not specified resulted in a crash instead of a proper error message.
-  Stored procedures in MySQL databases that did not have explicit result sets, resulted in a transaction failure. This has been fixed.
-  Change the value of the option `listing_and_temporary_files` using the Option statement could lead to a crash when AIMMS tried to write to the listing file afterwards.
-  Passing an invalid entry as first argument to GMP::Instance::Generate could lead to a severe error.
-  Calling the procedure GMP::Instance::CalculateSubgradient could result in a crash, if before the math program was solved using a different solver.

--------------





AIMMS 25.5.4 Release (August 12, 2025 - build 25.5.4.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Changing the dimension of an indexed set could result in a crash.
-  Since AIMMS 24 the webserver was always started listening on all interfaces, causing the Windows Firewall exception dialog to appear. From this release on, unless specified differently, by default the webserver will only listen on the loopback interface, preventing the Windows Firewall exception dialog to appear.
-  A unit override operator in a constraint definition is now supported by the new math program generator.
-  A constraint with an empty set in its index domain could lead to an error in the new math program generator.

--------------





AIMMS 25.5.3 Release (July 29, 2025 - build 25.5.3.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 12.0 has been upgraded to version 12.0.3.
-  The PRO library has a new function GetSessionOBOAuthorizationHeader. This function returns a bearer token, which can be used in the Authorization header to authorize PRO REST API requests on behalf of the user.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed a regression in the function DepreciationLinearRate.
-  AIMMS could hang when solving multiple models asynchronously with Gurobi 10.0 or 11.0, if the Gurobi option 'Output file' was enabled.

--------------





AIMMS 25.5.2 Release (July 17, 2025 - build 25.5.2.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The function :any:`errh::CreationTime` is now following the same rules with respect to daylight saving time as the function CurrentToString.
-  Assigning the empty element to an element parameter that currently holds a value outside the set range did not work correctly.
-  Fixed a bug when using a free index in an argument of a procedure or function call.
-  Only in latest version 25.5.1, the procedure FindUsedElements did not empty the contents of the output set first.
-  The number of warnings that are generated from within an external function is now limited by the option 'Maximal Number of Warnings Reported'.
-  In some rare situations the function ``me::SetAttribute`` did not work correctly.

--------------





AIMMS 25.5.1 Release (July 10, 2025 - build 25.5.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++
-  The implementation of the OrderBy attribute of a set has been improved. The syntax has become a bit more strict in that you should now use the same free index when specifying multiple expressions.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The iterative operators Sort and NBest are now supported by the new compiler.
-  If an indexed set (indexedA) is a subset of another indexed set (indexedB), then AIMMS now shows an error when you assign individual sets to indexedA which are not subsets of the corresponding individual set in indexedB.
-  Setting an environment variable using the EnvironmentSetString function did not result in that variable being able to be retrieved from another thread using EnvironmentGetString on Linux installations (e.g. the AIMMS cloud).
-  A READ statement using a database procedure did not first update the definition of arguments of the procedure.
-  Trying to open a .aimms file that includes repository libraries (like WebUI) did not work when there is no internet connection. It should only fail when the repository library is not yet downloaded and thus not locally available.
-  The solver column row mapping was not always printed correctly if the AIMMS Presolver was enabled.
-  In some cases AIMMS could hang during a solve if the concurrent optimizer of CPLEX was used on Linux.

Other AIMMS Updates
+++++++++++++++++++++++++
-  The solver Octeract has been removed.

--------------


#############
AIMMS 25.4
#############



AIMMS 25.4.4 Release (June 23, 2025 - build 25.4.4.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  A numeric value that ends with a period (for example: 1.) was not recognized by the new compiler.
-  Using the Math Program Inspector in combination with the new math program generator was sometimes too slow.
-  The function GMP::Instance::GetAttributeValue was returning incorrect values for multi-objective attributes when using Gurobi.
-  Compilation errors in the condition of a For statement did not always point the correct location, making it hard to find the error in the source text.
-  If a For loop has a domain condition, and an identifier in this condition is affected by a CleanDependents call within the For loop, then this could lead to an error when executing the second loop.

--------------





AIMMS 25.4.3 Release (June 03, 2025 - build 25.4.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed an issue with the .nch files in the main project and library folders. Sometimes, multiple duplicate entries appeared in these files.
-  If a mathematical program uses a violation penalties identifier, the generator does no longer stop when an empty infeasible row is encountered.

--------------





AIMMS 25.4.2 Release (May 21, 2025 - build 25.4.2.8).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The Solvers General option 'Constraint listing scaled model' has been added which can be used to print the scaled model in the constraint listing, in case the option 'Scale model' is switched on.
-  When making model edits to an identifier definition, in some situations definitions that were depending on this identifier were not always re-evaluated.
-  Elements from the predefined set ContinueAbort could no longer be assigned to the math program suffix 'CallbackReturnStatus'.
-  Even if all repository libraries are included in the .aimmspack, AIMMS was still making a call to the server to get information on the latest available version of a library. Getting that version was irrelevant and thus this call has been removed.

--------------





AIMMS 25.4.1 Release (May 07, 2025 - build 25.4.1.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The time needed to sort a large set based on the order by attribute has been reduced.
-  The functions `GMP::Instance::GetAttributeValue <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_instance-procedures-and-functions/gmp_instance_getattributevalue.html>`__
   and `GMP::SolverSession::GetAttributeValue <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_solversession-procedures-and-functions/gmp_solversession_getattributevalue.html>`__ have been added. These functions can be used to retrieve the value of a model, solution, quality or multi-objective attribute of a solve with CPLEX or Gurobi.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If a definition of a parameter or set includes a call to a procedure, then this procedure should now have the new property 'UsedInDefinition' set. This new property is used to check that no changes to global identifiers take place within the body of the procedure. If the new procedure property 'UsedInDefinition' is set, a new attribute 'Defines Identifiers' can be specified. This attribute list the identifiers that use the procedure as their definition. See `this How-To article <https://how-to.aimms.com/Articles/672/672-support-for-defining-procedure.html>`__ for more information.

--------------


#############
AIMMS 25.3
#############



AIMMS 25.3.4 Release (April 25, 2025 - build 25.3.4.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS API error messages about assigning values to non-member elements would refer to element numbers rather than names, making the errors hard to interpret.

--------------





AIMMS 25.3.3 Release (April 14, 2025 - build 25.3.3.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An inlined variable with no definition specified was causing an error at the moment that after the solve the values of that variable were calculated.

--------------





AIMMS 25.3.2 Release (April 04, 2025 - build 25.3.2.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An inline variable that is declared in another library or module was not always expanded correctly by the new math program generator.
-  Fixed a problem in new math program generator for constraints with a large amount of symbolic terms that were added or subtracted.
-  A mathematical program for which also a stochastic variant is created could give a warning on nonanticipativity constraints during the generation of the normal deterministic gmp.
-  The function GMP::Instance::GetColumnNumbers did not always return the correct number of columns when columns were added after generation via other GMP functions like GMP::Column::Add.
-  Made a small improvement in the startup time of models with a huge amount of identifiers.
-  The Identifier Cardinalities dialog box did first update all identifiers with a definition, and therefore the memory usage shown could be higher than the actual memory usage (before the dialog was opened).

--------------





AIMMS 25.3.1 Release (March 25, 2025 - build 25.3.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The last features that were still unsupported in the new math program generator have been implemented. For an LP or MIP model, the new generator should now be able to generate the GMP that is to be send to the solver. If you have set the option disable_new_mathprog_generator to get rid of 'unsupported' warnings in recent versions, it is recommended to set this option back to its default and try again whether the model generates with the new generator. We have seen that on average the generation time has improved 2 to 3 times, so it worth trying. If you still get warnings about unsupported constraints, please let us know.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed some problems with integer ranged parameters with a non-base unit. The range was not properly checked, and the value was not stored correctly.
-  Fixed an error in the new math program generator when a variable was referenced using 'repeated' indices, as in MyVariable(i,i).
-  In the Identifier Cardinalities dialog box, the Mem Usage column also includes the memory that is used to store the index domain restriction. This is now only done if the restriction is not a direct identifier reference but an expression for which additional data is kept.
-  The iterative operators First and Last could lead to an error if the set of the iterative index is empty.
-  You now get a deprecation warning on the usage of construct subset(index), which is interpreted as (index in subset). The new warning comes with an auto-improve, so you can easily replace all the occurrences.
-  Having an optional argument of a procedure with an initialData attribute filled in, could lead to an error.

--------------


#############
AIMMS 25.2
#############



AIMMS 25.2.3 Release (March 14, 2025 - build 25.2.3.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed a bug related to a domain condition like: (i in Subset). This problem only exists in versions 24.6.7 and later.

--------------





AIMMS 25.2.2 Release (March 12, 2025 - build 25.2.2.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The TestDate intrinsic method would incorrectly cause execution to be stopped when called from within an external procedure when it should just return false. This has been fixed.
-  After updating the AIMMS cloud image the `zip` and `unzip` command line tools were no longer available. These command line tools were added again.
-  The option matrix_block_sizes was not working for the new math program generator.

--------------





AIMMS 25.2.1 Release (February 27, 2025 - build 25.2.1.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The logical IN to check that an element is part of an Indexed Set was performing poorly in recent AIMMS versions. This has become much quicker in this AIMMS version.
-  The construct to bind an index to an IndexedSet is now supported by the new compiler (and thus also by the new mathematical program generator).
-  The new math program generator now supports semi-continuous variables.
-  Procedure calls within an if then else expression were not always run correctly. An expression like (IF condition THEN myProcedure() ENDIF) did sometimes run the procedure even if the condition evaluated to false.
-  In some situations .Level appeared as the suffix of an identifier in the WebUI, and this even caused identifiers to end up being read only.

--------------


#############
AIMMS 25.1
#############



AIMMS 25.1.2 Release (February 20, 2025 - build 25.1.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If a database table contains a column for Units, and one the entries for that column happened to be an empty string (instead of an explicit NULL) the read operation for that table would stop without any warning or error. Now the empty string is treated the same as an explicit NULL.
-  Update the dumpfile submit facility to support https endpoints, allowing dumpfiles to be submitted to AIMMS again.

--------------





AIMMS 25.1.1 Release (February 07, 2025 - build 25.1.1.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

- A new feature has been added that can be used to help end-users diagnose and resolve infeasibilities caused by input data issues. The new procedure `GMP::Instance::GetInfeasibleData <https://documentation.aimms.com/language-reference/optimization-modeling-components/implementing-advanced-algorithms-for-mathematical-programs/managing-generated-mathematical-program-instances.html#explainability>`__ should be used to enable this feature. This procedure will output a message describing the cause of the infeasibility. If can also be used to leverage graphical insights for iterative resolution. This feature is only available for linear models.
- Gurobi 12.0 has been upgraded to version 12.0.1.
- The default keyword for the Solvers General option 'Remove doubletons' has been renamed. By default doubletons will now always be removed by the AIMMS Presolver for linear models.

Resolved AIMMS Issues
+++++++++++++++++++++++++

- The procedure GMP::Solution::RetrieveFromModel did not retrieve the basis correctly if the AIMMS Presolver was used.
- The obsolete Gurobi option 'Parameter display' has been removed.
- The Linux AimmsCmd executable did not handle closing of stdin correctly resulting in an error. Additionally when pressing Ctrl-C or Ctrl-Z resulted in callstack dumps being displayed. Both issues have been addressed by this fix.
- The new math program generator did not filter out coefficients that were close to zero, as the old generator did.
- Internal dependencies have been updated to resolve potential security exploits.

--------------


#############
AIMMS 24.6
#############



AIMMS 24.6.9 Release (February 06, 2025 - build 24.6.9.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The new warning on the FOR statement that was introduced in the previous release was triggered too often. You now only get the warning if a loop index refers to an ordered set and that set changes during the iteration.

--------------





AIMMS 24.6.8 Release (January 29, 2025 - build 24.6.8.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Re-compiling the entire model after deleting a runtime library could fail.
-  In 24.6 a new implementation of the For statement is enabled. Because of that an extra warning is triggered when the set ordering of a loop index is changed within the inner statements of a for statement, which may result in different behavior as before.
-  The basis (if any) was not passed correctly to the solver in case the AIMMS Presolver is activated.
-  Inline variables with a definition containing multiple lines sometimes resulted in that the math program was not accepted by the new math program generator.

--------------





AIMMS 24.6.7 Release (January 24, 2025 - build 24.6.7.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If during the 'Project Close' sequence, you clicked the Cancel button in one of the dialog boxes that could appear, the WebUI was in an invalid state afterwards.
-  Constraints or Variables with a simple (index in subSet) restriction in the IndexDomain, could not be used in the new math program generator.
-  An inlined variable with an IndexDomain that is specified over multiple lines was not picked up by the new math program generator, and thus the old generator was used because of that.

--------------





AIMMS 24.6.6 Release (January 13, 2025 - build 24.6.6.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Reduced AIMMS Linux artifacts size.
-  In the WinUI Gantt Chart, if the parameter to store Store Selection was declared as binary, an unexpected warning could occur.

--------------





AIMMS 24.6.5 Release (January 09, 2025 - build 24.6.5.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The constraint properties "IncludeInCutPool" and "IncludeInLazyConstraintPool" are now supported by the new Mathematical Program generator.

--------------





AIMMS 24.6.4 Release (December 31, 2024 - build 24.6.4.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The new math program generator, introduced in 24.6, now supports Indicator Constraints as well.
-  The new math program generator, introduced in 24.6, now supports SOS Constraints as well.
-  NodelockTool on Linux did not work properly.
-  NodelockTool now connects to license.aimms.com via HTTPS.
-  RPM installer now installs in `/usr/local/Aimms`, not in `/usr/local/Aimms/<version>`.
-  Linux IFA .run file will set the LD_LIBRARY_PATH to allow libraries to find .so files that are shared with AIMMS.
-  Compiler errors in the index domain attribute of an identifier now point to the correct location, while previously they sometimes incorrectly pointed to a location in the definition attribute.

--------------





AIMMS 24.6.3 Release (December 17, 2024 - build 24.6.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Executing a SWITCH statement in some situations caused a severe error.
-  The function DialogGetNumber triggered an incorrect error.

--------------





AIMMS 24.6.2 Release (December 13, 2024 - build 24.6.2.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Made sure that the AIMMSUnitTest library also works within an encrypted .aimmspack file.
-  The "Ctrl + F" search functionality was not working because of the version numbers that were displayed in the model explorer.
-  The 'IN REPLACE MODE' of a solve statement was not working correctly in new generator.
-  A mathematical program that is initially generated by the new compiler, can now be used to do a resolve (and thus a partial generate).
-  The constraint properties 'Basic' and 'ShadowPriceRange' are now supported by the new generator.
-  The option 'scale_model' is now supported by the new generator.
-  In the model explorer, the Latest version number of a repository library was not entirely readable because of an overlap with the vertical scroll bar.
-  New generator now supports constraints and variables that need runtime unit checking during generation. Which is required when unit parameters without a specified quantity are used.
-  Variables with open finite bounds were not handled correctly in new generator code.

--------------





AIMMS 24.6.1 Release (December 4, 2024 - build 24.6.1.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Improvements in the New Generator:
++++++++++++++++++++++++++++++++++

With this release, the LP/MIP generator has received a significant makeover. This redesign addresses long-standing issues and introduces several improvements, including enhanced parallelization and performance enhancements that vary based on your model.

Changed behavior in the New Generator:

- Previously, if the lower bound of a variable was equal to the upper bound, it was treated the same as setting nonvar=1 (the variable was removed from the model). Now, it is treated as nonvar=-1. See `nonvar <https://documentation.aimms.com/functionreference/suffices/variable-suffices/nonvar.html>`_.

- Variables not part of the GMP are no longer altered during the solve generation. They retain their .level values. Previously, these values were set to the bound closest to zero, even if the .level value was within bounds.

- When generating with the new generator, the progress window will at first only show the increasing number of constraints. The number of variables and the number of nonzeros are shown only in a later stage.

- If a variable is marked as nonvar, its level value will not be changed (not even if it is out of bounds). The idea behind this is that there is probably a good reason why you want to make the variable nonvar with the current value.

- Any individual variable (scalar or multidimensional), that is not part of the generated mathematical program (meaning that there is no column in the GMP that refers to this variable) will keep the level value as it was prior to the solve. It is not set within its current bounds or moved towards the closest bound. What the level values of such variables should be is rather arbitrary theoretically and anything that AIMMS would do with it is just taking extra time.


AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 12.0 has been added. Gurobi 12.0 comes with performance improvements for LP, MIP, MIQP and MIQCP models, and adds support for (global) nonlinear optimization for models with integer variables (MINLP) or without (NLP).
-  The new compiler for the body of procedures and functions will now try to handle the For, Block, If-Then-Else, While and Repeat statements. Especially in the condition of the For statements this may lead to some new warnings if this condition contains deprecated constructs. It is recommended to fix these warnings as they might cause errors in future AIMMS versions.
-  The Find All (Ctrl-Shift-F) functionality now also searches for occurrences in the webui.json file. This may help to figure out whether identifiers are referenced in the WebUI.
-  If an application is using a version of a Repository Library for which a newer version has been released, this is now shown in the Model Explorer and Library Manager. The latest version number will be displayed at the right hand side margin. In the Library Manager dialog you can then easily update to the latest version via a single button click.
-  AIMMS dialogs used for licensing have been updated from ASCII to UTF-8 encoding. This change enhances compatibility and ensures better handling of diverse character sets.
-  We added GMP functions and procedures to get and set string-valued options for GMP::Instance and GMP::SolverSession.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The option distribution_compatibility can no longer be used to switch back to the old syntax of the distributions LogNormal, Gamma, Pareto, Triangular, Weibull, Beta and Exponential.  If your model relies on this option you will get an error and you should adapt the calls to these distributions using the comment that is given in the corresponding documentation. After adapting the calls, you should set the option back to its default.
-  AIMMS would crash when executing a procedure using the 'Run Procedure' right-click context menu item that would eventually call the AIMMS intrinsic function 'ExitAimms'.
-  We changed how we handle SIGPIPE: users of AimmsCmd will no longer get a coredump for this signal.
-  AIMMS now asks for confirmation if you are trying to reuse the name of an existing intrinsic function name (like 'max') as the name of a new symbol. It is recommended to not do this and use a non existing name.

--------------


#############
AIMMS 24.5
#############



AIMMS 24.5.21 Release (November 29, 2024 - build 24.5.21.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The improved support for the cloning of identifiers in the previous version (24.5.20) did not add the correct prefixes to the indices in the unit specification.

--------------





AIMMS 24.5.20 Release (November 25, 2024 - build 24.5.20.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Added better support for the cloning of identifiers in the library AimmsUnitTest. If the identifier has a unit attribute that contained references to other identifiers, the cloned identifier did not always get the correct same unit.
-  The option 'warning_not_initialized' is now set to OFF by default. This option has been quite annoying in the past and actually there never is 'uninitialized' data in AIMMS, because the data of an identifier will just have its default value when no initial data is explicitly assigned.

--------------





AIMMS 24.5.19 Release (November 22, 2024 - build 24.5.19.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In WebUI the warning message "WinUI pages are not available when project is setup for WebUI." was sometimes incorrectly triggered.
-  If a procedure argument is element valued with a range being a set in the global namespace (for example '::MySet'), and that same set name also exists in another namespace (for example 'MyLib::MySet') then in some situations an incorrect compilation error was triggered when trying to call this procedure.

--------------





AIMMS 24.5.18 Release (November 21, 2024 - build 24.5.18.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed an issue with project creation. If AIMMS cannot retrieve a repository library due to reasons such as no internet connection or an incorrect certificate, it would previously leave an incorrect .aimms file.

--------------





AIMMS 24.5.17 Release (November 20, 2024 - build 24.5.17.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Removing some data from an identifier (either by setting it to 0, or using the Empty statement), could in some specific situations result in a crash of AIMMS.

--------------





AIMMS 24.5.16 Release (November 18, 2024 - build 24.5.16.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In latest release the drag&drop features in the model tree were accidentally disabled.

--------------





AIMMS 24.5.15 Release (November 15, 2024 - build 24.5.15.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The progress window could show duplicate lines if the option 'Scale model' was switched on.
-  The math program suffix 'NumberOfNonzeros' was showing an incorrect value if the option 'Linear presolve' was switched on.
-  The procedure GMP::Coefficient::SetQuadratic could result in a failure if the quadratic coefficient value was set to 0.

--------------





AIMMS 24.5.14 Release (November 06, 2024 - build 24.5.14.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some situations, when WebUI was active, doing mouse-clicks in the Model Explorer tree could lead to a 'non responding' AIMMS.

--------------





AIMMS 24.5.13 Release (October 23, 2024 - build 24.5.13.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Adapted FFRead DLL to customer wishes.

--------------





AIMMS 24.5.12 Release (October 22, 2024 - build 24.5.12.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The functions in the AimmsAPI now check whether a handle refers to a deleted symbol. This may fix some crashes that happen in combination with the DEX library.
-  Special values like INF or -INF were not handled correctly when a unit conversion was applied.

--------------





AIMMS 24.5.11 Release (October 15, 2024 - build 24.5.11.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If a parameter has a unit parameter as unit, and that unit parameter refers to a derived unit with a parametric conversion factor (like in  DerivedUnit->BaseUnit : #-># * myFactor), then if myFactor changed to another value the value of the parameter was not displayed accordingly in the WebUI.

--------------





AIMMS 24.5.10 Release (October 08, 2024 - build 24.5.10.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The FFRead.dll has been extended upon request of a customer.

--------------





AIMMS 24.5.9 Release (September 24, 2024 - build 24.5.9.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The Solvers General option 'Solution batch size' has been added to retrieve the solution from the solver more efficiently.
-  Closing AIMMS while the Math Program Inspector was still open could result in a crash.
-  The scaling tool sometimes failed to scale a model because it terminated prematurely.
-  In the latest release, calling either of the functions FileTime, FileSelect or FileSelectNew resulted in a severe error.

--------------





AIMMS 24.5.8 Release (September 12, 2024 - build 24.5.8.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Superfluous ErrorCollectorStack warning messages are no longer logged in the solver session log.
-  Because of the new default setting of the option case_string_character_set there were problems reading back case files created on Linux in a Windows AIMMS, and vice versa. This has been fixed in the latest release, but cases need to be recreated to work correctly.
-  AIMMS could crash when using the option 'Display most violated constraints and bounds'.
-  Using Windows path separators (\\\\) in file functions like FileCopy now also works on Linux and on the AIMMS cloud.
-  Deleting variables with a definition could lead to problems when trying to re-solve a mathematical program afterwards.

--------------





AIMMS 24.5.7 Release (August 27, 2024 - build 24.5.7.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The range check for constraints (controlled by the option 'Warning row range left hand side') did not handle semi-continuous variables with a negative range correctly.
-  The AIMMS scaling tool did not scale indicator constraints correctly.

--------------





AIMMS 24.5.6 Release (August 13, 2024 - build 24.5.6.9).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The  conversion specifiers '%Am|set-identifier|' and '%Aw|set-identifier|' no longer add extra spaces, which would happen if the element was shorter than the longest element in the set.
-  The 'Subset of' wizard could make AIMMS crash when opening it if the attribute already contained a long reference to a set, like 'a::b::c::d::the_set'.
-  When passing a somewhat larger string to the Val function, which did not only contain numeric characters, AIMMS could crash in some cases.
-  The project option 'Equality relative tolerance' would always show up in the 'Options with nondefault value' section of the options dialog, even when it was set to its default value.
-  Gurobi 11.0 has been upgraded to version 11.0.3.

--------------





AIMMS 24.5.5 Release (July 17, 2024 - build 24.5.5.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS could crash when using CPLEX parameter files for multi-objective optimization.
-  Assigning sets to an indexed set could lead to a crash.
-  The scaling tool did not handle extreme values like 1e100 correctly.

--------------





AIMMS 24.5.4 Release (July 09, 2024 - build 24.5.4.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The function 'SetAsString' did not always respect the set ordering.
-  Changing a parameter to a variable or the other way around sometimes made AIMMS crash.

--------------





AIMMS 24.5.3 Release (July 04, 2024 - build 24.5.3.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Trying to open an old application that still has compound set constructs in it now works properly.
-  Reading data from a text file which referred to a non existing index could get into an endless loop. This will now end immediately with an appropriate error message.
-  Leaving an argument to a function empty could cause a crash.

--------------





AIMMS 24.5.2 Release (June 06, 2024 - build 24.5.2.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The AIMMS function MemoryInUse now shows the accurate value.

--------------





AIMMS 24.5.1 Release (May 30, 2024 - build 24.5.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

- An extra (optional) binary argument has been added to the procedure GMP::Solution::Check. If set to 1, the procedure will also check for bound violations and integrality violations.
- The default for the option case_string_character_set has been changed from "utf8" to "native". From experiments it shows that the native character set has the best performance. This option only affects newly created cases and all these cases remain compatible with older AIMMS versions.
- Gurobi 11.0 has been upgraded to version 11.0.2.

Resolved AIMMS Issues
+++++++++++++++++++++++++

- A defined parameter with a unit for which the conversion from the base unit contained a parameter (like in: localCurrency->€ : # -> # * exchangeRate) did not show the correct value in WebUI if the value of exchangeRate was changed.
- A performance issue was fixed for iterative operators like mean.
- The new option 'Row range violation left hand side tolerance' has been added. This option is used by the AIMMS generator to check individual constraints for feasibility by computing the range of the left hand side and comparing it to the right hand side, as controlled by the option 'Row range violation left hand side'. (Previously, this tolerance was controlled by the option 'Constraint listing feasibility tolerance'.)
- Callbacks aren't called anymore when calculating Substructure Causing Infeasibility or Substructure Causing Unboundedness in the Math Program Inspector.
- In functions like StringToTimeslot where a date time string is matched against a date time format, an error could occur when the match was not successful.

**Note**: Using AIMMS version 24.5 or higher with on-premise PRO does require **AIMMS PRO 24.7** or higher for WebUI applications. 

--------------


#############
AIMMS 24.4
#############



AIMMS 24.4.3 Release (May 23, 2024 - build 24.4.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS crashed when changing WebUI versions through the Library Manager.
-  In a WebUI table widget, showing the contents of a Set next to some other identifiers could lead to a crash in the underlying AIMMS system.
-  We made a small performance improvement that could make generation of a mathematical program a bit faster.

--------------





AIMMS 24.4.2 Release (May 09, 2024 - build 24.4.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS RPM installer for Linux did not contain the correct dependencies.
-  Newly created projects now set the option case_compatibility to AIMMS_4_80. It is recommended to set this option in existing projects as well.
-  The AIMMSAPI function AimmsSetNameToElement no longer triggers an error message in the error/warning window if a calendar element name does not adhere to the format of the calendar. The return value of the API function will simply be 0.
-  The model generation times are now reported in the log file using the AIMMS.GENERATOR logger.

--------------





AIMMS 24.4.1 Release (May 02, 2024 - build 24.4.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  From AIMMS 24.4 onwards, the WebUI will be released separately in the form of a Repository Library. Next to advantages for the developers at AIMMS themselves, this offers the benefit that we will be able to increase our WebUI release frequency, while retaining a very stable AIMMS engine. It also allows you to combine a (slightly) older tried-and-tested AIMMS version that works well in your situation, with the latest WebUI improvements. All this means that the WebUI has been assigned `its own part on our documentation website <https://documentation.aimms.com/webui/index.html>`__, which also includes `the release notes <https://documentation.aimms.com/webui/release-notes.html>`__ of the WebUI. In `this section <https://documentation.aimms.com/webui/creating.html#in-aimms-24-4-and-higher>`__ you can read how to work with the WebUI as a Repository Library.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The irreducible infeasibility set (IIS) could be incomplete for models containing semi-continuous or semi-integer variables.
-  Calling a procedure with missing arguments, like in FormatString("%n %n", a, ), could cause a severe internal error.
-  A "Read from file" did not work correctly if the file contained multi-dimensional sliced assignment statements, like A('i1','i2') := 3; and the quoted elements did not exist in the corresponding sets.
-  If you removed the Stochastic property of a variable for which the Stage attribute was also specified, the Stage attribute was not completely removed and was still present in the saved .ams file, which could lead to unexpected errors.

--------------


#############
AIMMS 24.3
#############



AIMMS 24.3.2 Release (April 04, 2024 - build 24.3.2.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When adding new arguments to a procedure or function via the wizard, a rather strange error message appeared.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When creating a new AIMMS model and opening the WebUI for the first time in that same first session, you would get an error about the WebUI page not being found. Saving, closing and reopening the model would mitigate this problem, but in this version we properly addressed the problem and now it does not happen anymore.

--------------





AIMMS 24.3.1 Release (April 03, 2024 - build 24.3.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  You can now print information about constraints, variable bounds and integrality violations to the listing file. This is controlled by the new Solvers general option 'Display most violated constraints and bounds'.
-  The scaling score has been added to the Matrix Statistics tab in the Math Program Inspector.
-  The compilation and execution of constant and symbolic list expressions is now picked up by the new compiler and the parallel engine. This may lead to some compilation errors in your application for constructs that were unintentionally accepted by the old compiler. An example is: 'DATA { 'a' : 3, 'b' : 4, 'c' }' where the last entry is missing a colon and a corresponding value. The old compiler just accepted this and assumed a value of 1.0.
-  Gurobi 11.0 has been upgraded to version 11.0.1.
-  Many of the time related functions are now handled by the new compiler within AIMMS. This may introduce some compiler warnings that were not given in previous AIMMS versions. If the warnings do not make any sense, or if you notice any other unexpected behavior related to these functions, please let us know.
-  It is now possible to wait longer than the default 30 seconds for the Python service to start by specifying the 'startWaitTime' argument of the LaunchService method. Please note that this will only have effect when run on AIMMS PRO 24.5 or higher.

WebUI Improvements
+++++++++++++++++++++++++

-  Two new WebUI library functions, `webui::RequestFileUpload` and `webui::RequestFileDownload`, have been introduced that allow you to trigger file uploads and downloads from within an AIMMS procedure, allowing you to put those behind a button, item-action or widget action. For more information, please have a look at `the documentation <https://documentation.aimms.com/webui/library.html#public-upload-and-download-procedures>`__.
-  It is now possible to add HTML content in Table cells, allowing for much flexibility in your data presentation. For details, see `the documentation <https://documentation.aimms.com/webui/widget-options.html#webui-ishtml>`__.
-  We created a new option 'Header Visibility' in the Table widget. With this option, you can hide the rows and/or columns header(s), as there are situations where omitting either of those will give a cleaner presentation of your Table data. For details, please see `the documentation <https://documentation.aimms.com/webui/table-widget.html#support-to-hide-row-and-column-headers>`__.
-  The brand new Diagram widget is now available as an experimental feature. It provides a very straightforward and eye-pleasing way to create and/or display any kind of network in your apps. For details, please refer to `the documentation <https://documentation.aimms.com/webui/diagram-widget.html>`__.
-  The previous restriction limiting Combination chart to only show up to 1000 data points has been lifted. While we continue to advocate for concise and clear data presentation, users now have the flexibility to load more data points onto the chart if necessary. For details, please see `the documentation <https://documentation.aimms.com/webui/combination-chart-widget.html#developer-option-for-threshold-of-data-points>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Previously, sometimes the WebUI was not always updated when the function `webui::RefreshAllWidgets` was called from within an AIMMS procedure. The behavior of this function has been significantly improved.

--------------


#############
AIMMS 24.2
#############



AIMMS 24.2.10 Release (March 29, 2024 - build 24.2.10.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The 't' icon, signifying derivation, was absent on the Identifier Settings option editor tab of a named view derived from a template, potentially leading to confusion.
-  If there was just one job in the Gantt Chart widget that was read-only, the whole Gantt Chart became read-only.
-  In some situations, a 'vector<T> too long' error message could appear when working in WebUI tables which had a sorting applied.

--------------





AIMMS 24.2.9 Release (March 27, 2024 - build 24.2.9.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  A WebUI table with a single identifier as its contents and for which the pivoting was such that the identifier index was put in the totals group, showed the wrong (i.e. all zeroes) values.

--------------

(we skipped AIMMS 24.2.8 due to internal technical reasons.)




AIMMS 24.2.7 Release (March 20, 2024 - build 24.2.7.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We addressed the "error: could not find '/apps/...'" when launching an app on PRO. This was caused by PRO being able to connect to the webserver before it was fully initialized.

--------------





AIMMS 24.2.6 Release (March 15, 2024 - build 24.2.6.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  PRO debug sessions did not work any longer due to an incorrect session type.

--------------





AIMMS 24.2.5 Release (March 14, 2024 - build 24.2.5.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  There was a regression problem with caching in the GMP::...Multi() functionality.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When having a literally specified default Named View in your widget, in combination with the UIEditable option set to 0, then on PRO the Named View selector in the widget header did not react to the selection made there.

--------------





AIMMS 24.2.4 Release (March 08, 2024 - build 24.2.4.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Calling GMP::Instance::GenerateStochasticProgram twice for the same generated math program could result in a crash if GMP::Coefficient::Set(Multi) was called in between.
-  Option assignments to a specific solver option (example: Option 'solver name'.anOption := 8;) was not working correctly.

--------------





AIMMS 24.2.3 Release (February 29, 2024 - build 24.2.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If the option 'warning_range_violation' was set to off, you could get an incorrect error in the WebUI when you assigned a new value to an identifier.

--------------





AIMMS 24.2.2 Release (February 21, 2024 - build 24.2.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The function GMP::Solution::RandomlyGenerate resulted in an error if the optional argument was not specified.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  On a sorted WebUI Table column, when hovering over the "v" header cell context button, the context menu was not always displayed.
-  Some WebUI widgets were not able to deal correctly with custom annotations (i.e. those specified by the app developer as the webui::IdentifierAnnotation attribute) for set elements. In case these custom annotations were specified as a string value with some words separated by spaces, these would be put in the DOM incorrectly. For example, "ABC DEF" would be put as "annotation-ABC DEF". With this fix, it will be put as "annotation-ABC annotation-DEF".

--------------





AIMMS 24.2.1 Release (February 14, 2024 - build 24.2.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++

-  Non-default Gurobi option settings can now be written to the Gurobi log by enabling the new Gurobi 11.0 option 'Parameter display' (default 'yes'). The default for the CPLEX option 'Parameter display' has been changed to 'yes' for CPLEX 22.1.

WebUI Improvements
+++++++++++++++++++++++++

-  A new function "RequestQueueSize" has been added to the public interface of the WebUI library. Amongst others, you can use this function to find out whether a dialog is open in WebUI. For details, see `the documentation <https://documentation.aimms.com/webui/library.html>`__.
-  The dropdown list for selecting an element parameter for the Store Focus option of a widget has been improved. Now this list only shows the entries which are compatible with the corresponding index.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When saving a case using the Data Manager in WebUI, execution errors during updating identifier definitions could lead to a saved case which was non-shareable to the end users. In these situations, AIMMS now saves a case without the defined identifiers.
-  The Multiselect widget and the (compact) Scalar widget got some involuntary scrollbars after Google released Chrome 121. Along with the remediation of this, we improved the overall consistency of scrollbar sizing and colors too.

--------------


#############
AIMMS 24.1
#############



AIMMS 24.1.8 Release (February 08, 2024 - build 24.1.8.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In some situations, it could happen that a WebUI app hanged (and remained 'Busy' forever).

--------------





AIMMS 24.1.7 Release (February 07, 2024 - build 24.1.7.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In very specific situations, making a structural change to your AIMMS model in developer mode, could lead to AIMMS crashing.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Gantt-chart's Job labels (the y-axis) now respect all the margins of the widget and will no longer be truncated.

--------------





AIMMS 24.1.6 Release (February 06, 2024 - build 24.1.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We updated the MySQL ODBC driver to 8.0.29. This version addresses an incorrect retrieval of TEXT field information that was introduced with the earlier 8.0.19 driver in the AIMMS 24.1.5 release.

--------------





AIMMS 24.1.5 Release (February 02, 2024 - build 24.1.5.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We downgraded the MySQL ODBC driver used in the AIMMS cloud applications from 8.1 to 8.0 in order to work around backwards compatibility issues with database schemas relying on default settings of the MySQL ODBC driver.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When the setting 'UI Editable' was set to false, cloud users could no longer resize their table columns.

--------------





AIMMS 24.1.4 Release (January 30, 2024 - build 24.1.4.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Multidimensional arguments in the multi variants of the GMP routines, e.g., GMP::Column::FreezeMulti, were not handled correctly anymore.
-  Changing the dimension of an identifier in the IDE could lead to a crash instead of a proper error message.

--------------





AIMMS 24.1.3 Release (January 26, 2024 - build 24.1.3.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In the Scalar widget, trying to slice a non-scalar parameter with its unit displayed to a scalar value (using 'Fixed Element'), could lead to a crash.

--------------





AIMMS 24.1.2 Release (January 24, 2024 - build 24.1.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  UnitParameters without a specific Quantity specified, in combination with unit conversions that use identifiers with a definition, sometimes caused errors because the identifiers used in the unit conversion were not evaluated at the right time.
-  The NodelockManager.dll file was missing in the installation.

--------------




AIMMS 24.1.1 Release (January 23, 2024 - build 24.1.1.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++

-  After almost a hundred AIMMS 4 Feature Releases, we say goodbye to the existing way of versioning our releases. From now on, we will use a year-based system, making it easier for you to quickly get an idea of when a particular AIMMS was released. Needless to say that we will start with AIMMS 24.1.1. Aside from the 24, the numbering system will not change: the next Hotfix Release will be AIMMS 24.1.2, and the next Feature Release will be AIMMS 24.2.1. Once we hit 2025, AIMMS 25.1.1 will be the first Feature Release in that year. For details on compatibility between AIMMS, PRO and AIMMS Library versions, please see `this Community post <https://community.aimms.com/aimms-pro-cloud-platform-43/new-24-aimms-libraries-and-aimms-pro-versions-1604>`__.
-  AIMMS 24 has been compiled using newer compilers. Next to that, we did an update of all open source components of AIMMS and we modernized our build system so that we can more easily keep up with automatically updating these open source components to their latest versions.
-  Knitro 14.0 has been added.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In rare cases, specifying the solver in the solve statement would result in an incorrect solver being used and could result in a crash.

WebUI Improvements
+++++++++++++++++++++++++

-  The Widget Named Views feature has been extended with a `template mechanism <https://documentation.aimms.com/webui/widget-options.html#managing-derived-views>`__, to simplify the management of multiple Widget Named Views for a widget.
-  The Combination Chart widget type, initially introduced as an experimental feature in AIMMS 4.84, has now been transitioned to a general availability feature.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The widget names in the Add Widget wizard and the Change Type option editor have been changed from technical names to user-friendly labels (for example: "Gantt Chart" instead of the previous "ganttchart").

--------------



#############
AIMMS 4.98
#############


AIMMS 4.98.8 Release (January 18, 2024 - build 4.98.8.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When applying a custom (CSS) theme, for an application published on PRO, that attempted to set a more complex background property, you could see the new definition being broken because of (incorrect) silent path updates on the WebUI side. For example, definitions that set multiple background images, or a background image and a 'fallback' color using RGB values, would break.

--------------





AIMMS 4.98.7 Release (January 16, 2024 - build 4.98.7.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  A crash could occur when switching between browser tabs while using the webui::RefreshAllWidgets procedure.

--------------





AIMMS 4.98.6 Release (January 10, 2024 - build 4.98.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS cannot handle file names longer than 260 characters. You now get an error message when you try to open an .aimms application that is on a path that is too long.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The X-axis labels on the Gantt Chart widget were cut off slightly when displaying letters like 'p', 'q', 'g' which need some more vertical space than other letters. As a result, the actual chart area has been ever so slightly decreased.

--------------





AIMMS 4.98.5 Release (January 05, 2024 - build 4.98.5.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Fixed an annoying warning that wanted you to change a \$ into a \|, and once you did it asked to change the \| into a \$.  See also `here <https://community.aimms.com/aimms-developer-12/pipe-signs-and-dollar-signs-expected-changes-for-4-97-1505>`__.

--------------





AIMMS 4.98.4 Release (December 22, 2023 - build 4.98.4.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The sort button in the header of the table widget did not always react to every click on it.
-  The order in which identifiers are being displayed in the WebUI identifier selector list has been improved. Identifiers that are declared in the main model will be shown on top of identifiers that have been declared is some (other) namespace; any exact match with the text specified in the search box will be shown on top, and all other identifiers are sorted alphabetically on their fully qualified name.

--------------

(we skipped AIMMS 4.98.3 due to internal technical reasons.)



AIMMS 4.98.2 Release (December 19, 2023 - build 4.98.2.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If a parameter with a Definition is used to define a unit in the Conversion attribute of a Quantity (which is sometimes used in the currency quantity to deal with changing exchange rates), then in some situations this definition was not evaluated at the right time leading to unexpected unit conversion results.
-  Missing values have been added for the Gurobi options ‘Barrier crossover basis’, 'Presolve aggregation', 'Presolve sparsify reduction' and 'Scale'. For the latter two options, some option values have been renamed.

--------------





AIMMS 4.98.1 Release (December 15, 2023 - build 4.98.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 11.0 has been added. Gurobi 11.0 comes with performance improvements for MIP, MIQP and MIQCP models.
-  The CPLEX feature FeasOpt and the Gurobi feature FeasRelax are now supported by AIMMS. For more details, please refer to the `documentation <https://documentation.aimms.com/language-reference/optimization-modeling-components/solving-mathematical-programs/infeasibility-analysis.html#adding-infeasibility-analysis-to-your-model>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The Gurobi option 'MIP node method' was missing the value 'Automatic'.
-  We made the PRO Launch service procedure more user-friendly and created some `documentation <https://documentation.aimms.com/cloud/launch-service.html>`__ for it.

WebUI Improvements
+++++++++++++++++++++++++

-  As per customer request, we changed the default alphabetical sort order in the WebUI (table widget) from case-sensitive to case-insensitive (to match the behavior in the WinUI pivot table). To override this behavior you can set the 'webui.case-sensitive-comparison' option to 1 in the 'webui-options.conf' settings file.
-  Identifiers with a multi-dimensional unit parameter as unit are now displayed correctly in the WebUI. In previous versions the data values were displayed according to the unit, but the unit itself was not displayed.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Some special characters (like ampersands, or brackets) were accepted in the name of a PRO app, but led to the app not being able to start.

--------------



#############
AIMMS 4.97
#############




AIMMS 4.97.12 Release (December 08, 2023 - build 4.97.12.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The function Element() could cause an error if the statement containing the call to Element() was executed multiple times.

--------------





AIMMS 4.97.11 Release (December 06, 2023 - build 4.97.11.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Sometimes a scrollbar appeared in the Table widget, even when it wasn't needed. It could block the view of the right-most part of the data.

--------------





AIMMS 4.97.10 Release (December 04, 2023 - build 4.97.10.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  On a PRO environment, error messages for the upload and download widget were not displayed prominently enough.
-  When you had an unsupported widget on the page (for example, a widget only compatible with a Grid Layout page added to an old style page), its settings button (cog wheel) would be shown on the widget below it.

--------------





AIMMS 4.97.9 Release (December 01, 2023 - build 4.97.9.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When using the Upload widget to upload a file which exceeded 128MB in size, you got an unclear 'error uploading file' message. Now you get an explicit message about the size limit.
-  Old style custom widgets could be rendered invisible in the WebUI.
-  The "tag-linechart" class has been removed from the CSS classList of the bubble chart widget, because it was added mistakenly in the past.

--------------





AIMMS 4.97.8 Release (November 23, 2023 - build 4.97.8.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An updated docker image used in the AIMMS cloud did not contain some system libraries required to use the emailclient library.

--------------





AIMMS 4.97.7 Release (November 22, 2023 - build 4.97.7.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When using the Multiselect widget where the elements are from a sliced subset, the count of the Select/Deselect buttons were inaccurate and the clicking on the Deselect button would give an error message.
-  When only typing whitespace characters in the Multiselect Widget, the search field disappeared.

--------------





AIMMS 4.97.6 Release (November 17, 2023 - build 4.97.6.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When accidentally passing a Set to a function argument that is expecting a String, AIMMS will sometimes do a conversion that is most of the time not what you would expect, as it will create a string containing all the element names of that set. This string can become pretty large and for example the function StringToElement could not deal with such a large string, causing a crash. StringToElement has now been adapted to not crash anymore on such a large string.  The rather strange conversion of a Set to a string is already a deprecated 'feature' and is only still applied in expressions that are not yet accepted by the new compiler.
-  Unit parameters with a definition should never trigger a warning like: "Warning: The unit parameter "upX" is not initialized (default values are used)."

--------------



AIMMS 4.97.5 Release (November 15, 2023 - build 4.97.5.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In combination with specific focus actions in WebUI widgets, editing an annotation in the AIMMS IDE could lead to AIMMS crashing.

--------------





AIMMS 4.97.4 Release (November 09, 2023 - build 4.97.4.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

**PLEASE NOTE:** This version was retracted from our website, because it did not work correctly with our SCN apps on the cloud. It cannot be downloaded anymore.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Invoking the :token:`webui::OpenPage` procedure during a Home page's "loading procedures" could result in a blank or incomplete page being displayed.

--------------





AIMMS 4.97.3 Release (October 25, 2023 - build 4.97.3.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The postsolve of a multi-objective model could fail if a nonzero relative tolerance was used for one of the objectives.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The selection box widget now refreshes following a data update through the "upon change" procedure when the value is cleared. Additionally, the widget will now show the default value (instead of the empty element) if a value is cleared.

--------------

(we skipped AIMMS 4.97.2 due to internal technical reasons.)




AIMMS 4.97.1 Release (October 18, 2023 - build 4.97.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 10.0 has been upgraded to version 10.0.3.
-  The compiler now triggers warnings on deprecated usage of the operators \$ and \|. See `here <https://community.aimms.com/aimms-developer-12/pipe-signs-and-dollar-signs-expected-changes-for-4-97-1505>`__ for details.
-  For some warnings and errors there is now a menu command to let AIMMS make the required change and thus improve the code. These warnings and errors show a small wrench in the icon indicating that the right-mouse menu will show the Improve commands.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  GMP procedures which can modify a row, e.g. GMP::Row::SetRightHandSide and GMP::Coefficient::Set, now generate an error if the row is not part of the GMP. Previously, AIMMS would silently generate the row which could result in unexpected or unwanted behavior.
-  The missing Gurobi option 'Projected implied bound cuts' has been added.
-  For multi-objective models, the objective value and the best bound of the math program now refer to the (blended) objective with the highest priority.
-  The procedure GMP::Row::GenerateMulti could fail if the indices in the 'binding' argument were permuted.
-  The math program suffix .Objective was not always showing the correct value when used inside a time callback procedure.

WebUI Improvements
+++++++++++++++++++++++++

-  We have enhanced the functionality of the MultiSelect widget. When you apply a filter to the widget, the "Select" and "Deselect" links will now correctly select or deselect all the filtered entries as intended. Additionally, we have added a count of available entries to the "Select" and "Deselect" links for clarity.
-  On the delete page and delete widget confirmation dialog, as well as on the deprecation alert dialog, users can now accomplish the action of the highlighted button by using the enter or space bar keys.
-  When running AIMMS in developer mode and downloading a WebUI table as an Excel file, the file to be downloaded is now created in a 'WebUITemp' subfolder of the project folder (instead of in the main project folder).
-  When downloading WebUI table data as an Excel file (or uploading an Excel file to a WebUI table), the WebUI will now show an appropriate message when generating (or processing) the Excel file takes a while.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Multiselect widget sometimes gave an incorrect error message when trying to deselect an entry.
-  We have improved the table identifier filtering by ensuring that it continues to work even after the translations for identifier names were changed.

--------------



#############
AIMMS 4.96
#############


AIMMS 4.96.16 Release (October 11, 2023 - build 4.96.16.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Using a 'defining procedure' as the definition of a parameter that has a unit, no longer triggers a unit inconsistency warning.

--------------




AIMMS 4.96.15 Release (October 06, 2023 - build 4.96.15.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We resolved a compilation error in the AIMMS WebUI (system) library, that occurred when the option 'case sensitive element comparison' was turned on.

--------------





AIMMS 4.96.14 Release (September 22, 2023 - build 4.96.14.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When displaying many indexes in a Table header (more than 15 or so), the last few index columns were not displaying the index values, but data values instead.

--------------





AIMMS 4.96.13 Release (September 19, 2023 - build 4.96.13.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Using AllIdentifiers in a statement like: "write AllIdentifiers to file "out.txt";" sometimes resulted in a severe internal error. This was caused by a problem in dealing with the Public attribute of a Module.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  Table widgets were not always refreshing immediately when opening a dropdown outside of the table, of which the content has an influence on how the Table is displayed (for example, as a display domain).

--------------





AIMMS 4.96.12 Release (September 13, 2023 - build 4.96.12.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The scalar widget was not always properly refreshing when applying a display domain to it.
-  Popups such as dropdown boxes created by a widget can now be styled using custom CSS in a similar fashion as custom styling other elements within a widget's scope.

--------------





AIMMS 4.96.11 Release (September 08, 2023 - build 4.96.11.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We addressed a problem in the Properties dialog of the WinUI Scalar object, where the specified symbol for the "# Visible Columns" was sometimes removed.
-  We added licensing support for enforcing a minimum AIMMS version.

--------------





AIMMS 4.96.10 Release (August 29, 2023 - build 4.96.10.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS could crash when closing the project while the Math Program Inspector was open.
-  If data was assigned to an identifier with a specified default running over a subset of its declared domain, it would run over the identifier's declared domain instead.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Due to a change in the latest Google Chrome versions, it was not possible anymore to select read-only cells in a WebUI Table widget.

--------------





AIMMS 4.96.9 Release (August 24, 2023 - build 4.96.9.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We added additional diagnostic logging for analyzing and reproducing issues in database writing, should these occur.

--------------





AIMMS 4.96.8 Release (August 15, 2023 - build 4.96.8.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In the previous 4.96.7 release, it turned out that the fix for the issue that should have been resolved in it was not part of the actual release. In this release, it is included: Incorrectly triggered duplicate data errors could occur when writing a database table to MySQL in merge mode.

--------------





AIMMS 4.96.7 Release (August 14, 2023 - build 4.96.7.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Incorrectly triggered duplicate data errors could occur when writing a database table to MySQL in merge mode.

--------------





AIMMS 4.96.6 Release (August 10, 2023 - build 4.96.6.8).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Academic/community/organization web licenses could not be used without a connection to our web license server. AIMMS now allows offline usage of these web licenses up to 24 hours after the last connection with the web license server was made.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The shape of the chart markers used in the Combination chart widget, for the line, area and other chart types, will now be allocated based on the sequence of their data series, as reflected in the chart legend. Before, actions like pivoting, adding of contents, or other changes to the display of the series would result in the markers changing without any apparent need.
- Improved the warning message for old-style annotations (deprecated since 4.71.1) still being used in your model. Previously, the message did not appear in case you were referring to identifiers in the :token:`webui::` attributes on the attribute form using a different casing that was used to declare the identifier. To prevent unnecessary old-style annotation warnings as a whole, you should rename the identifier to not be of the form :token:`X_annotations` (or :token:`X_tooltips`) for the identifier X. See our `online documentation <https://documentation.aimms.com/webui/widget-options.html#identifier-annotations>`__ for more details.

--------------





AIMMS 4.96.5 Release (July 25, 2023 - build 4.96.5.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The shadow prices of the lazy constraints were not always retrieved from CPLEX if the postsolve step was carried out for an MIP model for which a lazy constraints callback procedure was installed (a feature introduced in AIMMS 4.96.1).
-  AIMMS version 4.96 did not show the correct version number on the start page.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When you specified a slicing for an identifier in one of the WebUI options and went back to the relevant options editor later, the slicing was not displayed correctly. Instead, the 'default slicing' would be displayed, even though functionally the slicing worked fine.

--------------





AIMMS 4.96.4 Release (July 13, 2023 - build 4.96.4.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  On systems where the folder "C:\\ProgramData\\Paragon Decision Technology" exists and not "C:\\ProgramData\\AIMMS" the licensing of AIMMS could give rather unexpected errors that were prohibiting the usage of AIMMS. Please note that this folder is there to support old AIMMS versions that were released when our company was still called "Paragon Decision Technology" instead of "AIMMS".

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In recent versions of AIMMS, when opening the WebUI without having any page created yet, you would get an incorrect message saying that 'this page does not exist'.
-  The appearance of resource labels in Gantt charts was inadvertently broken, as part of the Theming improvements found in 4.95.10. To fix this, and to prevent some other labels in Combination charts, Maps and Table from going 'bad' when you try going for a 'dark mode' theme, a few related color combinations where taken out of theming and changed to remain 'high contrast' under all circumstances.

--------------





AIMMS 4.96.3 Release (July 11, 2023 - build 4.96.3.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When publishing to the cloud, the successful use of images from the project's resources folder for theming was, unintentionally, restricted to the :token:`--bg_app-logo` property. Now, virtually all of the other properties starting with :token:`--color_bg` are usable for this purpose too.

--------------





AIMMS 4.96.2 Release (July 05, 2023 - build 4.96.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The procedures GMP::Row::SetRightHandSide and GMP::Row::SetRightHandSideMulti no longer generate an error if they are called for a constraint containing the objective variable.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When page visibility was specified through an identifier, this did not work properly.

--------------




AIMMS 4.96.1 Release (June 28, 2023 - build 4.96.1.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  AIMMS now provides detailed information in case CPLEX concludes that the Benders decomposition is invalid. This is controlled by the new CPLEX option 'Benders decomposition check limit'.
-  Gurobi 10.0 has been upgraded to version 10.0.2.
-  The matrix manipulation procedures, which have been deprecated since AIMMS version 3.5, have been removed. Projects using matrix manipulation procedures should use GMP procedures instead as explained `here <https://documentation.aimms.com/functionreference/deprecated/matrix-manipulation-functions/index.html>`__.
-  The postsolve step is now also supported for MIP models for which a lazy constraints callback procedure is installed, but only if the Solvers General option 'Postsolve' is switched on.
-  The global solver Octeract has been upgraded to version 4.7. Octeract 4.7 comes with performance improvements for all kinds of nonlinear problems.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Removing doubletons by the AIMMS Presolver could be slow since AIMMS 4.95.1. Now it is faster than before.
-  The PRO library has a new parameter `ManagedSessionOutputCaseContainsDefinedIdentifiers`. If this is set to 1, the result case files that are sent back from server to client sessions will contain the data of sets and parameters that have a definition. This is only required if these case files are used directly in a multiple case comparison. By default, this parameter has the value 0, which results in a smaller case file that is sent over and there is no time spent at server side to update all these definitions.
-  Calling GMP::Solver::InitializeEnvironment yielded an incomplete error message.

WebUI Improvements
+++++++++++++++++++++++++

-  Next to the already existing Upload and Download widgets, it is now also possible to link upload and download actions to both widget actions and item actions. This allows for more context-sensitive use of the actions, while saving space on the page by leaving out the separate Upload and Download widgets. Of course, there remain situations where those come in handy, so you can continue to use them as before. For details on how to use this, please read `the documentation <https://documentation.aimms.com/webui/widget-options.html#configuring-widget-actions>`__.
-  The Named Views feature has been extended, such that you can now `set the current view from within the model <https://documentation.aimms.com/webui/widget-options.html#widget-named-views>`__ by using an element parameter to specify the Current View option. 
-  WebUI now also accepts procedures with only optional arguments (wherever it previously would accept only procedures without arguments). The default argument values will be used when the actual procedure call is made.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Workflow navigation did not always work as expected when the workflow had configuration errors.

--------------


#############
AIMMS 4.95
#############



AIMMS 4.95.12 Release (June 27, 2023 - build 4.95.12.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

WebUI Improvements
+++++++++++++++++++++++++

-  With the release of AIMMS 4.90.3, we upgraded the Slider widget to include support for slicing on Contents. The support for slicing on the Min, Max, and Step options has now been added as a further extension.

--------------





AIMMS 4.95.11 Release (June 20, 2023 - build 4.95.11.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Now, when using the 'is' or 'is not' filter types in the table widget, special characters are properly escaped.

--------------




AIMMS 4.95.10 Release (June 15, 2023 - build 4.95.10.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When moving to the new Ubuntu 22.04 as the base for the AIMMS cloud image in AIMMS 4.95.1, the zip command line utility was missing.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When combining the setting of the openClose string parameter for a workflow with the opening of a workflow page using the OpenPage procedure, the WebUI could get blocked. It would not react on any input anymore.
-  Hyperlinks in the List Widget did not have the proper styling (blue and underlined) anymore.
-  When a WebUI Table cell had the focus, and you switched between browser tabs to come back to the one containing the Table, the focus was lost, forcing you to click on the cell again. Now the focus is retained, which will help you when copy-pasting values from external sources to the table.
-  Some custom CSS properties were added again to improve on the 'themeability' of the application header/footer and Workflow. Some definitions were changed so the theming of simple things like the widget background does not immediately pose problems for charts. Moreover, all elements that are considered to be part of the App Developer UI (sidebar, option editors, many dialogs) will no longer respond to theming (to guarantee the usability of them) because a new class was added to their containers: `container--unthemed-on-purpose`.

--------------


(we skipped AIMMS 4.95.9 due to internal technical reasons)


AIMMS 4.95.8 Release (June 13, 2023 - build 4.95.8.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The tooltip for (WebUI) table cells that contained a 'count' aggregator value could show a wrong value in case the table also had an active filter.

--------------





AIMMS 4.95.7 Release (June 09, 2023 - build 4.95.7.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The chart labels (across all chart types, when showing labels for the values within a chart) have been aligned to maximize legibility. Font size, color and outline should now yield good results on most data colors.

--------------





AIMMS 4.95.6 Release (June 02, 2023 - build 4.95.6.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The IdentifierText function returned an empty string instead of the identifier name if the text field of the specified identifier was left empty.

--------------





AIMMS 4.95.5 Release (June 01, 2023 - build 4.95.5.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Using -inf as the default value for an unspecified default argument, it was not picked up correctly when entering a procedure. Instead, the value 0 was used.

--------------





AIMMS 4.95.4 Release (May 26, 2023 - build 4.95.4.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Since AIMMS 4.90, AIMMS could crash due to a buffer overflow in dialog functions if you tried to display too many characters in it.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The disabling/enabling of the Widget Actions for 'Upload...' and 'Download...' (for data or image snapshots) has been made more fine-grained, so you can now hide (but not really disable) them individually and for specific widgets or widget types. More information on how to achieve this through a few lines of CSS in your application specific resources can be found in `this How-to article <https://how-to.aimms.com/Articles/568/568-disable-standard-webui-functions.html>`_ on disabling standard WebUI functions.

--------------





AIMMS 4.95.3 Release (May 24, 2023 - build 4.95.3.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS could crash at the beginning of a solve if the option 'Linear Presolve' was switched on and the 'ShadowPriceRange' property was set for one of the constraints. This regression issue was introduced in AIMMS 4.89.1.

--------------





AIMMS 4.95.2 Release (May 17, 2023 - build 4.95.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The ElementCast function with a calendar element as the second argument did not always work properly.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  If you used the menu or the page navigator to move to a workflow step of a *collapsed* parent item, this parent would remain closed. Which was unintended behavior, just like Workflow's urge to always scroll the current page into view. Both behaviors have been dealt with now.

--------------




AIMMS 4.95.1 Release (May 10, 2023 - build 4.95.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The AIMMS presolver will now also remove duplicate rows with unequal right-hand side values, unless the rows are incompatible. In that case, the presolver will detect the infeasibility of the model.
-  The image running AIMMS in the cloud has been upgraded:
    -  It is based on ubuntu 22.04 
    -  Available ODBC driver for MySQL : 'MySQL8.0'. The 'MySQL' driver which was 5.3 under the hood is no longer supported
    -  Available ODBC drivers for MS SQL Server: "ODBC Driver 17 for SQL Server" and "ODBC Driver 18 for SQL Server". In the previous image only version 17 was available, be aware that version 18 has breaking changes, see also `here <https://techcommunity.microsoft.com/t5/sql-server-blog/odbc-driver-18-0-for-sql-server-released/ba-p/3169228>`__.
    -  This image no longer contains direct support for R: contact user support if you are using R in the cloud for the migration trajectory to this AIMMS version.


WebUI Improvements
+++++++++++++++++++++++++

-  The app developer can now define multiple Named Views for a widget. Each of these views represents a specific state of the widget. The end-user can select either of these named views to have a different look at the widget. For example, there could be named views for different pivotings of the data, or even completely different widget types, such that you can present the data in a Bar chart or a Line chart, according to which named view the end-user selects. Please refer to `the documentation <https://documentation.aimms.com/webui/widget-options.html#widget-named-views>`__ for all the possibilities.
-  Now the Table title header cells support custom tooltips using `webui::IdentifierTooltip  <https://documentation.aimms.com/webui/table-widget.html#custom-tooltips-for-identifier-and-indices>`__.
-  Now Identifier names in the Scalar widget also support custom tooltips using `webui::IdentifierTooltip  <https://documentation.aimms.com/webui/scalar-widget.html#tooltips-for-identifier-names>`__.
-  The WebUI library was extended with two procedures: `RefreshAllWidgets <https://documentation.aimms.com/webui/library.html#webui::RefreshAllWidgets>`__ and `UseTransparentVeil <https://documentation.aimms.com/webui/library.html#webui::UseTransparentVeil>`__.
-  Up until now the most recent Theming options could not be considered 'complete' yet: despite the number of custom CSS properties available, there were several elements not subject to any theming (using fixed values to achieve an AIMMS Theme) or only pretty coarse theming was achieved at the best, leaving you with the need to add application specific stylesheets like before... With the help of customer feedback and by going through virtually all components, we have added a whole range of additional CSS properties *and* made sure they are applied in all logical locations. Please review the latest base theme file to see how Theming should now 'reach' all parts of a WebUI application much better. For more information, please see `this documentation <https://documentation.aimms.com/webui/understanding-theming.html>`__.
-  The behavior of the Workflow panel was changed to allow for a better utilization of the vertical space: a parent item that has a child item that is the currently visible page can now be collapsed. The presence of a 'current' child will still be visible, in an alternate form below the parent. This includes the state it is in, its tooltip and the ability to re-open the parent by clicking on the collapsed child.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We improved the assignment algorithm of colors (from the WebUI color palette) to the individual elements (e.g. bars in a bar chart) in WebUI widgets. As a result, colors may change but color consistency (i.e. the same elements will have the same color when used in different widgets) is retained. Colors will be more predictable as there is a direct link now between the ordinal number in the (root) set and the color in the color palette. Chances for unnecessary duplication of colors have decreased.

--------------


#############
AIMMS 4.94
#############


AIMMS 4.94.3 Release (May 03, 2023 - build 4.94.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS could crash when retrieving data using an indexed unit into the WebUI.
-  The financial functions that have a bound on 'rate' did not work properly above rates of 200% and had limits that were bound to -100..500%. Note: these are still the default bounds.
-  When passing an identifier slice as argument to a procedure or function, AIMMS gave a severe internal error if the identifier was sliced using an 'empty' element.

--------------





AIMMS 4.94.2 Release (April 21, 2023 - build 4.94.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Identifiers with a prefix that were renamed using the webui::IdentifierElementText method, were displayed untranslated when case comparison mode was being used in the WebUI.
-  The Case Comparison switch, which was introduced in AIMMS 4.94.1, was missing for the Combination Chart Widget.
-  Updatable identifiers in a library were wrongly shown as read-only when WebUI was in case-comparison mode.

--------------




AIMMS 4.94.1 Release (April 18, 2023 - build 4.94.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Using indexed database tables, with a fixed value for the index, row deletes were not executed sometimes.

WebUI Improvements
+++++++++++++++++++++++++

-  We added the possibility to filter on the actual identifier(s) being displayed in the Table widget, similar to the already existing filtering functionality. For details, see the `documentation <https://documentation.aimms.com/webui/table-widget.html#to-add-filter-rules-to-the-identifier-header>`__.
-  App developers can now choose whether or not the end-user is allowed to apply case comparison for each individual Table or Chart widget.

--------------


#############
AIMMS 4.93
#############


AIMMS 4.93.2 Release (April 14, 2023 - build 4.93.2.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The postsolve of an MIP with lazy constraints, solved with CPLEX, could be slow.

--------------




AIMMS 4.93.1 Release (April 4, 2023 - build 4.93.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The new option 'presolve remove duplicate variables' has been added to the AIMMS Presolver.
-  The new procedure GMP::Instance::AddLimitBinaryDeviationRow adds a constraint to a generated math program that sets a limit on the number of binary variables of which the solution value is allowed to vary. That way you can re-optimize an MIP problem after making some modifications and limit the impact of those modifications on the solution. Adding this constraint can have a negative impact on the objective value and therefore you have to make a trade-off between the solution quality and how much the solution is allowed to vary. For details, see `here <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_instance-procedures-and-functions/gmp_instance_addlimitbinarydeviationrow.html>`__.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If the value of the option 'Listing and Temporary Files' was changed then the output folder in which the solver logs and the listing file were written was only changed after restarting AIMMS.

WebUI Improvements
+++++++++++++++++++++++++

-  Previously, it was not possible as an app developer to easily access a workflow page once it had been marked hidden or inactive. You first had to make it visible or active again. Now you can always access such pages through the App manager of the WebUI.
-  Now the Table and Scalar widgets support an indexed Element Parameter that is ranged over an Indexed Set.
-  The use of a single WebUI page in multiple workflows has been made more intuitive. Now you will remain in the same workflow when activating a step which is part of more than one workflow. The exact behavior is documented `here <https://documentation.aimms.com/webui/workflow-panels.html#configuring-a-pageid-in-multiple-workflows>`__.
-  We further improved the error validation and messages on the workflow mechanism.
-  Now you can add up to 10 tabs in a WebUI sidepanel.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Combination Chart widget now supports custom tooltips on X-Axis labels.
-  The styling of the List entry button (the '+' button), which is available in the Map and Combination chart widget option editors, has been improved and now resembles button widget styling.

--------------


#############
AIMMS 4.92
#############


AIMMS 4.92.12 Release (March 31, 2023 - build 4.92.12.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We added the AIMMS procedure `webui::IsWebUIDialogOpen`, which returns 1 when a dialog is currently open on the WebUI and 0 otherwise. It can be used to assert that no dialog is currently open before starting a new one.

--------------





AIMMS 4.92.11 Release (March 29, 2023 - build 4.92.11.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When calling a procedure that is located in a runtime library that still requires compilation, this compilation is now automatically performed before running the procedure.

--------------




AIMMS 4.92.10 Release (March 23, 2023 - build 4.92.10.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In recent AIMMS 4.92 versions, it was not possible anymore to run WinUI apps on the cloud.

--------------



AIMMS 4.92.9 Release (March 22, 2023 - build 4.92.9.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When trying to download a repository library, the Library Manager now gives a more useful error message for HTTP response code 403.

--------------



AIMMS 4.92.8 Release (March 21, 2023 - build 4.92.8.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When filtering values in a SelectionBox widget by typing specific special characters (those with a meaning in so-called regular expressions, like '*' or '?' for example), an error message was displayed.
-  Now right clicking on a Table cell with the CTRL key pressed after a block selection will clear this selection. If the Table cell had item actions associated with it, the previous behavior suggested that the item actions would be applied to the whole selected block, which was not the case.
-  Clicking on the 'closing cross' of the Selectionbox widget with a one-dimensional parameter gave an unexpected error in recent AIMMS versions.

--------------



AIMMS 4.92.7 Release (March 14, 2023 - build 4.92.7.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When copying text from an external program which contained special space characters, these were not recognized by the compiler. This 'non-breaking space' (ASCII character 160) is now replaced by the normal space character during compilation.
-  AimmsCOM.exe would not start for AIMMS versions >= 4.88, preventing usage of the AIMMS COM object.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When the Download Image button is clicked, a veil will now be displayed with a proper message, until the application becomes interactive again. In case of widgets with a lot of data, creating the screenshot can take some time.
-  Block editing did not work in full-screen mode of the Table widget, after the block selection was already made in 'non full-screen mode'. This also did not work the other way around.

--------------



AIMMS 4.92.6 Release (March 10, 2023 - build 4.92.6.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  To prevent all kinds of Excel related issues when trying to open a generated Excel file, the 'download as Excel' WebUI table feature has been restricted to not show more than 65535 dropdowns (implemented as Excel validations). In addition, in case the number of table cells corresponding to an element parameter or binary parameter exceeds 65535, dropdowns with just 2 elements will also be skipped (to favor dropdowns with more elements). Dropdowns with more than 100 elements were already skipped in the initial version. Please keep in mind that large Excel files are not the best way to communicate large amounts of data.

--------------



AIMMS 4.92.5 Release (March 9, 2023 - build 4.92.5.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

(We skipped AIMMS 4.92.4 because of internal technical reasons).

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The best bound value shown in the (final) progress window was not always correct for non-convex QCP problems solved with Gurobi.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Text widget did not always take newline characters into account.
-  The Gantt chart widget does not allow dragging of read-only jobs anymore.
-  The Download widget now shows the translated text for its procedure name during the download process.
-  The identifier element text (as specified in the `webui::IdentifierElementText` string parameter) as well as the identifier tooltip text (as specified in the `webui::IdentifierTooltip` string parameter) were not applied to identifiers that were displayed in widgets that were in 'case comparison' mode.

--------------



AIMMS 4.92.3 Release (March 7, 2023 - build 4.92.3.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When writing to a SQlite database on Linux, strings were sometimes incorrectly written (only the first character appeared).

Resolved WebUI Issues
+++++++++++++++++++++++++

-  With case comparison enabled, workflow panels were not displayed.

--------------



AIMMS 4.92.2 Release (March 1, 2023 - build 4.92.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Using AIMMS 4.92.1, publishing a WinUI app on PRO gave an error message, after which the app would not start at all.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The labels of a compact Scalar Widget will now use the available horizontal space better, before inserting an ellipsis. Styling also cooperates better with custom stylesheets and the code used in `this How-To article <https://how-to.aimms.com/Articles/94/94-using-the-scalar-switch-css.html>`__.


--------------



AIMMS 4.92.1 Release (February 28, 2023 - build 4.92.1.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 10.0 has been upgraded to version 10.0.1.
-  A new version of Knitro was added: Knitro 13.2.
-  The postsolve step is now also supported for MIP models containing a pool of lazy constraints.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The setting 'Old situation' of option 'Stealth mode' has been removed for CPLEX versions 12.10 and 12.9. (Newer CPLEX versions already did not have this setting.).
-  If the scaling tool is used then the values of the Solvers General options 'MIP absolute optimality tolerance' and 'Cutoff' should have been scaled before passing them to the solver.
-  The postsolve could be incorrect for multi-objective optimization problems.
-  Using File or Directory functions with path names that contained non OS native slashes, like for example FileExists("folder1/folder2\myfile.txt"), could lead to completely messed-up strings in other string parameters in the model. AIMMS automatically converts these slashes to the expected ones for the OS on which it runs, but while doing that the AIMMS string management got corrupted.
-  An EMPTY statement where a slice of an identifier is emptied, went wrong if the slicing was done via a set that is not a subset of the original domain set. Both the slicing set and the domain set only shared the same root set.

WebUI Improvements
+++++++++++++++++++++++++

-  We enhanced the Workflow panel with the possibility to have sub-levels, so that parent-child relationships can be integrated into your workflows. Also, we added more direct data validation to the workflow definition data, such that you get clear feedback in case of inconsistencies there. For details, see `the documentation <https://documentation.aimms.com/webui/workflow-panels.html#configuring-workflow-panels>`__. 
-  The Table widget now has an improved keyboard navigation (more like Excel, see `the documentation <https://documentation.aimms.com/webui/table-widget.html#table-widget>`__).
-  Block selection on the Table widget is now also possible using the SHIFT + ARROW keys.
-  Block selection on the Table widget is now possible using a SHIFT + Mouse click combination.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  On the cloud, in Scalar Widgets in end-user mode (with a non-editable UI) you could not filter the values by typing in the input field above the drop-down list.
-  Reverting a change to a Table cell value which shows an integer value (i.e. an element parameter with a subset of integers as its range) made the reverted value incorrectly show decimal values.
-  Clicking on the 'closing cross' of the Selectionbox widget gave an unexpected error in recent AIMMS versions.
-  On dialog pages, the widget Settings icon was appearing in the UI for "headerless widgets" when the dialog was opened (except when opened from the App manager) in recent AIMMS versions.
-  Using the ESC key to try to abort a block edit, led to the whole block of table cells being filled with an unintended value.
-  The WebUI raised an unexpected error when block deleting from an identifier that has a linked read-only identifier.
-  We removed the white background and box shadow from the Image Widget, like it was before the layout changes for headerless widgets (in 4.91.1). The original intention was to outline the Image widget better, but we now only show the covered area when it is still empty. This works better for the logos and branding found in many applications.

--------------

#############
AIMMS 4.91
#############


AIMMS 4.91.7 Release (February 17, 2023 - build 4.91.7.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some rare situations, the return value of a procedure was not passed correctly to the calling procedure.
-  If the NoSave property is specified for a Variable with a definition, then the data of the artificially created constraint for the variable was inadvertently added to the case.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When pasting data in a WebUI table, cells that were specified as 'read-only' by using a `webui::FlagsIdentifier` annotation, were still being pasted into.

--------------



AIMMS 4.91.6 Release (February 16, 2023 - build 4.91.6.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Statements in which the left-hand side identifier has both a nonzero default and a multidimensional index expression suffered from a regression issue introduced in AIMMS 4.88.5 (and incorrectly fixed in 4.89.2), which could lead to erroneous results.
-  Having a '!' inside a quoted element name could sometimes lead to the situation that the whole statement was not executed at all.
-  The Empty command did not remove some of the data of a defined variable in recent AIMMS versions.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Our online example (and variations thereof) to transform boolean scalar values into a nice sliding toggle switch should no longer experience some minor misalignment that appeared after introducing the new layout for the Widget Menu and access to the Option Editor (4.91.1).

--------------



AIMMS 4.91.5 Release (February 10, 2023 - build 4.91.5.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If the function IdentifierUnit was called on an identifier that did not have any unit specified, it could happen that the result was the base unit of the quantity SI_Unitless whereas it should return no unit at all.
-  There was a problem with Output/InOut arguments in functions like DialogGetString.
-  When the database structure was loaded from a file through the function LoadDatabaseStructure, random characters were sometimes added to the column names, resulting in strange looking errors.

--------------



AIMMS 4.91.4 Release (January 31, 2023 - build 4.91.4.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Robust optimization models with an uncertainty set described by scenarios (using a ConvexHull region) were not always handled correctly by AIMMS.
-  The EMPTY statement was no longer checking whether any unused strings could be removed from memory. In some models this could lead to a temporary increase in memory usage. This check has now been reintroduced during the EMPTY statement.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We removed the Title option from the Text widget. This option did not have any effect, because the header of the Text widget is never displayed.
-  From AIMMS 4.90 onwards, the WebUI did not load properly on the Safari browser on iOS devices.
-  The Legend of the Combination Chart widget now only contains entries for the associated elements that are actually displayed on the chart.
-  When opening a Table cell for editing, it was not possible anymore to use the mouse cursor to start editing the contents somewhere in the middle.

--------------



AIMMS 4.91.3 Release (January 25, 2023 - build 4.91.3.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The procedure OptionSetString did not always handle string values 'on' and 'off' correctly in case of a solver option.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The barchart, linechart and barlinechart widget are using an internal heuristic to decide what index to use for coloring. In the special case in which the chart only contained a single element (e.g. a single bar in a bar chart), this heuristic could result in the bar not being colored at all (i.e. a gray bar). We improved the heuristic such that it can now use information from indices that have been fixed using slicing, resulting in more consistent coloring.
-  WebUI applications showing a combination-chart, with a color index and/or transparency index specified, were vulnerable to (multi-threading related) AIMMS crashes. The likelihood of such crashes occurring increased as the data within the widget and/or the number of widgets on the screen increased. We addressed this multi-threading issue.

--------------



AIMMS 4.91.2 Release (January 18, 2023 - build 4.91.2.8).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In the Conversions attribute of a Quantity, a line that started with a $ sometimes gave an unexpected error.
-  Shadow prices with the special value ZERO were not handled correctly by the scaling tool.
-  The log of the dual simplex algorithm was not shown in the CPLEX status file if the CPLEX option 'LP method' was set to 'Concurrent'. (Note: to see the logs of the primal simplex and barrier algorithms the CPLEX option 'Clone Log Files' should be switched on.).

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When widgets are added to the home page of a new application and this page is refreshed, the page layout would erroneously change to classic layout. Because we addressed this in 4.91.2, it can happen that if you open an older model using 4.91.2 or later, you will have a (correct) grid page layout with all existing widgets in the 'unassigned' area. In this case, you should assign these widgets to their areas once. Please note that this problem can only occur in models which only have one page (the home page).

--------------



AIMMS 4.91.1 Release (January 9, 2023 - build 4.91.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++

-  The performance of the AIMMS Presolver has been improved for linear models.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The AIMMS Presolver will focus less often on numerical accuracy if the option 'Presolve numeric switch' is at its default value ('Automatic') because this focus can be time consuming.
-  Errors that occur in AIMMS-API calls no longer result in severe internal errors.

WebUI Improvements
+++++++++++++++++++++++++

-  The dropdown boxes in both the Scalar and the Table widgets, when displaying element parameters, have been upgraded to a new underlying technology which we have already used for the Selectionbox widget for a while. It offers dynamic updating of the data in the list without having to close it first, faster loading of the elements and a search feature.
-  We've changed the way the widget menu (the 'kebab menu') and the access to the widget options ('the cogwheel') looks. This is especially noticeable for application developers that will now find that these two buttons are always visibly attached to all widgets, both the ones with and without the a full header. This makes their presence immediately known and consistent for both developers and end-users, with editable or non-editable interfaces. It also allows the widget menu, which can also contain the widget actions, to have a more prominent and clear role in your application and development.
-  In Scalar widgets, the currently selected dropdown entry can now be cleared by clicking the "x".

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Upon causing a range violation on a table cell (for example, by specifying a negative value in a non-negative cell), an error message was displayed. However, the cell was locked from any further modifications after this, requiring you to reload the page.
-  In Scalar widgets that display an element parameter, opening the dropdown with its possible values is now always activated by a double-click. Previously, there were some scenarios where a single-click would do and some where a double-click was required.
-  The Item actions context menu in combination with UponChange procedure which take some time, sometimes disappeared completely.


--------------

#############
AIMMS 4.90
#############


AIMMS 4.90.5 Release (January 5, 2023 - build 4.90.5.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In some situations, AIMMS could crash if you copied a widget to the same page. Also, a crash could occur after a combination of scrolling and clicking in several data and/or header cells of a Table widget.

--------------



AIMMS 4.90.4 Release (December 20, 2022 - build 4.90.4.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some situations the operator Mean was performing worse than the (deprecated) operator Average. In this version the usage of Average is no longer automatically redirected to Mean, so in those statements where you encounter a performance problem you can now fall back to using (the old implementation of) Average.

--------------



AIMMS 4.90.3 Release (December 14, 2022 - build 4.90.3.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When displayed in a WebUI widget, data could become corrupted if an entire row or column was removed. AIMMS could crash as a result.

WebUI Improvements
+++++++++++++++++++++++++

-  The modern identifier selector is now supported in the option dialog of the Slider widget. As a result of this, slicing is now also supported.

--------------



AIMMS 4.90.2 Release (December 1, 2022 - build 4.90.2.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Saving cases where the option 'case_contains_runtime_libraries' is set to 'On' could result in a crash. Especially when some runtime libraries had the 'NoSave' property set.
-  In the AIMMSPro library, some function arguments were not declared in the correct way. This led to a warning in the latest AIMMS version.
-  SetElementRename did give an incorrect error message when trying to rename an element in a set that was defined as the union of some other subsets. Renaming an element in such a set is allowed unless one of the subsets itself has a definition and the element is in that subset.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We restored the 'contents.filters.in' option in the advanced option editor tab of the widgets where it was previously supported. This enables app developers to modify their WebUI, in order to adjust for the Widget Filtering feature, which has become deprecated since AIMMS 4.90.1.
-  When entering negative values in the Combination Chart widget for the step size of the Y-axis in the settings, the app could hang.

--------------



AIMMS 4.90.1 Release (November 25, 2022 - build 4.90.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  You can now create a Quantity in a runtime library.
-  The new linear solver COPT has been added. COPT can be used to solve LP and MIP problems, as well as convex QP and QCP problems. COPT is developed by Cardinal Operations. More details can be found in `the documentation <https://documentation.aimms.com/platform/solvers/copt.html>`__.
-  Gurobi 10.0 (version 10.0.0) has been added. Gurobi 10.0 comes with performance improvements for LP, MIP, convex MIQP models and for convex and non-convex MIQCP models.
-  Previous versions of AIMMS did not always check that an argument passed to an external function/procedure was really matching the type of the argument. Especially when this argument was passed as a 'handle' to the underlying DLL function. In AIMMS 4.90 you will get a warning when the actual passed-in argument to an external procedure does not match the type or dimension of the argument declaration. However, compilation and execution will continue as it did in earlier versions. It is recommended to have a look at these warnings and try to fix them, as in a future version of AIMMS these warnings will be treated as errors. For more details on this, see `the documentation <https://documentation.aimms.com/language-reference/procedural-language-components/external-procedures-and-functions/declaration-of-external-procedures-and-functions.html>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The case files that are created to communicate data from a client to a PRO solver session and back, now use a different internal string character set. Especially for configurations where the session runs on a Linux machine, this greatly improves the time that is needed to read these cases.
-  A local unit parameter in a procedure or function may get its value from the unit of a passed in argument. You now get an error if the arguments that assign this unit parameter are all optional.
-  When passing a set implicitly via the arguments (so not as an explicit set-valued argument), all the arguments that use this set should refer to the exact same set in the actual call. This error message was missing in previous AIMMS versions.
-  Sets that are passed to a procedure/function cannot be declared as being a subset of some other local set. In previous AIMMS versions this was not resulting in an error message, but the behavior was also not as expected: inside the procedure or function the set could then have elements that were not part of the superset.
-  An optional element-valued argument in a procedure cannot have a local set as its range.

WebUI Improvements
+++++++++++++++++++++++++

-  In the WebUI Table widget, sorting on data has been possible for quite some time. From this release onwards, you can also sort on the row and column headers. For details, see `the documentation <https://documentation.aimms.com/webui/table-widget.html>`__.
-  Now 'mailto:' links are supported in the Text widget.
-  The "Advanced Table Editing" has been promoted to a General Feature; we removed it from the Experimental Features list. The copy/paste and block editing functionality is documented `here <https://documentation.aimms.com/webui/table-widget.html>`__.
-  From AIMMS 4.90 onwards, you will get a deprecation message when opening models which still have a 'Contents.filters.in' property specified (as a result from using the deprecated Filter tab on widgets). See `the documentation <https://documentation.aimms.com/webui/widget-options.html>`__ for details on how to mitigate this.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  Only if you used the 'Advanced Table Editing' Experimental Feature: When copy/pasting a cell displaying a string containing newline characters from and to a WebUI Table, the pasted string was spread over multiple cells, depending on the number of newline characters present. 

--------------


#############
AIMMS 4.89
#############


AIMMS 4.89.9 Release (November 24, 2022 - build 4.89.9.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS could crash when adding a new library via the Library Manager dialog. This was a problem in the AIMMS 4.89 series of releases only.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We corrected the page delete confirmation message, which displayed an incorrect number of subpages.

--------------



AIMMS 4.89.8 Release (November 23, 2022 - build 4.89.8.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Annotations were not always properly set on Line Combination Charts, leading to css not being applied correctly.
-  When uploading an Excel sheet to a WebUI table in a model for which the `webui::IdentifierElementText` identifier contained duplicate values, the upload could fail. Now the upload should work correctly as long as the element text for the identifiers that are actually being used in the table at hand are unique.

--------------



AIMMS 4.89.7 Release (November 21, 2022 - build 4.89.7.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The constraint listing sometimes displayed right-hand-side values close to 0 as 0, which is not correct if the option 'Listing number precision' is set to a high value.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The store focus mechanism in the Combination Chart widget did not work when the identifier specified resided in a library.
-  Buttons did not work anymore in models created with old AIMMS versions (to be more precise: those using the deprecated option 'procedure' for their button procedure configuration).

--------------



AIMMS 4.89.6 Release (November 16, 2022 - build 4.89.6.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When moving identifiers in a runtime library, these could appear as name change entries in the .nch file of the main project, which is not correct.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Entries in the Multiselect widget flickered when clicking either "Select All" or "Select None".

--------------

(For technical reasons, we skipped the AIMMS 4.89.5 release).


AIMMS 4.89.4 Release (November 8, 2022 - build 4.89.4.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The function ConvertUnit could result in a crash if the passed unit was empty.
-  Using a Student License, AIMMS would crash when trying to create a 'New Project' due to the limited model sizes for that type of license.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Selection Box Widget would not work properly when the model was published on AIMMS PRO: searching/filtering the list was broken.

--------------



AIMMS 4.89.3 Release (November 2, 2022 - build 4.89.3.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Logging database statements at trace level could in some cases lead to crashes because the displaying of null-data was not correctly handled (since AIMMS 4.80).
-  In some situations an Empty statement that uses an element parameter for slicing did not first update it. This resulted in either the wrong slice or nothing at all being emptied.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We have carried out two styling fixes: ('old') Bar and Line Charts now properly show the units used in the chart, at the top of the vertical axis. Layout issues were causing them to be hidden from view. This also repairs the margin between axis labels and the chart, which was too big. Moreover, the Label widget was inadvertently showing border/drop shadow where it was never intended to have them. These errors, made while creating the new Theming options, have been corrected.

--------------



AIMMS 4.89.2 Release (October 26, 2022 - build 4.89.2.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In AIMMS 4.88, versions of repository libraries that were stored in the .aimmspack file were not used when running the app. This could lead to unexpected longer startup times, for example in solver sessions.
-  Calling the function GMP::Solution::GetRowValue many times could be time consuming if the (optional) argument 'valueType' was set to 2.
-  In AIMMS 4.88.5 we introduced a regression issue for statements where the left-hand side identifier has both a nonzero default and a multidimensional index expression.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When the contents of a custom tooltip were changed while the tooltip was visible (for example: a button click changed the tooltip), it could happen that the combined contents would then start duplicating on every showing of the tooltip, potentially even leading to a crashing browser.
-  After uploading an Excel sheet to an existing WebUI table, any existing sorting in the WebUI table was ignored.

--------------



AIMMS 4.89.1 Release (October 20, 2022 - build 4.89.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The memory usage and computing speed of the AIMMS Presolver has become more efficient for linear models. For large linear models it can be beneficial to switch on the option 'Linear presolve' because this might drastically reduce the memory usage of the solver.
-  We introduced a new intrinsic function `SetAsString` that returns a string representation of a set. Implicitly casting from a set to a string is now deprecated. Please refer to `the AIMMS Function Reference <https://documentation.aimms.com/functionreference/elementary-computational-operations/set-related-functions/setasstring.html>`__ for more information.
-  Failed connections to our academic/community license server specified through a license URL now provide more detail about the reason of failure (e.g., license expired, too many sessions, etc). Licenses with a license URL can now also be specified in the License Configuration dialog in AIMMS itself. Previously, such licenses could only be entered in the AIMMS Launcher.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When setting the ``aimmsunit::TestSuite`` annotation on a section node in the model tree, the error message 'Section Test_Section: Annotation aimmsunit::TestSuite already set.' was incorrectly displayed. The cause was that the annotation was stored twice in the underlying .ams files. Now it is stored only once, which resolves the aforementioned and similar errors.
-  A crash could occur when using an incorrect index domain attribute specification.


WebUI Improvements
+++++++++++++++++++++++++
-  We added a feature as part of the existing Experimental Feature 'Advanced table editing' which allows you to search for values in a WebUI table. Please read `the documentation <https://documentation.aimms.com/webui/table-widget.html#search-and-find>`__ for more details.
-  The widget header buttons have been restructured to prevent cluttering.
-  We added the application option 'Show Upload/Download Data Controls', which allows you to enable or disable the Excel Upload/Download and the CSV Download buttons in all Table widgets across your WebUI.
-  In AIMMS 4.86 we introduced the feature to Download Excel data from a WebUI Table and to upload Excel data into a WebUI Table. Since then, we have polished this feature and now we consider it good enough to make it into a generally available (GA) feature. This means that you do not have to set the 'Excel Upload/Download Support' checkbox anymore.
-  When copy/pasting values in the Table widget that are not allowed (for example, a string value into a numeric cell), a warning message is now displayed.
-  Using ``webui::IdentifierElementText`` in combination with the Table widget's Excel download functionality is now supported.
-  We added a ``webui::IdentifierTooltip`` annotation, which allows you to specify tooltips for elements used  in the ``<IDENTIFIER-SET>`` sections of WebUI widgets. Currently, this is supported for Table row/column headers. We are aiming to support it across the whole of WebUI soon. For details, see `the documentation <https://documentation.aimms.com/webui/widget-options.html#identifier-annotations>`__.



Resolved WebUI Issues
+++++++++++++++++++++++++

-  A Selectionbox widget displayed on the bottom of a page will now open its dropdown above it if there is not enough room left on the screen to open the dropdown below it.
-  In previous versions of AIMMS, the webui.json file could sometimes still contain fragments of widgets which in reality had already been removed from your WebUI.
-  Performing a really quick CTRL+V keypress in a Table cell when trying to paste a block of cell data could lead to the whole block being copied into the single cell, leading to an error message about the value being invalid.
-  The Table widget did not update properly after an edit in the table followed by changing a value in a Selectionbox widget causing the table to have a structural change.
-  The Selectionbox widget is now also updated when the dropdown is opened and at that time the underlying data changes.
-  Annotations were not applied correctly to WebUI charts when 2 identifiers were added that are in different index domains. Only the first identifier got the annotation.

--------------


#############
AIMMS 4.88
#############


AIMMS 4.88.6 Release (October 11, 2022 - build 4.88.6.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The new option 'Postsolve time limit' has been added, which can be used to specify a time limit if an LP problem is solved as part of the postsolve step.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Only now it was noticed that the Parametric Curve object in WinUI was no longer working. This is caused by a necessary change to the engine some time ago. From now on, you can no longer create a new Parametric Curve object and on existing pages that use it, an error message will appear. If you still need the functionality of the Parametric Curve you can quite easily create a procedure that mimics the calculations and store the result in some indexed identifiers, which can be displayed in any other page object (or WebUI widget).
-  A '+=' assignment containing index expressions in the identifier domain in the left hand side, could give wrong results. An example of such a statement is ``A(elemPar(i), elemPar2(j)) += B(i,j)``. These type of statements, where the assignment to the left hand side does not follow the same order as the set order of the domain indices i an j, are treated by AIMMS as 'sequential statements'. This means that a kind of implicit ``FOR (i,j)`` statement is added around the statement. The analysis whether the 'sequential' approach is needed was not taking into account that there is a += instead of a normal :=. This error only appeared in the last release of AIMMS, where the new compiler was no longer skipping these statements.
-  If the option 'MIP calculate sensitivity information' was switched on then all continuous variables violating one of its bounds would be fixed to the nearest bound, even if none of them violated the bounds by more than the 'Postsolve bound tolerance'.

--------------



AIMMS 4.88.5 Release (October 6, 2022 - build 4.88.5.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In Aimms 4.70 we introduced a regression error. Aimms could create incorrect data if multidimensional index expressions were used at the left hand side of an assignment. In addition, such an expression must introduce a new index and the data must have a specific distribution. Param(i, EP(i,j), j) := 1; is a an example statement where this might occur. Note that EP is at the left hand side, is multidimensional, and introduces a new running index (j). In case you have such statements and are unable to update to newer versions, please contact User Support.

--------------



AIMMS 4.88.4 Release (October 4, 2022 - build 4.88.4.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  A rare, data dependent but potential severe performance regression issue has been addressed. It could appear if parameter data related to a huge set was incrementally added. This problem was introduced in the AIMMS 4.70 release.
-  When an application was trying to delete an already deleted runtime library, AIMMS could crash.

--------------



AIMMS 4.88.3 Release (September 28, 2022 - build 4.88.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Assigning a constant list expression to a multidimensional identifier was wrongly rejected at compile time when one of the identifier's indices was fixed by specifying it as a scalar element expression.
-  The AIMMS Presolver did not always handle doubletons correctly. Namely, if a model contains the constraints x=y and x=y+5 then the AIMMS Presolver deleted the second constraint instead of marking the model as infeasible.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  All usages of links to and images residing within your Application's 'resources' folder will now keep on working correctly, whether deployed locally, on Pro, or in the cloud. This is true for the Image Widget, the Text Widget and the HTML you provide for tooltips.

--------------



AIMMS 4.88.2 Release (September 23, 2022 - build 4.88.2.11).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We implemented a safer way of saving the model (.ams files). Each model file is now saved to a temporary file first. In case of an unrecoverable error during save, the original file will stay unchanged, while its new version that is causing the error can be found in a .ams-tmp file.
-  Expressions such as { i in S } (a set constructor without definition) are now properly implemented using local binding only, instead of combining local binding with default binding. In short, this expression now results in the set S. See also `this topic on binding rules <https://documentation.aimms.com/language-reference/procedural-language-components/index-binding/binding-rules.html>`__ in our documentation.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When using the experimental feature toggle 'Excel Upload/Download Support', the downloaded Excel files show a dropdown that lets you change the value element parameters. In case the element parameter at hand has a `webui::ElementTextIdentifier` annotation specified, the labels in the dropdown now correctly show the element text (instead of the original set elements).

--------------



AIMMS 4.88.1 Release (August 31, 2022 - build 4.88.1.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

IMPORTANT: Backward Compatibility on PRO
++++++++++++++++++++++++++++++++++++++++
For applications that are or will be built with AIMMS 4.88 (or future versions) to be published on PRO, it is necessary to update AIMMS PRO (on-premise) to version 2.44, released July 15 (see the `PRO release notes <https://documentation.aimms.com/pro-release-notes.html>`__).

We have changed the underlying build configuration of our C++ code to move faster to new technologies. This upgrade does not affect the functionality of any product of AIMMS. Still, due to unavoidable name changes of some of the binaries we release with AIMMS, older versions of PRO and repository libraries are no longer compatible. This adjustment will improve the robustness and maintainability of our code.

It might also affect some Repository Libraries, but that will be solved 'automatically' when you open the model in AIMMS 4.88 (or future versions). 
If you open the model in AIMMS 4.88 (or future versions) before publishing, the Autolib will find the supported version for all repository libraries in the model and will show a pop-up that versions have been updated, and you need to save the model. Only when the model used a very old version (lower than 1.0.0) of the Unit Test Library, some incompatibility may arise because an identifier 's' is no longer available.

AIMMS Improvements
+++++++++++++++++++++++++

-  The option 'Updates batch size' has been added for Gurobi to pass GMP updates more efficiently.
-  Several solution and solver related statistics have been added to the Math Program Inspector, on the Math Program Solution, Variable Statistics and Constraint Statistics tabs.
-  Gurobi 9.5 has been upgraded to version 9.5.2.
-  Four new GMP routines have been added:

    -  GMP::Coefficient::GetRaw
    -  GMP::Row::GetRightHandSideRaw
    -  GMP::Column::GetLowerBoundRaw
    -  GMP::Column::GetUpperBoundRaw

   These can be used to retrieve a collection of coefficients/bounds/right-hand-sides efficiently.
-  A new GMP procedure, called GMP::Coefficient::GetMinAndMax, was added. It can be used to determine the minimum and maximum value of coefficients in a generated mathematical program.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The procedure GMP::Instance::Solve did not take CurrentSolver into account for selecting the solver. (Note: GMP::Instance::SetSolver overrules CurrentSolver.).
-  If the terms in the definition of a constraint are not unit-less then the Unit attribute of the constraint itself should also be specified and it should be commensurate with each of the terms in the definition. AIMMS was not always checking this, especially when unit parameters are involved that are not linked to a specific quantity. In that situation the unit consistency can only be checked during the generation of the mathematical program (and thus not at compile time). This change may lead to new warnings and errors in your existing model, and you should correct your model to make the units consistent. If you encounter serious problems because of this change, please let us know.
-  The infeasibility analysis by the AIMMS Presolver could sometimes be more complicated than needed.
-  The program and solver status returned by IPOPT was incorrect in case the problem had too few degrees of freedom.
-  Opening the Math Program Inspector for large MIP models with indicator constraints, solved with CPLEX, could be slow.
-  The procedure GMP::Solution::Check did not take units into account.

WebUI Improvements
+++++++++++++++++++++++++

-  On Grid Layout pages, from the Page Configurator in the sidebar, you can now add your widgets directly to a Grid Area. So without having to drag each of them from the bottom of the list of Unassigned Widgets. For details, please see `the documentation <https://documentation.aimms.com/webui/widget-manager.html#adding-a-widget-aimms-4-88-and-higher>`__.
-  The Table widget has a new 'Show Upload/Download Data Controls' option, with which you can control whether you allow your end-users to upload/download the table data. In case of sensitive data you would probably want to prevent this. The default of the option is Off, so please be aware that you may need to make some changes to your existing applications. For more details, see `the documentation <https://documentation.aimms.com/webui/table-widget.html#controlling-the-csv-and-excel-functionality>`__.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  In the WebUI it is now possible to select element variables as the contents of a table.

--------------


#############
AIMMS 4.87
#############


AIMMS 4.87.7 Release (August 23, 2022 - build 4.87.7.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Buttons on dialog pages with a scalar widget were larger than they used to be and the styles of the primary and secondary buttons were swapped.
-  In some situations, deleting widgets from a subpage could leave traces of it in the webui.json file.

--------------



AIMMS 4.87.6 Release (August 12, 2022 - build 4.87.6.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When a parent page was deleted, the child pages and its widget details were not removed from WebUI JSON file properly.
-  In tooltips in the Map widget, referring to the '/app-resources/resources/' path (for example, to include images in your tooltips, located somewhere in your WebUI resources folder) only worked in developer mode. When running the same model on PRO/Cloud, the path (and thus the files in it) could not be located. Other widgets which support tooltips will be adjusted similarly in future releases.

--------------



AIMMS 4.87.5 Release (August 12, 2022 - build 4.87.5.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We added a new predeclared `webui::IdentifierElementText` identifier (ranging over `AllIdentifiers`) that can be used to specify element text for identifiers in your WebUI. The application-specific 'properties' files were not sufficient to use element text while downloading an uploading Excel files from/to a table. For details, see `the documentation <https://documentation.aimms.com/webui/table-widget.html#excel-upload-download-support>`__. 

--------------



AIMMS 4.87.4 Release (August 8, 2022 - build 4.87.4.20).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Some improvements have been made to the function me::Compile(). Especially for the situation where runtime created sets and indices were re-created in between compilation attempts.
-  The EMPTY statement on a slice of an identifier, like for example EMPTY x(i,j,'k1'), could lead to a fatal error.
-  Time limits were not always handled correctly by the GMP Outer Approximation and Multi Start modules.
-  When using the command line argument --run-only, the PostMainInitialization and PostLibraryInitialization procedures were not run.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  WebUI widgets in which a non-default display-domain had been specified, did not update correctly after you changed an annotation of an identifier in the AIMMS IDE.
-  Item Actions (on Chart and Table widgets) that depend on Store Focus being processed *before* showing them, will now work as expected. Before, you inconveniently needed to left-click the item before right-clicking it to access the correct Item Actions.
-  When the Limited-Option-Editor option is set to True/1, the Combination chart widget now correctly only offers the Contents and Pivot tabs to end users.

--------------



AIMMS 4.87.3 Release (July 21, 2022 - build 4.87.3.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An error was wrongly triggered during library list modification using Library Manager: when a library prefix had the same name as an existing identifier in some module of the model, even though it was not visible globally but required the usage of its module's prefix.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  For chart types like Pie chart, Tree map and Gantt chart, we enhanced the readability of some colors of data labels displayed on top of similarly colored data elements.
-  The widget header buttons for the recently introduced "Upload and Download to/from Excel" feature now work properly from within Dialogs and Side panels too.

--------------



AIMMS 4.87.2 Release (July 15, 2022 - build 4.87.2.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Knitro would use a lower value than the specified time limit if it was using multiple threads.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Pressing the "Enter" key in the Add Widget wizard was incorrectly interpreted as a click on the Cancel button. Now the widget will be correctly added.
-  The option to convert a chart to a Combination Chart is now properly disabled if the "Combination Chart Widget" experimental feature is not enabled.

--------------



AIMMS 4.87.1 Release (July 11, 2022 - build 4.87.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Knitro version 13.1 is added. A major improvement in this version of Knitro is the parallel implementation of the branch-and-bound algorithm.
-  This AIMMS version adds functionality to do asynchronous solves (using GMP functionality) on the AIMMS Cloud.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The encoding for the function cp::Sequence was not always correct if the CP Optimizer option 'Sequence encoding' was set to 'Partial sum'.
-  The performance of the Cleandependents function has been greatly improved. Due to implicit use of this functionality by Aimms, this also affects some other statements. It is sometimes used as part of a solve statement, it is used when calling Empty on a set, and it is used when calling Empty on a part of an identifier (e.g. Empty myParameter(somesubsetindex)).

WebUI Improvements
+++++++++++++++++++++++++

-  The Table widget has been extended with block editing and copy/paste functionality as an Experimental Feature. For details, see `the documentation <https://documentation.aimms.com/webui/table-widget.html#block-editing>`__
-  A new color palette, consisting of 16 well discernible colors for most users, was introduced to replace the previously default 19-color palette. It will affect all Widgets that derive the coloring of their nodes from ordinal annotations: all Charts and the Map. The new palette also works better when using the Transparency Index option to create additional color variations for the Combination Chart. Please refer to `the documentation <https://documentation.aimms.com/webui/data-coloring-and-palettes.html>`__ to learn more about the new colors, about falling back to the previous 19, 11 or 7-color palettes and how this influences any custom data coloring that might be in place.

--------------


#############
AIMMS 4.86
#############


AIMMS 4.86.8 Release (July 6, 2022 - build 4.86.8.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In case of an unknown set range of one of the identifiers' declaration domain indices, an improved error message now also displays the identifier name instead of just 'The range "" does not represent an existing set.'.
-  Mathematical programs with violation penalties were generated incorrectly if the objective variable was not part of the set of variables.

--------------



AIMMS 4.86.7 Release (July 5, 2022 - build 4.86.7.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  While in the debugger, the tooltip on a suffix of a math program (for example: myModel.ProgramStatus) did not give the expected information.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When running a procedure from the WebUI, an error that is triggered but handled by the global error handler procedure will no longer pop up as an error message in WebUI.
-  Sometimes WebUI pages gave a unexpected error messages about 'AimmsMeOpenRoot()' and 'AimmsMeCLoseNode()' function calls.
-  Deleting values in a downloaded Excel sheet and then uploading the changes back to a WebUI table (which is available as an experimental feature) now results in resetting the value to its default (instead of resetting it to 0 or to the empty string).

--------------



AIMMS 4.86.6 Release (June 30, 2022 - build 4.86.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  For the experimental feature that allows uploading/downloading an Excel sheet to/from a WebUI table, we improved the handling of element parameter data in (a subset of) Integers: any dropdown will now correctly contain integers as numbers (instead of as string) and the error during uploading of integer data (as an element in (a subset of) Integers) was fixed.
-  Applying a 'top-n' filter in a WebUI table that contained identifiers for which one of the domain sets was empty could result in a crash.

--------------



AIMMS 4.86.5 Release (June 27, 2022 - build 4.86.5.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Excel upload/download WebUI feature has been extended with support for identifier with domain sets that use the `webui::ElementTextIdentifier` annotation: entries in the row and/or column header that have been translated using an element-text identifier are now downloaded (as they appear in the WebUI table itself). Of course, these translations are also taken into account during an upload of an Excel sheet.

--------------



AIMMS 4.86.4 Release (June 21, 2022 - build 4.86.4.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Logging for database ODBC execution was not showing correct timestamps: the logging entry on finishing will no longer appear as if it occurred before the start of the execution.
-  Interface attribute of runtime libraries could not be set via ``me::SetAttribute`` function.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Fast navigation using the Workflow panel could result in ``A procedure is already running`` error caused by page load/leave procedures. Now, after navigating via the Workflow panel, the panel rejects clicks for a short amount of time (<2s), such that the error cannot be triggered accidentally anymore. For longer running procedures the *Busy veil* will activate (as already usual).
-  Using the *Download Image - PNG* functionality to grab a 'screenshot' of a complete WebUI page could result in scrollbars being shown on certain widgets or areas. Since scrollbars in a static image have no use and only clutter the output, all scrollbars are now hidden in the screenshot images.
-  When Dialogs or Dialog pages were configured with many buttons (DialogActions) or buttons with substantially long labels, those labels risked being clipped. The buttons (not the labels) are now set up to wrap to more than one row if needed.
-  When editing binary (0-1) values in a downloaded Excel sheet (using the new upload/download WebUI feature), the Excel sheet used to issue a warning mentioning that 'the number in this cell is formatted as text'.

--------------



AIMMS 4.86.3 Release (June 15, 2022 - build 4.86.3.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We fixed a bug that only appeared in a very rare instance when resolving a model. Consider solving a mathematical program, say myMP, multiple times, with a variable v_X(i,j), and with the index domain condition p_dom_X(i,j) on that variable. When p_dom_X(i,j) has less elements in the second solve, some elements from the first solve in v_X(i,j) become inactive. Due to a bug, these inactive elements could incorrectly be set to 0. This is only an issue when the inactive elements are used in later computations, so when the elements of p_dom_X that were first removed, are restored again and the now active elements of v_X are needed.

--------------



AIMMS 4.86.2 Release (June 10, 2022 - build 4.86.2.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When entering numerical values in WebUI widgets, the validation is now based on the browser locale.
-  Upon starting up an AIMMS model in 4.86, three warning messages about replacing tabs with '\\t' were displayed for code in the WebUI library.

--------------



AIMMS 4.86.1 Release (June 9, 2022 - build 4.86.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  In the Debugger menu there is a new command "Break on Error". If this command is checked, then whenever an error is triggered during the execution of a statement, the debugger automatically breaks on that statement. This allows you to more easily inspect the cause of an execution error as you can look at all the data that is used in that statement. This new feature only applies when the Debugger is already enabled.
-  Octeract has been upgraded to version 4.3.
-  The Data Management style using "single data manager file" is no longer available from this version onwards. It has been a deprecated feature for many years. If your application is still built upon this style, you should make some modifications to use the style that works on separate case files. To make these modifications it is recommended to use an earlier version of AIMMS, toggle the style to "files and folders" and make all adjustments there. After that you can switch to this latest AIMMS version.

WebUI Improvements
+++++++++++++++++++++++++
-  The WebUI Table widget has been extended with the possibility to download the Table data to an Excel file. It is also possible to upload data from an Excel file to a WebUI Table. This is currently released as an `Experimental Feature <https://documentation.aimms.com/webui/experimental-features.html#experimental-features>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Models with very large finite variable bounds (in absolute sense) were sometimes handled incorrectly by the AIMMS Presolver. The new option 'Presolve numeric switch' specifies whether the AIMMS Presolver should focus on numerical accuracy. At the default setting of this option, AIMMS makes an automatic choice based on the matrix coefficients and variable bounds.
-  When reading data from an input file, from now on range violations of variables will result in warnings as long as the option 'warning variable range violation' is not set to off.



--------------


#############
AIMMS 4.85
#############


AIMMS 4.85.7 Release (June 7, 2022 - build 4.85.7.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When scrolling down fast in a WebUI Table, it sometimes happened that the table cells were not aligned properly with the row header cells.

--------------



AIMMS 4.85.6 Release (June 1, 2022 - build 4.85.6.21).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The scaling algorithm, activated by switching on the option 'Scale model', could calculate incorrect scaling factors if the combination algorithm was used.

--------------



AIMMS 4.85.5 Release (May 16, 2022 - build 4.85.5.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If a procedure in a Module is added to the public section of that Module, then using pro::DelegateToServer inside that procedure did not always work correctly.

--------------



AIMMS 4.85.4 Release (May 6, 2022 - build 4.85.4.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  After releasing the new AIMMS theming with 4.85.1, we accidentally changed the color of read-only table cells and scalar values into a very light color, making them look 'disabled' instead. This error has been corrected and should render lists of read-only values much more readable again.

--------------



AIMMS 4.85.3 Release (May 5, 2022 - build 4.85.3.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In sets that were constructed via a collection of element parameters, which in turn were defined as a fixed element, an incorrect error about a "cyclic definition" was triggered.
-  When a parameter had a definition using scalar element parameters, and was at the same time used in the "Order by" attribute of the set being the range of those element parameters, then this parameter could erroneously stay empty after its definition evaluation.

--------------



AIMMS 4.85.2 Release (April 20, 2022 - build 4.85.2.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In the Project Settings dialog box, options were incorrectly displayed as 'at default' because in the comparison of an option value with its default value it used the absolute and relative tolerance options.
-  The global-custom-prop-constants.css file was not present in the AIMMS Installation folder, as described in the Theming documentation.

--------------



AIMMS 4.85.1 Release (April 12, 2022 - build 4.85.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  The CPLEX options 'Node file size' and 'Tree memory limit' have been renamed to 'MIP tree memory limit' and 'Working memory limit' respectively. AIMMS can still read in the old option names but will use the new option names if the project is saved.
-  The progress window information for BARON has been changed such that it is more inline with other solvers.
-  The layout of the Math Program Inspector tool is now remembered when you close and re-open the tool. This holds for both the sizes of the sub-windows and the sizes of the columns in the various lists. This new feature can be disabled via the option MPI_Remember_Layout in the Project Options.
-  The new global solver Octeract has been added. Octeract can be used to find a global optimal solution for NLP, MINLP and non-convex quadratic or quadratically constrained problems. Octeract can handle models with trigonometric functions. Currently Octeract is only available for Windows.
-  If an expression contains a reference to a Macro, it can now be handled by the new compiler and execution engine.
-  AIMMS Postsolve is now less strict on bound violations of continuous variables. The new option Postsolve Bound Tolerance specifies the allowed bound violation, and uses a default value of 1e-10. Set this option to 0 to get the old behavior.
-  Most of the simple procedure call statements in a body of a procedure or function are now handled by the new compiler and engine. Because of that it may happen that your model produces more warnings for "uninitialized data", which are valid warnings but somehow they were not noticed before. Besides these extra warnings, there should be no difference in how a model behaves because of this change.
-  CPLEX 22.1 has been added.
-  CP Optimizer 22.1 has been added. CP Optimizer 22.1 comes with a new experimental local search method which works best on lightly constrained problems. It is activated by setting the CP Optimizer option 'Search method' to 'Neighborhood'.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The Math Program Inspector did not handle semi-continuous variables correctly.
-  Passing MIP starts to Gurobi using the procedure GMP::Solution::SetMIPStartFlag did not work.
-  Setting the BARON option 'Thread limit MIP' to a nondefault value did not have any effect.
-  Using the function :any:`SubString` within a Macro definition could lead to unexpected results.
-  Negative variable bounds and right-hand-side values were missing the minus sign if they were printed by activating the CPLEX 20.1 options 'Find fractional root solution' and 'Write cuts'.
-  AIMMS did not print the scaling factors (in the listing file) if the Scaling Tool in the Math Program Inspector was used and the Solvers General option 'List scaling factors' was set to 'Automatic' or 'Symbolic'.
-  A postsolve with CPLEX could take very long for large models because passing the model updates was not done efficiently. (These updates are now controlled by the existing CPLEX option 'Updates batch size'.).
-  The deprecated solver AOA has been removed from the AIMMS installation. As a result, the math program suffix 'CallbackAOA' has been removed and the OuterApproximation module is no longer available as a system module. To solve MINLP problems using the outer approximation algorithm you should use the GMP-OA version.
-  The OnError clause of a Block statement behaves like a loop. For every error and/or warning triggered, the statements in the OnError are executed. Because of this, it is allowed to use Skip, Break and Loopcount inside an OnError. However, using Loopcount always returned 1, no matter how many errors or warnings were iterated.

WebUI Improvements
+++++++++++++++++++++++++

-  WebUI now offers a fully new and simpler way of theming your application. For details, see `the documentation <https://documentation.aimms.com/webui/theming.html>`__.
-  The Combination Chart widget has been greatly extended. In the previous release, just the Column chart was supported. Now it also supports the Area, Area Spline, Line, Scatter and Spline chart types.
-  Existing Bar Chart, Line Chart and BarLine Chart widgets can now automatically be converted into the new Combination Chart widget. Please see `the documentation <https://documentation.aimms.com/webui/combination-chart-widget.html>`__ for details.
-  In the Combination Chart widget, it is now possible to hide specific indexes from being displayed.
-  In the Combination Chart widget, it is now possible to specify an interval for the X-axis label.
-  In the Combination Chart widget, there are better coloring options by using the coloring index and the transparency index.
-  Combination Chart Widget now supports a secondary y-axis.
-  Tooltips are now also supported on the Selectionbox, Multiselect and Legend widgets, by using a Tooltip Identifier for the relevant identifier(s) in your model.
-  Some options for our new Combination Chart widget have been renamed in the webui.json file. Existing webui.json files will be automatically updated to reflect the changes upon opening of the project. Please note: The option names as shown in the UI (i.e. the option editor) will *not* change.

--------------


#############
AIMMS 4.84
#############

AIMMS 4.84.8 Release (April 8, 2022 - build 4.84.8.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  It was possible to add elements to the set AllTimeZones. This led to errors when trying to access the (nonexistent) underlying time-zone information. Adding elements to this set is not allowed anymore.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The dropdown of a scalar widget value that called for a selection box will no longer become misplaced in the upper-left corner when the widget is refreshing while the dropdown contents is still loading. This could happen if you clicked fast enough to open the dropdown while the page and model were still resolving.

--------------



AIMMS 4.84.7 Release (April 1, 2022 - build 4.84.7.8).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When saving a case file to a location on a network drive, AIMMS did not give any error message if the location did not exist or if it was not writable.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We removed the (harmless) 'data not initialized (default values are used)' warnings when opening a WebUI project.

--------------



AIMMS 4.84.6 Release (March 10, 2022 - build 4.84.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  After editing AIMMS project files outside of the IDE and then opening the project in AIMMS Developer mode, duplicate procedure names could be erroneously accepted by AIMMS.

--------------



AIMMS 4.84.5 Release (March 8, 2022 - build 4.84.5.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Widgets could not always be placed on dialog pages and dialog pages were sometimes displayed far smaller than their prescribed size.

--------------



AIMMS 4.84.4 Release (March 3, 2022 - build 4.84.4.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In recent AIMMS versions, the custom theme switcher (the :token:`theme-switcher-addon.js`) was removed. Now we have added the "Custom Theme Classes" option to the WebUI application properties. Customers with the old :token:`theme-switcher-addon.js` in their apps can remove it, as this no longer works: the same functionality should now be specified through the new option.
-  Some symbols, like '|', were not giving the expected behavior when used in strings specified in a WebUI Table filtering rule, because they were not treated as normal string characters, but as special symbols in a regular expression. We have now changed the behavior of the string filtering: in all existing string filtering rule types (like "contains", "starts with", ...) characters are treated as their literal string value. On top of that, we added an extra string filtering rule type: "matches regex". This rule allows you to explicitly specify regular expressions, just like in any other search box within the WebUI.
-  In later AIMMS versions (4.83 and higher), it could happen that WebUI Gantt Charts were empty, whereas they displayed normally in AIMMS 4.82.

--------------



AIMMS 4.84.3 Release (February 23, 2022 - build 4.84.3.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The model information in the progress window was not always correct if the math program was scaled after activating the Solvers General option 'Scale model'.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Due to small changes in the CSS, screenshots of pages with scrolled contents were clipped.
-  AIMMS could crash when displaying a domain for a multidimensional identifier with (a specific type of) an expression used in an index domain condition.
-  Public identifiers in modules were not accessible/selectable from within WebUI widgets.

--------------



AIMMS 4.84.2 Release (February 11, 2022 - build 4.84.2.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some cases valid UTF-32 characters were wrongly rejected by the :any:`character` intrinsic function.
-  In the Find All dialog box you can now use the name completion feature on identifier names.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When toggling the 'Hide Labels' option in a Map widget, hidden or inactive Arcs could be displayed.
-  Widget titles can now occupy the whole available width of the toolbar. The icons on the right of the toolbar are now hidden per default. Only when the widget is hovered over, they will become visible and the title is shortened to make space for them.
-  Combination Chart elements could get cut off on the right side when used on a workflow page.

--------------



AIMMS 4.84.1 Release (January 31, 2022 - build 4.84.1.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  A case-dot expression now executes much faster if the order of the running indices is not such that the case index is the first index. This could happen quite easily when the case index was used as an iterative index, like in:  ``maxPinCases(i,j) := max(IndexCases, IndexCases.P(i,j))``.
-  The AIMMS Presolve will now apply dual reductions by default, as controlled by the new option 'Presolve Dual Reductions'. Dual reductions remove feasible or even optimal solutions while guaranteeing that at least one optimal solution remains.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The predefined set AllSolvers could contain more solvers than the solver configuration (besides NETSOL).
-  Switching on the option 'Linear presolve' did not always enable the AIMMS Presolver for linear models.

WebUI Improvements
+++++++++++++++++++++++++

-  We added a new widget type as an experimental feature: the Combination Chart. It allows the displaying of several chart types in one single chart. The first version is restricted to the Column Chart type, but it also offers cool features such as a clear legend which can be easily toggled on or off and to display/hide data points, zooming in on your data and many more. For more details, see `the documentation <https://documentation.aimms.com/webui/combination-chart-widget.html>`__.
-  We added support for OAuth2 Authorization Code flow in WebUI applications running on the PRO/Cloud platform (this requires PRO/Cloud platform version 2.41+, DEX 1.3.0.24+).


Resolved WebUI Issues
+++++++++++++++++++++++++

-  Grid Layout Dialog pages (the default dialog type) received new positioning and sizing logic that no longer allows them to go partially off-screen.
-  Selection Box widgets could become empty when the option 'UI editable' was set to false when running your app on PRO/Cloud.

--------------


#############
AIMMS 4.83
#############


AIMMS 4.83.11 Release (January 26, 2022 - build 4.83.11.3).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Some edit operations on the annotations in the model editor were not correctly saved, especially in combination with the usage of the Source File attribute.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The performance of the Map widget, when displaying a huge number of nodes (tens of thousands), has been improved.

--------------



AIMMS 4.83.10 Release (January 19, 2022 - build 4.83.10.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Functions like :any:`Round`/:any:`Ceil`/:any:`Floor` could have quite unexpected results if the argument involves unit analysis, but the resulting unit is commensurate with the unitless unit [-]. In such situations these functions now behave as if the argument has no unit at all.
-  A strange incorrect error popped up during compilation (which was gone again after recompiling). This no longer happens.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  If you were trying to edit the content of Text Widget in narrow widget areas, like in a Side panel, the editor's toolbar on top was overlapping (top of) the content. Moreover, any content shown in Text Widgets within Side panels will now have some padding to achieve a more pleasing alignment with other elements. Please note that this will of course reduce the amount of content shown without scroll bars inside the widget.

--------------



AIMMS 4.83.9 Release (January 18, 2022 - build 4.83.9.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When reading new elements into a set via a database read, the elements did not always have the correct casing. If an element already existed in another set, but with different casing, it would just use that existing name.
-  When a database procedure was called, not all its dependencies were updated.
-  Attempting to connect to a data source without a name did not report an error but silently stopped execution of the remainder of the running procedure.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We did a minor tweak to the readability of some input and search fields by creating a higher contrast between text and background colors.

--------------



AIMMS 4.83.8 Release (January 6, 2022 - build 4.83.8.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In a stochastic model a recompilation of the model after a 'commit namechanges' sometimes resulted in a crash.
-  In an assignment statement where an identifier appeared both at the left and the right hand side of the assignment, using a domain condition with a '(not Index in Set)' could sometimes result in a crash.

--------------



AIMMS 4.83.7 Release (January 4, 2022 - build 4.83.7.8).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The outlines/strokes, or the actual line, of a Line-, Bar-, Bar-Line-, Gant- and Pie-chart could remain invisible if no annotations were applied to the graph's data.
-  If you were using a custom stylesheet to customize the colors of lines in the Line or Bar-Line chart and if the used CSS classes were not only targeting the stroke but also the fill (probably for re-use for other chart types with the same annotations) then your line would also receive an unexpected area fill. We changed (back) our own internal styling of those charts to specifically prevent this, without you having to change your custom stylesheet.

--------------



AIMMS 4.83.6 Release (December 22, 2021 - build 4.83.6.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  While creating new element names via the AIMMSApi (for example in the Data Exchange library) there was an incorrect check on 'what is a valid unicode character'. This check resulted in a severe internal error.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Slider widget will no longer allow you to edit, nor suggest that you can edit data that is read-only.

--------------



AIMMS 4.83.5 Release (December 17, 2021 - build 4.83.5.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In the WebUI you could get incorrect errors on "This identifier is already in use as a keyword" while just opening an option editor for the first time.
-  In the Table filter dialog, the part with the 'Clear All Filters' was not displayed in the expected style anymore.

--------------



AIMMS 4.83.4 Release (December 13, 2021 - build 4.83.4.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Checking assertions within a for loop was not always working correctly.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Special values (e.g. 'inf') in WebUI could trigger some false, empty (and therefore confusing) warnings.
-  Sometimes a WebUI Table pushed outside the reserved widget space or outside its own area from the grid layout. This could result in the Table slightly overlapping with another widget from a neighboring area.

--------------



AIMMS 4.83.3 Release (December 10, 2021 - build 4.83.3.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In some situations, the error message 'Unable to mark current tab active in model due to an unspecified error' could unexpectedly appear in the WebUI.

--------------



AIMMS 4.83.2 Release (December 8, 2021 - build 4.83.2.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  A scalar identifier with a domain condition that consists of a multi-dimensional identifier with all indices fixed, was giving errors when used in an expression.
-  During a case load the (peak) memory usage was growing a bit too fast. Now some of the (temporary) needed memory is returned to the operating system during the read and not only at the end.

--------------



AIMMS 4.83.1 Release (November 26, 2021 - build 4.83.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Gurobi 9.5 (version 9.5.0) has been added. Gurobi 9.5 comes with performance improvements for LP, MIP, MIQP models and for convex and non-convex MIQCP models.
-  The new procedure :any:`GMP::SolverSession::GetIIS` can be used to retrieve an irreducible infeasible set (IIS) for an infeasible math program. It returns the row and column numbers of the rows and columns in the IIS. The IIS will be calculated by the solver and is supported by CPLEX, Gurobi and BARON.
-  By using the new CPLEX 20.1 option 'Find fractional root solution' you can instruct CPLEX to find and return the fractional solution after exploring the root node in the branch-and-bound tree of a MIP solve. It can be useful to analyze this fractional solution to improve the formulation of a MIP problem, aiming to reduce the solving time. This new option can be combined with another new option, named 'Write cuts', which can be used to write the cutting planes, found by CPLEX at the root node, to a file, while possibly also writing the presolved model. Both options can be found in the new category MIP Advanced.
-  For most GMP procedures that can be used to modify columns, rows or coefficients, a 'raw' variant has been added which uses a set of column and/or row numbers as input.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  New HSL option values have been added for the IPOPT option 'Linear solver selection'.
-  The function :any:`GMP::Instance::CreateBlockMatrices` did not always generate correct block GMP's if no block value was specified for some of the (non-objective) variables.
-  The system libraries AIMMSXLLibrary and AIMMSForecasting are no longer shipped as system libraries. For some time already the latest versions of these libraries were also available as Repository libraries. If your application uses either of these two system libraries, the application is now automatically modified to use the corresponding Repository library.

WebUI Improvements
+++++++++++++++++++++++++

-  You can now add custom HMTL tooltips to the Bubble chart axes title, that can help convey additional information about these axes.
-  WebUI improved the handling of the special values 'inf' and '-inf'. WebUI will display those and is able to use them in totals. However, if a total contains both 'inf' and '-inf' the result is undefined (following the logic AIMMS itself uses). In addition, you will be able to input 'inf' and '-inf'.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  If you had selected (or kept, instead of converting it to Grid Layout) a Classic Layout for your page, then the previews of the layouts in the Page Configurator would not automatically scroll to the right part of the list, making it less clear which layout was active.

--------------


#############
AIMMS 4.82
#############


AIMMS 4.82.9 Release (November 24, 2021 - build 4.82.9.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The unit analysis for the modulo function, :any:`mod(x,y) <mod>` , now demands the same quantity for x, y and its return value. Previously the unit of x was incorrectly divided by y which, even with unit checking disabled, may have given wrong results if non-base-units were used in the modulo function.

--------------



AIMMS 4.82.8 Release (November 23, 2021 - build 4.82.8.9).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The first time during a day that the right mouse menu in the model editor was used, AIMMS could be unresponsive for some seconds. This was because of the preparation of the "Help On" sub menu that needs to communicate with the online manuals. This preparation has now been moved to the startup phase of AIMMS (in a separate thread) so that you will probably no longer notice this delay.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Button widget did not show any Grid pages in the PageLinks dropdown option.
-  When renaming the current page, the page became empty. Only after a refresh the contents reappeared.

--------------



AIMMS 4.82.7 Release (November 15, 2021 - build 4.82.7.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In rare cases, opening a model could yield an incorrect "range violation" warning.
-  Reading a runtime identifier from a case file using the case-dot notation (like in ``caseIndex.runtimeLibPrefix::runtimeIdentifier``) did not result in any data being read from the case file.
-  The data of runtime identifiers is now always included in a case file, unless this is explicitly disabled via the property 'NoSave'. When reading back such a case these runtime identifiers should be present, otherwise the corresponding data in the case file is just ignored.
-  Although it is not used that often, a scalar identifier can have a domain condition (specified like this: " | ``myCondition`` "). This condition was not always applied correctly during execution.
-  For procedures with a large number of arguments (like :any:``pro::sessionmanager::ListSessionsSinceDate``) the tooltip text was not displayed correctly.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  In some situations, dragging jobs vertically in a Gantt chart could lead to a too sensitive movement in the Gantt chart widget. We addressed this issue such that the Gantt chart vertical movement is now consistent with the dragging of the jobs.
-  It could happen that the `webui::FlagsIdentifier` was not correctly taken into account when combined with a 'display-domain' in a WebUI widget.

--------------



AIMMS 4.82.6 Release (October 27, 2021 - build 4.82.6.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The function :any:`Round` when handled by the new compiler and engine had a small difference compared to the implementation in the old engine. In some rare situations where both implementations were used next to each other this could lead to wrong results. Now both the new and the old engine use the exact same implementation to do the rounding.
-  The intrinsic functions :any:`Character` and :any:`CharacterNumber` now also support the Unicode characters in the range U+10000 to U+1FFFF.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Double clicking on an item on the status bar which has a procedure behind it could lead to an unexpected error.
-  The Node and Arc Sets Options of the Map Widget are now more relatable, as the Set's title reflects the name of its main identifier instead of 'Node.0'.
-  The Classic layout on the Page Manager has been moved to the back. Previously, it was the first option, but we want to encourage the use of the true Grid layout.

--------------



AIMMS 4.82.5 Release (October 19, 2021 - build 4.82.5.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In version 4.81.5 there was a change in which identifiers that were depending on AllDataFiles were excluded from a case save operation. This turned out to be a bit too rigid. Now AIMMS only excludes an identifier from a case if (1) it is a subset of :any:`AllDataFiles`, (2) any of its domain sets is a subset of :any:`AllDataFiles`, or (3) if the set range is a subset of :any:`AllDataFiles`.
-  The functions ``AimmsMeFirst`` and ``AimmsMeNext`` did not work correctly if you tried to enumerate nodes in a model that has 'unnamed' declaration sections in it (that is Declaration Sections with just the name "Declaration").

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When creating or renaming a page we will no longer append '_1' to the underlying page name if it is not needed.
-  `webui::FlagsIdentifiers` annotations were not taken into account correctly when the identifier was displayed in 'compare-case' mode.
-  In some rare cases, opening a dialog page could inadvertently lead to unassigning widgets from the grid areas in the underlying page. The assignment of widgets to grid areas is now preserved in such situations.

--------------



AIMMS 4.82.4 Release (October 14, 2021 - build 4.82.4.25).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In AIMMS 4.82 and above, you could get an incorrect error message about a cyclic definition when introducing a set definition equal to the union of some subsets (``parentSet = subSet1 + subSet2``). This happened only in the same session where you edited the set's definition attribute, so the error was not there after re-opening the model. 
-  If a set has a definition equal to the union of some subsets (``parentSet = subset1 + subset2``) then the content of that set can be changed by changing the content of either of these subsets. If this definition was removed then it was sometimes still possible to change the set via its subsets.
-  The AIMMS API could not deal with data defined over non-existing elements provided by CDM in particular situations.
-  If the solve of a MIP problem was interrupted inside a time callback then the solve of the postsolve problem (if any) would also be interrupted.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Ignoring the 'special values in WebUI are not supported warning' could lead to loads of these warnings being sent at the same time, which could eventually lead to a crash.
-  There were some issues with editing group widgets: they could not be edited anymore and buttons in edit mode of group widgets displayed erratically.
-  We addressed an unexpected warning message about ``webui::ClientBrowserName`` that users occasionally encountered when opening an empty WebUI page.

--------------



AIMMS 4.82.3 Release (October 4, 2021 - build 4.82.3.29).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The procedure attribute 'Uses runtime libs' (introduced in AIMMS 4.82.1) has been included in the set :any:`AllAttributeNames`.
-  The statement ``Empty myDatabaseTable;`` did not first update any of the attributes of the Database table. This could lead to the situation that for example the string parameter holding the data source name was still empty.
-  When deleting a definition of a parameter or set it could happen that you got errors that the identifier seemed to still have a definition.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The Table widget underwent some refinements in the way it deals with the row and column sizing, which should help in keeping their styling consistent and dependable across the entire table. At 100% browser zoom, custom sizes might be one pixel more or less now. At other zoom levels, rows and columns no longer grow quadratically (so 150% zoom would result in rows being 2.25x as high. Now 1.5x as you would expect), which you will notice in the data/labels showing in existing apps where you had a tight fit. Moreover, we've made sure that scroll bars allow you to reach all of your data, also when the Table is shown in a very small area. And finally, the indicators (fading to white) that show whether there are more rows or columns outside your current viewport position, now work correctly.
-  The redirects you set up for Workflow steps could be bypassed if your Workflow's pages were nested in a certain way and if you then used the breadcrumb to navigate to a parent page. You will now correctly navigate to where Workflow restrictions should take you.
-  When having the Sidebar open to show anything else than the Page Navigator or the Widget Manager (i.e. the Case Manager or the Experimental Feature toggles), we no longer show the names and borders of the widget areas on a page with Grid Layout.
-  Selecting an item from a Legend with read-only contents will no longer result in an error and unclickable items. Behavior for writable contents has not changed.


--------------



AIMMS 4.82.2 Release (September 22, 2021 - build 4.82.2.13).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If an identifier has a unit specification containing an expression over an indexed unit parameter (as in: ``[m]/myUnitParam(i)``), you now get a warning when you try to display this identifier in the WebUI. The reason for this is that the unit analysis implementation in AIMMS is not yet capable to deal with the multi-threaded way that WebUI retrieves the data, resulting in internal errors. To work around this limitation, you can create a new unit parameter: ``myUnitParam2(i)`` with the definition ``[m]/myUnitParam(i)``, and then use this new unit parameter as the unit of the identifier that you want to display in the WebUI. If you ignore this new warning, the data will now be displayed as if no unit was specified.
-  AIMMS cannot handle constraints that contain conditions (using $ or | operators) that have references to stochastic identifiers. When such a condition was used inside the iterative operator SUM, no error message was given but it did not work as expected. Now you do get the error message when the condition in a SUM contains stochastic references.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We improved the creation of expressions to calculate totals over WebUI identifiers (that are specified as content of a widget) that have been equipped with a display-domain. Without this improvement, this could sometimes lead to tooltips not being displayed for widgets, for example.


--------------



AIMMS 4.82.1 Release (September 15, 2021 - build 4.82.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  Procedures now have an additional attribute: 'Uses runtime libs'. A procedure with this attribute specified can use identifiers of the indicated runtime libraries, as long as they exist when the procedure is called. Model editing procedures are prohibited within procedures that use this feature. More information can be found `here <https://documentation.aimms.com/language-reference/advanced-language-components/model-structure-and-modules/runtime-libraries-and-the-model-edit-functions.html#rubric-runtime-usesruntimelibs>`__.
-  An optional argument, called ``feasTol``, was added to the procedure :any:`GMP::Solution::Check`. This argument is used to determine the feasibility tolerance used by this procedure. If a constraint violation is smaller than this tolerance then it will be ignored. If this argument is not passed, or if it is set to a negative value, the option 'Constraint Listing Feasibility Tolerance' is used as the feasibility tolerance.
-  The function :any:`GMP::Instance::GenerateStochasticProgram` now generates stochastic rows for all scenarios (instead of only for the representative scenarios), if the generation mode equals 'CreateNonAnticipativityConstraints'.
-  The analysis of using non-initialized identifiers inside a definition evaluation has been improved. This may lead to some new warnings in existing models. 
-  You now get an error on parameters with a definition where the property Stochastic is irrelevant, because the definition is not referring to any other stochastic identifier.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Empty indicator constraints were sometimes incorrectly marked as infeasible during generation.
-  A quadratic constraint could be generated incorrectly if it contained two (or more) quadratic terms that would cancel each other out, e.g., x * y - x * y.
-  There was a problem with retrieving AIMMS PRO User Group information during solver sessions.
-  When reading an identifier from a case file using the case-dot notation, AIMMS did not respond correctly when in between these reads the underlying case file was overwritten. It could lead to all kinds of case read errors.


WebUI Improvements
+++++++++++++++++++++++++

-  Downloading widget contents as a PNG is now available for the Map widget as well and will be a General Availability feature (no more an experimental feature). You can use it by clicking the camera icon in the widget header.
-  Selection Box V2 is now available as a General Availability feature (no more an experimental feature).
-  The Application Manager is now the default option to manage pages and widgets on these pages. There are some noticeable changes from the first iteration which was released under the experimental features.
   1. Widgets under the page are now grouped under a section "Widgets on page" which is expandable and collapsible.
   2. You can see the count of widgets on each page in the "Widgets on page" node.
   3. When a widget is pasted the destination node is expanded.
-  This AIMMS version provides the ability to remove a wizard from the new App Manager (so that the wizard function can be replaced by a workflow).


Resolved WebUI Issues
+++++++++++++++++++++++++

-  Identifier name changes in AIMMS did not reflect in the WebUI for the Map widget.
-  Group widgets can not be added anymore as they are deprecated.


--------------



#############
AIMMS 4.81
#############


AIMMS 4.81.7 Release (September 9, 2021 - build 4.81.7.8).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

WebUI Improvements
+++++++++++++++++++++++++

-  We added support for custom tooltips to the :ref:`Button <button-widget-custom-tooltip>`, :ref:`Upload <upload-widget-custom-tooltip>` and :ref:`Download <download-widget-custom-tooltip>` widgets.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In rare situations, when the runtime unit analysis was executing a statement, AIMMS could give an incorrect warning on a unit mismatch. Runtime unit analysis (as opposed to compile-time unit analysis) is needed when an expression contains references to unit parameters that are not tied to one specific quantity.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  We improved support for setting and handling infinite values ('INF' and 'MININF') in the WebUI.
-  For a project with the Case sensitive element comparison turned on, the WebUI library could issue some errors/warnings caused by invalid casing of hard-coded references to elements in the set :any:`AllAttributeNames` and :any:`AllIdentifierTypes`.


--------------



AIMMS 4.81.6 Release (August 26, 2021 - build 4.81.6.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Downloading a CSV file from a WebUI table which contained values with more than 20 decimals did not work properly.
-  The notification dialog got two scroll bars if there were several notifications.
-  It was not possible to scroll using the mouse wheel in a multiline Scalar widget when it contained more than one identifier.
-  The appearance of the selection box has been made consistent across all page types.


--------------



AIMMS 4.81.5 Release (August 17, 2021 - build 4.81.5.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  There is a new option 'case_save_defined_identifiers'. If you set this option to 'Off' you easily exclude all identifiers with a definition from a case during saving. When you only create cases for standard save and load sequences and not use any of the multiple case comparison features in the language or WebUI, this option may help to decrease both the time to write a case file and the size of a case file.
-  When saving a case, any identifier that (indirectly) depends on the pre-defined set :any:`AllDataFiles` or :any:`AllCases` will no longer be included in the case. Besides that this gave unexpected errors during the save operation, it seems rather useless to store data of other cases inside a case and it is not really defined how this data will be read back. If you encounter problems with this new behavior, please let us know.
-  The optional argument ``evalInline`` has been added to the procedures :any:`GMP::Solution::SendToModel` and :any:`GMP::Solution::SendToModelSelection`. It can be used to disable the evaluation of inline variables (if any).

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When running a WebUI app in the cloud, it will not correctly listen to changes in the browser's language setting. A browser refresh is still required to apply the changes on the browser page (e.g. changes in number formats). Previously, even a browser refresh did not help. In non-cloud mode, this has always been working fine.



--------------


AIMMS 4.81.4 Release (August 4, 2021 - build 4.81.4.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  If you assign a fixed height widget like the button, compact scalar, label, etc. to a grid with "``gridAutoFlow``": "``row``" and when the visibility of the widget is toggled from visible to hidden, other widgets assigned to the respective grid will not be distributed correctly. Until this matter is addressed in future software versions, the usage of hidden widgets in this specific scenario is not recommended for the time being.
-  Removed/resolved some uninitialized data warnings for some runtime identifiers that are created when you use WebUI Forms.
-  The side panel tab will stay open when the ``displayText``, ``tooltip``, ``icon``, or ``iconcolor`` are changed/updated. Only when the ``pageId`` or ``state`` are changed/updated an open side panel will collapse.
-  The side panels now listen to the ``state`` property that determines the visibility of the side panel tab. ``Active`` (displayed and clickable) and ``Hidden`` (not displayed).

--------------


AIMMS 4.81.3 Release (August 2, 2021 - build 4.81.3.15).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Writing a case file with the option value 'Case_Compatibility' set to the new value 'AIMMS_4_80' did not always produce a correct case on Linux.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Performance has been improved when using the WebUI Option Editor to define a slice over a set with a huge number (in this case around 750.000) of elements.
-  If you use an identifier to configure the visibility of a page, this configuration will now be persisted correctly.
-  Fixed the console error that a Map would issue when the Heatmap data was empty and the visibility of the heatmap was changed.
-  For element parameters over a calendar, AIMMS WebUI will now first look at a `webui::ElementTextIdentifier` to determine its display value. Only if not specified, the timeslot format of the calendar (or any timeslot format from a convention that overrides the timeslot format of the calendar at hand) will be used.
-  The `webui::ElementTextIdentifier` annotation is now also considered for element parameters over calendars. This annotation will prevail over any timeslot format (either of the calendar itself or the `webui::ApplicationConvention`).
-  Restored the ability to scroll the contents of Side Panels when the content length requires it, using a scroll bar.
-  Because toggling the visibility of a widget could lead to 'stale' Option Editors, the editor will now close whenever you edit widget visibility.
-  When navigating from pages with Workflow to ones without it, Grid Layout pages now properly use all screen real-estate again.
-  If you were using Side Panels with Grid Layout and the Side Panel contained a Selection Box V2, then you were (wrongly) warned about incompatibility of that combination. This will no longer occur.
-  .. raw:: html 
   
    <strike> 

    If you assign a fixed height widget like the button, compact scalar, label, etc. to a grid with "``gridAutoFlow``": "``row``" and when the visibility of the widget is toggled from visible to hidden, other widgets assigned to the respective grid will not be distributed correctly. Until this matter is addressed in future software versions, the usage of hidden widgets in this specific scenario is not recommended for the time being. 
      
   .. raw:: html 
    
    </strike>

.. note:: The release notes have been updated. The last bullet point will be part of the next Hotfix release and is not present in this Hotfix release.

--------------


AIMMS 4.81.2 Release (July 14, 2021 - build 4.81.2.9).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Item actions on the Scalar widget with a Display Domain active did not work correctly in some scenarios.
-  Since the Export-To-Image feature was incorporated, the pipe icon separating the widget actions & Filter buttons from the rest of Widget header section buttons was missing.
-  Selectionbox-v2 now correctly occupies (less) space again when used on a Grid Layout page/dialog/side panel, and within a grid area with the widgets stacked in rows. We've also addressed some minor visual issues and text translations that were seen around some features/widgets when used in combination with Grid Layout.


--------------


AIMMS 4.81.1 Release (July 7, 2021 - build 4.81.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

AIMMS Improvements
+++++++++++++++++++++++++

-  A new option, called "Use Quadratic Structure", was added to the Solvers General category. If this option is active, quadratic structures are passed to Knitro 12.3 or higher versions. See the AIMMS Help for more information.
-  This AIMMS version adds functionality to run Gurobi on the AIMMS Cloud using the new Gurobi `Web License Service <https://www.gurobi.com/web-license-service/>`__. The new procedures :any:`GMP::Solver::SetEnvironmentStringParameter` and :any:`GMP::Solver::SetEnvironmentIntegerParameter` can be used to specify the required connection parameters. See the `AIMMS Cloud documentation <https://manual.aimms.com/cloud/gurobi-support.html>`__ for more information.
-  If the coefficient matrix of a math program contains several independent block submatrices then the new function :any:`GMP::Instance::CreateBlockMatrices` can be used to decompose the math program into several generated math programs, each containing an independent block submatrix. Each of these blocks can be solved separately, and by combining the solutions of these blocks a solution of the original math program can be obtained. This approach can be more efficient than solving the original math program.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In rare cases the AIMMS Presolver did not handle quadratic constraints correctly.


WebUI Improvements
+++++++++++++++++++++++++

-  The Grid Layout for WebUI pages was already available as an Experimental Feature since AIMMS 4.75, but with the release of AIMMS 4.81, it has become the default way of organizing your pages. 

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When an identifier name was very long it did not fit in in the identifier selector properly.
-  The Page Configurator, where you choose your Classic Layout or Grid Layout templates, will now accurately show which template is active for the current page, moving the layout carousel to the correct page for both custom and standard layouts.
-  Both the titles/tooltips and the header texts of Side Panel tabs will now be translated by either the default or your own translation resources. Please note: if your 'simple' tab titles are present in any of those resources, you might now end up with an unexpectedly 'translated' text. However, it also means you can finally adapt them to your users' language settings.


--------------




#############
AIMMS 4.80
#############

AIMMS 4.80.4 Release (June 30, 2021 - build 4.80.4.14).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  An index without a scope in an 'IN' construction was not always recognized as such. Now, the appropriate compile error is given.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When having item actions on two pages and triggering such an action on a page, followed by a switch to the other page and going back to the first, the item action there was not triggered anymore since AIMMS 4.79.7.
-  The progress message, which is displayed when the WebUI is busy, now shows an ellipsis in the end when the message is too long.
-  A new widget with a name consisting of only numbers was not displayed on the WebUI when being added. There were also console errors.
-  The selection box did not display the value that was selected for a calendar element parameter with element text.
-  Item actions did not appear when a Barline chart was resized or made full-screen.
-  Gantt chart jobs could sometimes extend beyond their designated area.


--------------



AIMMS 4.80.3 Release (June 21, 2021 - build 4.80.3.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The default values for the Lower and Upper threshold options have been set to -Infinity and Infinity, respectively.
-  The Selectionbox-V2 widget now works properly when you try to add it to a new Grid Layout page.
-  For the Selectionbox-V2 widget, setting the Contents directly in the Add Widget dialog box did not work correctly. Now, you cannot specify the Contents in this dialog anymore (the identifiers are greyed out). Instead, you should open the newly created widget and provide the contents in its Contents option editor.


--------------



AIMMS 4.80.2 Release (June 16, 2021 - build 4.80.2.17).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The DATE column type in a Teradata database expects a string instead of a DateTime structure like other vendors do. This has been adapted in our database interface. Warning: AIMMS does not do any date-to-string conversion so the date format must be exactly as expected by TeraData.
-  Error reporting on database subjects could sometimes show an old error again instead of the new one.
-  64-Bit Integer database columns were no longer recognized since 4.72.4.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The new feature of 4.80 to store cases in a new format had a serious bug that could lead to a situation where not all data was correctly read back from a case.


--------------



AIMMS 4.80.1 Release (June 8, 2021 - build 4.80.1.0).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++

-  The functions :any:`GMP::Solution::GetColumnValue` and :any:`GMP::Solution::GetRowValue` can now also be used to retrieve information regarding basic columns and rows.
-  The latest CPLEX and CP Optimizer releases have been upgraded to version 20.1.0.1, which comes with regression fixes for some rare issues.
-  The optional argument 'merge' has been added to the procedures :any:`GMP::Solution::SendToModel` and :any:`GMP::Solution::SendToModelSelection`. This argument can be used to merge the values of the variables and constraints in a math program with a solution in the solution repository of a GMP.
-  The code to update all the defined identifiers used in a statement was re-visited and improved. This fixes some rare situations where the definition of an identifier was not updated in time.
-  We updated the logging for the AIMMS database functionality. All database-related activity is now logged on child loggers of AIMMS.Database. All queries etc. are now logged on the logger `AIMMS.Database.dbms.SqlExecuter`. These are the available levels:
  
  - `INFO`: model level
  - `DEBUG`: statement level 
  - `TRACE`: field level

  more info on logging can be found `here <https://how-to.aimms.com/Articles/329/329-more-logging.html>`__.

-  In order to activate the logging configuration (LoggerConfig.xml), in addition to using the `--logcfg` command line option there is now another possibility. When AIMMS is started directly with a project name (for example, double-clicking on a ``.aimms`` project file) and there is a LoggerConfig.xml file in the same folder with the project file, then this LoggerConfig.xml file will be picked up automatically and no `--logcfg` option is needed anymore.   
-  When exporting an end-user version (creating an ``.aimmspack``) if your application uses libraries from the online library repository, you can now choose to include the sources of these libraries in the ``.aimmspack``. This was already possible for the Windows part but not for the Linux part. So now, also when running on the (Linux) cloud, the sources don't need to be downloaded during startup.
-  The time needed to read or write a case file has been improved. This has been achieved by a slightly different case format for which you can select the character encoding to be used to store strings and element names. Especially on Linux this leads to a much a faster read. To use this you should set the option `case_compatibility` to `AIMMS_4_80` and specify the most suitable value for option `case_string_character_set`.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS would not install libraries from the library-repository when it is behind a web-proxy that uses HTTP redirects. These redirects are now supported and libraries can be installed.
-  When reading an identifier from a case where all stored values were at their default could lead to a situation in which the WebUI did not show the correct values and/or definitions that used this identifier were not re-evaluated.
-  Defined identifiers that are used in a statement of a Function were not always updated at the right moment.
-  Gurobi 9.1 has been upgraded to version 9.1.2.
-  When assigning a list expression to an identifier, omitting the index domain on the left hand side of the assignment is deprecated and a warning is now displayed. This will result in a compile error in a future AIMMS version. For example, Parameter := data { ('i01') : 1.0 }; is now deprecated and should become Parameter(i) := data { ('i01') : 1.0 };.


WebUI Improvements
+++++++++++++++++++++++++

-  Now the Dialog and Side Panel page types can also be designed using the Grid Layout Experimental Feature.
-  We introduced custom sizing for the Dialog page.
-  The tabs on a Side Panel can now have a colored icon on it for easier identification.
-  We introduced the 'selectionbox-v2' widget as an experimental feature. The widget uses a new technology stack and should use less resources and support a large number of items (more than tens of thousands) in the selectionbox dropdown. We also foresee a significant page load performance increase on pages with a lot of ``selectionboxes``. Please note: a selectionbox-v2 requires the page to use the Grid Layout.
-  The animation that occurs when navigating between WebUI pages has been changed to be more agreeable and to have less impact for more users.
-  We improved the performance of opening the option dialog of a widget.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The option to download a .csv file from a WebUI Table widget now takes the regional settings of the browser into account. This ensures that the column separator used in the .csv file is not the same as either the decimal or the thousand separator for the specified region.



--------------





#############
AIMMS 4.79
#############


AIMMS 4.79.7 Release (June 4, 2021 - build 4.79.7.2).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issue
+++++++++++++++++++++++++

-  In some specific scenarios it could happen that the right-click action items menu on a widget would randomly disappear when being displayed.



AIMMS 4.79.6 Release (May 28, 2021 - build 4.79.6.12).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The AIMMS IDE is now more resilient with respect to loss of connectivity with a license server. It will accept up to 24 hours of connection loss, and will automatically restore the connection whenever possible.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The 'Select All' and the 'Select None' buttons are now properly disabled when a Multiselect widget contains readonly data.
-  In AIMMS 4.79.2, we accidentally introduced numerical formatting on string values that could be interpreted as numerical values (strings like '12345', or '100e7'), when double-clicking on such string values in Table or Scalar widgets. This led to unexpected changes in the underlying strings in the AIMMS model.



AIMMS 4.79.5 Release (May 14, 2021 - build 4.79.5.26).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  A case read in a model that contains 'defining procedures' could lead to a situation that string parameters did not get the correct values. Because of that the model could easily crash after a case read.
-  Getting help on the GMP functions (for example :any:`GMP::Instance::Generate`) did not bring you to the online documentation.
-  When writing to a database table in replace rows mode in case of (assumed) foreign keys and fixed columns and rows in the database that should be deleted, the fixed columns were not taken into account in the DELETE query, resulting in too many rows to be deleted.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Using an 'upon-change' procedure to revert the value that just had been edited (for example, in a table widget) did  not update/refresh the widget correctly (i.e. the edited value instead of the original value was shown).
-  Clearing a selected element by using the cross icon in a Selectionbox widget did not clear the underlying value in the AIMMS model.
-  In some situations, scrolling a table could trigger a simultaneous scrolling on the whole page.


--------------



AIMMS 4.79.4 Release (April 29, 2021 - build 4.79.4.17).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Changing the base unit of the quantity SI_Unitless resulted in data from previously saved cases not being read back correctly. AIMMS stores all data in a case according to the base unit, so if a base unit has changed a unit conversion should be applied when reading back the case.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Sometimes when slicing a multi-dimensional identifier the index would jump back to the first index while trying to set a slice for another index.
-  In some situations, specifying a slice for an identifier in a widget, could result in a backend crash.
-  When the windows key is pressed the WebUI will now ignore the keypress (or combination of keys pressed), as this could result in unexpected behavior.
-  Bars in the Gantt chart Widget were sometimes moved outside of the chart area.
-  Specifying a filter in a column (or row) of a table widget that contained a '-' character (as a result of putting multiple identifiers with a different index domain in the same Table widget) did not work.



AIMMS 4.79.3 Release (April 16, 2021 - build 4.79.3.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Creating an ``.aimmspack`` file could go wrong if the project folders contained empty files.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  If you were combining Grid Layout pages with Side Panels and you were also specifying a layout that called for a vertical scroll bar on that page, you were often faced with the Side panel tabs overlapping the scroll bar, making it nearly inaccessible. This should no longer occur.
-  The use of formatted numbers in tables, scalars and some other locations did not always result in a correct number being shown. Formatting is now slightly faster, correct up to at least 20 decimal/fraction digits and supports more locales and non-Latin characters.


--------------



AIMMS 4.79.2 Release (April 8, 2021 - build 4.79.2.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  We added scroll support to the row and column headers in the Table widget.
-  There was a performance problem in the Barline chart.
-  On a page with many ``selectionboxes`` (more than 25, either visible or hidden), it could happen that they did not show any content anymore. Only the text 'Empty Selectionbox' would be displayed and the ``selectionboxes`` could not be used. This problem was introduced in AIMMS 4.78.4.


--------------


AIMMS 4.79.1 Release (April 2, 2021 - build 4.79.1.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++
-  There is a new attribute for Libraries and Modules: Required Units. This attribute eliminates the need to declare Quantities inside a library or module. For information on the topic, see `this community post <https://community.aimms.com/product-updates/78>`__.


WebUI Improvements
+++++++++++++++++++++++++
-  The Text Widget can now have a string parameter as its content. This means that you can now dynamically specify the content of this widget, greatly enhancing the possibilities of this widget in your applications.
-  Now the WebUI offers a button in the widget and page headers with which you can easily download the content of the widget or the whole page as an image file.
-  The Bar Chart, the Line Chart and the Barline widgets now offer support for AIMMS sets with a tooltip annotation on it.


Resolved AIMMS Issues
+++++++++++++++++++++++++
-  In case of errors happening during running solver sessions on PRO, AIMMS could crash.
-  Changing the type of an identifier (for example from numeric to element valued) was not correctly registered when re-compiling the model afterwards.
-  Handling of license related Gurobi errors has been improved.
-  Using Checking directives in a Read statement where the database table itself is indexed, could lead to wrong index mappings and thus incorrect behavior and/or incorrect error messages.
-  An expression like ``Ord(elemparam(i) $ expr(i))`` could lead to a crash when either ``elemparam`` or ``expr`` was empty. This could also happen when the $ condition was added automatically because of a domain condition on the element parameter.
-  The result of the function NonDefault was not numerical if the argument was a string parameter or an element parameter. Now it always returns either 1 or 0.
-  In case of `list expressions <https://documentation.aimms.com/language-reference/non-procedural-language-components/numerical-and-logical-expressions/numerical-expressions.html#list-expressions>`__, the tuple size of the list expression should exactly match the number of running indices on the left hand side. For example, `Parameter(i, 'elem1') := data { ('i01', 'elem1') : 1.0 };` is not accepted anymore, and should become `Parameter(i, 'elem1') := data { ('i01') : 1.0 };` because the second index is fixed.
-  Multi-line attribute windows could show too much indentation if the .ams file had been edited outside AIMMS.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The performance of WebUI tables that show identifiers with a large index domain in combination with annotations and totals has been improved.
-  The performance of WebUI tables (with large identifiers that use (complex) domain conditions to restrict the number of non-default entries) has been improved.
-  Empty WebUI translations (entries like Identifier = '') in a `properties` file were ignored since AIMMS 4.78.


--------------




#############
AIMMS 4.78
#############


AIMMS 4.78.4 Release (March 23, 2021 - build 4.78.4.13).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The Errors/Warnings window is no longer opened automatically at startup if there are no errors or warnings to report.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Large WebUI tables with active filters and totals could cause a crash.
-  The Selectionbox widget now also works correctly when setting the value of an element parameter with a calendar range in combination with a custom non-default string format in the associated calendar.


--------------



AIMMS 4.78.3 Release (March 18, 2021 - build 4.78.3.18).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Local identifiers in a procedure or function were not always correctly emptied when calling the procedure or function multiple times.
-  Local copies of repository libraries included in an ``.aimmspack`` file could not be loaded if their path on Windows after extraction exceeded 200 characters.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Now you can click anywhere in a Table/Scalar cell to set a checkbox. You do not need to click specifically inside the checkbox anymore.
-  Widget actions now also work when a widget is in full screen mode. Previously the widget actions menu did not appear when the button was clicked and the widget was in full screen mode.
-  In a few Grid Layout templates, the selection box stretched to the complete area that it was assigned to instead of maintaining the actual height of the widget.
-  There was an issue with the `Barline widget <https://documentation.aimms.com/webui/bar-line-chart-widget.html>` aggregating data for elements that had the same element text attribute. The behavior is now consistent with other widgets.


--------------



AIMMS 4.78.2 Release (March 5, 2021 - build 4.78.2.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  AIMMS now gives a warning message when you use a lag/lead operator while the right hand side is not unit-less. AIMMS will interpret the right hand side in the base unit, which may not always be what you expect.
-  There is a new option 'Post_Compilation_Procedure'. This option specifies a procedure that is run automatically after each explicit and successful compilation (via F5). It has been created to offer an easy way to run a set of tests on your model.
-  Reading a 'relation' set from a case file could lead to a crash when the data of that relation was not yet accessed before the read.
-  There is a new function :any:`RegexReplace` that uses regular expressions to do replacements in a string.


--------------



AIMMS 4.78.1 Release (February 26, 2021 - build 4.78.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++
-  The solver ODH-CPLEX 5.3 is now available. ODH-CPLEX 5.3 fixes an issue in which only a fraction of all incumbent solutions found by ODH-CPLEX were passed through an incumbent callback procedure.
-  It is now easier to use older solver versions in applications running on AIMMS Cloud or AIMMS Pro (because the automatically generated solver configuration file now also includes older solver versions for end-user projects).
-  BARON has been upgraded to version 21. The default setting of the BARON option 'Relative termination tolerance' has been changed in this version. Please set this option to 1e-4 (the default value in previous BARON versions) if you experience a longer solving time for your model.
-  Knitro 12.3 has been added.
-  The scaling tool can now also be directly used in a solve statement (or a :any:`GMP::Instance::Solve`) by switching on the option 'Scale model'. The model will then be scaled automatically before sending it to the solver. The new option 'Scaling algorithm' determines which algorithm will be used to scale the model. (Note: previously the option 'Scale model' could only be used in combination with the AIMMS Presolver).
-  The scaling tool in the Math Program Inspector can now also be used for multi-objective optimization problems.
-  The option categories in the section Solvers General are now alphabetically ordered.
-  Different option settings can now be used for the optimization problems, corresponding to different objective priorities, solved during the optimization of a multi-objective problem by CPLEX or Gurobi. These options have to be set using parameter files, as controlled by the option 'Read parameter file' of CPLEX or Gurobi. See the AIMMS Help for more information.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  There was a problem preventing a checkbox in the WinUI to be displayed if the size of the object was a bit too small.
-  Setting a breakpoint on a Definition could lead to various errors because, while being on this breakpoint, the IDE was still able to evaluate other definitions (or even the same one again). In this new version of AIMMS, while being on a definition breakpoint, no other definitions will be evaluated.
-  Runtime libraries will not be stored in a case anymore, see also `this community post <https://community.aimms.com/product-updates-roadmap-36/cases-and-runtime-libraries-834>`__. A warning will be logged to the log file if a runtime library is encountered at reading a case.
-  The terms and conditions dialog for the Academic License and Community Editions are now only shown once a day.



WebUI Improvements
+++++++++++++++++++++++++
-  AIMMS 4.78 comes with new `App Management <https://documentation.aimms.com/webui/app-management.html>`__ tooling that allows you to easily rename and copy widgets as well as move them between pages in your Web Apps. It is available as an `experimental feature <https://manual.aimms.com/webui/experimental-features.html>`__.
-  To improve the Table filtering, a certain tolerance has been added when comparing numerical values, resulting in a better user experience. This is especially important for using (in)equalities in a filter.
-  The communication of resources to the browser has been made more efficient. For more details, see `this community post <https://community.aimms.com/product-updates-roadmap-36/smarter-delivery-of-webui-for-improved-performance-838>`__.
-  The WebUI application options 'Sidebar open by default' and 'Page manager hidden' have been removed from the product.



Resolved WebUI Issues
+++++++++++++++++++++++++

-  As an app developer, while working on a page of which the width (with the sidebar open) exceeded the available screen width, you could run into tables that could neither have their columns resized nor their contents filtered.
-  Changing the Center Latitude and Longitude along with the Zoom reverted the Center Latitude and Longitude to the previously set values in some cases.


--------------




#############
AIMMS 4.77
#############


AIMMS 4.77.4 Release (February 5, 2021 - build 4.77.4.5).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When reading data from a case, identifiers that are defined over a calendar sometimes were not read correctly. Especially when the start and end date of the calendar were also read from the case. This was only a problem in earlier 4.77 versions.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Setting a widget to "full screen" will now work as expected again on both Classic and Grid Layout pages.


--------------



AIMMS 4.77.3 Release (February 1, 2021 - build 4.77.3.15).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Warnings or errors that were triggered during the update of a definition during a case read could lead to strange errors in a later stage of execution.
-  In the case of an external DLL function call: if this function had an array of strings as one input argument, wrong strings were passed.
-  There was an error in ``CleanDependents`` in combination with data from multiple cases. This resulted in a situation where an element in a set was not recognized.
-  Non-ASCII characters in user profile names could cause the new academic licensing scheme to fail.

.. seealso::
  
  Documentation about ``CleanDependents`` operator in :any:`cleandependents`

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Page Actions were moving along with the scroll on Grid-Layout pages.
-  In some cases when using the Grid Layout, leaving the final page of a wizard did not take you to the intended page in your WebUI. Instead, the wizard page remained.


--------------



AIMMS 4.77.2 Release (January 22, 2021 - build 4.77.2.7).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In a :any:`switch <switch>` statement, using a macro being a quoted element name could lead to the compile-time error wrongly indicating that the quoted element is not in the range set. This bug was introduced in AIMMS 4.77.1.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When editing a cell in the table and moving to either the next cell or another widget by clicking, the update of the edited cell would be applied later than a store focus or uponchange procedure. That order is now corrected, such that the edited cell will first be updated and then the next action/procedure will execute.
-  Widget actions were broken for widgets within a Group widget.
-  With the introduction of the Date Time Picker feature, a table widget that showed calendar data which was filtered, could end up empty.
-  WebUI state support was not working correctly on PRO, because the page names were not identified correctly.


--------------



AIMMS 4.77.1 Release (January 8, 2021 - build 4.77.1.1).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.


AIMMS Improvements
+++++++++++++++++++++++++

.. important::
  
  The warning "Missing semicolon at the end of a [statement list/procedure body] is deprecated. A future AIMMS version may give a compilation error on this." is now by default an error in AIMMS Developer. 
  
  **Note:** it is possible to let AIMMS insert all the missing semicolons it found at once by clicking on the error.

-  AIMMS now offers more control for the LP problems that are solved to calculate shadow price ranges and (variable) value ranges. The new general solvers option 'Time limit sensitivity ranges' can be used to set a time limit, while the new CPLEX and Gurobi option 'Sensitivity method' can be used to specify the LP method.
-  Gurobi 9.1 (version 9.1.1) has been added. Gurobi 9.1 comes with performance improvements for LP, MIP, MIQP models and for convex and non-convex MIQCP models.
-  CPLEX 20.1 has been added. CPLEX numbering has changed; it now is based on the year of release. CPLEX 20.1 comes with improvements to the performance of mixed integer programming (MIP) models that provide better solutions more quickly.
-  CP Optimizer 20.1 has been added. CP Optimizer 20.1 comes with improvements to constraint programming models with variables that have large domains.
-  CONOPT 4.1 has been added. CONOPT 4.1 comes with a few bug fixes.
-  The code to read and write case files has been completely re-written. This should not have any negative impact on existing models. The format of the case files has not been changed and thus is still compatible with older AIMMS versions. The new code fixes a few problems related to the order in which data was read in and the in between evaluation of definitions. If you encounter any problems because of this change, please let us know as soon as possible. For more details, see `here <https://community.aimms.com/product-updates-roadmap-36/cases-and-runtime-libraries-834>`__.
-  The Help On menu command in the attribute window of the model editor are now linked to the online version of the Language and the Function Reference.
-  There is a new option "JIT_Body_Compilation". With this option you can enable the new feature: Just-In-Time body compilation. This means that the compilation of the body attributes of procedures and functions is skipped at startup and thus that startup time decreases. The procedures and functions are compiled just before they are first run.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The action 'Substructure Causing Infeasibility' in the Math Program Inspector could fail in the rare case that a variable only appeared in the objective.
-  Constructs like ``i in {lower(i) .. upper(i)}`` did not perform well, both in terms of memory and execution time.
-  ODH-CPLEX could hang if a callback procedure was installed.
-  The ODH-CPLEX option 'Solution improvement heuristic mode strategy' was missing a value.
-  Case files that do not include all defined identifiers (which is the default for communication with solver sessions under PRO) were not always read correctly. Especially when sets were subsets of sets with a definition.
-  The ``objectVersionId`` of the uploaded ``messages.log`` wasn't correctly stored for non-interrupted solver sessions, resulting in not being able to download the messages.log for finished sessions.
-  No solution was passed back to AIMMS if BARON found a solution before hitting a time limit.
-  In rare cases a GMP::Row routine could fail if a row number was passed in the 'row' argument.
-  The message of a compile error on an if-then-else operator was too generic: now the :any:`else` and :any:`then` operands are mentioned in the message.


WebUI Improvements
+++++++++++++++++++++++++

-  The Date Time Picker for :any:`calendar` elements and Time Zone Settings for multi timezone application, introduced in `AIMMS 4.75`_ as experimental features, are now officially supported features.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  When no default value has been defined for the element parameter in AIMMS, the empty default option will not be shown in the scalar widget.
-  The button on the Upload widget, when used on PRO in combination with the 'UI Editable' setting set to false, could 'dance' when hovered over.
-  When switching from the Classic page layout to the new Grid layout, it could happen that the areas were displayed too small in the page manager.
-  Widget actions were not showing up when a complete column was empty in the defining widget actions string parameter.
-  There was a problem with the y-axis labels formatting when min/max/size were configured in the bar/line/bar-line charts.


--------------




#############
AIMMS 4.76
#############


AIMMS 4.76.11 Release (December 17, 2020 - build 4.76.11.11).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In case of an iterative operator, when a domain was specified using an :ref:`IN-operator <lr:in-operator>` and the second operand of this IN-operator was a direct stand-alone index name (used instead of a set name), the wrong domain could be deduced (for example, in an expression like ``count(indexName1 IN indexName2)`` ).


--------------



AIMMS 4.76.10 Release (December 14, 2020 - build 4.76.10.11).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The :any:`Val` function could suffer from multi-threading issues when used on :any:`calendar` elements.
-  The return value of the :any:`AttributeToString` function, when used to get the "Default" attribute of a string parameter, was enclosed in redundant quotation marks.
-  Solving a robust optimization model with an ellipsoidal uncertainty constraint could result in a failure.
-  UTC start and end times of :any:`calendars <calendar>` were always shifted to local time, while timezone adjustments should only happen if the granularity of the :any:`calendar` is higher than daily.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Uploading a file using the `upload-widget <https://documentation.aimms.com/webui/upload-widget.html>`__ in the WebUI to a folder that contained special Unicode characters did not work on Windows.


--------------



AIMMS 4.76.9 Release (December 8, 2020 - build 4.76.9.4).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  When you changing a value in the table, without hitting enter and then clicking away to a read-only cell, the change was not applied.
-  Setting values of element parameters in a subset of a :any:`calendar` with a non-standard datetime format, was not possible.
-  Setting values of element parameters in a :any:`calendar` using something else than the date-time-picker (e.g. a selection widget), did not work.


--------------



AIMMS 4.76.8 Release (December 3, 2020 - build 4.76.8.6).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Defining a set via a procedure where the set is an output argument to that procedure did not work. The compiler now flags this as an error.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  There were issues with `tooltips <https://documentation.aimms.com/webui/widget-options.html#html-tooltips>`__ and some menus (like those for item actions or widget actions) hiding behind dialog pages or side panels in some cases.
-  Map widget longitudes are no longer clipped between -180 and 180 but are instead wrapped to fall within the -360 to 360 range, which gives you more options when trying to keep a logical relation between the curves/nodes you might be drawing but that did not end up where you expected them.
-  When having the option `UI Editable <https://documentation.aimms.com/webui/app-misc-settings.html#ui-editable>`__ set to 0 in a WebUI (as is the case under PRO, for example), the end-user was not able to use the Table filter mechanism to filter the data.
-  :any:`errh::MarkAsHandled` now also empties the predeclared string parameter :any:`CurrentErrorMessage` if it is related to the handled error.


--------------



AIMMS 4.76.7 Release (November 25, 2020 - build 4.76.7.12).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When an identifier was used in a definition of another identifier, and these two identifiers had different index domains (index domains without domain restriction and defined via a definition in their turn), run-time changes to the index domain of the first identifier were not taken into account when re-evaluating the definition of the second (i.e. that could lead to wrongly calculated inactive data).
-  The check whether an element parameter is empty or not (using operator = or <>) did not work correctly if the value of the element parameter referred to an inactive element in the range set.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Maps may draw slightly faster when showing overlays with large amounts of straight line sections.
-  Workflow configurations that redirect to a page using `webui-grid-pages <https://documentation.aimms.com/webui/webui-grid-pages.html>`__ did not work correctly in previous versions.
-  A WebUI case could incorrectly not be marked as dirty after running a procedure from WebUI, resulting in the 'Save case as...' option to not appear. 


--------------



AIMMS 4.76.6 Release (November 17, 2020 - build 4.76.6.10).
------------------------------------------------------------------------------------------

Download `here <https://www.aimms.com/support/downloads/#aimms-dev-download>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  There was a problem with time units, caused by the fact that the WebUI library now declares the unit 'minute'.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The experimental 'webui state support' feature will now also work for pages using `the new Grid Layout <https://documentation.aimms.com/webui/webui-grid-pages.html>`__ (but some limitations to setting it up correctly will still apply).
-  In some rare situations (in which you use similar totals in tables on more than one WebUI page), you could receive errors like 'Some of the attributes of runtime parameter ``webui_runtime::Exprxxx`` are not yet successfully compiled.'.
-  Editing or changing a latitude or longitude identifier using the identifier selector from `the Map widget options <https://documentation.aimms.com/webui/map-widget.html#adding-node-sets>`__ used to clear any previously made selection.


--------------








AIMMS 4.76.5 Release (October 30, 2020 - build 4.76.5.8)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In case stochastic data is present and the option 'Show Stochastic Data if Available' is set to an appropriate value, AIMMS will now show a dialog asking you whether you want to see the deterministic or stochastic values of a variable or parameter on a data page.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The edit menu of the `text-widget <https://documentation.aimms.com/webui/text-widget.html>`__ was not always visible when having a Text widget on `dialog-pages <https://documentation.aimms.com/webui/dialog-pages.html>`__.


--------------



AIMMS 4.76.4 Release (October 28, 2020 - build 4.76.4.11)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Reading data into a subset of a calendar, using the AimmsXLLibrary, could give incorrect errors.
-  A procedure with an output argument of type Set was incorrectly handling the argument as an ``InOut`` argument. This resulted in that the set was not empty at the start of the procedure body.
-  Subtracting two elements in (a :ref:`SubsetOf <attr:set.subset-of>`) :any:`Integers` did not always listen to the properties ElementsAreNumerical or ElementsAreLabels. For ElementAreNumerical an expression ``(int1-int2)`` should be evaluated as ``(Val(int1)-Val(int2))``, and for ElementsAreLabels it should be evaluated as ``(Ord(int1)-Ord(int2))``.
-  The AimmsAPI function ``AimmsAttributeGetUnit`` was not working correctly when the output string was not consisting of Unicode characters.
-  This AIMMS version has added support for connecting to servers that use TLS v1.3 HTTPS encryption.

--------------



AIMMS 4.76.3 Release (October 23, 2020 - build 4.76.3.5)
------------------------------------------------------------------------------------------

Resolved WebUI Issues
+++++++++++++++++++++++++

-  AIMMS could hang whenever you tried to make changes to the library setup of your project (using the IDE) while the WebUI was running.
-  The specified display-domain was not always applied correctly to the identifiers in a widget that was showing data in 'case comparison' mode.
-  The inverse cumulative of the Poisson distribution could suffer from numerical instabilities, which might even cause AIMMS to become unresponsive at high input values.


--------------



AIMMS 4.76.2 Release (October 21, 2020 - build 4.76.2.9)
------------------------------------------------------------------------------------------

AIMMS Improvements
+++++++++++++++++++++++++

-  We made various performance improvements in the AIMMS API that will improve the performance of libraries such as CDM, DataLink, DataExchange, and AIMMSUnitTest.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  If you need to declare a new unit for the unit a of calendar and the only existing time quantity is located in a read-only library, a second time quantity will be created. In previous AIMMS versions the unit was incorrectly added to the already existing read-only quantity.
-  An attempt to call the AimmsAPI function ``AimmsServerProjectOpen`` for a second time, after closing a previously opened project, resulted in a crash.
-  We addressed the strange "Too many casts" error when using an expression ``{ elementParam1 .. elementParam2 }`` in which the two element parameters did not have the same set range.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  An unnecessary scroll bar was displayed in the Legend widget using the grid layout for pages.
-  Contents added during widget creation were not always retained in the widget contents section, resulting in empty widgets.


--------------



AIMMS 4.76.1 Release (October 16, 2020 - build 4.76.1.1)
------------------------------------------------------------------------------------------

AIMMS Improvements
+++++++++++++++++++++++++
-  As AIMMS is gradually moving towards online documentation, the Function Reference documentation that was previously shipped with the AIMMS installation and installed locally, is now only accessible `online <https://documentation.aimms.com/functionreference/index.html>`__.


Resolved AIMMS Issues
+++++++++++++++++++++++++

.. important::
  
  when you are making use of a file to store the database structure (with LoadDataBaseStructure): in version 4.72.4 we unintentionally made a change that has an impact on this functionality: it may be that if you used SaveDataBaseStructure in an older version, the resulting file is no longer compatible. So if you are using this functionality, please create a new database structure file once with a version 4.72.4 or higher to be used at LoadDataBaseStructure.

-  In some rare cases when using the Mod function with arguments that have units of measurement, the result could have a precision lower than double precision for the floating point format.
-  In AIMMS 4.75, the 'Subset of' wizard was not working as it should.
-  An attempt to switch to the Profiler while the execution is stopped on a breakpoint in the Debugger is no longer allowed. It resulted in an error situation in earlier versions.
-  The option `Show_Stochastic_Data_if_Available` now does an additional check whether the :any:`.stochastic` variant is completely empty while the original identifier is not. If so, AIMMS will display the data of the original identifier and not the empty stochastic data.



WebUI Improvements
+++++++++++++++++++++++++

-  We have added the combined Bar-Line Chart to the collection of WebUI widgets. For details, please see the `documentation <https://manual.aimms.com/webui/bar-line-chart-widget.html>`__.
-  We changed the way some totals (in WebUI tables) are computed: all 'total sum', 'total count', 'total mean', etc. totals are computed by the model using AIMMS expressions. Ergo, these do not take into account any rows or columns not being visible because of display-domain, sparsity or filtering. All 'sum', 'count', 'mean', etc. totals are computed by traversing the cells in the table itself and therefore reflect the totals of the *visible* cells in the table (potentially affected by sparsity, display-domains and/or filtering).


Resolved WebUI Issues
+++++++++++++++++++++++++

-  When using a WebUI app on a tablet, checkboxes did not work properly. Furthermore, it was impossible to use column resizing in the Table widget. We also changed the scroll bar behavior in the Table widget: if there is scrollable content in a Table, the scroll bars are now automatically made visible on a tablet.
-  We improved the warning messages when computing totals over identifiers with mismatching units in a WebUI Table widget.
-  After pressing the ESC key when editing data in the Table widget, the value could be modified (rounded).
-  Table filtering did not work correctly on translated element headers.
-  Widget options for Side Panels and Dialog Pages were not showing up after creation, preventing the user from changing their height/width and positioning.
-  System messages at the 'info' level will now show with the same icon as 'debug' messages (an 'i' within a solid circle), instead of having no icon at all.
-  The ``webui::AnnotationsIdentifier`` and the ``webui::TooltipsIdentifier`` annotations are now also taken into account when in case comparison mode.
-  Data being displayed in 'compare case mode' (in WebUI) now correctly uses the annotations and tooltips of the original identifier.
-  Layout 9, part of our experimental Grid Layout feature released with 4.75, was inadvertently lacking the 'full screen' feature that the layout was originally created for. We added that property (called ``runIntoGridgap``), for grid areas. It is also available for use in your custom layouts.


--------------



#############
AIMMS 4.75
#############

AIMMS 4.75.4 Release (October 8, 2020 - build 4.75.4.8)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  We fixed a performance issue that was introduced in version 4.73 with the new way of handling definitions.
-  Making a modification in a math program, while the Math Program Inspector was open, could in some cases result in a crash.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The WebUI now shows a warning when some of the widgets tries to change a value of an identifier that is not present anymore in the model.

--------------




AIMMS 4.75.3 Release (September 23, 2020 - build 4.75.3.6)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In the debugger, when hovering over an identifier, the data shown in the tooltip no longer contains inactive data.
-  We added the function ``axll::CopySheet`` to copy an existing sheet in a spreadsheet file. This was added to easily create sheets with pre-set formatting and coloring.


Resolved Security Issues
+++++++++++++++++++++++++

-  The WebUI now uses the HTTPS protocol for retrieving GeoFabrik map tile data.

--------------




AIMMS 4.75.2 Release (September 17, 2020 - build 4.75.2.10)
------------------------------------------------------------------------------------------


AIMMS Improvements
+++++++++++++++++++++++++
-  The BoxR package for R has been upgraded from version 0.3.4 to 0.3.5.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Options that are given nondefault values to new models automatically, were not always saved. This applies especially to the option to use UTC times in reference dates introduced in 4.74. 

    .. important:: If your model uses time, check that the option "Use UTC ``forcaseandstartenddate``" is on. Altering it once is enough to avoid the bug, but be aware: this changes the meaning of calendars.

-  Finding an element in a quarterly calendar, using :any:`StringToElement`, did not work sometimes.
-  Specifying :ref:`the OrderBy attribute <set.order_by>` on a runtime set, could lead to an unexpected error in recent AIMMS versions.
-  We removed an incorrect warning about a missing semicolon.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Making a name change to an identifier that was being used as a display-domain identifier in WebUI could result in the display-domain not being active anymore.
-  'ElementsAreNumerical' was added as property to the ``webui::ExtensionOrder`` set, in order to prevent a (harmless) warning being displayed.
-  When using the Grid Layout experimental feature, the option to create a Group widget will be hidden (since the Grid Layout removes the need for having Group widgets).


--------------




AIMMS 4.75.1 Release (September 9, 2020 - build 4.75.1.0)
------------------------------------------------------------------------------------------


AIMMS Improvements
+++++++++++++++++++++++++
-  Multi procedures have been added to the `GMP::Column <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_column-procedures-and-functions/index.html>`_ and `GMP::Row <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_row-procedures-and-functions/index.html>`_ namespaces. These procedures can be used to efficiently modify a group of columns or rows, belonging to one variable or constraint respectively.
-  Knitro 12.2 has been successfully linked to AIMMS. 
-  The list of recent projects to choose from on the start page or in the File menu now shows the title of the project next to the ``.aimms`` file name.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  The procedures in the `GMP::Linearization <https://documentation.aimms.com/functionreference/algorithmic-capabilities/the-gmp-library/gmp_linearization-procedures-and-functions/index.html>`_ namespace now also accept a row number for the `row` argument.
-  Gurobi 9.0 has been upgraded to version 9.0.3.
-  AIMMS now accepts nonlinear constraints in a stochastic model, but only if they are actually generated as linear constraints (e.g., because some variables are fixed).
-  When renaming an identifier that is also used in a library, the library now becomes 'dirty' such that during a subsequent save the library files will contain a reference to the new name. In previous AIMMS versions, the library files remained unchanged and were relying on the name change mechanism via the ``.nch`` file.
-  In this version, we re-implemented the parsing of the commands for AIMMSCommand. No features were added.
-  The set :any:`AllTimeZones` in AIMMS was not initialized on PRO.
-  If sets were emptied when already empty or were assigned the exact same content as before, the sets were marked as changed and thus could trigger an evaluation of definition that were depending on it.


WebUI Improvements
+++++++++++++++++++++++++
-  In this release, we present a whole new mechanism for creating the layout of your WebUI pages: Grid Layouts. It offers far more control on where widgets will be located on your pages. Currently, this is offered as an experimental feature. We are eager to hear your feedback. For details, please see the `documentation <https://manual.aimms.com/webui/webui-grid-pages.html>`__.
-  We have added filtering for Table columns, rows and headers. This feature allows you to easily show just the data that your end-users are interested in. For details, see the `documentation <https://manual.aimms.com/webui/table-widget.html#data-filtering-on-the-table>`__.
-  It is now possible (as an experimental feature) to select dates and/or times by using a dedicated date/time picker whenever a Table or a Scalar widget displays date/time-related values. For details, see the documentation for `Scalars <https://manual.aimms.com/webui/scalar-widget.html#date-and-time-picker-for-element-parameters-with-a-calendar-range>`__ and `Tables <https://manual.aimms.com/webui/table-widget.html#date-and-time-picker-for-calendar-elements>`__.
-  As another experimental feature, the AIMMS WebUI now offers support for working with the same WebUI App from different time zones. For details, see the `documentation <https://manual.aimms.com/webui/time-zone-setting.html>`__.
-  We changed the Widget Actions icon to better suit the new UX.


Resolved WebUI Issues
+++++++++++++++++++++++++
-  Now table column widths will be rounded to two decimals when resized. This prevents problems when storing the model in a version control system, as this will lead to far less 'changed' lines.
-  The maximum zoom out level of the map widget has been increased such that a larger area of the map can be displayed now. Also users can now pan right or left completely which was restricted before.



--------------






#############
AIMMS 4.74
#############


AIMMS 4.74.8 Release (August 26, 2020 - build 4.74.8.15)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Since AIMMS 4.73, the time zone mapping could be incorrect: when the Windows local timezone name did not match the English one since then used by AIMMS, only time zones with DST were checked for a match, leading to a possibly incorrect mapping and warnings.
-  The solve of an LP model inside the Math Program Inspector could hang (during the crossover step) if the barrier algorithm was used.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  On slower internet connections, WebUI apps were not always able to start properly. This was due to an internal timeout of 15 seconds. Therefore we introduced a new WebUI option called ``webui.webuiserver.max-session-idle-seconds``, which now defaults to 5 minutes. You can specify this setting in the file ``MainProject\\WebUI\\settings\\webui-options.conf``.


--------------



AIMMS 4.74.7 Release (August 14, 2020 - build 4.74.7.8)
------------------------------------------------------------------------------------------

AIMMS Improvements
+++++++++++++++++++++++++

-  We added ODBC support for the IMPALA database and drivers.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When the value of the attribute `datasource` of the database table was very long, AIMMS crashed without a message after usage of some of the wizards of the database table.
-  When an ODBC driver throws an exception when retrieving structural information about the database (table), AIMMS could crash instead of reporting the issue as an error.


Resolved WebUI Issues
+++++++++++++++++++++++++

-  It was not possible anymore to add widgets to a page containing a Group Widget.
-  The WebUI did not use annotations that were specified on the parent nodes of a symbol in the model tree.

Resolved Security Issues
+++++++++++++++++++++++++

-  No security-related changes were made in this AIMMS version.

--------------



AIMMS 4.74.6 Release (August 10, 2020 - build 4.74.6.3)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  When the connection with the database was broken during the execution of a read statement, a misleading error message "Function Sequence Error" could be reported.
-  In recent AIMMS versions, variables with a domain condition that uses a sub expression like (i IN {'a','b'}) were not always generated correctly.
-  In recent AIMMS versions, the construct (i IN { 1..5 }) did not always work when used inside the body of a function.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The search functionality in the widgets has been updated to search based on 'Element Text Identifier' values if configured.
-  Map nodes were not getting deleted from the map widget after emptying the node-set data.


--------------



AIMMS 4.74.5 Release (August 4, 2020 - build 4.74.5.2)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  There was a problem that sometimes occurred when modifying values on a WebUI page that also contained references to a calendar set. The bug resulted in a crash of AIMMS.
-  Models with a complex definition structure could suffer from long or even infinite compilation duration since 4.73.
-  We addressed various issues in the new definition evaluation handling that was introduced in 4.73.
-  There was a performance issue in the generation of a mathematical program.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  Upon editing a Table cell, the "reload" icon could appear, after which the cell would stay on busy mode endlessly.
-  Side panels content did not align well on a workflow page.


--------------




AIMMS 4.74.4 Release (July 21, 2020 - build 4.74.4.5)
------------------------------------------------------------------------------------------

Resolved WebUI Issues
+++++++++++++++++++++++++
-  Warnings raised from within the model are now correctly communicated to the end user if the `communicate_warnings_to_end_users` option has been set.
-  Handling of name changes for widget properties that incorrectly contained an index specification has been improved.
-  Improved handling of the redrawing of (changed) arcs and nodes results in better Map performance.
-  For line charts that contain multiple lines, annotations are now correctly applied to all involved lines and their elements.

--------------




AIMMS 4.74.3 Release (July 6, 2020 - build 4.74.3.2)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  Renaming an identifier while a library has an index or element parameter with that same name, could accidentally rename the identifier in the library as well.
-  We added an error message for an unsupported combination of a defining procedure and a domain condition expression.

--------------




AIMMS 4.74.2 Release (July 1, 2020 - build 4.74.2.8)
------------------------------------------------------------------------------------------

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In specific cases publishing an AIMMS model on PRO yielded a 'unable to publish model' error.
-  For some data types, Unicode characters were not sent correctly to the database.
-  When a Halt statement was executed, in a next definition evaluation that uses a procedure, only the first statement in that defining procedure was executed.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  A warning will be shown if a valid page contains an invalid ``redirectPageId`` and some error messages related to workflow have been improved.
-  When a bubble was highlighted in a Bubble Chart widget and then an X bubble-point was selected, the previously selected bubble was no longer highlighted.


--------------



AIMMS 4.74.1 Release (June 23, 2020 - build 4.74.1.0)
-----------------------------------------------------


AIMMS Improvements
+++++++++++++++++++++++++

.. important::  When the .ams file is written to disk, AIMMS itself now uses tabs instead of 4 spaces. This reduces the size of the .ams file up to 30%. Because AIMMS versions before `AIMMS 4.73`_ do not expect tabs as indentation, models saved in `AIMMS 4.74`_ may introduce unexpected issues when opening them in versions older than 4.73. You can prevent this by first opening and saving the model in 4.73. After that, the model will be compatible with older versions again. When the .ams file is managed by a versioning system (such as git), .ams files will have changes on all lines.

-  The CPLEX, Gurobi and ODH-CPLEX options related to heuristics have been placed in the new MIP Heuristic category.
-  The math program suffix ``BestBound`` and the GMP functions for retrieving the best bound can now also be used to obtain the best bound for a continuous problem (NLP, QP or QCP) solved with BARON and for non-convex quadratic problems solved with CPLEX or Gurobi.
-  The solver ODH-CPLEX 5.0 is now available. ODH-CPLEX 5.0 uses CPLEX 12.10 underneath. Whereas, ODH-CPLEX 4.0 uses CPLEX 12.8. Therefore, the new options for ODH-CPLEX 5.0 stem from the CPLEX part. For some MIP cases, the results obtained by ODH-CPLEX 4.0 are not deterministic. This behavior is fixed in the ODH-CPLEX 5.0.
-  A scaling tool has been added to the Math Program Inspector. It can be used to scale linear optimization models by selecting the Scale Model action. The tool will determine scaling factors for all (symbolic) variables and constraints which can be viewed in the Scaling Factors tab. By selecting the Resolve action in the Math Program Inspector you can resolve the model which will then automatically use the new scaling factors.
-  The logical iterative operators Atleast, Atmost, Exactly are now handled by the new compiler and execution engine. AIMMS took the opportunity to make their behavior more consistent: their second argument now has a restriction to be a non-negative integer (there were no restrictions before). An error will be issued if this is not the case. Furthermore, when the Atleast and Exactly operators have an empty domain as their first argument and zero as their second, the return value is 1 (this was not the case before, which was incorrect).
-  When requesting help on a function in the model editor using the right mouse menu command Help-On, you are now re-directed to a help topic in the online Function Reference.
-  When writing data to a database via the ODBC Driver, parameters can be used for each row, but for some vendors and ODBC drivers this can be slow. Therefore, AIMMS offers an alternative flat-string technique for a few vendors. This alternative was already available (and the default) for MySQL databases and is now also implemented for MS SQLServer and PostgreSQL. There is a new option `Database insert as flatstring` (under AIMMS\Database interface) with which one can control whether this technique is used for the mentioned vendors. Based on performance experiments, the default for MySQL and PostgreSQL is to use this flat-string technique, and for MS SQL Server not to use it.
-  The default value of the option 'Database String Valued Foreign Keys' has changed from 'Check' to 'Ignore'. See also the help documentation on this option. The default is changed because checking the foreign key information can be very expensive (depending on database vendor) whilst for most models this is not relevant. **IMPORTANT:** When your model writes to a database table which has string valued foreign key columns to another table, you may need to consider the best value for this option. When the value is 'Ignore' (now the default) and an empty string would be written to such a column, a runtime error will be reported.
-  From now on, in new models only, Aimms interprets reference dates as UTC times by default i.s.o. local-no-DST times.

	What is affected:
	Functions that use default-timezone reference dates. (:any:`StringToMoment` and :any:`MomentToString`)
	The begin and end date of calendars that have granularity smaller than a day.
	The storage in cases of such calendars and element parameters pointing into them.

	Why this change:
	Until now, the meaning of times changed when the model was opened in another timezone. 2 o'clock in the US was still shown as 2 o'clock in China. When building a multi timezone/multi user application in Aimms, this is probably not what you want. This may already occur when running Aimms in the cloud, as the server may be in a different timezone, and thus lead to unexpected results even if the model is to be used for only one location.
	Though the :any:`ConvertReferenceDate` function can be used to work around this problem within the model, times in cases were also stored in local time. Any attempt to load a case created in another timezone would lead to incorrect data when trying to work with nonlocal timezones.  

	Notes:
	
	-  This change is only applied to new models: Since the meaning of strings signifying reference dates is changed, automatic conversion of old models is not possible 
	-  In timeslot formats, always using a timezone explicitly is advisable. Even if display in every user's local time is intended, DST should be taken into account, and thus ``localDST`` should be used. Timeslot formats that do not specify a timezone are still using 'local' time. 
	-  When using an hourly calendar, specifying minutes in the timeslot formats is advisable. It is uncertain if at some point the calendar will be shifted off the full hour, esp. when time zones get to be used in timeslot formats.


Resolved AIMMS Issues
+++++++++++++++++++++++++

-  There was a situation in which renaming an identifier 's' in the main model also changed the unit [s] in the WebUI library.
-  If the CPLEX option 'print presolve status' was switched on, any action in the Math Program Inspector that triggered a solve (e.g., Resolve) would result in a crash. This bug was introduced in AIMMS version 4.71.1.
-  The warning "The maximum of 20 warnings reached, further warnings suppressed. See also option maximal_number_of_warnings_reported" was not shown in the error window of AIMMS.
-  The properties ElementsAreNumerical and ElementsAreLabels did not always have the intended effect when the logical value of a corresponding element was checked as part of an OR/AND/XOR expression.
-  Clicking a checkbox in the WinUI Pivot Table while having the WebUI open could lead to a crash.

 
WebUI Improvements
+++++++++++++++++++++++++
-  Item Actions are now available for the Table, Scalar, Gantt, Bar, Line, Bubble, Pie, and Treemap charts as well.
-  The list widget is now an official feature and is removed from the experimental features.
-  Previously, whenever a column on which you sorted, contained an element parameter over a calendar, the string representation of the date was used to sort upon, alphabetically, leading to an unexpected ordering. Now, such a column is sorted according the order of the dates in the underlying calendar.
-  The formula for calculating the bubble size is updated and improved. Sizes are calculated based on the area, same as the map. Also, Added maximum reference size to size the bubbles based on a fixed value.



Resolved WebUI Issues
+++++++++++++++++++++++++
-  The Pivot Tab in the options of the Bubble chart widget was broken.
-  Console errors were displayed while opening the option editor for Table widget contents and adding/removing identifiers from the Bubble chart widget.
-  The WebUI will now actually make use of your browser's configuration for preferred languages and thus also of any provided translations for that language, when available. See https://documentation.aimms.com/webui/multi-language.html#multi-language-support for details.


--------------







#############
AIMMS 4.73
#############


AIMMS 4.73.5 Release (June 08, 2020 (build 4.73.5.7)
-----------------------------------------------------------------

 Changes made in this release are listed below. A high level overview can be found at the `AIMMS New Features Page <https://www.aimms.com/support/new-features/>`__.

Looking for best practices on how to use AIMMS? Check out the `AIMMS Knowledge Center <https://how-to.aimms.com/>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some cases, execution of a statement locally overriding units could be slow.
-  When re-compiling the entire project, initial data of sets was reinitialized, while it should have happened only for sets where the initial data attribute was actually edited.
-  If a multi-dimensional identifier only contained one very small value (smaller than 1e-8), its data was not correctly stored in a case file.
-  Using a color scheme in the WinUI 2D Chart did not work correctly if the scheme was linked to a subset of AllColors with a definition.
-  We made some changes to the function :any:`axll::FillList`: (1) The argument DataRange is no longer optional, (2) the default values in the tooltip were not correct, and (3) the comment referred to the wrong function.
-  From various similar crash reports that were sent in recently, we did improve a weak spot in the code of version 4.73. Most reported crashes occurred during the saving of a case.

Resolved Security Issues
+++++++++++++++++++++++++

-  No security-related changes were made in this AIMMS version.

--------------



AIMMS 4.73.4 Release (May 28, 2020)
-----------------------------------

Build 4.73.4.11

Resolved AIMMS Issues
+++++++++++++++++++++++++

-  In some situations, an identifier with a definition did not have the correct value after loading a case file. This was an error only in previous 4.73 versions.
-  If a definition contained a call to function A and if in the body of that function A another function B was called, the definition was not always triggered when the parameters used in the function B were modified. This error only happened in earlier 4.73 versions.

Resolved WebUI Issues
+++++++++++++++++++++++++

-  The ``webui::FlagsIdentifier`` annotation was not always taken correctly into account in widgets with multiple identifiers, some of which having indices that were used during aggregation.
-  In rare situations, the ``webui.json`` could miss a specific line. If so, not all WebUI pages were available for navigation using the ``webui::OpenPage`` procedure.
-  'Totals on top' were moved to the bottom when a Table column (or row) was sorted. Now, they correctly stick to the top.
-  Item actions work on touch devices as well now.


--------------




AIMMS 4.73.3 Release (May 25, 2020)
-----------------------------------

 Build 4.73.3.8 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In just created procedures, sometimes a local parameter retained the value from the previous procedure call. The problem disappeared after closing and reopening the model.
-  In some cases when WebUI was using data slicing over a literal (fixed) element, an error about this fixed element could be wrongly triggered. This incorrect behavior was introduced in the 4.73.1 release.
-  We fixed an error in a recent implementation of the model editing functions. It could result in various problems, one of which was that profiler results disappeared unexpectedly.
-  The profiler data in definitions of sets or parameters was not visible. This bug was only in the early 4.73 versions.
-  The styles of inactive secondary page actions were broken.

Resolved WebUI Issues
+++++++++++++++++++++++

-  There were some duplicate Gantt chart setting attributes in the miscellaneous tab of its options editor.
-  Creating data widgets with invalid 'literal' contents (i.e. no AIMMS identifier) could result in a crash. Now, an empty widget will be shown in such cases and you can use the UI to fix the contents of your widget.



--------------




AIMMS 4.73.2 Release (May 8, 2020)
------------------------------------

 Build 4.73.2.8

Resolved AIMMS Issues
+++++++++++++++++++++++

-  (Only) in the previous `AIMMS 4.73.1 Release (April 29, 2020)`_ , a definition of a set or parameter via a 'defining procedure' was not always triggered correctly. It resulted in a faulty cyclic definition detection and/or data not being calculated.
-  Because of multiply declared time quantities (in different libraries), it could happen that data read from a case was not correct.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The secondary page action is now center-aligned when there is only one action icon.



--------------



AIMMS 4.73.1 Release (April 29, 2020)
-----------------------------------------

 Build 4.73.1.3

AIMMS Improvements
++++++++++++++++++++

-  The Irreducible Inconsistent System (IIS) will from now on be retrieved from the solver, by default, if this action is selected in the Math Program Inspector. Before an algorithm implemented in AIMMS was used. Using the IIS from the solver has several advantages: it is faster and for models with integer variables it also finds an IIS if the infeasibility is triggered by the integrality of some of the variables. (The new option `Use IIS from solver` controls which approach is used to calculate an IIS.).
-  The mechanism to determine when a definition should be re-evaluated has been completely replaced. This has been done to better support the new compiler but also to clear the path for some upcoming new features. Because of these changes you may notice some differences in your model, listed below. We tested the new version thoroughly, but it can still be that something in your model is not working correctly because of this change. Please let us know as soon as possible.

  -  definitions are sometimes evaluated in a different order than before.
  -  certain uses of the ``orderBy`` attribute are now detected as a 'cyclic dependency'.
  -  the ordering of elements in a set that does not have an ``orderBy`` attribute specified can be different.

-  AIMMS now reads its timezone names from a supplied JSON file, generated from the static time zone information of Windows during deployment of the AIMMS release. Making this list independent of locale, OS and time-of-use should increase stability when using time zones explicitly in calendars. As a consequence, time zone names are now always in English. If really needed, the file can be adapted to match locale or changed policies.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  If the CPLEX option `print presolve status` was switched on, any action in the Math Program Inspector that triggered a solve (e.g., Resolve) would result in a crash. This bug was introduced in AIMMS version 4.71.1.
-  In previous AIMMS versions it was allowed to use the function :any:`ElementRange` to specify the initial data of a set. For the new compiler and execution engine, this turned out to be a serious problem as it does not expect function calls in a constant data expression. If you use this construct in your model, you will get an error on it now and you need to either change it to a DATA statement or move the initialization to the MainInitialization procedure. Please note that 

      .. code:: 
          
          ElementRange(1,10,prefix:"element-") 
     
      can also be specified as:
      
      .. code:: 
      
          DATA { element-01 .. element-10 }.


-  Assigning elements to a set within a for loop could lead to errors.
-  An ordered local set in a procedure could give unexpected warnings when used in a for loop.
-  Although not specific for this release, please be informed that during the last two years one of the things that has been modernized is the code to handle iterative operators. While doing that it was not recognized that the old implementation had a bug: older AIMMS versions moved conditions on the data to the index domain, which is only correct if zeros have no effect on the result (like in sum, count, first). For example, with zero's in A, prod(i, A(i)|A(i)) would return a nonzero result. It now correctly returns zero, but when using the construct it is likely prod(i|A(i), A(i)) was intended. Especially when you upgrade to the latest AIMMS from a rather old AIMMS version, be aware of this.
-  There was an error in the wizard of the Source File attribute to write a section to a new separate .ams file. This resulted in the problem that in subsequent actions files were not found or were written to incorrect folders.
-  When saving the database structure with the function :any:`SaveDatabaseStructure`, column information on foreign keys was not stored, and also the password for the database was not stored if the function :any:`SQLCreateConnectionString` was used. The effects of these issues were that even when a recently created file was loaded with `LoadDatabaseStructure`, it could still happen that foreign key column information was retrieved from the database (which can take a while, depending on the database vendor), and that a user was prompted for a password. These issues are resolved. To benefit from these fixes, the model developer needs to call the function :any:`SaveDatabaseStructure` on a fully initialized model once, and use the thus newly obtained structure file in the function :any:`LoadDatabaseStructure` in production.
-  A syntax error in the SQL query could occur when writing to a database table that uses other quotes than '"' for its column names if the database structure was loaded from a file.
-  A nodelock license could give an error (error code 104) when a laptop awakes from a sleep/hibernate state while the AIMMS session was still active.
-  Help was missing for the option ``Database string valued foreign keys``.
-  **IMPORTANT:** A few months later than originally announced, AIMMS does no longer accept compound set constructs in your model and now flags these as an error. Please take measures to reformulate your model to not use compound sets anymore. See also `Deprecation of Compound Sets <https://how-to.aimms.com/Articles/109/109-deprecate-compound-sets-overview.html>`__.
-  When the .ams source file was edited in an other editor and tabs were used instead of spaces for the indentation of the model tree, in the attribute windows in AIMMS the code was indented too far. Now both spaces and tabs are recognized as indentation.

WebUI Improvements
++++++++++++++++++++

-  The Map widget has been extended with many exciting new features. For a complete overview of all that is new, please see `New Features (Map V3) <https://www.aimms.com/support/new-features/#MapV3>`__.

.. Warning::

    Because of the map upgrade, we needed to make a change in the CSS selectors for the arcs: arcs used to be **polyline**, now they are **path**. The labels on the arcs used to be **rect**, now they are **div**. If you are using these selectors in your custom CSS, you will need to make the appropriate changes. Please note that the custom style changes on arcs were not officially supported by AIMMS. We will now support some of the CSS properties for arcs that are mentioned in the CSS styling section of the manual.

-  You can now use a wizard to select a ``webui::UponChangeProcedure``. Please, make sure you select a procedure with the right prototype: the UponChange procedure can have 0, 1 or 2 arguments. For details on this, please see `the documentation <https://documentation.aimms.com/webui/widget-options.html#additional-identifier-properties-a-k-a-old-style-annotations>`__.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When having an active case and a comparison case open in the WebUI, the data from the active case was not editable anymore.
-  Removing the ``webui::AnnotationsIdentifier`` from a set did not have any effect on an open WebUI page. Now it does.
-  A scalar value now gets updated correctly if a user double-clicks on a cell having units, followed by another single click and a changing of the value and then a click outside of the widget.




--------------

#############
AIMMS 4.72
#############

AIMMS 4.72.3 Release (April 9, 2020)
------------------------------------

 Build 4.72.3.2

Resolved WebUI Issues
+++++++++++++++++++++++

-  Scrolling using the mouse wheel in Multiselect widget in a sidepanel did not function properly.
-  Editing a value in a Scalar widget displaying a unit now works as expected.




--------------



AIMMS 4.72.2 Release (March 31, 2020)
--------------------------------------

 Build 4.72.2.5

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The DataChangeMonitor did not work for sets with an order by attribute value other than 'user'.
-  When compiling a model with a lot of errors, for example during a big change in domains and sets, AIMMS could crash because of collateral damage while trying to continue compiling as far as possible.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Removing the ``webui::AnnotationsIdentifier`` from a set did not have any effect on an open WebUI page. Now it does.
-  The ``pro::sessionmanager::FinishSession()`` procedure will no longer produce the connection.txt dialog with logging information as this info has become obsolete and the dialog is a nuisance when executing this function. Now the ``pro::sessionmanager::FinishSession()`` procedure will gracefully close the App and release the seat (in case you have no other Apps open).
-  After selecting the check box for customization of the table widget, it was not always possible to move it to a new position within the WebUI window.




--------------



AIMMS 4.72.1 Release (March 19, 2020)
--------------------------------------

 Build 4.72.1.1

AIMMS Improvements
++++++++++++++++++++

-  CP Optimizer 12.10 has been added.
-  Knitro 12.1 has been added.
-  The "Jose" support package for the BoxR library was added to AIMMS.
-  The "Caret" package has been put on the cloud.
-  There is a new option `display_elements_with_quotes` that can be used to indicate whether element names that are printed during a Display statement should be surrounded with single quotes.
-  The option `Repeat postsolve` has been added which can be used to instruct the postsolve step to find a solution that is inside the variable bounds.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The Math Program Inspector did not calculate the slack and surplus values correctly for greater-than-or-equal constraints and ranged constraints.
-  AIMMS no longer prints unnecessary line breaks in the CPLEX status file.
-  FileCopy in a Linux environment did not work when the destination file already existed.
-  The model solved during the postsolve step would almost always be marked as infeasible after a user interrupt. (Please note that the postsolve will only be triggered after an interrupt if the option `Do postsolve after interrupt` is switched on.).
-  During the postsolve of a MIP model with the option `Postsolve Continuous Variables` set to 'Round to nearest bound and resolve LP', continuous variables were not always fixed on the nearest bound if the level value was outside the bounds.

WebUI Improvements
++++++++++++++++++++

-  We added the new List Widget to the WebUI as an experimental feature.
-  UponChange procedures for the WebUI can now be specified through AIMMS annotations, instead of using prefixed procedure names.
-  As another experimental feature, we now offer support in the WebUI Library for determining the currently open tab/page in the browser.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The wizard to add new widgets has been improved with regard to validity checking. Furthermore, some annoying behavior has been addressed, such as losing changes already made when clicking OK before having entered a widget name.
-  In some cases, the 'Busy' message was not being displayed in the WebUI when the WebUI/AIMMS was actually busy, possibly leading to confusion for the user. For example, widgets could (still) show as empty.
-  WebUI will show a busy veil whenever AIMMS does not respond for whatever reason (e.g. a dialog being open, some procedure run being triggered from outside WebUI).
-  There is now an explicit message in the WebUI that Internet Explorer 11 was deprecated.


--------------

#############
AIMMS 4.71
#############


AIMMS 4.71.7 Release (March 13, 2020)
-------------------------------------

 Build 4.71.7.3

Resolved AIMMS Issues
+++++++++++++++++++++++

-  SQLCreateConnectionString did not work correctly when the provided password contained a ';' character.
-  Assigning to an output string argument of an external procedure (from within C++ code) could make AIMMS crash.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The busy screen could be flickering when a dialog page was open in the WebUI.
-  The ``webui::GetAllPages`` procedure failed to execute sometimes after creating a new page.



--------------



AIMMS 4.71.6 Release (February 28, 2020)
-----------------------------------------

 Build 4.71.6.8

Resolved AIMMS Issues
+++++++++++++++++++++++

-  On the cloud, the newest MS SQL ODBC Driver is used and this new version introduces a new underlying data type for the TIME data type that was not yet supported.
-  Using SetElementAdd within a procedure was no longer working correctly when the passed set was part of a pure union set. A pure union set is a set that is defined as the union of a number of subsets.
-  When applying the suffix .unit on an index of AllIdentifiers sometimes the unit parameter was returned instead of the actual unit value.
-  When reading multiple cases in sequence, the time to read a case sometimes became unexpectedly long. AIMMS now uses a different memory allocation algorithm during the case read and this can drastically improve the performance.
-  The profiler values that are shown in the margin of the model editor were not updating correctly when the line numbers were also displayed.
-  If the option `matrix block sizes` was switched on, any action in the Math Program Inspector that triggered a solve (e.g., Substructure Causing Infeasibility) would result in a crash. This bug was introduced in AIMMS version 4.71.1.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, starting up the WebUI in a recent version of AIMMS would display an incorrect 'Compatibility Issue' dialog.
-  We improved the error message (when opening WebUI) in case the ``webui.json`` project file is invalid (e.g. as a result of a source control merge conflict being resolved in a faulty way).
-  Element parameters in (a subset of) the set AllCases will now, in the WebUI, be displayed by the filename of the corresponding case file (instead of as an integer in the set AllIntegers).



--------------



AIMMS 4.71.5 Release (February 14, 2020)
----------------------------------------

 Build 4.71.5.5

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The SolverStatus of a Math Program was not correctly restored from a case file. This was especially noticeable when solving via a PRO solver session.

Resolved WebUI Issues
+++++++++++++++++++++++

-  We addressed a number of issues with the multiline Scalar widget. The empty space on the top has been removed, such that the multiline Scalar looks similar again as in AIMMS 4.69 and before. The font size has been modified and tooltips will not be shown on multiline Scalar widgets anymore.
-  In AIMMS 4.71, filtered data in the WebUI was sometimes updated incorrectly. An additional issue noticed in Gantt charts, that was missed in the fix made in 4.71.3, has been addressed now.
-  As we have deprecated the support for Internet Explorer, the AIMMS IDE no longer offers it as a browser of choice for starting the WebUI. The only choices offered now are Chrome and Edge.



--------------



AIMMS 4.71.4 Release (February 7, 2020)
---------------------------------------

 Build 4.71.4.2

Resolved WebUI Issues
+++++++++++++++++++++++

-  The Gantt chart used to group resources when the ``ElementTextIdentifier`` translation was the same for 2 or more resources. This has been corrected: no resources are grouped anymore even when the translation is the same.
-  Users can now drag and change the duration of jobs when the end time of one job and start time of the next job are the same. Earlier it was difficult to change the duration of the job that had the end time the same as the start time of the next job.
-  The WebUI could crash when using it on a model using a procedure with more than 32 arguments. Now the WebUI will not support models using procedures with more than 64 arguments.



--------------



AIMMS 4.71.3 Release (February 6, 2020)
----------------------------------------

 Build 4.71.3.5

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In rare cases, using the 'unordered' specifier on a for loop could lead to errors/data corruption.
-  When the connection to a database was lost, a crash could occur when trying to reestablish the connection.
-  There was a regression issue where an empty element in a set enumeration (such as ``{'a', ''}``) caused a crash during compilation.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Filtered data in the WebUI was sometimes updated incorrectly, which could lead to errors.
-  On cloud, message dialogs used to open in front of a dialog page, which caused the application to freeze.



--------------



AIMMS 4.71.2 Release (February 4, 2020)
---------------------------------------

 Build 4.71.2.2

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes when editing a value in a widget on a page with a scroll bar, the page could unexpectedly scroll to a different position after doing so.
-  The Gantt chart could get frozen when resizing a job.



--------------



AIMMS 4.71.1 Release (January 30, 2020)
---------------------------------------

 Build 4.71.1.0

AIMMS Improvements
++++++++++++++++++++

-  From this AIMMS version onwards, we are not releasing the 32-bit versions of the software anymore.
-  The Math Program Inspector is now using GMP functionality underneath. This makes it easier for us to maintain the code and add new functionality in the future. The Math Program Inspector can now be used to inspect stochastic programming models, that is, math programs generated with the function GMP::Instance::GenerateStochasticProgram. Several minor bugs have been fixed, including a bug that caused the action Substructure Causing Infeasibility to sometimes fail for nonlinear models, and another bug that caused the action Irreducible Inconsistent System to fail for models with SOS constraints.
-  The menu bar from the Math Program Inspector now has the menu command 'Stop' (and thus it responds to CTRL+SHIFT+S).
-  R-packages have been upgraded.
-  CPLEX 12.10 has been added.
-  Gurobi 9.0 has been added. Gurobi 9.0 can be used to solve non-convex quadratic programming problems (QP, QCP, MIQP and MIQCP) by setting the new option `Nonconvex strategy`.
-  There is a new property 'No Implicit Mapping' added to the 'database table'. When executing a read or write statement on the table, implicit mapping occurs by comparing the column names in the table which are not already bound by the explicit mapping with identifier names in the model. This is not always the desired behavior, so now this implicit mapping can be turned off.
-  We added a new option `Warning comparing elements different sets` to control the warning that you get on an expression that compares two elements of different sets. If you know how the comparison works in that situation there is no harm in leaving it as is and hence that you ignore this warning. See the help on this new warning for more information.

WebUI Improvements
++++++++++++++++++++

-  It is now possible to hide the navigation menu from the application settings.
-  The Workflow and Status bar features are now available as regular features. Both have been removed from the experimental features configuration.
-  The existing methods of adding Flags, Tooltips, Annotations and Text annotations have been deprecated. We now offer a more elegant solution to achieve the same result, which requires some changes to existing models that make use of these features. The former specification by _flags, _tooltips, _annotations and _text will be removed in a future release and we therefore advise you to adjust your models as soon as possible. For details, see the documentation.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In previous versions, AIMMS accepted that the Initial Data attribute of a set contained references to other sets in the model. This was not according to what the Language Reference stated and it also was not always working as expected. From now on this incorrect specification will be gradually deprecated, starting with giving a warning when it is encountered in a model. In a future version this usage will become just an error, so you are advised to spend some time fixing it. Fixing means that you either change the Initial Data in a Definition, or that you move the initialization of the set to one the initialization procedures in your model.
-  The missing options 'Sifting algorithm' and 'Benders worker algorithm' have been added for CPLEX 12.9 and 12.10.
-  The missing option `MIP priority order type` has been added for CPLEX 12.10. The option `Use order` has been renamed to 'MIP priority order switch' in CPLEX 12.10.
-  The irreducible infeasibility set (IIS) was sometimes not printed in the listing file when running a project on PRO. (Printing of the IIS is controlled by the option `Infeasibility Finder`.)
-  The "Index Domain Wizard" was made a bit larger, to accommodate for more text to be visible.
-  If a large value (> 1000) was assigned to the option `solver workspace`, no extra memory was allocated for MINOS.
-  The AIMMS API now uses the local time of the convention, if specified, when translating dates to calendar elements.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Custom tooltips were not always displayed for Scalar widgets.



--------------

#############
AIMMS 4.70
#############


AIMMS 4.70.4 Release
----------------------------------

 January 24, 2020 Build 4.70.4.20

AIMMS Improvements
++++++++++++++++++++

-  Four new functions have been added to the AIMMSXLLibrary to determine the boundaries of the data in a sheet: ``FirstUsedRowNumber``, ``LastUsedRowNumber``, ``FirstUsedColumnNumber`` and ``LastUsedColumnNumber``.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  An error in the function DateDifferenceDays was not reported at the correct location and popped up during a later stage in the execution.
-  In the WinUI, displaying a large number in scientific notation was not always working correctly.
-  There was a problem with the function SetElementAdd when used inside a procedure where the set was passed as an argument.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Text entered in the Title field in the widget options is now properly editable, without removing the previous content.
-  In AIMMS 4.70, changes in element parameters were sometimes not shown in the WebUI.
-  When using a display domain in a widget, such that the display domain depends on identifiers present in the same widget, did not update the display domain immediately when it should, leading to unexpected behavior.
-  Single-clicking on the drop down arrow icon on element-valued cells in Table or Scalar widgets did not work as expected anymore: it incorrectly required a double-click.
-  It was not possible to add/change widgets to/on pages with hidden visibility due to internal ``webui.json`` validation.
-  When having a Totals column in a WebUI table (by using the Totals section in the table's options editor), it was impossible to change the width of this column.
-  While updating/redrawing secondary page actions, the page actions menu was flickering.
-  The WebUI would not start up when running the x86 (i.e. Windows 32-bit) version of AIMMS.
-  Configured annotation text was not displaying anymore in the scalar widget.



--------------



AIMMS 4.70.3 Release (January 3, 2020)
--------------------------------------

 Build 4.70.3.4

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The AIMMSXLLibrary now provides a proper error if you try to write outside the row/column limits of an Excel sheet. For a .xlsx file the maximum number of rows is 1,048,576 and the maximum number of columns is 16,384. For a .xls file these limits are 65,536 rows and 256 columns.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Adding a page to your WebUI with a name that was (internally) reserved, like for example "Properties", led to the page name not being displayed with a capital in the page menu of the WebUI.
-  Sometimes clicking just outside of a checkbox in a WebUI table, made the value change in the WebUI, but did not communicate this change to AIMMS.



--------------



AIMMS 4.70.2 Release (December 19, 2019)
---------------------------------------------

 Build 4.70.2.4

Resolved AIMMS Issues
+++++++++++++++++++++++

-  There was still a problem with the fix in 4.69.6 with the database mappings running over a subset of the declaration domain of the identifier.
-  When using a sparsity modifier on an iterative operator, empty domains were not handled correctly, leading to an incorrect error message.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes the WebUI displayed (unexpectedly) empty selection widgets.
-  In some cases, when changing WebUI options, you could get an error about not being able to write the ``webui.json`` file.
-  There were some tooltip alignment issues in the Scalar widget.



--------------



AIMMS 4.70.1 Release (December 12, 2019)
----------------------------------------

 Build 4.70.1.6

**IMPORTANT!**

For this AIMMS 4.70 release, we had to update our signing certificate. However, on some machines this may lead to the following warning dialog from Windows Defender Smartscreen popping up:

 

.. image:: Images/Release_notes_files/image005.jpg
   :name: Picture 2


Should this happen on your machine as well, please click on 'More info'. Then you will be presented with the following dialog:

 
.. image:: Images/Release_notes_files/image006.jpg
   :name: Picture 1

Here, it is safe to click on 'Run anyway'. From then onwards, AIMMS will execute normally. We apologize for this inconvenience.

 

AIMMS Improvements
++++++++++++++++++++

-  The TSA ("Time Series Analysis") R-library has been added to AIMMS.

WebUI Improvements
++++++++++++++++++++

-  We added new aggregator types to the WebUI widgets. For example, you can now distinguish between aggregators for the total data covered by a widget, or for only the data currently displayed. For details, see the `documentation <https://manual.aimms.com/webui/widget-options.html#totals>`__.
-  In the multiselect widget, we added the possibility to translate the phrases 'SELECT ALL' AND 'SELECT NONE' (using a standard language translation (i.e. -'properties') file.
-  In the application settings, the Workflow Panel section that contained Workflows and Workflow Steps has been moved under Application Extensions section along with the Status Bar setting. The Application Extensions section will contain all features that will work across the application.
-  In the page settings, the Workflow Items section that contained Side Panels, Primary Page Action and Secondary Page Actions has been renamed to Page Extensions. Page Extensions are features that are specific to pages.

**Be aware: changed behavior/CSS classes in the WebUI**

-  We have made the alignment of scalar widgets more consistent. String parameters, element parameters and numbers are now all displayed centered when displayed as a single scalar.
-  Previously, when an element parameter was displayed as a dropdown (in a Table or Scalar widget), the user had to click once to activate the dropdown. Now either a specific click on the small 'down arrow' on the right is needed, or a double-click on the value.
-  Some CSS classes for the Scalar widget have changed: .boolean-value-editor changed into .boolean-cell-editor-contents, .string-value-editor changed into .string-cell-editor-contents and .dropdown-value-editor changed into .dropdown-cell-editor-contents. These changes will be quite evident when using switches for binary values, for example, as these will display as checkboxes now. In this case, you would need to use the new class names in your CSS in order to get your switches back.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  During the read/write statement, AIMMS now gives an execution error when you try to reference an indexed database table via an element parameter.
-  Some usages of iterative operators as index expression in a scalar statement could crash.
-  A statement like `MySet+='4';` triggered an error about the element not being an element in the set. Of course this is an incorrect error message because adding the element to the set is the purpose of this statement. This is a regression issue that was introduced in version 4.68.
-  The handling of enumerated sets (like: { 'label1', 'label2', 'label3' }) is now mostly done by the new compiler and new execution engine. Because of that you may get different warnings and/or errors whenever an individual element in an enumerated set cannot be added or is not an element in the corresponding (root) set. This is especially the case when referring to non existing identifiers in a subset of the predeclared set AllSymbols.
-  In the function Card, the second (optional) argument should now really be an element in the set AllSuffixNames. This means that the very old and deprecated suffix names like for example "l", "lo" and "up", will now give an error.
-  While implementing the new compiler we found two language constructs that were accepted by the old compiler, but are actually incorrect. These two constructs now give an error: 1. An element range specified as { 1 .. element-valued-expression } where the range of the element valued expression is not a subset of Integers. This is incorrect syntax and should be written as { '1' .. element-valued-expression }. 2. In some situations the compiler accepted a construct like (index in StringToElement(set,"element")). This is wrong syntax because the IN operator expects a set at the right hand side and not an element. The correct way to write this is (index = StringToElement(set,"element")).
-  AIMMS is gradually replacing its compiler by a new version. In this release, the new compiler can handle a number of statements that involve units. While running our tests, we noticed that when a model contains a unit and an index with the same name, the new compiler gets confused. We have been able to resolve all confusions that our tests covered but your model may contain constructions that we did not foresee. We would like to hear back from you to better our implementation and in most cases we will be able to provide you a workaround.
-  It was possible to assign a value to a subset which had a definition.
-  The program and solver status were incorrect if CPLEX hit a time limit while solving a multi-objective optimization problem.
-  The solver status returned by CONOPT 4.0 was incorrect if the iteration limit was set to 0.
-  The postsolve step could fail if CPLEX was used to solve a multi-objective optimization problem for which no objective was specified in the corresponding mathematical program.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Widget and Page entries in the ``webui.json`` file are now internally sorted, which results in a much lower chance of merge conflicts arising when having your WebUI project under version control.
-  On the identifier selection dialog (used for the Map widget, for example), the details from the 'your selection' section could only be reached by using a scroll bar.



--------------

#############
AIMMS 4.69
#############


AIMMS 4.69.7 Release (November 14, 2019)
----------------------------------------

 Build 4.69.7.9

WebUI Improvements
++++++++++++++++++++

-  The user can now add translations for menu items.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS now always gives a compilation error if you declare the same index in a separate Index declaration and as index attribute of a set. Like in this example:

Index i { Range: S; }

Set S { Index: i; }

In previous versions this seemed to work okay, but it could lead to serious crashes during further model edit actions.

-  A problem was caused by an Empty statement where the identifier to be emptied was specified over subsets of the declaration domain. This resulted in a problem with the sorting of a set, which left the execution structures in an erroneous state.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When a widget is displayed in full-screen mode, it occupies the full screen, even if the maximum column size has a non-default setting for the current page.
-  The Upload and the Download widget did not respect the translation file (i.e. the text(s) on these widgets was non-alterable).
-  The label text in Gantt Charts is now also visible when there is whitespace before or after the text.
-  It was possible that by clicking slightly outside of the primary action button, the primary action was triggered.
-  Some transitions between widget types resulted in an empty 'Pivot' section of the options editor of the widget.



--------------



AIMMS 4.69.6 Release (October 25, 2019)
---------------------------------------

 Build 4.69.6.10

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When in a database mapping an index is used that runs over a subset of the declaration domain of the identifier, this implicit filter was not respected during a write to a database.
-  If the definition of a set is calculated via a procedure call, an incorrect error about a cyclic dependency could be triggered.
-  When a database table had a column that matched an identifier in the model that does not contain storable data (such as a section), writing or reading from the database would give an error because of the implicit mapping feature. Now these kinds of matches are ignored by the implicit mapping feature.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Adding any special character to your job titles (using the _text suffix) made all the text appear in the first bar of the Gantt Chart widget and moving the bars was not possible anymore.



--------------



AIMMS 4.69.5 Release (October 14, 2019)
-----------------------------------------

 Build 4.69.5.9

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the Identifier Selector tool of the IDE a node of type NodeSelector ignored all procedures and functions that were part of the selected model node.
-  Reading back a calendar from a case file could fail if some of the parameters that define the calendar were not included in the case file as well.
-  In some rare cases calendar attribute "Timeslot format" required specifier for week number, when in fact it was not necessary.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When trying to specify a slicing for an identifier in the identifier selector dialog, it was sometimes impossible to select the required fixed element value from the list. This happened when the set from which you wanted to select it, contained more elements than fitted the list.
-  It could happen that by changing the set order of an identifier displayed in the Table widget when running in the cloud, the Table widget could become empty, only to repopulate after a manual browser refresh.



--------------



AIMMS 4.69.4 Release (October 7, 2019)
------------------------------------------

 Build 4.69.4.1

Resolved WebUI Issues
+++++++++++++++++++++++

-  When deleting a row in the Table widget which was located around the center of the Table, it could happen that after the deletion the Table would be scrolled to a completely different part of the Table. Now the row(s) around the deleted one will remain in the center of the Table.
-  When having a specific Table row in focus and scrolling that row out of view and then clicking somewhere in a column header, would cause this previous focus row to appear on the top of the Table, hence losing your current scrolling position.



--------------



AIMMS 4.69.3 Release (September 26, 2019)
-------------------------------------------

 Build 4.69.3.2

Resolved WebUI Issues
+++++++++++++++++++++++

-  Due to browser storage problems, it could happen that WebUI apps only showed an empty WebUI on specific browsers.
-  (Very) old WebUI projects sometimes failed to open, because their internal structure was not perfectly converted into the new ``webui.json`` file. We have improved the backward compatibility.



--------------



AIMMS 4.69.2 Release (September 24, 2019)
-----------------------------------------

 Build 4.69.2.1

Resolved AIMMS Issues
+++++++++++++++++++++++

-  If a numeric value is converted to a string representation (either via FormatString or via an implicit conversion), the value according to the actual unit should be used. This was not the case in all situations. Additionally, when this is used in a definition, the definition is now re-evaluated when the current convention of the model changes.
-  When reading from a database table into a parameter with a definition, no error was raised. Now this will correctly show an execution error.
-  When reading from a database table and filtering on a column which was not in the index domain of the identifier, the identifier got incorrect data. This situation now issues an execution error.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In AIMMS 4.69.1, the WebUI did not load anymore when the workflow flag was enabled and the workflows identifier was not configured.
-  It could happen that both the HTML and the textual tooltip were displayed in the Table widget.



--------------



AIMMS 4.69.1 Release (September 17, 2019)
-------------------------------------------

 Build 4.69.1.0

AIMMS Improvements
++++++++++++++++++++

- Multi-objective optimization problems can now also be solved with Gurobi 8.0 and higher.
- The *incumbent* callback procedure has been renamed to *candidate*, and the *new incumbent* callback procedure has been renamed to *incumbent*. Note that the functionality of the *incumbent* callback procedure has changed as it now can no longer be used to reject candidate incumbent solutions (use the new *candidate* callback for that).
- The math program suffix *.CallbackNewIncumbent* has been renamed to *.CallbackIncumbent*. The procedure :any:`GMP::Instance::SetCallbackIncumbent` has been renamed to :any:`GMP::Instance::SetCallbackCandidate`, and the procedure ``GMP::Instance::SetCallbackNewIncumbent`` has been renamed to :any:`GMP::Instance::SetCallbackIncumbent`. (The math program suffix *.CallbackNewIncumbent* and the procedure ``GMP::Instance::SetCallbackNewIncumbent`` are now hidden.)
- In rare cases, CPLEX 12.9 could incorrectly return a zero-solution inside an incumbent callback procedure (previously known as new incumbent; see the previous note) if the CPLEX option `Use generic callbacks` was at its default setting.
- During the execution of certain statements, AIMMS now responds quicker on an attempt to interrupt the execution via the AIMMS interrupt tool.
- AIMMS is gradually replacing its compiler by a new version. In the old compiler, the precedence of the $-operator was not always consistent and in many cases different from what the language reference says. In the new compiler the precedence of the dollar operator is always as stated in the language reference, taking precedence over all other binary operators. This can cause a different interpretation of your expression, and therefor a warning is now reported when the new compiler encounters an expression in which this may be an issue: The precedence of the $ operator has in some situations changed in the new compiler. Use parentheses to make your intention clear. In some cases, the changed interpretation can lead to compile errors, which may be puzzling. In other situations, the result may be different. To correct these warnings there are multiple solutions:

	-  add the parentheses around the operands of the in-operator in an expression: ``P $ i IN setI`` -> ``P $ (i IN setI)``
	-  replace the $-operator by a \|-operator for a domain condition: ``sum( i $ i <> EP, P(i))`` -> ``sum( i | i <> EP, P)``
	-  remove the 1 $ for expressions that are already binary valued: ``1 $ P(i) > 7`` -> ``P(i) > 7``

	Please note that the ``onlyif`` operator is also treated as a $-operator.

-  During the creation of an ``.aimmspack`` file, you can now indicate that you want to include a copy of each repository library that is part of your project. The end user can then run the project without the need to have access to the on-line library repository.
-  It is no longer allowed to assign a set with only one element to a non-scalar element valued parameter. For example: ``myElemPar(i) := { i };`` This has never been part of the official AIMMS syntax and should now be rewritten as ``myElemPar(i) := i;``
-  The Intrinsic Database Functions TestDataSource, TestTable and TestColumn now set the CurrentErrorMessage with the available information if they return 0.

WebUI Improvements
++++++++++++++++++++

-  Visible license info text above Menu and Settings (``LicenseInfo``, ``sessions.default.id``, ``sessions.default.id.private``, ``widget.visibility.greyout``) on the Miscellaneous tab under Application Settings are now hidden so users can't (easily) use it. They are still present under the Advanced tab, though.
-  When opening a WebUI model containing a Map V1 widget or Page Actions V1 functionality, you now get a deprecation warning. The dialog contains a link explaining why this is and what you can do to make your WebUI future-proof in this respect.
-  App developers now have the control to hide/show the download CSV data button in a table widget with the option "Hide Download data" in the Table widget settings.
-  When UI Editable is set to false, the end user now cannot change the values for showing/hiding the data manager in the Application settings and for showing/hiding the CSV download button in Table widgets.
-  The Data Manager can be shown/hidden now from the application settings.
-  The settings cog-wheel for several smaller widgets (such as button, label, upload, download and selection box) has been changed, such that it no longer floats outside the widget but stays inside so users can actually find it easily and have no overlap or out of viewport issues.
-  Widget actions are now also available for Scalar, Legend and Slider widgets.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When calling AIMMS procedures from the WebUI, local parameters were not reset.
-  CPLEX 12.9 could hang in a callback procedure.
-  A chapter on SessionArgument has been added to the Function Reference.
-  Referencing a defined parameter that has a domain condition from within an expression could sometimes lead to a strange and incorrect compilation error.
-  The number of nodes shown in the progress window after a solve was not correct if CPLEX was used.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The Busy bar is back when any execution is triggered from a dialog window.
-  When a _text parameter is added to the Gantt Chart for inline text in the jobs, on moving the job out of the Gantt Chart viewport, the text was also going outside of the viewport.
-  On deleting a widget, we now immediately remove its reference from the WebUI.json file.



--------------

#############
AIMMS 4.68
#############

AIMMS 4.68.6 Release (September 16, 2019)
------------------------------------------

 Build 4.68.6.11

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When the AIMMS IDE Message Window and the WebUI browser window are open at the same time, two threads might be reading and modifying the same information, which could lead to an AIMMS crash.
-  When scheduling multiple procedures via the call to ScheduleAt, the procedures were not always executed at the correct moments in time.
-  A solve with ODH-CPLEX could hang if a time callback procedure was installed.
-  A parameter with an indexed unit parameter as unit and with one of its domain sets being empty took a really long time to display in the WinUI Pivot Table.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The tooltips on hover of widget headers and table identifier headers was not displayed.
-  The WebUI was broken in Internet Explorer 11 on the latest released version (AIMMS 4.68.5).
-  Especially in Internet Explorer 11 and Microsoft Edge, the '+' button on the bottom of the options editor for the Map widget disappeared for a few seconds after clicking it.
-  A Gantt Chart job would move when it was only clicked and not dragged.
-  Widget tooltips could overlap message dialogs in the WebUI.
-  Gantt Chart job texts could be placed outside of the associated job.



--------------



AIMMS 4.68.5 Release (August 29, 2019)
-----------------------------------------

 Build 4.68.5.13

WebUI Improvements
++++++++++++++++++++

-  We have added an experimental feature "Highlight" for widgets in the WebUI. This features enables you to add additional css classes to specific tuples in widgets. It allows for more responsive synchronization between widgets. Currently the Gantt Chart and the Table widgets support this. For details on how to enable this experimental feature, please contact `AIMMS support <mailto:suppport@aimms.com>`__. For more details, see `the documentation <https://documentation.aimms.com/webui/css-styling.html#highlighting-experimental>`__.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In the search list of the Contents options editor, you would see a '+' icon in the results. This has been removed, as it served no purpose.
-  In the Bubble Chart widget, the Pivot options editor did not work correctly.
-  Read-only flags were not always immediately updated in the WebUI upon changing.
-  Tooltips were sometimes shown outside the intended area.
-  Single-page WebUI apps were converted to the new ``webui.json`` format incorrectly in AIMMS 4.68.



--------------



AIMMS 4.68.4 Release (August 22, 2019)
----------------------------------------

 Build 4.68.4.4

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Due to a performance degradation, in release 4.68.2 the fix for 'When runtime identifiers are added or deleted (by another thread) the Model Explorer now updates its tree accordingly' was reverted. Now we have fixed this issue in a much nicer way.
-  There was a problem during case I/O for parameters for which the stochastic data was still available, while the 'Stochastic' property had been removed.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some cases, clicking on a row in a Table widget, immediately followed by a scroll up or down, was too slow.
-  In some cases, just scrolling in a Table widget was too slow.
-  Editing values in the Table widget could be slower than in earlier versions.
-  The rendering time of the Gantt Chart widget has been improved.



--------------



AIMMS 4.68.3 Release (August 20, 2019)
--------------------------------------

 Build 4.68.3.18

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In rare cases, solving a math program for a second time could result in an error if the first solve was using a callback procedure in which another math program was solved. This only occurred if the solver used multiple threads (e.g., if CPLEX was solving a MIP).
-  A crash could occur when deleting specific libraries from within the Library Manager dialog.
-  Moving a node in the model tree from global to local procedure scope (or vice versa) could lead to a crash during subsequent model editor actions.
-  In a runtime library, moving a node into a procedure or function incorrectly marked the complete application as 'edited'.
-  The default value of the option `Warning_empty_iterative_domain` is changed from 'Error in develop else off' to 'Off'. Although not mathematically correct, in most of the existing AIMMS models the fact that the Mean over an empty iterative domain set results in 0.0 is accepted behavior.
-  The SolutionTime suffix of a math program would contain a negative value (after a solve) if the solver used multiple threads (e.g., if CPLEX used the concurrent optimizer).

Resolved WebUI Issues
+++++++++++++++++++++++

-  There was a misalignment of widgets in dialog pages.
-  There was a problem in the page menu, if a folder had the same name as the app name. In that case, pages listed below it were failing when accessed through the menu.
-  Using double quotes in HTML-tooltip text could lead to problems in displaying the tooltips.
-  The Show or hide Widget controls button was not displayed on tablets.
-  In the Ganttchart widget, a job was not displayed if its start time was 0 (but had a duration), while the previous or the next job did have a start time but no duration.
-  The application of name changes is now restricted to only the identifier names that cannot be resolved within the current model context.



--------------



AIMMS 4.68.2 Release (July 29, 2019)
-------------------------------------

 Build 4.68.2.4

Resolved WebUI Issues
+++++++++++++++++++++++

-  In 4.68.1 an issue was introduced that made some actions in WebUI very slow when AIMMS Developer was also open. This issue was introduced by the fix for *When runtime identifiers are added or deleted (by another thread) the Model Explorer now updates its tree accordingly.* This fix is now reverted.
-  The widget option editor can now be scrolled upon changing the zoom level.
-  A delay (similar to tooltips) has been added to elements in all charts including map nodes, to avoid flickering.



--------------



AIMMS 4.68.1 Release (July 19, 2019)
-------------------------------------

 Build 4.68.1.6

AIMMS Improvements
++++++++++++++++++++

-  The new procedure ProfilerCollectAllData allows you to retrieve the profiling measurements of statements that are executed on the server and thus display this data in the WebUI.
-  Knitro 12.0 has been added.
-  The AIMMSXLLibrary has a new option :any:`axll::TrimLeadingAndTrailingSpaces`. If you set this option to 1, any leading or trailing spaces in a cell value will be removed before passing it to AIMMS.

WebUI Improvements
++++++++++++++++++++

-  The WebUI now supports name changes in the AIMMS model. Before this version, using identifiers in the WebUI that had their name changed in the AIMMS model, required you to re-select the changed identifier(s) where used in the WebUI. From now on, model name changes are propagated to the WebUI.
-  AIMMS has been extended with a procedure :any:`webui::SetProgressMessage` which allows you to replace the text of the 'busy' message in the WebUI with something more suitable to your specific situation. You can update/change this message multiple times during execution. For details, see `the documentation <https://manual.aimms.com/webui/library.html#setprogressmessage>`__.
-  We added Page Actions to the WebUI, which help your users to get quick access to actions that are needed often, while at the same time reducing unnecessary clutter on their WebUI pages. For details, see `the documentation <https://manual.aimms.com/webui/page-settings.html#page-actions>`__.
-  WebUI now offers, similar to the Page Open Procedure, a Page Leave procedure, which is called upon leaving the page for which it is specified. For details, see `the documentation <https://manual.aimms.com/webui/page-settings.html#action-upon-leave>`__.
-  We are currently working on our Workflow support feature in the WebUI. For more details and information on how to get access to this experimental feature, see the `AIMMS New Features Page <https://www.aimms.com/support/new-features/>`__.
-  When selecting a widget in the widget manager that is not in view on the current page, the page is now scrolled such that the widget will be in view, in order to be highlighted properly.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  There was a problem related to the resolution of identifier names that contain both a library prefix and a suffix. This, a.o., could lead to unexpected errors when using case comparison in WebUI of identifiers that were declared in a library.
-  The postsolve step did not always work correctly for models with SOS constraints containing continuous variables.
-  When runtime identifiers are added or deleted (by another thread) the Model Explorer now updates its tree accordingly.
-  In functions with both an iterative and a regular signature (such as first and last), compile warnings were suppressed and compile errors were misleading.
-  During the first compilation at startup of a project, annotation identifiers that resided in a library were not always resolved correctly.
-  In rare cases, solving the same math program for a second time could result in a crash or an incorrect objective being passed to the solver, if the solver used multiple threads (e.g., if CPLEX was solving a MIP or using the barrier optimizer).

Resolved WebUI Issues
+++++++++++++++++++++++

-  When resetting the Minimum Resource Height in the Gantt Chart, the chart did not react immediately.
-  On the IE 11 browser, when the Gantt Chart with the Minimum Resource Height specified opens, all resources were loaded within the viewport first and only then the vertical scroll appeared.
-  If a Gantt Chart showed the resolution error message, and you adjusted the Minimum Resource Height in order to tackle that, you would still get the error, only now with a scroll bar added to the widget.
-  When having a Table widget of which the data depends on another widget and selecting a value in that Table, this could lead to the Table data jumping to its first row again after making a change in the widget on which it depended, thus losing the highlight on the value that you previously selected.
-  Sorting a Table widget did not work when the Table was displayed on a Dialog Page.
-  Widget actions will now close when the focus is lost(i.e. the user clicked on an other widget).
-  On a WebUI page that has a PageLeaveProcedure with a ``requestid``, executing a WebUI::OpenPage procedure would throw a "WebUI cannot run nested dialogs" message.
-  Text inside Gantt Chart bars on pages with multiple Gantt Charts are now shown properly.
-  Not all buttons were visible when placed in a Group Widget.
-  When running under PRO/Cloud, the value of the project option `WebUI_maximum_number_of_entries_in_widget` was not correctly initialized.



--------------

#############
AIMMS 4.67
#############


AIMMS 4.67.8 Release (July 4, 2019)
-----------------------------------

 Build 4.67.8.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A For-loop using ``loopcount`` and an additional check, would only work correctly on every second run.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, Dialog pages would only show a small part when being displayed for the first time.



--------------



AIMMS 4.67.7 Release (June 28, 2019)
------------------------------------

 Build 4.67.7.0

WebUI Improvements
++++++++++++++++++++

-  The widget actions feature is now also available for the Multiselect widget.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Case references followed by a dot and referring to an identifier with a specified namespace, could in some rare cases incorrectly trigger a compile time error.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes you could get an unexpected "WebUI cannot run nested dialogs" message upon showing a dialog.
-  Because in older versions of AIMMS, some internal errors were silently ignored, it sometimes happened that when using the latest AIMMS version, some widgets might not populate anymore.



--------------



AIMMS 4.67.6 Release (June 20, 2019)
-------------------------------------

 Build 4.67.6.1

Resolved AIMMS Issues
+++++++++++++++++++++++

-  On Linux, the function CurrentToString was incorrectly taking daylight saving time into account when local time was set to UTC.
-  Moving a set with a definition to a local set did not always properly clean up the definition.
-  A statement like ``sD := { IndexIdentifiers in mySection }`` would not result in the right results (i.e. only the identifiers that are defined in the section called ``mySection``).

Resolved WebUI Issues
+++++++++++++++++++++++

-  Widgets were sometimes not displayed at all on dialog pages.
-  A scalar in compact mode sometimes required a reset in order to display its contents.
-  The displayed name in a Table widget of a subset which comes from an AIMMS library, did not display its namespace prefix. This had the effect that if it was used in a translation file WITH the namespace, no translation would take place.
-  When using a Scalar widget in compact mode, it would jump back to non-compact mode when opening either a dialog page or a side panel.
-  An identifier for which the unit was specified using a unit parameter with a definition, was not updated correctly in the WebUI when the unit parameter got another value.



--------------



AIMMS 4.67.5 Release (June 7, 2019)
------------------------------------

 Build 4.67.5.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Set ordering was not taken into account when calling an external function.



--------------



AIMMS 4.67.4 Release (June 5, 2019)
-----------------------------------

 Build 4.67.4.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Using an element of a Calendar in the function Val or FormatString could lead to a crash when the calendar was using a string parameter for its time format.
-  The two-arguments version of the function Ord could lead to a crash when the ordering of the set that is specified as the second argument was still out-of-date.



--------------



AIMMS 4.67.3 Release (June 4, 2019)
-------------------------------------

Build 4.67.3.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Sensitivity ranges were not calculated for LP problems if the barrier algorithm with multiple threads was used.



--------------



AIMMS 4.67.2 Release (May 29, 2019)
-----------------------------------

 Build 4.67.2.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A so-called GUI-expression in the WinUI could cause a serious bug when the compilation of that expression was triggering two or more warnings (for example warnings on non-initialized identifiers). AIMMS ended up in an endless loop that was just consuming more and more memory.
-  The syntax highlighting could give some unexpected coloring in deeply nested language constructs.
-  Having a domain condition which resulted in an empty domain, could sometimes lead to a severe internal error when used in the left hand side of an assignment statement when assigning to an indexed set.

Resolved WebUI Issues
+++++++++++++++++++++++

-  It could happen that incorrect expressions used for the Display Domain option of a widget did not lead to an error message (and, as a result, to unexpected data being displayed in the widget).



--------------



AIMMS 4.67.1 Release (May 27, 2019)
-----------------------------------

Build 4.67.1.0

AIMMS Improvements
++++++++++++++++++++

-  A new intrinsic procedure GarbageCollectStrings has been added to AIMMS. Calling this procedure may help in reducing the memory in use by AIMMS, when somehow the automatic garbage collect of unused strings does not seem to be triggered. See also the documentation in the Function Reference.
-  The function CopyRange has been added to the AIMMSXLLibrary.
-  The release notes of the Autolibs of AIMMS are now published on the website (see for example `here <https://documentation.aimms.com/rlink/release.html>`__). In addition, a link to these release notes is now present in the Library Repository Browser in AIMMS.

WebUI Improvements
++++++++++++++++++++

-  We made a fundamental change in the storage of WebUI pages and widgets. For details, see the `New Features page <https://www.aimms.com/support/new-features/#SingleJSON>`__. **IMPORTANT:** if you plan to publish your existing AIMMS app(s) using AIMMS 4.67, you first need to re-export your model using AIMMS 4.67. This step creates the expected ``webui.json`` file. If you omit this step, you will get an error message upon publishing.
-  Minimum and Maximum Resource Height have been introduced for the Gantt Chart. The Minimum Resource Height option adjusts the resource height such that when the height of all resources exceeds the height of the Gantt Chart widget, a vertical scroll bar appears on the right and the user can scroll down in order to see the resources below. When a batch is dragged down, the chart automatically scrolls to reveal the resources below. The Maximum Resource Height option will condense the resources to the set value such that the batches are not spread to fit the size of the Gantt Chart.
-  As of this release, Gantt Chart jobs can now also be resized from the left side in case the duration of the job is editable (i.e. changing the start time while keeping the end time the same). A special cursor will appear if you hover on the sides of the job to signal that you can adjust its duration.
-  There is a new option that allows developers to automatically open the WebUI upon project startup. It can be found in the AIMMS Options dialog in the category Project - Startup & Authorization, and is called Open_WebUI_on_startup.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In a statement like ``MySet += myElementParameter``, the set ``MySet`` could incorrectly be modified if ``myElementParameter`` contained inactive data. This could happen if ``myElementParameter`` had been assigned a certain element but that same element was later removed from the range set of ``myElementParameter``. When using such an element parameter with inactive data in any expression, the element parameter should behave as if it is empty.
-  When running a procedure from the WinUI that ended in a Halt statement, a strange empty error message dialog box popped up.
-  CPLEX errors could be generated if the model contained indicator constraints and the CPLEX option `Check solution` was switched on.
-  AIMMS crashed if the ShadowPriceRange property was specified for a constraint in a multi-objective optimization model. (Note: sensitivity information is not available for multi-objective optimization models.)
-  The (deprecated) Math Program suffices ``modelstat`` and ``solverstat`` were no longer updated.

Resolved WebUI Issues
+++++++++++++++++++++++

-  If no value was set for the procedure column in the WidgetActions string parameter identifier, none of the widget actions were listed in the widget.
-  Widget actions, bar chart settings, line chart settings and store focus options were not displayed in the Options editor when running a WebUI app on an iPad.
-  After editing a cell in a Table involving a vertical scroll bar, the focus on the current element could be lost (i.e. on a row which scrolled out of focus as a result of the edit).
-  It could happen that after using the search box in a Multiselect widget was used, it disappeared. Related, when having 2 Multiselect widgets depending on each other, selecting a value in one could lead to the disappearance of the search box in the other.



--------------

#############
AIMMS 4.66
#############

AIMMS 4.66.2 Release (May 17, 2019)
-----------------------------------

 Build 4.66.2.6

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Sometimes an incorrect unit analysis warning was triggered, when the units involved unit parameters.
-  Using the ``loopcount`` in the condition of a For statement could lead to a severe compilation error.
-  The specification ">t8i" in the FormatString caused an error when the actual value to display was equal to 0.
-  When a multi-dimensional identifier was written without parentheses where that was not expected, AIMMS would sometimes crash instead of raising a compilation error.
-  In rare cases, when the WebUI was open, AIMMS would hang during compilation (showing the 'Scanning' status).
-  High dimensional identifiers leaked memory when closing the model (but not AIMMS).

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes identifiers which should display were hidden on a page.
-  Zooming in the map widget using the mouse would sometimes also scroll the whole page.
-  Earlier, if the node size for a set of nodes was the same, the map would consider the value in the set with node radius ranging from 3 to 10, i.e any value 3 and below would take node radius as 3, 10 and above as 10 and the rest the absolute value 4-9. We have now increased the max size to 21.25, so node size 3 and below will be radius 3, 4 to 21 that absolute value and 21 and above radius 21.25.
-  Having a domain condition which only involved an element parameter, could lead to the associated identifier not being displayed in the WebUI.
-  Using custom widget positions could lead to unexpected rendering of your WebUI when resizing the screen.
-  In the Selection box widget, the order of the elements displayed in the selection list was not always as expected.
-  When running a procedure (by pressing a button on the WebUI) and having the Data Manager still open, could lead to a message stating that 'another procedure is already running'.



--------------



AIMMS 4.66.1 Release (May 3, 2019)
----------------------------------

 Build 4.66.1.1

**Please note:** This is the last AIMMS version which is also released in its VS2013 version. Going forward, only VS2017 versions will be released. When using PRO, you will need AIMMS PRO version 2.28 or higher to be able to run the VS2017 versions.

Looking for best practices on how to use AIMMS? Check out the `AIMMS Knowledge Center <https://how-to.aimms.com/>`__.

AIMMS Improvements
++++++++++++++++++++

-  CP Optimizer 12.9 has been added. CP Optimizer 12.9 is only available for 64-bit Windows (VS2017) and Linux.
-  Gurobi 8.1 has been upgraded to version 8.1.1.
-  BARON 19 has been added. BARON 19 is only available for 64-bit Windows (VS2017).

WebUI Improvements
++++++++++++++++++++

-  We have introduced so-called 'Widget Actions'. This allows you to add a short menu to individual widgets, which you can populate with relevant actions. For more details, please see `the documentation <https://manual.aimms.com/webui/widget-options.html#widget-actions>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The names of the branching variables displayed in the CPLEX status file could be incorrect. (Branching variables are displayed if the CPLEX option `MIP display` is set to 'Display each nth node', the CPLEX option `MIP Search Strategy` to 'Apply branch-and-cut' and the Solvers General option Solver Listing Messages to 'All'.)
-  We fixed an error where the iterative operators First and Last were accepted by the compiler when having two arguments, like in First(i, condition(i)). The compiler did not raise an error and the second argument was just ignored. The correct way to write this is: First(i | condition(i)). If your model now gives an error on this, please correct the syntax and be aware that the expression was never evaluated in the way you probably intended.
-  In very specific circumstances, the current working folder that AIMMS works with could change unexpectedly, leading to error messages about files not being found. Now the proper working folder is re-initialized more often, minimizing the chance that this problem shows up.
-  An unexpected message like 'The local set local set "S" is passed implicitly and therefore it cannot be modified' could occur when running a procedure.
-  Since Aimms 4.63, index expressions at the left hand side of an assignment statement were not always handled correctly.
-  In certain circumstances, publishing Apps using the R-link on the cloud could fail.
-  The function ``pro::management::_IsRunningOnCloud`` now returns a correct value in all situations.
-  AIMMS showed an incorrect error about an index mismatch for a runtime identifier that was generated by the WebUI.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When using HTML tooltips, the 'normal' tooltip would flash on the screen for a split-second before actually showing the HTML tooltip.
-  The positioning of tooltips has improved for all chart types. Previously, tooltips could be positioned too far to the top of the screen to be read properly, for example.
-  After calling the OpenExternalURL procedure In IE 11 and Edge browsers, calling another OpenExternalURL would result in an error.
-  There could be problems with not displaying inactive AIMMS data in widgets.
-  The custom HTML tooltip for the Bubble Chart widget with a data element with a size of 0 was not displaying correctly.
-  The filtering of widgets, using the filter tab of a widget, did not always work correctly. Since we introduced slicing on identifiers in the WebUI quite a while ago, which is the preferred way of filtering, we decided to remove the filter tab from the widgets. If you have apps which rely on this functionality, they will continue to run as they did. Only if you want to make changes to the filtering, you should do so by either using the advanced options or by opening the model with an older AIMMS version which still has the filter tabs. We do recommend to consider using slicing on identifiers, though.
-  When using the WebUI in the Chrome browser, on a touch-enabled device, sometimes the widget options icon on the widgets would not show.
-  Some Table widgets would show empty columns in the row header area, with just a dash ('-') as their header.



--------------

#############
AIMMS 4.65
#############

AIMMS 4.65.1 Release (April 11, 2019)
-------------------------------------

Build 4.65.1.0

AIMMS Improvements
++++++++++++++++++++

-  CPLEX 12.9 has been added. CPLEX 12.9 comes with performance improvements and with support for multi-objective optimization. CPLEX 12.9 is only available for 64-bit Windows (VS2017) and Linux.
-  AIMMS now supports multi-objective optimization which deals with mathematical optimization problems involving more than one objective function that have to be optimized simultaneously. Solving multi-objective optimization problems requires the usage of GMP functionality, in particular the new procedure :any:`GMP::Column::SetAsMultiObjective`. Multi-objective optimization problems can be solved with CPLEX 12.9.
-  (See also the release note about the iterative operators mentioned for the 4.64.1 release). This version of AIMMS handles some of the First and Last expressions with the new compiler. These expressions can be interpreted as iterative operators (see the Language Reference, section 5.2.2) or intrinsic functions (see the Function Reference, chapter 2). The new compiler is more strict in the usage of '$' versus '|': Only '|' can be used to define a domain. If you have used the iterative operators 'First' or 'Last' in combination with a '$' to indicate a domain, this can now lead to a confusing compilation error, because the compiler does not recognize it as an iterative operator anymore. For example: First( t $ t in Set_T) will now result in the compilation error: The scope of index "t" has not been specified. You can easily resolve this compilation error by changing the '$' into a '|': First( t | t in Set_T) The compiler will recognize this as the intended iterative operator and no compilation error will be issued as a result.
-  The functions :any:`axll::FillList` and :any:`axll::FillTable` now have a new optional argument: ``clearExistingContent``. If set to 0, the function will not clear the existing content of a cell if there is no data for it in the AIMMS identifier. This argument is ignored if the optional argument WriteZeros is set to 1.

WebUI Improvements
++++++++++++++++++++

-  The WebUI has been extended with the possibility to create Dialog Pages. Furthermore, we added some AIMMS procedures to handle the opening of pages and side panels from within your model.
-  The design for the tooltip has changed to match the aesthetics of the WebUI theme. The font and background color has been changed to the default WebUI theme font and Grey (#505767), respectively.
-  It is now possible to hide the tooltip for data you do not want to show tooltips for. When you use an _tooltip identifier and empty the value for the data point you do not want to show the tooltip for, the tooltip will not appear for that respective data item. If you leave the _tooltip identifier data completely empty, the tooltip will not show for the entire widget.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Writing in dense mode was never supported for writing to files (only to databases), but did not give a compile error and it could have unexpected results. Using this construction now this gives a compile error. The Language Reference is also more explicit on this than before.
-  Running Knitro's multistart algorithm or multi-algorithm could result in a solver failure or a crash if parallel threads were used. This issue has been fixed for Knitro version 11.0 and higher.
-  The AIMMS Language Reference file was damaged in version 4.64.4.
-  The tooltip for string manipulation intrinsic functions (like FindString) was corrected. The ``caseSensitive`` optional argument default value is displayed in the tooltip (which depends on the 'case_sensitive_string_comparison' project option).
-  There was a problem when using an indexed function with an ordered set as the result.
-  The Linux version of AIMMS would do many needless calls to a memory function, which in some cases had a negative impact on the performance.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When the screen was blocked by a dialog, the WebUI status bar incorrectly showed the message 'Undefined'.
-  Widgets present on a Side Panel were available for selecting as filter widgets in widgets on a regular WebUI page. This behavior is not as intended and has been removed.
-  A 'Cubeview mismatch' error could occur when running your WebUI app on the cloud sometimes.
-  The refreshing of widgets, when then updatability of contents identifiers changes, has been improved.
-  The rendering of the Map widget has been made more efficient in terms of performance.
-  Combining a filter widget with a Table widget using slicing could lead to a freezing app when unselecting all items in the filter widget.
-  Tooltips on widgets were displayed immediately after hovering a data item with your mouse. This could be annoying, so we now leave a short delay before a tooltip appears.



--------------

#############
AIMMS 4.64
#############

AIMMS 4.64.4.21 Release (April 9, 2019)
---------------------------------------

Build 4.64.4.21

For technical reasons, this release is not called 4.64.5.

Looking for best practices on how to use AIMMS? Check out the `AIMMS Knowledge Center <https://how-to.aimms.com/>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  On Linux, the RTLD_DEEPBIND flag is now used when opening .so files in order to load dependencies correctly.
-  If during a case load an error occurs that can be linked to a specific location in the model, the error is not only shown in the error dialog box but also in the Errors/Warnings window. This allows a developer to easily jump to the location of the error.



--------------



AIMMS 4.64.4.0 Release (March 21, 2019)
---------------------------------------

 Build 4.64.4.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In some cases, AIMMS could crash when opening the data page of a parameter.
-  Loading a case by using 'CaseFileLoad' could lead to errors which would not occur when loading the same case through the menu.

Resolved WebUI Issues
+++++++++++++++++++++++

-  For invisible pages, the 'Visible' option on the 'Miscellaneous' tab of the options editor would still show as 'True'.
-  A specific sequence of actions in the WebUI could lead to AIMMS hanging.
-  Displaying an element parameter with range 'AllConventions' in a dropdown widget did not show any data anymore.
-  Displaying a scalar widget in a side panel showed a different styling than the same scalar widget outside of a side panel.
-  When specifying a value in the Contents tab of the options editor of a Map widget, the Map would disappear. As setting contents for a Map, a Group and a Text widget makes no sense anyway, the Contents tab has been removed for these three widget types.
-  Having one or more side panels in the WebUI led to open lines being displayed in the Page Menu on top of your application.



--------------



AIMMS 4.64.3 Release (March 15, 2019)
--------------------------------------

Build 4.64.3.22

Resolved WebUI Issues
+++++++++++++++++++++++

-  When slicing an index to a subset in the Table widget, your pivoting changes could get reset when refreshing the page.
-  Changing options in the options editor of a widget could get forgotten when refreshing the page.
-  In some situations, pivoting a line chart did not show the intended result.
-  When pressing the DEL key, data in a Table cell was not reverted to the default value anymore.
-  When using dots in the names of Table widgets, editing values in such a Table would not be propagated to AIMMS.
-  The WebUI library function ``webui::requestPerformWebUIDialog`` required you to close your project when you specified an empty set for the 'actions' argument. Now you get a proper error message to prevent this situation.
-  The first page of a Wizard would always be displayed as a blank page, even if it contained widgets.



--------------



AIMMS 4.64.2 Release (March 6, 2019)
-------------------------------------

Build 4.64.2.4

WebUI Improvements
++++++++++++++++++++

-  Some improvements have been made to the code related to the Store Focus functionality for Table widgets. This could lead to some performance improvements when re-opening pages.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Sometimes you could encounter an "Unknown error" when opening an AIMMS application on AIMMS Pro.
-  Some warnings that were triggered in an end-user project could lead to a crash, also when running on PRO.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Identifiers with an indexed unit parameter were not always displayed correctly in the WebUI.
-  An error on a missing CubeEngineLink.dll could occur when opening your app.
-  The Bubblechart axis labels were sometimes displayed as "object ..." instead of the intended text.



--------------



AIMMS 4.64.1 Release (February 28, 2019)
-----------------------------------------

Build 4.64.1.0

AIMMS Improvements
++++++++++++++++++++

Knitro 11.1 has been added. Knitro 11.1 is only available for 64-bit Windows (VS2017) and Linux.
For inefficient use of iterative operators, where not all of the indices introduced were actually referenced in the data, AIMMS used to issue a warning. For the Count, Exist, and numeric Sum, Max and Min operators, AIMMS now automatically replaces this expression by a more efficient one. In such cases, the warning will no longer be issued. Furthermore, these inefficient expressions could also be generated by the WebUI library under the hood. These expressions will now also run faster, and widgets depending on them will load faster as a result.
In this release the implementation of the error handling system as described in the Language Reference, has been rebuilt. This has been done because the previous implementation had some problems that sometimes resulted in errors or warnings not being presented to the user. Although in most situations the new error handling works exactly the same, you might notice some differences in how errors or warnings are handled. If you think that this handling is incorrect, please let us know. Known changes/bug fixes:

-  An error in constraint evaluations during a solve did not stop the execution.
-  An Assertion with a specified Action attribute that does not contain a Halt statement, triggered a Halt anyway. This implicit Halt should only occur when the Action attribute is empty.
-  Changes in the legacy function handling (see Language Reference 8.4.3). The described options ``intrinsice_procedure_error_handling`` and ``external_procedure_error_handling`` now only have an effect on the errors for which the procedure sets the ``CurrentErrorMessage``. If the procedure (also) uses the more modern style of raising warnings and errors then these raised warnings and errors will just be handled like any other warning or error that is raised during execution.
-  If a new error is raised during the handling of warnings and errors in a local error handler (like in the ``OnError`` clause of the Block statement, or inside the ``global_erroror_handler`` procedure) then the handling of the remaining warnings and errors is skipped and these warnings and errors are marked as handled.
-  If an external procedure (like for example the axll:: spreadsheet procedures) only raises warnings, these warnings are now correctly reported. In previous AIMMS versions these warnings sometimes just disappeared.
-  The WebUI now only displays errors and warnings that are not handled by any local or global error handler. Besides that, the various warning control options (like 'communicate warnings to end users') now also have an effect on the warnings shown in the WebUI. In general, this change will lead to a lot less warnings being displayed.

WebUI Improvements
++++++++++++++++++++

-  In the WebUI, you can now also add Side Panels to your pages. Side Panels allow you to put 'controlling' widgets to a panel on the right side of the screen, which can be opened and closed. This gives you the benefit of not having to clutter your pages with all kinds of selection widgets, allowing your users to focus better on the widgets that present your data. For more details, see `the documentation <https://manual.aimms.com/webui/side-panels.html>`__.
-  See note on inefficient use of iterative operators in the section above.
-  Errors and warnings that are reported in WebUI now listen to the error and warnings options that have been specified in your AIMMS project. In addition, errors that are caught and handled by the model, will not appear in the WebUI anymore. See the note(s) on error handling in the section above.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the AIMMSXLLibrary the functions :any:`axll::WriteTable`, :any:`axll::WriteTableQuick` and :any:`axll::WriteCompositeTable` now write the row and column headers according to the specified ordering of the underlying set(s).
-  Indicator constraints were not always generated correctly in stochastic models
-  Sometimes, opening the start page of AIMMS showed a dialog with a (harmless) error. This is corrected, but it could be that you need to clear your Internet Explorer cache in order not to experience it anymore. This is because the start page internally relies on Internet Explorer.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In the Contents tab of the widget options editor, it was not possible anymore to use the scroll bar in case a long list of identifiers was present.
-  Not all possible pages were being shown in the PageLink dropdown in the action option editor and in the drop down to select pages in the Wizard creator add-on.
-  The default index order (in a widget) now reflects the order of the indices that were used to declare the identifier. This problem could, for example, lead to arrows in the Map widget being drawn the wrong way around.



--------------

#############
AIMMS 4.63
#############

AIMMS 4.63.2 Release (February 15, 2019)
------------------------------------------

Build 4.63.2.5

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Exotic characters in the value of a string parameter could lead to problems when saved to and loaded from a case file.
-  Erroneous parameter definitions using an iterative operator, where an argument of this iterative operator is referencing the parameter itself, could crash.
-  When copying a newly created procedure or function, the index domain of locally declared identifiers were not always copied.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When multiple Gantt Chart widgets were present on the same page, support lines would be displayed on the first Gantt Chart when actions were done on the second one.
-  After a data change in the Gantt Chart widget, the X and Y axis labels would sometimes flicker.
-  The Gantt Chart widget would also flicker when the job duration was changed without selecting the job first.
-  It was not possible to increase the length of a job in a Gantt Chart widget, when the Viewport Start date and End date were identical and the resolution was set to 1 hour.
-  Sometimes, when starting your WebUI app on the cloud, this did not work correctly. That could result in the app getting corrupted, needing a re-publish. Now in these situations, you are offered a dialog with a clear error message and a 'Reload' button, preventing this corruption or the need to re-publish.



--------------



AIMMS 4.63.1 Release (February 11, 2019)
----------------------------------------

Build 4.63.1.27

 

AIMMS Improvements
++++++++++++++++++++

-  The Help menu and the Startup page now contain a link to the `AIMMS Knowledge Center <https://how-to.aimms.com/>`__.

WebUI Improvements
++++++++++++++++++++

-  We have implemented an authority mechanism, which allows you to fully control which of your model identifiers will be readable, writable or executable in your WebUI app. For details, see the `documentation <https://manual.aimms.com/webui/creating.html>`__.
-  Under the hood, we have done a lot of work on the WebUI code in this version. This should help us in our goal to make the WebUI more robust. Functionally, there should not be any difference. In terms of performance you may experience a slight gain in specific scenarios.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The check whether a value was an integer according to the tolerances was not always returning the correct result.
-  The warning "The use of a for around these statement(s) is unnecessary and probably inefficient" was not always issued when possible due to a bug. This bug is now resolved. Depending on the setting of the option "warning efficient for", you may now get some warnings or errors.
-  AIMMS did not always give a compilation error when a procedure was called within a numerical expression in a statement in a for loop (see the language reference chapter 10.3, "Using the return value"). This has been corrected. If you have used a procedure within a numerical expression and you get a compile error now, you may consider whether the called procedure should actually be a function.
-  A crash could occur when the binary Ord operator was used with a numeric parameter as the first argument.
-  When copying a newly created procedure or function, the index domains of locally declared identifiers were not always copied.
-  Some ill formed statements let Aimms crash instead of giving a compile error.
-  When the WebUI tried to access the data of an index domain restriction expression, an error message was generated and the data was not correct.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The behavior of drop-downs displaying element parameters defined over an indexed set has been improved. When selecting a value that is not in the range for the specific entry, the table will correctly display the initial value.
-  Indexed sets (and multidimensional relations) have been removed from the list of identifiers when populating the contents of a widget. This should prevent error messages that are incorrect and confusing to the app  Builder, since we do not support indexed sets/multidimensional relations yet in the WebUI.
-  When showing more than one Selectionbox widget on a page, showing element parameters defined over the same range set, you could get "Empty selectionbox" messages or non-responding selection boxes.



--------------

#############
AIMMS 4.62
#############

AIMMS 4.62.1 Release (January 25, 2019)
---------------------------------------

Build 4.62.1.4 

.

AIMMS Improvements
++++++++++++++++++++

-  **IMPORTANT:**  AIMMS 4.62 has been built using an updated version of the Visual Studio compiler (version 2017). Internally and code-wise, this brings us a number of benefits. However, please be aware that some older versions of the repository libraries may not be compatible with AIMMS 4.62 and higher. When you have an existing project that uses a version of a repository library that is not compatible with VS2017, then during startup this library will automatically be upgraded to the nearest newer version that is compatible. In developer mode you will be notified about this upgrade such that you can save the project with this new library references.
-  **IMPORTANT:** Because of this, AIMMS now comes in 2 'flavors': VS2017 and VS2013. PLEASE USE THE VS2017 VERSION!, as the other version will be phased out end of April. For now, we still offer this version in our download section, but only if you experience problems using the VS2017 version, use the VS2013 version instead and let us know what went wrong.
-  The really old option `using legacy mode` of the 'read from file' statement has been removed entirely. If your model still uses it, you will get a compilation error on it.
-  CP Optimizer 12.8 has been added. It comes with performance improvements for constraint programming problems. CP Optimizer 12.8 provides a bound on the objective (that is, a lower bound for minimization problems and an upper bound for maximization problems). CP Optimizer 12.8 is only available in the VS2017 version of AIMMS (and in the Linux version).
-  ODH-CPLEX 4.0 has been added. ODH-CPLEX 4.0 is only available in the VS2017 version of AIMMS (and in the Linux version).
-  Gurobi 8.1 has been added. It comes with performance improvements especially for MIQP problems.

WebUI Improvements
++++++++++++++++++++

-  The Scalar widget and the Table widget now support custom HTML tooltips. The user can override the default tooltip on these widgets to achieve the same effect as those on the charts. Please note that n characters should be replaced by the ``br`` tag, and t by using HTML tables. **IMPORTANT:** In order to implement this change, we had to rename the former 'title' attribute to 'data-old-title'. This can result in custom CSS not behaving as expected, if it targets this attribute. In such cases, please do the same rename in your CSS code.
-  The Gantt chart now has support lines/backdrop OR indicators when a job is being dragged or resized. This will be a default feature for the Gantt chart. When you drag or resize a job, there will be a background that helps the user drag the job with reference to other jobs. This makes it easier for the user to either line up jobs from different tasks/resources, or schedule jobs one after the other.
-  The Gantt chart now offers an indication using Today and Now lines, that helps the user identify the exact day and time on the Gantt chart.
-  In addition to the identifier slicing that is common through all of AIMMS and the WebUI, you can now also expand indices in the WebUI. So, in addition to slicing an index to (for example) a subset, you can now also expand it to a SUPERset. This allows you to match indexes of different identifiers displayed in the same widget. For example, you can make the displaying of related identifiers in a Table much more concise and intuitive. For details and examples, please refer to the `documentation <https://manual.aimms.com/webui/widget-options.html#identifier-settings>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Unhandled errors in a ``block-onerror`` are now re-raised at the end of the block statement. This means that any statement after such a block without a call to :any:`errh::MarkAsHandled` are not executed anymore.
-  Identifiers with a domain restriction could lead to strange errors when an identifier with the same name existed in another namespace.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The value of the center longitude and latitude of the Map V2 widget was reset at some point, when just navigating through the pages.
-  Using the compact Scalar widget displaying an element parameter made it hard to open the dropdown, because the icons for the dropdown and the options editor were too close to another.
-  In Bar chart and Line chart widgets, the Y-axis annotation now also listens to the number of decimals specified for the widget.
-  When having a full row or column of EMPTY binary variables in a Table widget, the widget would show empty checkboxes. Now the row/column is not displayed at all, consistent with the idea that empty rows and columns should not be displayed. Of course, by using a display domain you can still overrule this behavior.



--------------

#############
AIMMS 4.61
#############

AIMMS 4.61.7 Release (January 16, 2019)
-----------------------------------------

Build 4.61.7.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A 2D chart in the WinUI where both the Y-axes were specified and the X-axis was specified via a string parameter, did not always rescale the data points correctly when the number of points on the X-axis decreased.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In certain situations, the performance of the Map V2 widget has been significantly improved.



--------------



AIMMS 4.61.6 Release (January 11, 2019)
---------------------------------------

 Build 4.61.6.2). 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In specific uses of the FormatString function, you could run into an incorrect 'Unknown exception error' from AIMMS 4.61.2 onwards.
-  The Autolib mechanism of AIMMS downloaded its libraries into the Windows temporary folder. This could lead to problems when at some point this folder was emptied or deleted.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The '+' button on the bottom of the Arc sets options editor of the Map V2 widget was not rendered properly when more than 1 arc set was present.



--------------

**We skipped version 4.61.5 for technical reasons.**

--------------


AIMMS 4.61.4 Release (December 19, 2018)
------------------------------------------

 Build 4.61.4.0 

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes incorrect 'Domain violation errors' were raised by the WebUI, leading to unwanted behaviour like empty Tables or data not being editable.
-  In case comparison mode, data for the current case is now editable if and only if the corresponding model identifier is editable. Data for 'compared cases' is always read-only.
-  In some cases, modifiable data could not be edited.
-  In some cases, data would not be displayed, despite an explicit display domain of 1.



--------------



AIMMS 4.61.3 Release  (November 30, 2018)
--------------------------------------------

Build 4.61.3.0 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  It could happen that the name and path of a local case file was mentioned in error messages you get when running AIMMS on the PRO system.
-  A definition that was using the :ref:`.ProgramStatus` suffix of a math program was not always updated after solving the math program.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In a Table widget using slicing on a subset with an OrderBy attribute specified, the Table was not updated when the ordering of this subset changed.
-  Dropdown boxes in Scalar and Table widgets displayed the dropdown activation icon when they were read-only too.
-  Under some circumstances, the search list that pops up when opening a dropdown showed an infinite hourglass instead of the search results.
-  Deleting a value in a Table widget, displaying an identifier with a default different than 0, still put the value 0 in the cell instead of the real default.
-  The visibility option of a WebUI page, as set in the page navigation menu, was not always respected, possibly resulting in invisible pages being displayed or the other way around.



--------------



AIMMS 4.61.2 Release (November 23, 2018)
----------------------------------------

 Build 4.61.2.2 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the AIMMS API, AIMMS could crash when the undeclared arguments of a procedure were requested.
-  When solving mathematical models, inactive data was not correctly filtered, which could lead to errors since version 4.57.2.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Running WebUI apps on the cloud using Internet Explorer 11 did not work anymore (since AIMMS 4.59.1).



--------------



AIMMS 4.61.1 Release (November 21, 2018)
------------------------------------------

Build 4.61.1.6 

AIMMS Improvements
++++++++++++++++++++

A number of changes have been made to the **FormatString** function:

-  Passing a quoted element to the %e specifier is no longer allowed (example: ``FormatString("element %e", 'myLabel')``). This is because the new compiler cannot determine to which set ``myLabel`` belongs and thus it is treated as just a string. A valid alternative is to use the %s specifier. Of course, you can argue why to use FormatString for this at all. A much more efficient way of writing this is just ``element myLabel`` without a call to FormatString.
-  The new implementation is more strict in the order in which the modification flags are specified. They must appear in the order as described in the Language Reference, so this is the correct order: FormatString("%<>+0t12.3f",val) or FormatString("%<> 0t12.3f",val).
-  The new implementation will give warnings on invalid combinations of flags and format specifiers.
-  The conversion specifier %l is no longer available, it should be replaced by %e.

There is a new option called 'Database string valued foreign keys'. When AIMMS writes to a database table, whenever there is no value for a string valued column, the default value ("") is written. However, if that string valued column is a foreign key, this should be a NULL. In earlier versions, and when this option is set to 'Check' (default), AIMMS automatically determines during database write actions, whether the written columns are foreign keys. This determination itself may be expensive in terms of performance. The option allows you to skip this test. If the value is 'Assume', AIMMS will insert a NULL instead of a "" for every string valued column without a value. When the value is 'Ignore', AIMMS will insert a "" for these columns. This, however, may cause errors when the column is a foreign key.

WebUI Improvements
++++++++++++++++++++

-  The Map widget has undergone a major overhaul. Now it is possible to use multiple arc sets and multiple node sets, you can hide the labels on the arcs or display the arcs as straight lines instead of curved ones. When creating a new map widget, you will automatically get the new version. Existing Map widgets in your apps will remain the old style. In order to use the new functionality, you should redo the existing maps using a newly created Map widget.
-  The Pie Chart and the Tree Map widgets now have Store Focus support.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  There was an issue introduced in 4.59 where a statement with a complex scalar subexpression crashed upon first execution. This has now been addressed.
-  If the argument types of FormatString do not match with the conversion specifiers (for example a string valued argument is passed to a %f specifier) the error is now triggered at compile time (instead of run time).
-  In a subexpression binding an index with the IN operator, no indexed expression was expected within an indexed set. The following gave a syntax error on the '(' after ``ep: A(i IN setJ(ep(k)))``. Now it does not anymore.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The blue border around the currently selected widget when having the Widget Manager or the widget's options editor open was not displayed anymore.
-  Using the zoom functionality of the browser could have an effect on the centering of Map widgets in your application.
-  When resizing a Bubble chart widget, the currently selected Bubble was not retained.
-  When pivoting a widget with the store focus property set, in such a way that no data is displayed for the data point(s) of the store focus element parameters, these would be cleared. This is not done anymore.
-  Typing literal element names in a dropdown box in a Table widget still required you to select the typed item from a list. Now just hitting ENTER is sufficient once there is exactly one element left which satisfies the text in the search box.



--------------

#############
AIMMS 4.60
#############

AIMMS 4.60.5 Release (November 15, 2018)
-------------------------------------------

  Build 4.60.5.1

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Repeatedly changing the value of an element parameter could sometimes lead to a crash.
-  An execution error in the index binding domain of a For statement could either vanish or be reported at a later statement or definition update. This is corrected: the error will now be reported at the For statement header.
-  An execution error in the logical expression of a While statement was reported at the last statement within the while statement. This is corrected: the error will now be reported at the While statement header.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Opening WebUI pages generally goes faster, because of addressing an inefficiency in the underlying code.
-  The line which allows you to resize the row header columns in the Table widget was only displayed when hovering over the row headers themselves. Now it is also activated when hovering over the identifier headers on top of the row headers.
-  Having a set element named 'aggregated' displayed as a column or row header in the Table widget, automatically translated this to 'totals'.
-  The WebUI library has been slightly changed to prevent unintentionally emptying data which is needed for the proper displaying of dialogs using the ``webui::requestPerformWebUIDialog`` function.
-  In some cases, WebUI pop-up dialogs were not displayed and the WebUI froze when pages got reloaded as a result.
-  In some cases, read-only element parameters in a Scalar widget were displayed blue instead of grey.
-  In the Pie chart widget, the percentage displayed when hovering over an inner wedge of the chart was only the percentage of the first of its direct outer wedges. Now the percentage is the sum of all its direct outer wedges, as it should be.



--------------

**AIMMS version 4.60.4 was skipped for technical reasons.**

--------------


AIMMS 4.60.3 Release (November 5, 2018)
------------------------------------------

  Build 4.60.3.2

Resolved AIMMS Issues
+++++++++++++++++++++++

-  For an annotation of an identifier in your model that requires an identifier as a value, it is now allowed to add a comment.
-  In rare cases, calling CaseFileLoad from within your model could lead to situations that afterwards a set with a definition did not have the correct content.
-  The pre-defined sets AllMonths, AllWeekdays (and alike) were not marked as read-only, which made it possible to accidentally modify their content.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When specifying the annotation ``webui::ElementTextIdentifier`` for a subset in your model, it is now allowed that the specified identifier is declared over a superset.
-  Changing the column sizes of a Table widget did not always work anymore.
-  When pivoting a Table widget containing identifiers that have an associated WebUI annotation, such that the identifier ends up in the Totals area, you could get an incorrect error message. Now this is allowed.
-  Annotations did not work in combination with the Pie chart widget.
-  AIMMS procedures with output arguments, when called (implicitly) from the WebUI, for example using the wizard mechanism, did not reset their output arguments. So, if you did not explicitly assign a value to them, they passed their previously known value instead of an empty value. In the aforementioned wizard example, this could lead to a previously valid status message, which was no longer valid.
-  In the Table widget, the width of the dropdown list for element parameter values was too small sometimes.
-  In some situations, there would be an extra (empty) row displayed in the identifier header of a Table widget.



--------------



AIMMS 4.60.2 Release (October 31, 2018)
---------------------------------------

Build 4.60.2.3 

AIMMS Improvements
++++++++++++++++++++

-  The Conversions wizard for creating derived units of a Quantity now supports scalar identifiers next to literal constants. 



--------------



AIMMS 4.60.1 Release (October 15, 2018)
------------------------------------------

Build 4.60.1.2 

AIMMS Improvements
++++++++++++++++++++

-  The :any:`axll::WriteSet` Excel function has been extended with the option to allow range overflows.
-  The IDE in AIMMS has been extended with 'Find All' functionality. It allows you to look for a text in the whole model and getting an overview of all the locations where it was found.
-  The IDE now also allows you to create so-called Bookmarks in your model, to allow for quick navigation to certain places in the model when developing.

WebUI Improvements
++++++++++++++++++++

-  The Bar Chart and the Line Chart widgets now also support store focus functionality.
-  The Gantt Chart widget now more clearly highlights the job which is currently hovered over or selected.
-  The WebUI will now show a warning (upon page refresh) when you are using a display-domain identifier with a non-zero default. This is not supported by the WebUI and, as a result, the display-domain will be ignored in this case.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When calling an external function from AIMMS and accidentally mixing up input and output parameters, such that the function would end up passing back some value into an AIMMS input parameter, AIMMS would disappear. Now you get a proper warning if such a situation occurs.
-  Opening a wizard in AIMMS could sometimes lead to a crash.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, when deleting entries from the Table widget really quickly, this could lead to a crash, whereas the same actions performed less quickly went just fine.
-  A linechart showing horizontal line segments at exactly the maximum Y-axis value, did not show this line. Nor were the dots fully visible when displayed at the maximum Y-axis value.
-  The top of wizard pages was sometimes displayed as an empty space, with the top of the upper widget(s) hidden by it.
-  In the Bubble chart, sometimes the value 'NaN' was displayed on the axes.
-  We took the opportunity to address a number of minor issues with the new WebUI look-and-feel.



--------------



**AIMMS Email Client Library**

On October 4, 2018 we released the AIMMS Email Client Library. This library offers you the possibility to send emails directly from your AIMMS application. This way, you can for example send the results of your optimization model to other users in your organization. More information can be found on the `AIMMS New Features Page <https://www.aimms.com/support/new-features/>`__.



--------------

#############
AIMMS 4.59
#############

AIMMS 4.59.4 Release (October 4, 2018)
---------------------------------------

 Build 4.59.4.1 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In specific situations, deleting a number of AIMMS identifiers simultaneously could lead to a crash.
-  In resize edit mode, adding a resize line failed when doing it for the first time.
-  There was an issue in which the Network Object's GIS-background was not correctly displayed (i.e. in most cases as an empty map) on print pages.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When using a minimum bound for the Y-axis of the Linechart widget, the number of decimals used for the Y-axis annotation was far too much.
-  Moving jobs in the Gantt Chart widget did not always respect the combination of reference time and time resolution when 'snapping' the job back to the chart.
-  When selecting an already selected element in a dropdown cell in a Table widget, you could get either an empty element or a non-existing 'number element' displayed.
-  A Barchart widget using a display domain was not updated automatically upon data changes. This required an explicit page refresh.
-  When sorting a Table widget which displayed set elements which coincided with aggregator names (such as 'Count', 'Average', ...), the Table would become empty.



--------------



AIMMS 4.59.3 Release (September 24, 2018)
---------------------------------------------

Build 4.59.3.6 
 
Resolved AIMMS Issues
+++++++++++++++++++++++

-  In specific circumstances, AIMMS could crash when a breakpoint in the code was reached. This was already addressed in the previous release, but did not always work.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In the downloaded .csv file from a Table widget showing a more-dimensional parameter, 'Undefined' was displayed in the empty column/row header fields.
-  Showing two or more unrelated identifiers in a Table widget and using annotations to color them, could lead to superfluous cells being colored too.
-  The determination of user annotations (and flags) has been improved, in case a cell (in a widget) corresponds to an aggregated value over an index that is not in the domain of the corresponding value identifier.
-  The WebUI could sometimes hang, if selecting the already selected value from a dropdown cell in the Table Widget.
-  A Scalar widget displaying multiple scalar values, some of them read-only and some not, colored all entries black instead of just the read-only values.
-  When displaying small negative values on the axes of a Bubble Chart widget, they were sometimes rounded off wrongly, leading to very long entries like '-1.10000000000001', etc.



--------------



AIMMS 4.59.2 Release (September 18, 2018)
-------------------------------------------

Build 4.59.2.1

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In specific circumstances, AIMMS could crash when a breakpoint in the code was reached.
-  When getting a (correct) error message about a type mismatch in an if-then-else statement, you were taken to the wrong position in the model when clicking on the error message.
-  When reading from a database table, under certain circumstances a temporary table is created in the database. This could give problems when the read statement was executed in multiple sessions at approximately the same moment.
-  The function SQLCreateConnectionString was not working properly for connections to Oracle databases.
-  As of AIMMS 4.59.2, it is possible to specify the identifiers in the set *pro::ManagedSessionRemoveFromCaseIdentifierSet*, which you want to remove from the case when saving case on AIMMS PRO. For more details please see the `documentation <https://manual.aimms.com/pro/appl-state.html>`__.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When displaying subset data in a Table widget, the identifier header(s) did not display this.
-  When slicing the indexes of an n-dimensional parameter to element parameters, such that the result was a scalar parameter, you would still see the original indices mentioned in the Pivoting options editor of a Scalar widget.
-  The coloring of editable numerical parameters in Scalar widgets could be black instead of blue.



--------------



AIMMS 4.59.1 Release (September 12, 2018)
-----------------------------------------

Build 4.59.1.3

AIMMS Improvements
++++++++++++++++++++

-  Knitro 11.0 has been added.
-  The usage of the operator '|' as sparsity operator is now deprecated (for example: "A :=| B;"), and will give a warning in developer mode.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In some situations, active data could erroneously be reported as inactive in the Identifier Cardinality tool.
-  There was a problem in the AIMMS PRO Library, where defined sets could not be saved while saving an input/output case.
-  The Spreadsheet::SetOption function has been documented.
-  A Find in the model text could lead to a crash when a very long line was being searched.
-  Before writing to a database, the foreign key information was always retrieved, once per table per session. For some databases this is an expensive action. Now this is skipped when writing in insert mode.
-  Indicator constraints were not handled correctly if the binary variable in the activating condition was not generated (e.g., because it was fixed using the ``.NonVar`` suffix).
-  The bulk update functionality of the AIMMS API could generate high fragmentation within the AIMMS memory manager.

WebUI Improvements
++++++++++++++++++++

-  The WebUI now has a fresh new theme, making your WebUI apps look good right from the start. When opening existing models with AIMMS 4.59, you will be asked whether you want to try out the new theme, with the possibility to go back if you need more time. New WebUI apps will automatically get the new theme.
-  The Barchart and the Linechart widget now offer the possibility to specify a minimum bound, a maximum bound and the step size for the Y-axis. This allows you to provide the end-user of your WebUI apps with more focus on specific parts of your data.
-  We offer a new option `WebUI maximum number of entries in widget` in the AIMMS project options, to specify how many values will be displayed in a WebUI widget. The default value is 50.000, which has always been the default behind the scenes. In cases of extreme data, you might want to increase this limit. Be aware though that performance may be lower when doing so.
-  The Map-V2 widget (which is still behind a feature toggle) now offers Store Focus support.
-  The new option ``Save webUI state`` controls whether the WebUI state is saved when run under PRO. See the help in the options dialog in AIMMS for details.
-  When hovering over one of the chart widgets in the WebUI, the hovered over item is now displayed more prominently and the other elements are rendered more light, in order to add even more focus on the current one.
-  When using the space bar or a mouse-click to change the value of a checkbox in a Table widget, the focus is not set to the cell below anymore.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When opening the sorting dialog in the Table widget, the dialog could pop-up at unexpected places.
-  In some cases, displaying a maximized table and scrolling through it on a page by page basis, an occasional 0 value was displayed, instead of the real value.
-  Adding a string parameter to a table containing numbers, while having your "IDENTIFIER" in the "totals", you would run into an 'N/A' error and your string parameter addition would fail.



--------------

#############
AIMMS 4.58
#############

AIMMS 4.58.3 Release (August 31, 2018)
--------------------------------------

Build 4.58.3.3 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The .level values of binary variables with the default input were not correctly displayed in data pages after running an optimization model.
-  Opening a DialogPage in the WinUI could sometimes lead to a crash.
-  There is a new option for the index page object in the WinUI: "Always Hide Scrollbars". In specific cases, using the object could cause some unexpected flickering of the screen. By using this new option, this is prevented.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, the line spacing in the Table widget was off, especially when combined with zooming in the browser. We changed some code to mitigate this phenomenon.
-  The alignment of the buttons in the WebUI menu bar was a bit off sometimes.



--------------



AIMMS 4.58.2 Release (August 24, 2018)
--------------------------------------

 Build 4.58.2.7

AIMMS Improvements
++++++++++++++++++++

-  There is a new option :any:`axll::KeepExistingCellFormats` in the AIMMSXLLibrary. When you set this option to 1 prior to calling any write method, the existing formats in your spreadsheet will remain unchanged.
-  The function :any:`axll::ReadSet` has been extended with a new value for the ExtendSuperSets argument: -1. It means that elements which are not in the parent set are skipped.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The function SQLCreateConnectionString did not work correctly for the HANA ODBC Driver.
-  When causing a range violation during communication with Excel, you got an error message telling you about the range violation, but not in which specific tuple this occurred.
-  Using the option `intrinsic procedure error handling` not always led to the expected errors/warnings to be listed in the Message window (and thus also in the PRO logs).

Resolved WebUI Issues
+++++++++++++++++++++++

-  Annotations used for coloring the dots on a Line Chart widget now also color the actual lines of the chart. More precisely: a line on the chart gets the color of its first dot.
-  When still using the old-style unit support in your WebUI model, you get a warning upon starting the WebUI. The button there, promising to take you to the Manual page on this topic, was pointing to a non-existing location.
-  In some cases, the Identifier slicing dialog listed incompatible identifiers.
-  If the node size was the same for all the nodes in a Map widget, the nodes were rendered at the maximum size. They are now rendered at the minimum size.
-  Sometimes, the spacing between the Y-axis header and the Y-axis itself in the Bubble Chart widget was wrong.
-  If the Min and Max value of a Slider widget were the same, you got an error message. Now this situation is allowed.
-  The 'Use search box for more results' text could be 'selected' as an identifier in the Identifier slicing dialog. This is not possible anymore.
-  The default node size in the Map widget has been made slightly smaller.
-  The warning about Unit inconsistency that you can (correctly) get in the WebUI, did not list the identifier(s)/line number(s) involved.



--------------



AIMMS 4.58.1 Release (August 7, 2018)
-------------------------------------

Build 4.58.1.3

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Some changes with unforeseen consequences have made compilation slower in 4.54 and again in 4.56. These resulted in slower startup times of models and also slower execution if the model contains a lot of model editing statements. This has been fixed.

WebUI Improvements
++++++++++++++++++++

-  Tasks in a Gantt chart in the WebUI can now have additional text displayed in the associated bars. The duration identifier needs an _text identifier annotation. See the `Gantt Chart documentation <https://manual.aimms.com/webui/gantt-chart-widget.html>`__ for details.
-  There is a new and more clear dialog to set the sorting of a Table row or column. Furthermore, there is now a clear indicator to show you which row or column is sorted and in what direction.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The new UponChange feature did not work correctly in case you specified the `hasChanged` argument (i.e. the first argument of the UponChange procedure) to have the binary range.
-  The Store Focus functionality in the Gantt chart has been made more robust in combination with making changes to jobs.
-  An error could occur while scrolling in a sorted table for which totals had been specified on some index other than the first index in a part.
-  An execution error in ``webui::DataChangeMonitorUpdate`` has been fixed.



--------------

#############
AIMMS 4.57
#############

AIMMS 4.57.2 Release (July 31, 2018)
------------------------------------

Build 4.57.2.0

**Improvement**

-  There is now an MS SQL Server ODBC driver available on the AIMMS Cloud Platform.

**Resolved AIMMS Issue**

-  When solving mathematical models, set ordering is now taken into account. Setting the 'order by' attribute to the underlying sets can now make mathematical models with multiple valid solutions deterministic.



--------------



AIMMS 4.57.1 Release (July 27, 2018)
------------------------------------

Build 4.57.1.0

AIMMS Improvements
++++++++++++++++++++

-  For each subset of Integers you can now specify either of the two properties 'ElementsAreNumerical' or 'ElementsAreLabels' to have full control on how elements of these sets behave in an expression. See the Language Reference for more information on this.

WebUI Improvements
++++++++++++++++++++

-  The UponChange procedures for the WebUI have been extended with 2 arguments which tell you what tuples of the related identifier have changed and what their original values were.
-  The delete and backspace keys can now be used in the Table widget to quickly delete the present value (the delete key), or to delete it and immediately open the cell editor (the backspace key).
-  It is now possible to put HTML formatting into WebUI tooltips.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When displaying a number of overlapping bars in the Gantt Chart widget, it could happen that the lower ones were rendered on top of the row below the row to which they belonged.
-  If the Table was in a not-up-to-date state, binary cells which should not be editable anymore could give the false impression that they still were.



--------------

#############
AIMMS 4.56
#############

AIMMS 4.56.3 Release (July 24, 2018)
------------------------------------

Build 4.56.3.0

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When writing data to Excel sheets using the AIMMS Excel Library, sometimes the formatting of the cells written to got reset. Now, as long as you write compatible types to the cells (e.g. string parameters to General or Text cells), the formatting remains untouched.
-  In some cases, you could get a 'License file not found' error message.
-  There was an error in the evaluation of an indexed set with both a definition and a domain condition.
-  Assigning an expression to an option in a 'block where' statement did not work correctly.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The new column and row header feature, introduced in AIMMS 4.56.1, did not write these additional headers to the .csv file which can be downloaded from the Table widget.
-  When using the visibility option of the Bubblechart widget, the Bubblechart was sometimes rendered far too small.
-  Bar heights in the Gantt chart widget were sometimes calculated wrongly.



--------------



AIMMS 4.56.2 Release (July 12, 2018)
------------------------------------

Build 4.56.2.1 

Resolved WebUI Issues
+++++++++++++++++++++++

-  The newly introduced identifier header text feature did not work well yet with identifiers in Libraries.
-  In specific cases, a dropdown list for element parameters displayed in a scalar widget with multiple scalars in it, displayed in the top left corner of the screen.



--------------



AIMMS 4.56.1 Release (July 10, 2018)
------------------------------------

Build 4.56.1.8

WebUI Improvements
++++++++++++++++++++

-  The WebUI now has a 'health check' facility. Should you run into a 'Data Session Lost' situation in your app, the WebUI will, after a few seconds, automatically perform some connectivity checks. When this is done, it offers you the possibility to download a small report to your local machine. If the problem persists, you can provide this report to AIMMS support for analysis, which will provide us with more insight into the problem.
-  The identifier columns/rows in the Table widget now display the set name(s) of the identifier(s) which are in the table. This makes it easier to understand what the listed tuples are about. Please be aware that this does not work yet for sets which are defined in libraries.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Running the CleanDependents statement could cause a superfluous message about the empty element not being part of the set.
-  In a newly created project, the WebUI annotations were not available, unless you re-opened the project.
-  In rare cases an infeasible robust counterpart was generated as a feasible model.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The localization of the thousand separator/decimal point was not supported for all the common (browser) languages yet. We added support for Arabic, German, Spanish, French, Hungarian, Italian, Japanese, Russian and Chinese.
-  In some cases, the Map widget could display a number of pink blocks instead of (parts of) the actual map.
-  Double-clicking on a button (instead of a single click) showed the message 'some procedure is already running'. Now a double-click is treated as a single click.
-  When having the UI Editable option set to 0, the end-user could still center and scroll the map, but after a refresh of the page (either implicit or explicit), the map was restored to the original position and zoom level.



--------------

#############
AIMMS 4.55
#############

AIMMS 4.55.1 Release (June 22, 2018)
-------------------------------------

 Build 4.55.1.0 (Hotfix release)

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The function :any:`GMP::Instance::Delete` did not release memory allocated by the solver CP Optimizer.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some cases, you could get an error message about ``awf.persistence`` upon opening a WebUI page.
-  When the OpenStreetMap map service, which underlies the WebUI Map widget, is not functioning well, you see big pink tiles in your Map widget. Now the WebUI shows a message telling your users what is wrong.
-  The font used in the Option Editors was more blurry than the one in previous releases. This has been corrected.
-  If a Table cell still had the focus when using a scalar widget to cause a structural change in the Table, the Table would not update automatically.
-  When clicking in a Table cell, waiting a short while and clicking again, you got a blinking cursor, suggesting that you could edit the value. In reality, you got stuck then, because editing is only triggered by a double-click, just starting to type or using the Enter key.
-  In the background, the Selection widgets generated a lot of superfluous network calls.
-  Having big tooltips in the top part of the screen, could lead to the tooltips being hidden behind the WebUI menu bar.
-  In certain scenarios, your application could hang when run on PRO.



--------------

#############
AIMMS 4.54
#############

AIMMS 4.54.2 Release (June 18, 2018)
------------------------------------

 Build 4.54.2.16)

Resolved AIMMS Issues
+++++++++++++++++++++++

-  There was a regression issue in the WinUI Gantt chart, where moving a bar went wrong.
-  A double click in the header of the WinUI Pivot Table could lead to a crash.
-  The width of an aggregator column in the WinUI Pivot Table was determined by the last visible aggregator column, which could result in a situation where the column was too small to show the current values.
-  When completely emptying the index domain of an identifier, you could still get compilation errors based on the old index domain.
-  Preparing the postsolve step for a model with many indicator constraints could be unnecessarily time consuming.

Resolved WebUI Issues
+++++++++++++++++++++++

-  On non-touchscreen devices, element parameters with a definition were colored blue, as if they were editable.
-  Dragged bars did not get their Stored Focus element parameters set as expected. Instead, they remained set to the last job that was clicked on.
-  The Table widget was not showing data if a parameter had domain conditions containing an element parameter.
-  Doing a lot of moves from one row to another in the Gantt Chart widget, could lead to an unresponsive AIMMS in combination with an UponChange procedure.
-  Having a job with start time of 0 in the Gantt Chart widget would always set this job to read-only.
-  Sometimes, after having created a new Button widget, a crash could occur when clicking the button.
-  If you tried to resize a bar in the Gantt Chart widget such that it became smaller than its default time, the 'Busy' screen would not go away anymore.



--------------



AIMMS 4.54.1 Release (June 7, 2018)
-----------------------------------

 Build 4.54.1.2

AIMMS Improvements
++++++++++++++++++++

-  Gurobi version 8.0 has been added. Gurobi 8.0 is not available for Windows 32-bit.
-  A time limit can now be specified for (the GMP version of) AOA.

WebUI Improvements
++++++++++++++++++++

-  Editing in the Table widget has been made a lot faster than before.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In some cases, explicit element values were incorrectly matched with the set instead of the rootset and treated as empty when outside the set. E.g. the expression ``ep = 'rootsetelement'`` might return true if ``ep`` was empty.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When an ordered set changed the ordering of its contents, but the contents themselves remained the same, a Table Widget based on that set was not automatically redrawn to reflect the new ordering.
-  Sometimes, in the Options Editor, the list of possible aggregators to add to a Table widget would disappear after a second or so, making it impossible to add any.
-  The Stored Focus option overruled the setting of specific element parameter values by the UponChange procedure.
-  When scrolling in a Table widget, such that the originally selected value was not in view anymore, removed the focus from that value. When returning to it, it was hard to locate anymore because of this.



--------------

#############
AIMMS 4.53
#############

AIMMS 4.53.5 Release (June 1, 2018 Build 4.53.5.8)
--------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  If a parameter does not have the stochastic property set, any stochastic data for that parameter that is encountered in a case file will not be read in anymore.
-  Nested index expressions with an element parameter with a non-default default value gave an internal error in the new compiler. This is prevented for now by turning off the new compiler for such expressions.
-  Since AIMMS 4.53.1, in some cases no solution was shown in AIMMS after a user interrupt, even though the solver did find a solution.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The Upload widget and the Download widget were not working correctly when AIMMS was used in PRO Debugger Mode.
-  In some cases, the Gantt Chart widget would not take the display domain into account.
-  Overlapping nodes in a zoomed-out Map widget, with the Store Focus specified, did not always put the right value in the element parameter specified when clicking them.
-  The text description of an element parameter was not applied in a scalar widget and with the text description, the legend did not highlight the value.
-  When dragging a bar in the Gantt Chart widget, this bar was not put in the Store Focus identifier.
-  The default tooltip for cells in the Table widget did only show text until the first whitespace character of a string value. Now it will show the entire content.
-  The scroll bar in the Contents section in the options editor of the Table Widget did not work correctly anymore.



--------------



AIMMS 4.53.4 Release (May 24, 2018 Build 4.53.4.1)
---------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Pressing buttons in the WinUI while the WebUI was active as well, could lead to crashes.
-  When communicating identifiers with a non-default default value and a non-base unit unit to or from a database, the unit conversion was applied twice to the default.

Resolved WebUI Issues
+++++++++++++++++++++++

-  An empty element in a subset of Integers was displayed as '0' in the WebUI, instead of as the empty element.
-  Element names that contain spaces will always result in a single annotation in WebUI. For example, the element 'the Hague' will result in the 'annotation-the-Hague' class being present on the corresponding DOM element in your browser.



--------------



AIMMS 4.53.3 Release (May 18, 2018 Build 4.53.3.1)
---------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When writing strings to a MySQL database, in some situations the '' character was not escaped, leading to errors or strange data.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Empty elements in the set AllIntegers are now displayed as an empty string instead of 0.
-  The ElementText was not used when displaying an element parameter which was defined over a subset of AllIntegers.
-  The ElementText was also not used when downloading a .csv file from a Table widget.
-  Using specific combinations of Windows text sizing and browser zoom levels, text in scalar widgets could get an unexpected 'fade out' effect.
-  A read-only sliced parameter in a Scalar widget was displayed in blue instead of black, suggesting that it could be edited.
-  Two selection boxes on the same page, with the same identifier as their contents, would be rendered incorrectly as empty selection boxes.
-  The internal Application Name setting was inadvertently available to the WebUI developer. Specifying this setting could lead to the WebUI not displaying in a PRO environment. The setting has been removed.
-  The first letter of a widget was always automatically translated to uppercase, which could lead to unexpected behaviour in your custom CSS when targeting specific widget names.
-  Jobs in a Gantt chart with a start time of 0, became 'read-only', in the sense that they could not be dragged anymore.



--------------



AIMMS 4.53.2 Release (May 8, 2018 Build 4.53.2.1)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  If the function FileRead returned with an error, the file was not properly closed, which prevented it from being moved or deleted later on.
-  In the AIMMSXLLibrary, values were not checked against the binary range of a parameter.
-  When moving a task vertically in the WinUI Gantt chart, the corresponding procedure upon change was not always triggered.
-  Opening the PRO Progress Window (through the request manager) just after a solve started could result in the solve being aborted.
-  :any:`axll::WriteTable` did not change the cell format to a numeric format when writing numeric values.
-  An empty element as the default value of an element parameter in a subset of integers could give an incorrect compilation error.
-  Removing previously specified attributes of an identifier did not always completely empty the attribute text in the Attribute window or the written .ams file.
-  The compiler could give an incorrect warning on 'inefficient directly nested for statements' when the FOR and the DO were not on the same line.
-  Running :any:`axll::CreateNewWorkBook` on Linux or in the cloud could result in a crash.
-  Using SQLCreateConnectionString without a username or password could result in a crash since version 4.52.2.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When having a Scalar widget set to multi-line and moving from one field to the next using tab (or shift+tab to the above field), the data entered into the first field was automatically populated in the second field.
-  Bar Chart rendering performance when the underlying identifier data is (very) sparse has improved significantly.
-  Sometimes, selection boxes would be incorrectly rendered as 'Empty Selectionbox'.



--------------



AIMMS 4.53.1 Release (April 24, 2018 Build 4.53.1.8)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  As part of our new user experience improvement project called UX 2.0, to drastically improve the usability of AIMMS applications, a new Navigation Menu has been added to the WebUI. This menu should help users find their way around AIMMS Apps and get a general overview much more easily. As this new menu will become the new default, your existing Apps will change automatically. Please see the `documentation <http://manual.aimms.com/webui/page-menu.html>`__ for more details.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When running on Internet Explorer, the maximum number of columns on a page was not respected, possibly leading to odd looking WebUI apps.



--------------

#############
AIMMS 4.52
#############

AIMMS 4.52.5 Release (April 18, 2018 Build 4.52.5.1272)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some cases, when opening a WebUI page, you could get the error message 'The character ':' is not allowed in an identifier name. Only letters, digits and underscores are allowed in an identifier name, and an identifier name should start with a letter or underscore.'. This has been addressed.



--------------



**AIMMS CDM (Collaborative Data Management)**

On April 18, 2018 we released the AIMMS CDM library. CDM implements version control on AIMMS model data, very similar to the functionality offered by modern version control systems such as git. It offers a version control repository for AIMMS data within a regular relational database, with all data being stored in a tree of branches (or revision sequences). This allows you to effectively collaborate with other users and review each other's changes. An overview can be found at the `AIMMS New Features Page <https://www.aimms.com/support/new-features/>`__.



--------------



AIMMS 4.52.4 Release (The AIMMS 4.52.4 Release was also released on April 13, 2018 Build 4.52.4.1271)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  In rare cases the data structures of the WebUI became corrupted.



--------------



AIMMS 4.52.3 Release (April 13, 2018 Build 4.52.3.1270)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A performance issue in the execution engine with the operators > and < has been fixed.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some cases, line charts showing a parameter having a unit did not show the chart anymore.
-  Strings in the Table widget were right-aligned instead of left-aligned.



--------------



AIMMS 4.52.2 Release (April 6, 2018 Build 4.52.2.1268)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The function WebUI::CreateAnnotation now also allows numerical characters.

Resolved WebUI Issues
+++++++++++++++++++++++

-  AIMMS could crash after moving around a number of bars in the Gantt Chart widget.
-  Hidden widgets within a Group widget could sometimes become visible after resizing the browser window.
-  Using the Store Focus feature on Table Widgets did not always lead to the linked element parameters being filled with the expected value.
-  In Internet Explorer, using a link from within the Text widget led to a new tab being opened.



--------------



AIMMS 4.52.1 Release (March 27, 2018 Build 4.52.1.1265)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the AIMMS debugger, after pressing 'Finish (ignoring breakpoints)' breakpoints were no longer hit when running other procedures via the WebUI.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In the AIMMS debugger, after pressing 'Finish (ignoring breakpoints)' breakpoints were no longer hit when running other procedures via the WebUI.
-  Sometimes, the scroll bar in a Table widget could be moved a bit outside of the Table widget.
-  The Gantt Chart widget always displayed bars based on numerical set elements first, irrespective of any specified sort order.
-  As a result of the above-mentioned Gantt Chart bug, trying to move jobs from one resource into another could also fail.
-  When having an UponChange procedure connected to a parameter in your WebUI, and changing that same parameter in the UponChange procedure, this was not reflected in the WebUI.
-  In certain circumstances, an UponChange procedure in the AIMMS model could be triggered twice instead of once, leading to unexpected results.
-  Instead of a human readable date label on the X-axis of WebUI charts (like "Month" or "Year"), a label like "!_gen_lab_Year_Month" could erroneously be displayed.
-  Sometimes, data changes were communicated too late to the WebUI, making the WebUI "miss" some.
-  In rare cases, some of the data displayed in the WebUI did not reflect the data in AIMMS.



--------------

#############
AIMMS 4.51
#############

AIMMS 4.51.1 Release (March 16, 2018 Build 4.51.1.1258)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  We implemented some performance improvements in the parallel execution of AIMMS.
-  The procedure :any:`GMP::Instance::CalculateSubGradient` is now also supported by Gurobi.
-  The option `Lazy constraint mode` has been added for Gurobi. It can be used to specify how lazy constraints are handled by Gurobi. A new optional parameter has been added to the procedure :any:`GMP::Row::SetPoolType` for the same purpose.

WebUI Improvements
++++++++++++++++++++

-  The unit support in the WebUI has improved over previous versions. For details, see the `documentation <https://documentation.aimms.com/webui/units-support.html>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The function IdentifierGetUsedInformation did not find references in menus of a library.
-  The Cross Library References tool did not work correctly for an index in a Calendar.
-  AIMMS could crash if the objective variable was used in an indicator constraint.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, there would be an infinite spinner displayed in Selectionbox widgets.
-  Using drop-downs in a Scalar widget sometimes led to the actual dropdown menu to display in the top left of the page, sometimes with an empty list of choices.
-  When drawing a Map widget with varying node sizes and/or node colors, the Map was first briefly displayed with equal node sizes and/or colors. Now the Map immediately renders correctly.
-  Using links in a Text widget could lead to a "Page Not Found" message.
-  When zooming in or out in a Map widget, the value that was set for Store Focus was not retained.
-  The scalar widget is designed to show individual numbers, including 0's. This is why the data selection behaviour has changed from sparse to dense for the scalar widget, thus now also showing by default the individual numbers with value 0. Note that this data selection behaviour can be overridden in the display domain property of the identifier at hand in the scalar widget.



--------------



**AIMMS R-Link Release**

Today, March 14, 2018, we released the new R-link for AIMMS. This feature allows app developers to leverage the power of R, including R libraries, to add statistical and other specialized number-crunching features to their AIMMS apps. Data can easily be passed from the AIMMS model to R. R scripts can then be triggered from the AIMMS model. The results will be returned to the AIMMS model. The R-link will be released as an AIMMS library, using our new Auto-lib function. Check the `manual <http://manual.aimms.com/rlink/>`__ or contact our `Customer Support <mailto:CustomerSupport@aimms.com>`__ to learn more.


---------------

#############
AIMMS 4.50
#############

AIMMS 4.50.5 Release (March 8, 2018 Build 4.50.5.1250)
---------------------------------------------------------------------------------------------------------

 

**Please note that for technical reasons we skipped version AIMMS 4.50.4.**

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A crash could occur if empty (or trivial) cuts or lazy constraints were generated in a callback procedure.
-  Database exception errors were not logged.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Opening pages in certain situations could be much slower than before. This has been addressed.
-  When sorting in a Table widget which contained two or more identifiers with a different domain, the non-sorted identifier(s) would disappear from the table, only to reappear when resetting the sorting.
-  Sometimes the dropdown menu from the Widget manager appeared randomly on a WebUI page of end-users.
-  The Table widget could get stuck after resizing a column displaying an index.
-  In the underlying text files of a WebUI project, changes could occur after just opening your WebUI pages. This made it harder to manage your WebUI project with a version control system.



--------------



AIMMS 4.50.3 Release (February 28, 2018 Build 4.50.3.1241)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS could crash upon a lost database connection.
-  In rare cases, the solution of a math program was not stored correctly.
-  There could be an incorrect warning about non-commensurate units on an assignment when the left hand side identifier contained element parameters as index expressions.

Resolved WebUI Issues
+++++++++++++++++++++++

-  WebUI annotations were not removed from the widget(s) when you emptied the corresponding annotation string parameter in the AIMMS model.
-  When using a Text widget on a page, the page would scroll to the position of this widget upon opening, even when the Text widget was at the bottom of the page.
-  In rare cases, using an element parameter to slice an identifier displayed in a Table widget would not show any value of that identifier.



--------------



AIMMS 4.50.2 Release (February 26, 2018 Build 4.50.2.1238)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When reading data statements with '+=' from a file, in case of string- and element parameters there was an issue which resulted in strange values or errors.
-  A potential crash in the Pivot Table object was fixed.
-  :any:`axll::WriteSet`, :any:`axll::ClearActiveSheet` and :any:`axll::ClearRange` did not mark the workbook as dirty, so changes were not saved.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The annotation text in a Scalar widget could be displayed twice.
-  In Internet Explorer, the LineChart widget only used around half of the available space for displaying the actual chart.



--------------



AIMMS 4.50.1 Release (February 16, 2018 Build 4.50.1.1234)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  To add annotations to your WebUI, it is no longer needed to create an '_annotations' suffix to the relevant model identifiers. Instead, you can use the annotations attribute of them now and specify a ``webui::AnnotationsIdentifier`` annotations attribute.
-  The above also means that you can now annotate the nodes in your Map widgets, by specifying an annotation on the set that defines the nodes.
-  The arcs in a Map widget can now dynamically show the relative sizes of the flows they represent by drawing the arcs thinner or fatter.
-  The Map widget now also offers reverse links/focus support.

AIMMS Improvements
++++++++++++++++++++

-  The function :any:`axll::WriteCompositeTable` now supports parameters with an integer or binary range.
-  Several optional arguments have been added to the procedure :any:`GMP::Solver::InitializeEnvironment`.
-  The performance of the saving and loading of cases when having published AIMMS models on the PRO environment, was improved.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A crash could occur when applying a new index filter in the WinUI Pivot Table.
-  If CPLEX or Gurobi was using multiple threads, the solution was read back in replace mode, although merge mode was specified.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When having both a numerical and a string parameter in one scalar widget, where the numerical one had a unit associated with it, the WebUI inadvertently also added the unit to the string parameter displayed.
-  When using extreme scaling in a Bubble chart (i.e. having a huge difference between the size of the largest and the smallest bubble), the Bubble sizes could get messed up.
-  Previously, it was allowed to use widget names ending in one or more spaces. When having your model under source control, this could lead to problems. Now such widget names are trimmed.
-  If you had the zoom level in a Map widget defined by an AIMMS parameter, the parameter was accidentally replaced by the literal value if you applied a zoom action on the widget.



--------------

#############
AIMMS 4.49
#############

AIMMS 4.49.2 Release (February 1, 2018 Build 4.49.2.1226)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A possible crash in the Pivot Table was fixed.
-  There was a problem in the WinUI Table when 'Element Description' was specified in combination with the multiple case view.
-  Specifying the InitialData attribute of a scalar element parameter without the attribute 'Range' being set, resulted in an error.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When slicing over an element parameter that has a definition, the WebUI did not immediately update the sliced identifier when this element parameter was updated.
-  Changing a value in a Table widget based on an underlying ordered set, caused the focus to jump to the top left position of the table after the edit was made.



--------------



AIMMS 4.49.1 Release (January 30, 2018 Build 4.49.1.1219)
---------------------------------------------------------------------------------------------------------

 

**Where is AIMMS 4.48?**  you may wonder... Due to technical reasons, we skipped this number. Furthermore, this AIMMS 4.49 release is actually not a Feature Release, but provides a number of bug fixes.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Using index expressions on the left-hand side of a statement or expression, could lead to crashes or (in rare cases) to wrong results.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The WebUI library now listens to the option `Default_data_folder`, in order to determine the name of the data folder on disk. Previously, there have been problems with this folder being called either 'data' or 'Data', which led to problems when deploying on the (Linux) cloud.
-  Adding or removing parameters from the predeclared CurrentInputs set when they were at their default value, did not have the expected effect on their read-only status in the WebUI.
-  It could happen that a unit was displayed more than once for the same value in the WebUI (for example: '5 % %' instead of just '5 %'), when having specified the unit in the relevant .js file.
-  Tooltips were not displayed anymore when displaying a widget in full screen mode.
-  Editing a numerical value with more decimals than were displayed in the WebUI, could lead to the actual AIMMS-value being rounded unintentionally.
-  The Table widget could 'flicker' when the user entered data and used the mouse to click on another cell.
-  When using the horizontal scroll bar, sometimes the last column was not visible at once.
-  Sometimes it was impossible to select a value in a Table widget with the mouse in order to edit it from a specific position.



--------------

#############
AIMMS 4.47
#############

AIMMS 4.47.1 Release (January 22, 2018 Build 4.47.1.1213)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  CPLEX 12.8 has been added. It comes with performance improvements for MIP problems.

WebUI Improvements
++++++++++++++++++++

-  The options editors are now more limited to PRO users of your WebUI apps. This means that they only see/can change the relevant options for widgets in PRO mode.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When during an axll function call, the same element tuple is written more than once with different values, you now get a warning each time this happens, instead of just one warning at the first occurrence.
-  When compiling procedures that have more than 32 different index names in their arguments, AIMMS could crash.
-  Reading a date cell into a string parameter via the AIMMSXLLibrary did not work correctly in the latest AIMMS version.
-  When trying to read from a non-existing file with the option `Max errors during file read` set to a value higher than 1, AIMMS ran into an error. This is fixed, the error on the non-existing file is now reported.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The more widgets you already had in your application, the slower the creation of new ones would become. This has been addressed.
-  An index domain over a compound set could lead to no data being displayed in the WebUI.



--------------

#############
AIMMS 4.46
#############

AIMMS 4.46.4 Release (January 11, 2018 Build 4.46.4.1201)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The argument ModeForUnknownElements in both :any:`axll::ReadTable` and :any:`axll::ReadList` has a new allowed value of 3, which skips unknown elements but does produce a warning on it.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The AIMMSXLLibrary was sometimes not able to read in an .xlsx file.
-  On Windows, CBC was writing to standard output if its option `Status File` was switched off (which it is by default).
-  Gurobi 7.5 has been upgraded to version 7.5.2.
-  When closing and re-opening a project (without exiting AIMMS), name change information was parsed incorrectly.
-  A crash could occur in the AIMMSXLLibrary when warning_duplicate_elements was set to 'Error'.
-  The AIMMSXLLibrary inadvertently changed the format of cells to Text.



--------------



AIMMS 4.46.3 Release (January 8, 2018 Build 4.46.3.1197)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The timestamp of entries in the ``.nch`` (name change) files were not read back correctly, possibly leading to problems in your model.
-  In the Pivot Table of the WinUI, the calculated column width was sometimes too wide.
-  Fixed a crash that could occur when creating (and deleting) a large amount of runtime identifiers that have the unit attribute specified.



--------------



AIMMS 4.46.2 Release (January 3, 2018 Build 4.46.2.1189)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When trying to open a project that was already opened for editing, the AIMMS session that had it open for editing could no longer save its changes.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some cases, you could get an unexpected error message about some implicit set of which it was not clear what it was about. This message is not raised anymore.
-  It was not possible to add an _annotations identifier to Bubble Chart identifiers in your model, to allow for custom CSS-styling.
-  After pressing the escape button in a pop-up dialog in the WebUI, subsequent pop-up dialogs did not appear anymore.



--------------



AIMMS 4.46.1 Release (December 20, 2017 Build 4.46.1.1184)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT:**  This AIMMS version handles more definitions with the new compiler (and, as a result, with the parallel engine). This means that some definitions are evaluated more strictly than in older AIMMS versions. For example, the '|' operator is evaluated more strictly than before and this could lead to different results! For example, the expression 1 + 2 | 4 - 4 was always (incorrectly) interpreted as 1 + (2 | 4) - 4 instead of (1 + 2) | (4 - 4), clearly leading to a different result. In order to safeguard you, this AIMMS version has a number of new warnings built in, which will point you to lines in your model where such situations can happen. Please do not ignore these warnings, but try to address them. In the Language Reference, in table 6.13, you can find the operator precedences in AIMMS, which you can use as a guideline here.

AIMMS Improvements
++++++++++++++++++++

-  The new solver ODH-CPLEX, designed to run on modern multiprocessor machines, has been added.
-  The procedures :any:`GMP::Solver::InitializeEnvironment` and :any:`GMP::Solver::FreeEnvironment` have been added. These procedures can be used to connect and disconnect to a remote server or cloud server multiple times during one AIMMS session.
-  CONOPT 4.0 has been added. It comes with performance improvements for large nonlinear models. CONOPT 4.0 is less likely to end up in a locally infeasible solution.

WebUI Improvements
++++++++++++++++++++

-  We introduced a new, more elegant, way to add element text to your WebUI. This used to be done by specifying a .js file. Now it's done from within the AIMMS model and it allows you to replace element names with any alternative text that you like. Furthermore, it includes an inheritance mechanism between sets and subsets, for even more flexibility. When your app still uses the .js file mechanism, you will get a warning message upon startup.
-  The WebUI Button widget can now, apart from executing procedures, also be used to jump to another WebUI page or to an external web page.
-  In the Table widget, only the header cells associated with the cell currently hovered over/active will now be highlighted. This gives a much 'cleaner' visual effect.
-  Using the UI Editable application option now disallows end-users to open the options editors of the widgets in your WebUI app.
-  On touch devices, there is now a 'Page Edit Mode' switch. With this switch, you can disallow end-users to open the option editors in your WebUI app.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Making attribute changes to stored procedures could result in a crash.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some situations, when using a non-scalar display-domain identifier with an index domain that is a strict subset of the domain of the contents identifier, the data was not rendered correctly in the widget.
-  There was no 'do you want to save' pop-up message anymore after you changed the data in your current case in the WebUI when you wanted to load an other case.
-  In some cases, you had to explicitly refresh your WebUI page in order to see updates to your data, if the data depended on selections in other widgets on your page.
-  When editing a table and moving your mouse away from the table, you lost your focus on the cell in which you were typing. Now this focus remains and you can just continue to type.
-  When editing a value in the Table widget and double-clicking on another cell in order to edit that one, the focus kept coming back to the original cell.



--------------

#############
AIMMS 4.45
#############

AIMMS 4.45.5 Release (December 11, 2017 Build 4.45.5.1175)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The Excel functions :any:`axll::WriteTable` and :any:`axll::WriteTableQuick` now have optional arguments to include empty rows and/or empty columns separately.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Specifying the raw flag using the AimmsAttributeFlagsSet API function did not always result in faster retrieving of data.
-  Some attributes of a calendar were saved without their library or module prefix, making it hard, for instance, to define a timeslot format when the format was stored in a module.
-  Spreadsheet::RetrieveValue did not check the bounds if the referenced identifier was not a scalar.
-  Assigning empty data to an indexed compound set would cause an incorrect error about its dimension. This error is now suppressed.

Resolved WebUI Issues
+++++++++++++++++++++++

-  On Internet Explorer 11, the Download widget was showing its labels on top of each other.
-  In some cases, especially when typing really fast, a multiline scalar widget was not quick enough to save its contents. This could lead to an outdated underlying value being used in, for example, a procedure run from a button on the same WebUI page.
-  The content of the CurrentInputs set in AIMMS was not always communicated immediately to the WebUI when being changed. This could lead to identifiers being displayed as editable in the WebUI, whereas in reality there were not, or vice versa.
-  You could get an incorrect warning message about an identifier not being declared, but only being declared with a certain prefix.
-  In some cases, when showing a Gantt Chart widget in full-screen mode, an unexpected white window popped up.



--------------



AIMMS 4.45.4 Release (December 1, 2017 Build 4.45.4.1163)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In an assignment statement, the comparison of elements in an ordered set sometimes gave incorrect results.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The WebUI has been made more robust against a crash in the underlying AIMMS process.



--------------



AIMMS 4.45.3 Release (November 29, 2017 Build 4.45.3.1161)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  In the past, checking or unchecking the WebUI folder when creating an ``.aimmspack`` file determined whether a project was published as WebUI or WinUI. In the last few AIMMS versions, this did not work anymore. Now it does again.
-  Sometimes, opening the search box in a scalar selection box widget, led to an infinite spinner being displayed.
-  Sometimes, a selection box widget with an element parameter as its contents, incorrectly showed 'Empty Selectionbox'.
-  Pressing 'Cancel' in the 'Busy/Cancel' area when running a more time-consuming AIMMS procedure, did not always cancel the run.



--------------



AIMMS 4.45.2 Release (November 27, 2017 Build 4.45.2.1158)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  When deleting a procedure in your AIMMS model, which is still used in a WebUI button widget, now gives you a proper error message stating that the procedure does not exist.
-  Before actually drawing a widget, the WebUI first displayed a white outline of it, resulting in a less smooth user experience.
-  Sometimes, the dropdown belonging to the 'Add Widget' dialog popped up in the WebUI.
-  Sometimes, when trying to add a widget to a Group widget, the 'Add Widget' dialog would disappear.
-  In some cases, the partial data that makes up a 'Sum' column in a Table Widget was not shown; only the total sum itself was displayed.
-  Using a row height of 1 in a Table widget, sometimes caused the vertical alignment of the rows in the Table to be off a bit. This was especially likely when using long element names in dropdown cells.
-  If you have a Table widget which does not show any data (because of slicing, for example), it will now display an 'Empty Table' message, which is consistent with the other widgets.



--------------



AIMMS 4.45.1 Release (November 22, 2017 Build 4.45.1.1156)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  A library repository browser was added to the Library Manager that will allow AIMMS to make extra libraries available that can easily be included in projects (note that libraries with a version number starting with 0 are for internal testing and should not be used it in any serious project).
-  The Excel functions :any:`axll::WriteTable` and :any:`axll::WriteTableQuick` have a new optional argument called IncludeEmptyRowsColumns. It allows you to write a one or two dimensional identifier in 'dense' mode, writing also the rows and columns that only have values equal to 0.
-  The Excel function :any:`axll::WriteTable` can now be used also to write an identifier in a list format, where all indices appear in the row header and there is only one column with values. This makes it possible to also write a one-dimensional identifier using :any:`axll::WriteTable`.
-  The AIMMS DataLink library was added. This is a library that allows different types of data sources to read and write data from and into AIMMS, using a common interface.

WebUI Improvements
++++++++++++++++++++

-  When you add a new identifier to your AIMMS model, you do not have to restart your model anymore in order to use this new identifier in the WebUI, making the development process a lot more convenient.
-  The Page Manager can now also be used in PRO mode, to let end-users of your WebUI apps more easily navigate the pages in their app and get an overview of the current page tree.
-  The Slider widget now also has a Visibility option.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  There was a performance issue with specific cases of the iterative Max operation and with the For loop.
-  AIMMS would sometimes raise an incorrect error when changing units of an identifier back and forth.
-  When writing an empty string to a column in a database table that refers to another table as a foreign key, this will now result in the NULL value instead of the empty string.

Resolved WebUI Issues
+++++++++++++++++++++++

-  On PRO, the dragging of widgets has been disabled for the end-user, to prevent widgets moving around unexpectedly, which could lead to confusion.
-  Sometimes, the scroll bar in a Table widget was displayed outside of the widget boundary.
-  When using a .properties file for translations in your WebUI, any library prefixes were not taken into account. This has been addressed, but has the side-effect that if you use library identifiers in your widgets, this prefix is now also visible. You might want to use a .properties file, or adjust your existing one to include any library prefixes, in order to correct this.
-  When displaying element parameters defined over a subset of Integers in a Table widget and sorting them, they used to be interpreted as string values rather than numerical values. This led to, for example, the value 20 preceding the value 3. Now such element parameters are interpreted as numerical values.
-  If you combined a Sum (or Count, etc.) column/row in a Table widget with an indexed mentioned in an ``elementText.js`` file, the word 'Sum' (or 'Count', etc.) was not displayed in the header.
-  Using Totals in widgets for identifiers that were defined in a library, did not work properly.
-  Checkboxes in the Table widget, for boolean values, already changed value when clicking anywhere in the table cell, instead of on the checkbox itself.
-  Using units of measurement in your WebUI could in some specific cases cause the browser to crash.
-  The Gantt chart did not display anything if the index used in the Resources group contained less than 3 elements.
-  The Gantt chart showed 'flickering' data when using 3 indices in the Resources group.



--------------

#############
AIMMS 4.44
#############

AIMMS 4.44.4 Release (November 3, 2017 Build 4.44.4.1142)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Writing to a database table always counted the number of rows before writing, in order to determine the best strategy to use. For the Insert mode, this information is not used and so the counting is skipped. This can improve the performance of writing in Insert mode to huge tables.
-  There was a problem in the AIMMSApi function AimmsProjectClose, that could cause the calling program to hang.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When selecting filters for a WebUI widget, only the first 6 available filters were displayed in the Filters options editor, even if there was room to show more. You had to use the search functionality to access filters other than these first 6.



--------------



AIMMS 4.44.3 Release (October 31, 2017 Build 4.44.3.1139)
---------------------------------------------------------------------------------------------------------

 

**AIMMS Improvement**

-  A new function HistogramAddObservations (pay attention to the last 's') was added to help users avoid calling the existing function HistogramAddObservation in a loop and thus save time in execution.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS could crash during the `re-ordering` of a set if the OrderBy attribute of that set referenced another set that also needed to be re-ordered.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When running a procedure that resulted in an error, the WebUI turned into a 'Busy' status which did not disappear anymore.
-  Sometimes, using the ``webui::requestPerformWebUIDialog`` function, you could get duplicate dialogs popping up unexpectedly.



--------------



AIMMS 4.44.2 Release (October 30, 2017 Build 4.44.2.1134)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the WinUI Pivot Table, the unit of an expression was not always shown.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In some cases, widgets with the exact same name as an existing widget on your WebUI page would be created out of nothing. Furthermore, when adding a widget manually, duplicate names were (incorrectly) allowed.
-  When using a Selectionbox widget in a Group widget, the small diagonal cross to the right of the text was slightly too close to the actual text.



--------------



AIMMS 4.44.1 Release (October 25, 2017 Build 4.44.1.1129)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The menu option `Export End User Project` did not work correctly when the project was located in a folder with a long path name.

WebUI Improvements
++++++++++++++++++++

-  In the Map widget, it is now possible to specify the sizes of the displayed nodes. This enables you to visualize a certain property of your locations on top of your Map widget. For example, you could use city populations here, where the bigger cities will be drawn as a bigger node.
-  Some improvements have been made on (re)using the browser cache. This is beneficial for the page reloading performance of the WebUI.
-  The animation displayed when widgets are drawn on a newly loaded page has been removed, leading to a snappier feeling when loading a page.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When 3 or more users of your WebUI app on PRO would execute long/longer running AIMMS procedures at the same time, PRO would conclude after a while that the sessions were dead, leading to PRO actually killing the sessions.
-  When having a Table widget with a scroll bar and dragging it, there were times that the widget duplicated itself resulting in 2 displayed instances of the same widget.



--------------

#############
AIMMS 4.43
#############

AIMMS 4.43.2 Release (October 18, 2017 Build 4.43.2.1123)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A compatibility issue was introduced in cases created in the latest AIMMS versions (4.42 and 4.43.1). Cases created with these versions could not always be read back in AIMMS 4.40 or earlier. From AIMMS 4.43.2 onwards, all is fine again.
-  The Forall statement could sometimes return incorrect results.
-  The new compiler warning 'warning lag lead on subset of integers' was not stored at saving a project.
-  In case the filter of a database read statement only contains 1 element per column, internally the WHERE clause is now filled in directly instead of using a parameter. The usage of a parameter is slow when using some specific ODBC drivers.

WebUI Improvements
++++++++++++++++++++

-  You can now specify a default Row Height value in the Table widget (on the Misc. tab in the options editor). This allows you to create more compact tables (or less compact ones, if you want). The default value of the option leads to the same row height as in existing AIMMS versions.

Resolved WebUI Issues
+++++++++++++++++++++++

-  An UponChange procedure on an element parameter was incorrectly run twice (once for the empty element, once for the actual value).
-  The WebUI incorrectly showed the message "``awf.data.aimms.session``: MainExecution:Identifier does not contain data. (status code: 400)" when adding a procedure name to a Button widget upon creating the widget.
-  In the Identifier Settings options editor, long identifier names were not fully readable. A tooltip has been added now.
-  When having hidden widgets on a WebUI page and scrolling in one of the visible widgets, the visible widget would move around.
-  Sometimes the dropdown dialog (for Selectionbox widgets) incorrectly opened in the top left corner of the WebUI page.
-  Sometimes, when typing really quickly in a Multi-line Scalar widget, especially on slow network connections, some key presses were not registered correctly, leading to missing characters in your typed text.



--------------



AIMMS 4.43.1 Release (October 11, 2017 Build 4.43.1.1113)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  We added the new function PageCopyTableToSpreadsheet that allows you to specify separately whether row and/or column headers should be included.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Making a 'block-edit' in a WinUI table now triggers only one refresh of all other page objects that are on the currently opened page.
-  The new 'warning_lag_lead_on_subset_of_integers' error message triggered several superfluous warnings in the standard Forecasting Library. This has been corrected.

WebUI Improvements
++++++++++++++++++++

-  The caching of WebUI objects was improved, in order to allow quicker reloading of WebUI pages (i.e. pressing F5 in the browser).
-  The rendering of widgets is now more smooth.



--------------

#############
AIMMS 4.42
#############

AIMMS 4.42.2 Release (October 4, 2017 Build 4.42.2.1106)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When creating a new project, accessing the Page Manager could result in a crash.
-  Using ordered sets could sometimes lead to a crash.
-  Creating an end user project (``.aimmspack``) with a library located in a parent folder, did not work correctly.
-  The file name specified for the Application Help File was not always found.
-  References to library projects were not stored correctly in the ``.aimms`` file.



--------------



AIMMS 4.42.1 Release (September 27, 2017 Build 4.42.1.1096)
---------------------------------------------------------------------------------------------------------



**Please note:**  You may have noticed that the version number of this release has skipped 4.41. This is because of internal changes that we made to our  Build system. This 4.42 version should be considered as a bug fix release, not as a release containing new features. From here on, the numbering will follow the regular schedule again.

AIMMS Improvements
++++++++++++++++++++

-  The compilation time has been improved.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  If the base unit of a Quantity was the Euro symbol, writing a case file could result in an error.
-  A statement with a Lag or Lead operator could result in a crash if the element parameter on the left-hand side did not contain data.
-  Using compound aggregators in the WinUI Pivot Table did not show any results.
-  A warning was added on the usage of the Lag or Lead operator on a subset of Integers. This may give results other than expected.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The WebUI cannot handle Activity and Resources well yet. This has been made more explicit.
-  The performance when loading pages containing widgets which use display domains has been improved significantly.
-  Error messages about using special values could include an unexpected random GUID value.
-  If something was wrong in an underlying file of the WebUI mechanism, this could lead to an empty page being rendered instead of the page that you expect. The WebUI has been made more robust against this problem.
-  In slow networking scenarios, single key values entered into table cells were not picked up sometimes.



--------------

#############
AIMMS 4.40
#############

AIMMS 4.40.2 Release (September 13, 2017 Build 4.40.2.1080)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  Both sets of functions to write to Excel (the spreadsheet:: functions and the axll:: functions) now have an option to write calendar dates as strings (instead of dates).
-  Two new conversion functions to translate columns from name to sequence number and vice versa have been added to the Excel library. They are called :any:`axll::ColumnName` and :any:`axll::ColumnNumber`.
-  When writing to Excel you now have the option to write the value INF as the string "INF" (instead of using the underlying numerical value of 1E+150).

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When using the Ord function in combination with an ordered set, AIMMS could crash.



--------------



AIMMS 4.40.1 Release (September 8, 2017 Build 4.40.1.1075)
---------------------------------------------------------------------------------------------------------

 

**Important 1:**  From this AIMMS version onwards, a new structure of the underlying WebUI files and folders is used. This means that upon startup the WebUI of your existing applications, you'll get a warning message telling you so. You are strongly advised to first make a backup of your project before performing the conversion. Furthermore, if your project contains many pages, the conversion may take several minutes.

**Important 2:**  Please make sure that your WebUI project is converted, before publishing it on PRO with this AIMMS version and use the most recent PRO version. In PRO 2.16.4 a bug was introduced that results into a 'dangling' app which cannot be deleted anymore when non-admin users try to publish an invalid app (like an unconverted WebUI app in combination with AIMMS 4.40). Furthermore, you will get write access errors upon trying to republish the app. This bug has been fixed in PRO 2.16.5.

AIMMS Improvements
++++++++++++++++++++

-  BARON can now also handle the expression x^y where x and y are variables.
-  The AIMMS WebUI can now more easily be accessed from the AIMMS IDE.
-  The WebUI has been made more prominent in AIMMS. Upon creating a new project, you get the choice to use either WebUI or WinUI, with WebUI being the default.
-  For inserting data into a MySQL database, we added an alternative implementation which speeds up write statements with many rows.

WebUI Improvements
++++++++++++++++++++

-  The Scalar widget now offers the possibility to display multiple lines for long string values.
-  There is a new Page Manager available, which you can use to easily organize all your WebUI pages.
-  Based on the page structure in the Page Manager, a clear Page Menu is now offered for your WebUI applications.
-  You can now set up so-called Wizards by using the new Wizard Editor. This allows you to guide end-users through a series of pages in a fixed sequence.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The Button widget sometimes did not respond correctly to the visibility setting in its options editor.



--------------

#############
AIMMS 4.39
#############

AIMMS 4.39.2 Release (August 29, 2017 Build 4.39.2.1069)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  If a calendar has a unit larger than 'day', writing the calendar to a spreadsheet resulted in incorrect dates being written.
-  A crash could occur while AIMMS created an error message during a call to :any:`GMP::Column::FreezeMulti` or :any:`GMP::Column::UnfreezeMulti` because a column was not in the model.
-  If in the WinUI Gantt chart multiple tasks were located exactly at the same position, navigating between these tasks using the arrow keys sometimes did not work correctly.
-  Using iterative operators like sum, exists, count, ... in a definition could lead to very slow performance in some cases.



--------------



AIMMS 4.39.1 Release (August 23, 2017 Build 4.39.1.1063)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  Knitro 10.3 has been added.
-  A new option for Data Pages was added: 'Show Stochastic Data if Available'. If set, a data page automatically shows the stochastic data of the variable and/or parameter.
-  A new option is added under AIMMS/Progress, errors & warnings/Warnings/Compilation: Warning deprecated constructs, with possible values "Error in develop else off" and "Warning in develop else off". The former is the default. With this option, you can toggle whether the constructs that will no longer be available in the new AIMMS compiler will now issue a warning or an error in developer mode.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Element text parameters from model libraries are now supported.
-  Sum/Mean/Count/... values were incorrectly taken into account when sorting in the Table widget.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Fixed performance issues concerning iterative operators (sum, count, exists).
-  When integer valued columns were used in a database, the decimals of the double value in AIMMS were just removed instead of undergoing a proper rounding. This issue could also be triggered when a parameter with integer values but with a unit defined over non-base unit components was written to the database. Now a proper rounding is applied.
-  WebUI will now start even if a 'pro_arguments.txt' file (with reference to an invalid local PRO server) is present.
-  The error message for 'The maximum of execution errors reached' was not properly constructed.
-  When an error occurred in the definition of a variable, the error location was not properly determined.
-  The function ``libxl::WriteCompositeTable`` now always writes identifier values according to the specified units.
-  In rare cases passing a model to BARON could fail.



--------------

#############
AIMMS 4.38
#############

AIMMS 4.38.3 Release (August 3, 2017 Build 4.38.3.1048)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  When running WebUI apps from AIMMS PRO, cases could not be shared.
-  Data changes in identifier domain conditions were not applied correctly.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Compiling or executing a statement with nested indexed element parameters could lead to a crash.

**Note:**  `Click here <http://download.aimms.com/aimms/download/data/AIMMSLauncher/AIMMSLauncher-1.0.0.54.exe>`__ to download the new AIMMS Launcher, which fixes the issue of missing AIMMS Versions inside AIMMS Launcher when running AIMMS as an Administrator (elevated rights).



--------------



AIMMS 4.38.2 Release (July 21, 2017 Build 4.38.2.1041)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The function ReadRawValues has been added to the AimmsXLLibrary. This function allows you to read values from a spreadsheet without an explicit mapping to domain elements.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When showing a multiselect widget using the default row height, it did not use all available space anymore.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  An element expression including the sum operator could put AIMMS into an infinite loop.
-  If the AimmsXLLibrary encounters cells that are in the 'ERROR' state, a warning is raised, but reading continues.
-  If a Quantity was located in a library, the wizard for the Conversions attribute resulted in incorrect data.
-  The postsolve could fail with CPLEX if the model contained indicator constraints.
-  When declaring a Quantity in a library and when option `Singleton_unit_namespace` was set to 'On', sometimes the name of a unit was incorrectly prepended with a double colon.



--------------



AIMMS 4.38.1 Release (July 19, 2017 Build 4.38.1.1035)
---------------------------------------------------------------------------------------------------------

 

**New WebUI feature**

-  The Slider widget has been added to the set of widget types.

**New Solver**

-  Gurobi 7.5 has been added. Gurobi 7.5 includes performance improvements on real-world models, both LP and MIP.

**Compiler upgrading**

-  As you may be less or more aware, we are gradually upgrading our compiler. Until now, whenever a compilation error was encountered by our new compiler, the statement would be recompiled by the old compiler and the error message was shown like you were used to. In this release, whenever the new compiler encounters a compilation error, it will report it. You may notice that sometimes an error or warning message is different. Also, there are a few constructs ( all of which not described by our language reference, but for legacy reasons still working) that will not be supported in the new compiler. These constructs will be reported as deprecated warnings in developer mode. We advise you to resolve these issues, to be sure that your model keeps compiling in all future versions of AIMMS. As we keep extending the new compiler, it may well be that you encounter more deprecated warnings with every update of AIMMS.

**Resolved AIMMS/WebUI issues**

-  Starting from 4.35.1, in some cases the condition on the binding domain of iterative dense operators was not taken into account.
-  In rare cases, pivoting to the Aggregated field in a Widget, could lead to a memory overflow in AIMMS, leading to an unresponsive system.
-  The level values of deterministic variables in a stochastic program can now be stored in the .level suffix (instead of the .stochastic suffix) by switching off the new option `Store deterministic solution as stochastic`.
-  In the interface definition of a library, when expanding all identifiers in a section, now also the implicit subsets of AllIdentifiers that are associated with the contained sub sections or named declarations sections are added.
-  AIMMS should have generated an error if the objective variable was used (as the 'row') in the procedure :any:`GMP::Row::SetRightHandSide`.



--------------

#############
AIMMS 4.37
#############

AIMMS 4.37.4 Release (July 12, 2017 Build 4.37.4.1024)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  The procedure :any:`webui::RequestPerformWebUIDialog` did not work properly anymore. When called, it displayed an error message about the index ``webui::rq`` not being present.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The AimmsXLLibrary now supports reading cells of type Boolean into numeric parameters. TRUE is read as 1.0, FALSE is read as 0.0.
-  In the WinUI Pivot Table, the combination of the option `Initially Collapsed` and 'Show Subheaders' was not working correctly.
-  The final information in the progress window and the CPLEX status file were not correct if CPLEX exceeded the solution limit.
-  In rare cases, AIMMS would hang in the 'Scanning...' part before the compilation of a model.



--------------



AIMMS 4.37.3 Release (June 30, 2017 Build 4.37.3.1016)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, using the DisplayDomain feature in a Table widget led to an extra empty row in your Table.
-  In some cases, having a high number of identifiers displayed in a widget could lead to a dramatic performance drop.
-  Sometimes, clicks on a WebUI button were not registered properly, leading to the procedure that was behind it not being executed.
-  Scrolling either horizontally or vertically in a Table widget, could lead to a change in the layout of the current WebUI page.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the Pivot Table, a combination of artificial indices and multiple cases did not always show all the relevant data present in the cases.
-  Cuts inside a cut or lazy constraint callback procedure could be generated incorrectly which could result in a crash.



--------------



AIMMS 4.37.2 Release (June 23, 2017 Build 4.37.2.1007)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  In the function OptionSetString you can now pass a keyword value that contains either spaces or underscores: so both OptionSetString("Constraint_Listing", "At_every_solve") and OptionSetString("Constraint Listing", "At every solve") are now accepted.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the previous AIMMS version, a bug was introduced which resulted in the expression ``elemParam(i) = ''`` not being evaluated correctly anymore.



--------------



AIMMS 4.37.1 Release (June 22, 2017 Build 4.37.1.1001)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  We introduced the possibility to use slicing of your identifiers in your widgets. With this very powerful mechanism, that you may know of the WinUI, you can let your widgets show only parts of the data of multi-dimensional identifiers, without having to introduce additional identifiers in your model.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The Gantt chart widget still required the words 'Start' and 'Duration' in the relevant identifier names, despite the documentation stating otherwise. Now these terms are not needed anymore.
-  The width of columns in the Table widget containing a sum/mean/average/... was not adjustable.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Passing a model to Gurobi could be time-consuming if the model contained lazy (pool) constraints or indicator constraints.
-  Case I/O involving unit parameters that contain values with the Euro symbol did not work correctly.



--------------

#############
AIMMS 4.36
#############

AIMMS 4.36.1 Release (June 12, 2017 Build 4.36.1.983)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  The Table widget now offers the possibility to navigate it with the keyboard too.
-  The Table widget now has the 'Reverse Link' functionality in place (as you may know from the WinUI). With this, you can specify which element parameters should be updated automatically when the focus cell of the Table widget changes. It can be set on the 'Store Focus' tab on the Table widget options editor.

Resolved WebUI Issues
+++++++++++++++++++++++

-  A Treemap widget showing an identifier which only contains 0-values, now shows an 'Empty Treemap' message.

AIMMS Improvements
++++++++++++++++++++

There is a new option `Warning_Explicit_Element_Not_In_Set`. This option addresses the situation in which an explicit quoted element in an expression is not in the associated set at the time the expression is evaluated.
The options that control the handling of specific warnings in AIMMS (for example the option `Warning_Domain_Violation`), now have three new allowed values:

-  Error_in_develop_else_warning
-  Error_in_develop_else_off
-  Warning_in_develop_else_off

These values allow you to make a difference in how warnings are handled based on whether you are a developer or are using the model in deployment mode.



--------------

#############
AIMMS 4.35
#############

AIMMS 4.35.1 Release (June 7, 2017 Build 4.35.1.977)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  CPLEX 12.7.1 has been added to AIMMS.
-  The option `round coefficients` has been added for CPLEX 12.7 and higher. This option can be used to round matrix coefficients to a nearby integer value which, in rare cases, can improve the performance of CPLEX.
-  The latest version of PATH, a solver for mixed complementarity problems, has been added. PATH 4.7 is also available for 64-bit Windows and Linux.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Pinned widgets did not stay at the specified position after a page refresh.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Adding identifiers to the contents of a Table object caused a crash if the table was linked to a Floating Index object.
-  In rare cases, reading data from Excel could lead to a crash in AIMMS.
-  Writing in replace mode to SQL Server database tables in combination with foreign keys, could lead to an internal error in the database communication layer of AIMMS.
-  CPLEX no longer stops after 2^31 iterations (by default).
-  In rare cases AIMMS could crash after detecting an infeasibility during the generation of a math program.



--------------

#############
AIMMS 4.34
#############

AIMMS 4.34.9 Release (May 23, 2017 Build 4.34.9.963)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the For statement, an index was not recognized as a loop index anymore.
-  A Halt statement with a message containing a % character could lead to a crash.



--------------



AIMMS 4.34.8 Release (May 19, 2017 Build 4.34.8.960)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Clicking a checkbox in the composite table could lead to a crash when another thread was accessing AIMMS as well.



--------------



AIMMS 4.34.7 Release (May 16, 2017 Build 4.34.7.955)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The AimmsXLLibrary :any:`axll::WriteCompositeTable` procedure now has a new optional argument: WriteIndexNames. If set to 1, the index names will appear in the top-left area of the written table.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The :any:`axll::WriteCompositeTable` procedure did not handle empty identifiers correctly.
-  Indexed unit parameters without a specific Quantity set, could lead to a crash during a case load.
-  A run with CPLEX that used multiple threads and callback procedures could deadlock when AIMMS was called from an external program.



--------------



AIMMS 4.34.6 Release (May 11, 2017 Build 4.34.6.948)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Problems with the distribution functions have been addressed.
-  Some database related error messages showed the data source, which, in case of a literal connection string, could contain a password. In end user mode, the data source is now shown as "*****" in error messages.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Predeclared AIMMS identifiers are now accessible from the WebUI.
-  When setting the ``statusDescription`` output argument of the procedure specified in a Download widget to the string "OK", this raised an error message.
-  The SelectionBox widget did not always update the elements to select after a data change. This could result in an eternal "Searching..." message in the widget.



--------------



AIMMS 4.34.5 Release (May 3, 2017 Build 4.34.5.938)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The function :any:`axll::WriteCompositeTable` gave unexpected errors on identifiers that do not contain any data.



--------------



AIMMS 4.34.4 Release (May 2, 2017 Build 4.34.4.933)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A warning on a non-existing unit that is used in the WinUI could lead to unexpected errors during later execution.
-  Added support for the latest versions of Acrobat Reader.



--------------



AIMMS 4.34.3 Release (April 24, 2017 Build 4.34.3.927)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Deleting variables that were still referenced in the definition of stochastic constraints could lead to a crash during compilation.



--------------



AIMMS 4.34.2 Release (April 19, 2017 Build 4.34.2.922)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Having the word "Data" (either uppercase or lowercase) in identifier attribute forms, caused the function ReferencedIdentifiers to malfunction.
-  In some cases, the PRO logging was switched off.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When having the "IDENTIFIERS-NAME" in the Totals group of the Pivot Options Editor in the Table widget, changed values in the table were not passed to AIMMS anymore.



--------------



AIMMS 4.34.1 Release (April 7, 2017 Build 4.34.1.910)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Sometimes, evaluation errors occurred for tuples that should not be evaluated according to the given domain condition.

WebUI Improvements
++++++++++++++++++++

-  Editing values in the Table widget feels much more 'snappy' now.

Resolved WebUI Issues
+++++++++++++++++++++++

-  A string displayed in a Table widget, containing double quotes, was cut off at the position of the first quote.



--------------

#############
AIMMS 4.33
#############

AIMMS 4.33.3 Release (March 29, 2017 Build 4.33.3.898)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the Pivot Table, a subset of integers is now sorted numerically (instead of alphabetically) or the defined set order is used.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The WebUI could hang in certain situations when triggering a solve of an infeasible AIMMS model.



--------------



AIMMS 4.33.2 Release (March 23, 2017 Build 4.33.2.893)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS now gives a compilation error if the parameter that is used as the Violation Penalty of a Mathematical Program has a default value other than 0.
-  In the WinUI, when specifying a unit parameter as alternative unit of a displayed identifier, sometimes some values were not expressed in that unit.
-  When writing a multi-dimensional string value using :any:`axll::WriteTable`, the written strings were cut off unexpectedly.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Widgets which displayed dense data (e.g. the Multiselect widget) were not updated automatically anymore after making a data change in them.



--------------



AIMMS 4.33.1 Release (March 22, 2017 Build 4.33.1.887)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  CP Optimizer could consume a large amount of memory to provide progress information, which could result in a crash.
-  Handle arguments of an external procedure that were not referenced in the body call resulted in a crash.
-  A literal string passed in the body call of an external procedure was not converted with the given character encoding.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When displaying long element names in a scalar widget, the element names were not abbreviated anymore (with '...'), leading to a horizontal scroll bar in the widget. This made it harder to have a quick overview of the data displayed in the widget.
-  Sometimes, when changing data in a WebUI form, a message about Cubeview version mismatches could pop up.
-  The order of the entries on the Contents tab of widgets was not retained correctly after you changed it.
-  Calendar elements that are displayed in the WebUI use the format as specified in the model.
-  Sometimes, when changing values in the Table widget, the data in the table would scroll upwards at irregular intervals.



--------------

#############
AIMMS 4.32
#############

AIMMS 4.32.6 Release (March 20, 2017 Build 4.32.6.884)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The performance of the function :any:`GMP::Row::Generate` could be poor if many empty columns had to be removed.
-  MIP starts marked by the procedure :any:`GMP::Solution::SetMIPStartFlag` were not passed to CPLEX if a time callback procedure was installed.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Using the search box of the MultiSelect widget could stop filtering the values after 2 consecutive searches.
-  Opening a WebUI page with a hidden widget on it, and then making the widget visible, could crash the browser.



--------------



AIMMS 4.32.5 Release (March 10, 2017 Build 4.32.5.881)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When using the tunneling functionality on PRO, sometimes, during long data transfers, the connection would be lost, resulting in a non-responsive AIMMS.



--------------



AIMMS 4.32.4 Release (March 10, 2017 Build 4.32.4.880)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A definition evaluation error while writing a case file no longer makes the case file inaccessible.
-  The menu command 'View-Save Object State' now also works when the Pivot Table is displayed within a Tabbed Page object or within an Indexed Page object.
-  Passing matrix updates to CPLEX could be very slow because the updates were passed in small batches. The default batch size has been increased and can now be controlled using the new CPLEX option `Updates batch size`.
-  The AIMMS Presolver did not handle models with semi-continuous variables correctly.
-  The AIMMS Presolver was not called if the solver used multiple threads and a callback procedure was installed.
-  Non-default values of logical switch options were not passed correctly to CONOPT.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Identifiers with a parameterized unit specification could result in a crash in the WebUI.



--------------



AIMMS 4.32.3 Release (March 6, 2017 Build 4.32.3.872)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the Pivot Table, there was still an error when moving indices between outer indices, row area and/or column area, potentially leading to a crash of AIMMS.



--------------



AIMMS 4.32.2 Release (March 3, 2017 Build 4.32.2.870)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The iODBC manager under Linux is not supported (only the unixODBC manager is), yet if the iODBC manager was installed on the system, AIMMS would still try to use it and failed while connecting to the configured ODBC driver. Now, having the iODBC manager installed does not affect your AIMMS/database connectivity anymore.
-  There is now ODBC support for the Firebird database.
-  When selecting another identifier via an 'outer' drop down list in the WinUI Pivot Table, AIMMS sometimes crashed.
-  A unit in the row area of the WinUI Pivot Table was not always visible.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The button on the Upload widget didn't always change back from 'Add' to 'Start', especially when trying to upload the same file twice in a row.
-  Calendar elements that are displayed in the WebUI now use the format as specified in the model.



--------------



AIMMS 4.32.1 Release (February 27, 2017 Build 4.32.1.862)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  Logging to the CPLEX status file has been improved.

WebUI Improvements
++++++++++++++++++++

-  There is a new option for all widgets, with which you can control the sparsity domain of the identifier(s) displayed in the widgets.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The wizard for specifying the Body Call attribute of an external procedure or external function could lead to a crash.
-  The method :any:`axll::WorkBookIsOpen` did not return the correct result in Linux.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Scalar widgets could not be added to the Group widget anymore.
-  The Upload and Download widgets only allowed you to select a procedure with 0 arguments for it, whereas they actually need a procedure with 3 arguments.
-  When not in edit mode, the Text widget had spell checking enabled. In case you did not have any spelling mistakes, but were running your browser with a different language than the text in the widget, this led to a lot of incorrect red lines in the widget.
-  In the Bubble chart, when displaying axis values between -1 and 1, annotations like '900m' were used instead of the more intuitive '0.9'.
-  Images in Text widgets didn't always display when running your WebUI project under PRO.
-  When using Internet Explorer 11 as your browser, the [ENTER] key did not always submit the value in a Scalar widget.
-  When using Internet Explorer 11 as your browser, selecting a value from the dropdown list displayed in a Scalar widget did not make the dropdown list disappear again.



--------------

#############
AIMMS 4.31
#############

AIMMS 4.31.4 Release (February 22, 2017 Build 4.31.4.856)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The Option statement did not update any of the identifiers at the right-hand side before assigning the value to the option.
-  The body call wizard has an improved mechanism to retrieve the function names from a DLL. The wizard now also gives a warning when the DLL is 32 bit and AIMMS itself is 64 bit (or vice versa).

Resolved WebUI Issues
+++++++++++++++++++++++

-  Widgets which displayed dense data (e.g. the Multiselect widget) were not updated automatically anymore after making a data change in them.
-  The Upload and Download widgets didn't let you select procedures with 3 arguments anymore, while they do expect procedures with 3 arguments.



--------------



AIMMS 4.31.3 Release (February 10, 2017 Build 4.31.3.841)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  If you have many missing semicolons in your model, AIMMS can now try to insert them automatically. You get the option to do this when you do a 'go to error' on any of the warnings about missing semicolons in the error window.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The Excel function :any:`axll::WorkBookIsOpen` did not return the correct result in Linux.
-  When deleting Project User Files from a subfolder in the dialog box, the files were not really deleted after re-opening the project.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Using incorrect identifier names in the element-text-map.js file made AIMMS crash upon opening the WebUI.
-  In some situations, values were missing from the Table widget.



--------------



AIMMS 4.31.1.831 Release (The AIMMS 4.31.1.831 Release was released on February 3, 2017 Build 4.31.1.831)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The option `suppress listing file encrypted project` has been added, which can be used to enable printing of the constraint and/or solution listing in AIMMS PRO.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Pivoting the headers of a WinUI Pivot table that contained multiple identifiers could result in a crash.
-  In the WinUI Pivot Table, the unit was sometimes not visible in the column header.
-  The function :any:`FindReplaceStrings` now handles situations better, where the search string has overlapping occurrences of the string that must be replaced.
-  If you switch between apps while AIMMS is starting up, it could lead to a situation where the AIMMS window is not displayed at all. This fix tries to recognize this situation and restores the window to a normal state.
-  When opening a ``.aimmspack`` file, solver options changed in the Option Tree were not set correctly.



--------------



AIMMS 4.31.1.825 Release (The AIMMS 4.31.1.825 Release was released on January 25, 2017 Build 4.31.1.825)
---------------------------------------------------------------------------------------------------------

 

**PLEASE NOTE:** From this version onwards, it is not possible anymore to open encrypted projects or ``.aimmspack`` files using a developer license of AIMMS. The reason is that encrypted projects or ``.aimmspack`` files are aimed at model deployment, while development licenses are not for that purpose. Those projects/files can still be opened using deployment licenses.

WebUI Improvements
++++++++++++++++++++

-  Both Internet Explorer 11 and Microsoft Edge can now be used with the WebUI. Please note that we are still in the beta phase. So, if you find anything not working as expected, please let us know. Furthermore, Google Chrome remains the preferred browser for the AIMMS WebUI, as it performs better than either IE11 or Edge.
-  Bubbles with a size of 0 were not displayed in the Bubble Chart widget. Now, they are displayed as a small diagonal cross.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When horizontally scrolling in a Table Widget, after having scrolled the whole WebUI page down, the scroll bar was sometimes drawn too high.
-  The dividing lines for resizing the row header columns is now correctly not drawn in the area above the row header columns.
-  Sometimes, an empty Legend Widget was rendered incorrectly.
-  Creating a Button widget without immediately assigning a procedure to it, was not possible anymore.
-  In the Line Chart widget, horizontal and vertical gridlines were not drawn consistently on the foreground or the background of the lines.
-  When adding a new widget and closing the 'Add Widget' dialog with the enter key instead of the mouse, a dropdown was left open after closing the dialog.
-  Stability improvements in certain WebUI components.

AIMMS Improvements
++++++++++++++++++++

-  The generation of the robust counterpart has been improved further by creating less artificial variables and constraints.
-  XA 16 has been added, fixing an issue with previous XA versions on Windows 8 and 10 (64 bits).
-  Knitro 10.2 has been added.
-  CP Optimizer 12.7 has been added, offering significant performance improvements for scheduling problems. Note: CP Optimizer 12.7 is not available for 32 bits Windows.
-  Some statements in the body of a procedure are now handled by a new version of the compiler. It should not result in noticeable differences.
-  You now get a warning on missing semicolons in the body of procedures. Although not correct according to the Language Reference, AIMMS did accept a missing semicolon for the last statement in a statement list. A future version of the AIMMS compiler will be more strict on this, so please start adding the missing semicolons. Currently, this warning only appears in develop versions of AIMMS, so end-users are not experiencing this warning.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  There was a problem with how the AIMMS API handled Japanese characters in some situations.
-  In a Pivot Table with more than 2 levels in the column header, the width of the columns was not always calculated correctly.
-  Writing an identifier with a domain condition to a database didn't always go right.
-  Internal errors were displayed in the Messages Window after closing the solver configuration on the Start Page.
-  The functions :any:`GMP::Column::GetUpperBound` and :any:`GMP::Column::GetLowerBound` could return an incorrect (scaled) value for a GMP created by :any:`GMP::Instance::CreatePresolved`.
-  A fixed element as argument of an indexed set at the right-hand side of an IN condition could lead to an error.
-  The dynamic multistart algorithm did not handle an infeasible model correctly, if the infeasibility was detected by the AIMMS Presolver.
-  The progress window was not updated during a BARON solve.
-  An assignment statement no longer gives an error if the expression results in a tuple where any of the elements is not in the current declaration domain of the identifier at the left-hand side.
-  In the WinUI Pivot Table, the pivoting of indices in a table with multiple identifiers has been improved. In a previous version, after a pivot action, it could happen that in the header of the table the order of indices was not consistent.



--------------

#############
AIMMS 4.30
#############

AIMMS 4.30.5 Release (January 13, 2017 Build 4.30.5.814)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

WebUI Improvements
++++++++++++++++++++

-  The license information, when available for the license that you're using, will be displayed in the top bar of any WebUI page.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Using the Find function to search for strings in the AIMMS model, could crash AIMMS when you were using long lines of code.
-  On the AIMMS start page, you were confronted with a security dialog. This has been removed.
-  The procedure AimmsGetVersionNumber returned an incorrect minor version number.



--------------



AIMMS 4.30.4 Release (December 22, 2016 Build 4.30.4.807)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The AimmsXLLibrary was improved with respect to recognizing empty cells in a spreadsheet. This addresses the problem of an unexpected "No numerical content" error.
-  If the unit of measurement of the Gantt chart is not the same as the (time) unit of the underlying identifier, a unit conversion is applied now.
-  The command line option --export-to did not work anymore because of the locking of the ``.aimms`` file itself.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In rare cases, opening a WebUI page could crash AIMMS.



--------------



AIMMS 4.30.3 Release (December 15, 2016 Build 4.30.3.803)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In the AimmsXLLibrary, large numerical values where not retrieved correctly as a string value.
-  In the AimmsXLLibrary, the function ReadSet has been extended with an optional argument to allow you to skip empty cells in the given range.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Identifiers declared over a compound set were no longer displayed correctly in WebUI.
-  It was not possible anymore to create a button widget without having specified a procedure in the 'Add Widget' dialog already.



--------------



AIMMS 4.30.2 Release (December 14, 2016 Build 4.30.2.801)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The performance of the postsolve step for an LP problem, as controlled by the option `Postsolve continuous variables`, has been improved.
-  A fixed element as argument of an indexed set at the right-hand side of an IN condition could lead to an error.



--------------



AIMMS 4.30.1 Release (December 9, 2016 Build 4.30.1.798)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

AIMMS Improvements
++++++++++++++++++++

-  CPLEX 12.7 has been added, offering significant performance improvements. CPLEX 12.7 features a Benders decomposition algorithm. It also offers modeling assistance in the form of warnings regarding performance degradation or numerical stability. Note: CPLEX 12.7 is not available for 32 bits Windows.

WebUI Improvements
++++++++++++++++++++

-  You are now free to choose any name that you like upon creating a new widget, in any character set. In addition, the WebUI will automatically generate a unique name, should you enter a duplicate name.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The multistart algorithm now checks whether the model type of the math program is correct.
-  The progress window was not updated during a BARON solve.



--------------

#############
AIMMS 4.29
#############

AIMMS 4.29.2 Release (December 2, 2016 Build 4.29.2.790)
---------------------------------------------------------------------------------------------------------



**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A switch statement inside a for loop did not work anymore.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Since AIMMS 4.25, the 'Connecting...' message upon opening your WebUI showed a lot longer than before. This has been addressed.



--------------



AIMMS 4.29.1 Release (November 30, 2016 Build 4.29.1.787)
---------------------------------------------------------------------------------------------------------

 

**IMPORTANT: If you are going to use this AIMMS version with PRO on a Linux server, you will need to make sure that you are using PRO version 2.13 or higher.**

AIMMS Improvements
++++++++++++++++++++

-  The (branching) priorities of variables have been changed: the highest priority value will be considered first now (previously the smallest nonzero priority value was considered first). If you were using priorities in your project then you will have to adjust your project. The following solvers can use (branching) priorities: BARON, CPLEX, CP Optimizer, Gurobi, Knitro and XA.

WebUI Improvements
++++++++++++++++++++

-  In the Table Widget, it is now possible to drag the column headers and the row area headers in order to change their width.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Introduced a new execution error message for the situation that a set that is passed implicitly to a procedure is changed inside that procedure.
-  The Gantt Chart could crash if the 'upon change' procedure made changes to the number of bars in the chart.
-  'DetermineProblemStructureCausingInfeasibility' and 'DetermineProblemStructureCausingUnboundedness' have been disabled in the Math Program Inspector for MINLP problems.



--------------

#############
AIMMS 4.28
#############

AIMMS 4.28.3 Release (November 22, 2016 Build 4.28.3.778)
---------------------------------------------------------------------------------------------------------



Resolved WebUI Issues
+++++++++++++++++++++++

-  Models with a large number of identifiers gave incorrect errors when using the WebUI.



--------------



AIMMS 4.28.2 Release (November 16, 2016 Build 4.28.2.772)
---------------------------------------------------------------------------------------------------------



Resolved WebUI Issues
+++++++++++++++++++++++

-  Annotations in combination with the Gantt Chart widget did not work.
-  The Gantt Chart widget now has its own options editor, where you can set specific Gantt Chart options.
-  When using links in the Text widget, the link was sometimes replaced by a default (wrong) one.
-  The Label widget type has been removed from the 'Change Type' options editor, as this does not really made sense.
-  The height of the scrollable area of a Scalar widget was sometimes calculated incorrectly.



--------------



AIMMS 4.28.1 Release (November 11, 2016 Build 4.28.1.770)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  Editing of data in the Table widget is now faster.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Binary variables are now displayed as checkboxes in the Table widget.
-  Totals over a binary parameter were displayed as a checkbox instead of a number in the Table widget.
-  The Table widget sometimes displayed 'half overlapping' rows, especially when using the zoom functionality of your browser.

AIMMS Improvements
++++++++++++++++++++

-  We have made improvements in some advanced methods for nonlinear programs, namely the multistart algorithm and the AIMMS Presolver.
-  The options 'OBBT' and 'Scale Model' have been added for the AIMMS Presolver. The first option can be used to activate optimization-based bound tightening while the second option controls automatic scaling of a model.
-  Two new functions have been added: PrinterSetupDialog and PrinterGetCurrentName.
-  Gurobi 7.0 has been added. Gurobi 7.0 comes with significant performance improvements across MIP, LP, SOCP, MIQP and MIQCP problem types. Gurobi 7.0 supports indicator constraints and a solution pool for MIP problems. Please note that the interface dll for Gurobi 7.0 is named ``libgrb70.dll`` (previous versions used ``libgurobiXX.dll``).
-  Knitro 10.1 has been upgraded to version 10.1.2.
-  Several new optional arguments have been added to the procedure :any:`GMP::Instance::FindApproximatelyFeasibleSolution` including an argument for specifying a time limit. The performance of this procedure has been improved drastically.
-  A new argument has been added to the procedure :any:`GMP::Solution::Check` to retrieve the maximum infeasibility. If you were using this procedure in your project then you need to modify your project by adding this argument.
-  A new optional argument has been added to the function :any:`GMP::Solution::GetPenalizedObjective` which can be used to skip the objective.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The AIMMSXLLibrary could sometimes crash if both a warning and an error were generated.
-  Errors from external procedures that are caught by an OnError block are no longer printed to the Message window (and thus do not appear in the WebUI either).
-  The log file 'EndUserConversion_Log.txt" is now created in the log folder of the project, and automatically deleted if there are no errors.
-  ProfilerRestart caused a crash when the profiler was already active.
-  AIMMS could crash after running out of memory while passing a math program to a solver.
-  AIMMS no longer rounds the level value of a variable to 0 if that would result in a violation of a variable bound. Rounding of level values close to 0 is controlled by the option `Solution Tolerance`.



--------------

#############
AIMMS 4.27
#############

AIMMS 4.27.5 Release (November 1, 2016 Build 4.27.5.756)
---------------------------------------------------------------------------------------------------------



Resolved AIMMS Issues
+++++++++++++++++++++++

-  Renaming a page could lead to a 'page not found' error, for example when reading the menu  Builder data.
-  Displaying stretched .PNG images could result in repeating images along the right and bottom edges.
-  The function :any:`GMP::SolverSession::Execute` no longer generates an error if an external function is used in a constraint.
-  System procedures like PostMainInitialization, PreMainTermination, etc., no longer have attributes for Arguments and Properties.
-  More improvements in authenticating proxies in combination with PRO.



--------------



AIMMS 4.27.4 Release (October 27, 2016 Build 4.27.4.749)
---------------------------------------------------------------------------------------------------------



Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS now works better with authenticating proxies in combination with PRO.



--------------



AIMMS 4.27.3 Release (October 24, 2016 Build 4.27.3.744)
---------------------------------------------------------------------------------------------------------



Resolved WebUI Issues
+++++++++++++++++++++++

-  The sorting order in Multiselect widgets was not always as expected. Now it correctly follows the sorting in the AIMMS model again.
-  The widget server failed to start for users who had a space in their Windows login name.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When emptying the text in the Complement attribute of a complementarity variable, the attribute could disappear.
-  A call to the PageGetActive function from within a scheduled procedure now works correctly.
-  In the AIMMSXLLibrary, the function ``fillList`` now recognizes a request to write the header and the data values horizontally, based upon the width and height of the data range.
-  In the AIMMSXLLibrary, the function ``fillList`` now recognizes a request to write the header and the data values horizontally, based upon the width and height of the data range.
-  A memory leak occurred when evaluating a function with a specified index domain.



--------------



AIMMS 4.27.2 Release (October 19, 2016 Build 4.27.2.734)
---------------------------------------------------------------------------------------------------------



Resolved WebUI Issues
+++++++++++++++++++++++

-  The search field of a Multiselect widget would sometimes show the wrong selection after repeating a search.
-  The threshold values in the Table widget were not updated immediately anymore after changing cell values.
-  The ElementTextMap functionality in your custom .js files didn't work properly anymore.
-  When creating a Button widget, you would get an incorrect 'awf.persistence' message.
-  Binary variables were not displayed as a checkbox value in cells of the Table widget.



--------------



AIMMS 4.27.1 Release (October 14, 2016 Build 4.27.1.726)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  WebUI pages will load faster on average, when switching pages in your application.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The Execute statements now correctly accepts arguments that contain quotes again.



--------------

#############
AIMMS 4.26
#############

AIMMS 4.26.1 Release (October 7, 2016 Build 4.26.1.716)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  The Bubble Chart widget now also offers reverse link functionality. You can specify element parameters which should be filled based upon the currently selected bubble in the chart.
-  The Bubble Chart widget now has a separate options editor to specify its contents in. Previously, you had to make sure you specified the 3 needed identifiers in a specific order on the Contents tab.

AIMMS Improvements
++++++++++++++++++++

-  The AimmsXLLibrary has been updated to include table write functionality and a number of methods to create and manage new workbooks and sheets.
-  The implementation of the profiler measurements has changed internally. Calculation of gross versus net time of statements and procedures is now more consistent. Calls to intrinsic procedures or functions now also show a difference in gross time versus net time.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS could crash if CONOPT generated an error message indicating that a Jacobian element was too large.
-  Creating run time libraries and deleting run time libraries while in between making model edits, could easily result in a fatal application error.



--------------

#############
AIMMS 4.25
#############

AIMMS 4.25.1 Release (September 30, 2016 Build 4.25.1.703)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  The WebUI has been extended with the Bubble Chart widget type, allowing you to display up to 3 aspects of your data in a single chart.
-  You can now override the default tooltips in the WebUI.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, WebUI pages showed a lot of empty space below the last widget (on the bottom of the page).

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The Forecasting library did not work on the Linux PRO platform.
-  In the multiple case view of the Pivot Table object, an identifier for which the unit is specified through a unit parameter, the data is now displayed according to the values of the unit parameters that are stored in the case.



--------------

#############
AIMMS 4.24
#############

AIMMS 4.24.3 Release (September 14, 2016 Build 4.24.3.675)
---------------------------------------------------------------------------------------------------------



WebUI Improvements
++++++++++++++++++++

-  The layout of some WebUI pages was not correct anymore in AIMMS 4.24.2.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Numerical range violations during a read from file statement are now checked and handled according to the option `warning_range_violation`.



--------------



AIMMS 4.24.2 Release (September 1, 2016 Build 4.24.2.659)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  The Selectionbox widget can now also be dragged to a custom position. In order to allow this, a small drag area has been added to the right of the widget. This area becomes visible when hovering over the widget.
-  The Gantt Chart now supports reverse links (using the Store Focus tab in its options editor) and has new options to specify the visible viewport, allowing to implement scrolling/zooming in your model. For details, see the `Gantt Chart documentation <http://manual.aimms.com/webui/gantt-chart-widget.html>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS did not start up if an expected version of the .NET framework was not installed on the computer. This dependency has been removed. It appears that mostly people using Windows 7 could run into this problem.



--------------



AIMMS 4.24.1 Release (August 19, 2016 Build 4.24.1.641)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  The New Table widget is now the default (and only) Table widget. It provides improved speed and stability over the original one.
-  The (New) Table widget can now also be used in case comparison mode.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS could hang during an LP solve with CPLEX if the barrier algorithm was used with multiple threads.
-  The generation of the robust counterpart is now done more efficiently by creating less artificial variables and constraints.



--------------

#############
AIMMS 4.23
#############

AIMMS 4.23.2 Release (August 11, 2016 Build 4.23.2.630)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When closing a docked page and re-opening it using a button action on the page itself, the page did not re-open in docked mode.
-  WebUI applications could not work with the AIMMS Linux Version 4.23.1.618-linux64-x64.



--------------



AIMMS 4.23.1 Release (August 5, 2016 Build 4.23.1.618)
---------------------------------------------------------------------------------------------------------



WebUI Improvements
++++++++++++++++++++

-  Users will be notified more promptly on connection loss and this will prevent users from losing data changes made while not being connected.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Fixed an issue where highlighting via tab of element parameters not visible in scalar object.



--------------

#############
AIMMS 4.22
#############

AIMMS 4.22.1 Release (July 28, 2016 Build 4.22.1.602)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  CPLEX was not set as the default solver when the solver configuration file was automatically created on Linux.
-  In the model tree, doing a Copy command followed by multiple Paste commands, could lead to a crash.
-  You now get a message when you have too many attribute windows open (more than 100).
-  The Body Call wizard of an external procedure crashed when the attribute was still empty.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Resolved a crash when requesting to run a procedure (from within WebUI) that is not present in the corresponding AIMMS model.

WebUI Improvements
++++++++++++++++++++

-  There is a new "UI Editable" option in the application settings of the WebUI. With this option, you can lock the UI for certain users in a very flexible way. When you are currently using the old-style locking mechanism, you will have to convert your model as the old one does not work anymore in AIMMS 4.22 and onwards. You can find more information on the "UI Editable" option in the `WebUI Documentation <https://documentation.aimms.com/webui/app-misc-settings.html#ui-editable>`__ on our website.



--------------

#############
AIMMS 4.21
#############

AIMMS 4.21.5 Release (July 14, 2016 Build 4.21.5.583)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The Help menu in AIMMS has been extended with a WebUI Manuals section, which contains links to our on-line WebUI documentation.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Clicking in the WinUI Pivot Table could lead to a situation that requests from AimmsPRO or the WebUI were no longer handled properly.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Sometimes, the text in the tooltips in, for example, the Line Chart widget, were rendered slightly vague.
-  Sometimes, filters were applied to the wrong widget(s).



--------------



AIMMS 4.21.4 Release (July 11, 2016 Build 4.21.4.576)
---------------------------------------------------------------------------------------------------------

 

Resolved WebUI Issues
+++++++++++++++++++++++

-  Not all items in a Multiselect widget were displayed, because of a problem with the vertical scroll bar there.
-  When placing a Legend widget in a group, the Legend widget would be rendered slightly out of the bounds of the group.



--------------



AIMMS 4.21.3 Release (July 8, 2016 Build 4.21.3.570)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The spreadsheet functions RetrieveTable, RetrieveParameter and RetrieveValue now have a special argument that controls whether a non-integral value in the spreadsheet is automatically rounded if the parameter has an integer range. If the value is outside the lower and/or upper bound of the parameter, an error is generated.
-  The [ + ] and [ x ] buttons in the selection object now also listen to the readonly status of the object.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Identifiers from a library could not be used in a WebUI form.
-  The sorting indicator in the Table widget did not display anymore if a row or column was sorted.
-  Gantt Charts containing valid data sometimes displayed as an empty chart when first opening a WebUI page.
-  When adding an Image widget to a Group widget, the image would not display.



--------------



AIMMS 4.21.2 Release (July 6, 2016 Build 4.21.2.564)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The Pivot Table did not order elements of a subset of a Calendar correctly when new elements were added to the subset.
-  A Pivot Table could end up in an endless loop while trying to restore the last scroll position.
-  A circular dependency via the range of a defined parameter was not detected and resulted in a fatal application error.
-  CPLEX was not set as the default solver when the solver configuration file was automatically created on Linux.
-  When using a 'checking' clause in a database read statement, the sets could become mixed up leading to a fatal application error.
-  If the column width of a specific index in the Pivot Table was fixed, it was also not possible to resize a corresponding aggregator column.
-  There was a problem with a non-responsive WinUI when the WebUI was open.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When using very small numbers as Y-values in a Bar Chart widget, the available space in the chart was not used in an effective manner.
-  In some charts, the coloring didn't work correctly anymore.
-  The filter functionality of the Table widget didn't work reliably anymore.



--------------



AIMMS 4.21.1 Release (June 22, 2016 Build 4.21.1.547)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  A new version of Knitro is available: Knitro 10.1.
-  The new function :any:`GMP::Row::SetPoolType` can be used to specify that a row should be added to a pool of lazy constraints or a pool of (user) cuts.

WebUI Improvements
++++++++++++++++++++

-  There is a New Table widget in the WebUI. This is a currently still read-only version of the Table widget, with much improved performance when displaying huge data sets. It supports smooth scrolling and sorting. If you only want to display your data (i.e. don't want users to edit the data), you can simply switch to the New Table widget type from any already existing Table widget (just do a type switch through the options editor).
-  The Gantt Chart widget now offers support for vertical dragging and dropping of bars. It also includes functionality that supports a 'time window' on a Gantt Chart, making it easy to focus on the part of the Gantt Chart data that you are interested in.
-  Scalar element parameters can now be used in Selectionbox and Multiselect Widgets. However, please note that these widgets with an element parameter as content, cannot (yet) be used a a filter for other widgets.
-  Model annotations and flags: We have introduced a breaking change in this version to avoid future problems, and to standardize existing usage. This change might require developers to update custom CSS or JavaScript included in their projects. Annotations and flags appearing anywhere in the HTML of plugins, for example classes like `Mod7Ord1` and `readOnly`, are now prefixed with e.g. `annotation-` or `flag-`, and are differently (and more consistently) escaped. For more information, please see the manual section on `data dependent styling <https://documentation.aimms.com/webui/css-styling.html>`__.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The best bound used by AIMMS was not correct before Gurobi found the first integer solution (if Gurobi was used to solve a MIP problem).
-  The callback procedure for new incumbents did not catch all incumbent solutions if CPLEX used 'branch-and-cut' as the MIP search strategy.



--------------

#############
AIMMS 4.20
#############

AIMMS 4.20.7 Release (June 17, 2016 Build 4.20.7.539)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS could stop the execution after generating a warning during (the generation phase of) a solve.
-  The function ArgMin did not give the correct result when all values were +INF (and similar for ArgMax when all values are -INF).
-  When copying an identifier in the model tree an error could occur.
-  The database mapping wizard could crash when the attribute was still empty.
-  Removing the arguments from a procedure in the model explorer, resulted in a crash.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When having Map widgets on multiple pages, only the widget on the first page displayed the shadow lines and the arrowheads correctly.



--------------



AIMMS 4.20.6 Release (June 8, 2016 Build 4.20.6.525)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  When editing values in an ordered column of a Pivot Table, the Pivot Table sometimes unnecessarily scrolled a number of lines.
-  In some circumstances, editing data in the Pivot Table would crash AIMMS.
-  When using the 'row indentation' mode of the Pivot Table, sometimes it didn't restore its scroll position correctly.

Resolved WebUI Issues
+++++++++++++++++++++++

-  When downloading 500.000 cells or more data into a .csv file from the Table widget, the resulting .csv file could contain a lot of "Undefined" values.
-  When downloading 500.000 cells or more data into a .csv file, there are now more rows with useful data in the resulting .csv file.
-  The Download widget didn't accept file names with spaces in it.
-  When displaying strings containing backslashes in the WebUI, they were not displayed properly.

**PLEASE NOTE:** In this AIMMS version, the internal format of the file ``hermes-log.json`` (in the `config` subfolder in your model folder of the AIMMS model) has changed. This has the effect that AIMMS generates strange 'one-letter files' in the WebUI folder. The remedy to this problem is:

-  Exit AIMMS.
-  Delete the one-letter files.
-  Delete the mentioned ``hermes-log.json`` file too.

Upon re-opening the AIMMS model and starting the WebUI, the (updated!) ``hermes-log.json`` will be re-generated. So, this is a one time action. The one-letter files will not return anymore.

Should you open your AIMMS 4.20.6 model in an older version of AIMMS, you may find that you get a timeout message when trying to startup the WebUI. In this case you should also delete the ``hermes-log.json`` file.



--------------



AIMMS 4.20.5 Release (June 7, 2016 Build 4.20.5.515)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The progress information could be incorrect at the root node of the branch-and-cut tree if CPLEX used the (default) MIP search strategy 'dynamic search'.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Adding a new widget to a Group did not work anymore.
-  Switching from one type of Widget to another could sometimes lead to no data being displayed anymore.
-  The shadow lines of the arcs in the Map widget were not blurred anymore. This led to the widget becoming cluttered quite quickly.



--------------



AIMMS 4.20.4 Release (June 1, 2016 Build 4.20.4.504)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Sometimes AIMMS crashed while exiting, because there was a flaw in how the data structures were destructed.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The position of the labels in a Map widget with bidirectional arcs has been adjusted, such that the labels don't overlap anymore (which led to unreadable values).
-  The zoom level and the center position of the Map widget were not saved anymore.



--------------



AIMMS 4.20.3 Release (May 27, 2016 Build 4.20.3.497)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  After a modification of any of the Assertion attributes, the assertion did not work correctly anymore.
-  The composite table did not update correctly if the background color was changed through a color parameter.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The Map widget didn't display anything anymore.
-  After making an invisible Table widget visible again, it was rendered without any data showing.



--------------



AIMMS 4.20.2 Release (May 23, 2016 Build 4.20.2.490)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Writing an indexed set via the AIMMS API methods (which are also used by the XML reader) did not create the data in the proper internal format.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Scrolling to the top of a table widget on a scrolled down page sometimes resulted in an empty table.
-  If you added a new widget to a page which had been renamed in the past, it was not saved properly.
-  The ``webui::GetIOFilePath`` function has been adapted to work under Linux as well.



--------------



AIMMS 4.20.1 Release (May 19, 2016 Build 4.20.1.483)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The most common AIMMS Excel functions have been rewritten such that they can run on any environment, including environments where Excel is not installed (such as WebUI projects on an AIMMS PRO Server and Linux). In order to use them, please add the system library 'AIMMSXLLibrary' to your model. The functions are documented in the library itself.
-  In an Attribute window you can now use the shortcuts 'Ctrl + K' to comment a block, and 'Ctrl + U' to uncomment a block.
-  The dialog boxes for loading and saving cases are widened such that larger file names become more readable.
-  Gurobi 6.5 has been upgraded to version 6.5.1.
-  AIMMS uses a new parser to pass constraint definitions to BARON. It is no longer needed to split up large nonlinear constraints into several smaller constraints. BARON can now also handle the Abs() function.
-  If an XML file assigns an empty set element to a binds-to attribute, AIMMS will now generate a warning upon reading this file. This warning can be switched off by disabling the new option `xml warning empty element`.
-  The parameter ElapsedTime inside the GMPOuterApproximation module can now be used to retrieve the run time of the outer approximation algorithm.
-  The time callback procedure is now also supported by CONOPT, Knitro, SNOPT, IPOPT and CP Optimizer.

WebUI Improvements
++++++++++++++++++++

-  The Gantt Chart widget has been improved considerably.
-  Starting your WebUI development project is now much easier: just select 'Start WebUI' from the Tools menu as always. Now Chrome automatically starts with your WebUI opened.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS now makes sure that windows get refreshed when data is updated via another thread.
-  ExcelRetrieveTable did not correctly convert dates for element parameters into a calendar set.
-  AIMMS now produces an error if a procedure inside a runtime library tries to load a case that contains the runtime library itself.
-  In the ActiveX 2D chart the chart was not always correctly drawn when the cardinality of the domain set was reduced.
-  When searching for text in the model, any attribute window that was already open will not be automatically closed afterwards anymore.
-  In rare situations, the AIMMS Presolver could crash when printing an infeasibility analysis.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The search field in the multiselect widget was always visible. Now it's only visible if 7 or more items are present.
-  Translation files for the WebUI were not always taken into account anymore.
-  Images in the WebUI could overlap other widgets.
-  Scrolling in WebUI table sometimes led to a spinner being displayed infinitely.



--------------

#############
AIMMS 4.19
#############

AIMMS 4.19.4 Release (April 28, 2016 Build 4.19.4.452)
---------------------------------------------------------------------------------------------------------

 

**Resolved AIMMS Issue**

-  Using a reverse link in a Pivot Table object could sometimes lead to a crash of AIMMS.

AIMMS 4.19.3 Release (April 25, 2016 Build 4.19.3.447)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A call to the intrinsic procedure "TestDataSource" was not allowed inside indexed expressions.
-  In rare cases the memory could become corrupt if a GMP was resolved, which could result in a crash.
-  The Date Time Picker object could generate an irrelevant error about the specified time not having the correct time format.
-  Deleting a stochastic constraint in the model editor could lead to an internal error.
-  In rare situations, the AIMMS Presolver could crash when printing an infeasibility analysis.

AIMMS 4.19.2 Release (April 11, 2016 Build 4.19.2.428)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

When scrolling an indexed page with the mouse wheel, the object could not keep up with the speed of scrolling, which could result in a crash.
Inside a definition, the optional argument 'create' of the functions StringToElement and ElementCast cannot have a value other than 0, unless the specified set in the first argument is the same set for which this definition is given.
AIMMS could return an incorrect program and solver status if a time callback was installed.
Some profiler issues have been addressed:

-  If-then-else statements: the net time included the time spent on the execution of the contained statements. This resulted in the net time of the if-then-else statement being equal to the gross time.
-  Statements with a procedure or function call: the execution time of the procedure or function was subtracted twice from the gross time. This could result in a net time smaller than zero for the statement.
-  Generation statements: the generation of variables was included in the net time of the calling statement.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Tooltips in row or column headers were not always shown anymore.
-  The table widget didn't always display data if you used zooming in your web browser.
-  Editing data in a sorted row or column of a table widget could result in the wrong underlying data being changed. In order to prevent this, editing cells in sorted rows or columns is not allowed anymore. Meanwhile, we're working towards a proper solution to this problem.
-  When selecting a value outside of the first 100 search results in a selectionbox widget and refreshing the page, the selection was not retained.
-  Editing a value in your WebUI page and, without pressing enter or clicking elsewhere first, but instead immediately clicking on a button widget, caused the edited value not to be communicated to the underlying AIMMS model in time.
-  Readonly data in a multiselect widget were shown as being modifiable.
-  The table widget didn't always fully adhere to the order of the identifiers as specified on the contents tab in the options editor.

 



--------------



AIMMS 4.19.1 Release (March 30, 2016 Build 4.19.1.410)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  In Gantt charts where overlapping bars are shown using an offset, the sizes were not correctly calculated in a print report.
-  Scalar objects with no content behaved incorrectly on a print page.
-  It is no longer possible to have the same AIMMS project open for editing more than once.

WebUI Improvements
++++++++++++++++++++

-  A download widget has been added to the WebUI. With this widget, you can download any file created by your AIMMS model to your client machine running a WebUI.
-  The WebUI manual has been re-structured and improved.

Resolved WebUI Issues
+++++++++++++++++++++++

-  After changing something in the table widget, the widget position always moved back to the top again. This made it hard to select/unselect the next item, because you needed to scroll down again.
-  The icons in the menu editor of the WebUI were hidden sometimes.
-  Displaying long strings in the multi-select widget could cause misrenderings.



--------------

#############
AIMMS 4.18
#############

AIMMS 4.18.2 Release (March 21, 2016 Build 4.18.2.398)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  AIMMS could sometimes freeze when loading a huge data case.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The search box in the dropdown boxes of WebUI widgets didn't allow for a literal `0` to be entered.
-  When scrolled down on a WebUI page and deleting a widget from a group, the mouse icon and the widget to delete were not in the same position, making it hard to delete the widget.



--------------



AIMMS 4.18.1 Release (March 15, 2016 Build 4.18.1.393)
---------------------------------------------------------------------------------------------------------

 

WebUI Improvements
++++++++++++++++++++

-  The Dropdown Box in the Scalar and Table widgets have been enhanced with Search Functionality.

**ResolvedWebUI Issues**

-  In extreme cases (i.e. HUGE data), the download functionality in the Table widget didn't download all the available data.
-  The performance of the Multiselect widget in combination with large data sets has been further improved.
-  The tooltips in a Bar Chart widget were not visible anymore.
-  Indexed element parameters with as range a set with a large number of elements was not modifiable in a Table widget.
-  Sometimes, selecting a specific element parameter in the WebUI didn't work correctly (i.e. nothing was selected).



--------------

#############
AIMMS 4.17
#############

AIMMS 4.17.1 Release (March 3, 2016 Build 4.17.1.374)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  If the objective contains a nonzero constant (a.k.a. offset) then it will now be passed directly to CPLEX 12.6.2 (and higher) and Gurobi 6.5. As a result, these solvers will take the objective constant into account for calculating the MIP gap, which has an effect if the option `MIP Relative Optimality Tolerance` is set.
-  The option `clone log files` has been added for CPLEX 12.6.2 and higher. This option can be used to print more logging information during a parallel or concurrent solve.

Resolved AIMMS Issues
+++++++++++++++++++++++

The Gantt chart could be scrolled much too far down.
In the 32-bit version, the identifier selection dialog sometimes crashed when making selections in the tree part of the dialog box.
Reading an XML file containing an element parameter with range Integers could be very slow.
Three possible reasons for a superfluous \**** infeasibility warning in the constraint listings of CP models have been removed:

-  .begin, .end columns corresponding to non-present activities.
-  zero length activities might be erroneously marked as successor in sequential resources, thus causing superfluous infeasibility mark.
-  ``cp::alternative``, might be marked infeasible.

Setting the environment variable AIMMSUSERDLL didn't have the expected effect of influencing the DLL search path.
Opening a large listing file in AIMMS could take a long time and consume a lot of memory.
WebUI Improvements
++++++++++++++++++++

-  The performance of the selection widgets has been improved to handle bigger identifiers better.
-  The selection widgets now offer a search box to quickly find the element(s) you want.




--------------

#############
AIMMS 4.16
#############

AIMMS 4.16.2 Release (February 25, 2016 Build 4.16.2.358)
---------------------------------------------------------------------------------------------------------

 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Calling SetLocale from FFRead.dll could result in a crash.
-  Files larger than about 8 Mb are no longer opened using the Syntax Highlighting editor, which was too slow and had too big a memory footprint. AIMMS now automatically switches to a more basic internal editor.
-  If the same warning was generated over and over again, it did end up in a long list of warnings which could have a negative effect on the performance.
-  We added an error message for StringToElement trying to add an element to a read-only local set.
-  The [+] button in the selection object did not work correctly; it unexpectedly removed other elements from the set.
-  Aggregators for dense indices, and grand totals were not always calculated in the Pivot Table.
-  Ordered sets were incorrectly added to the predeclared set AllDefinedSets.



--------------



AIMMS 4.16.1 Release (February 17, 2016 Build 4.16.1.345)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The GMP Outer Approximation algorithm can now be combined with the multistart algorithm by simply switching on the new control parameter UseMultistart and adding the system module Multi Start. For non-convex MINLP problems, the Outer Approximation algorithm might find better solutions when combined with multistart.
-  It is now possible to specify a time limit for the multistart algorithm.

Resolved AIMMS Issues
+++++++++++++++++++++++

-  The `Used Identifers` dialog box on a page sometimes showed `random` identifier names.
-  For an identifier with a unit via an indexed unit parameter and INF as the default value, the Pivot Table option `Show default values` did not work correctly.
-  In the AIMMS Forecasting system library, there was a problem in the :any:`forecasting::WeightedMovingAverage` function. The matching between weights and coefficients is now in forward mode, instead of backward. In addition, the forecasting component uses more advanced exception handling now.

WebUI Improvements
++++++++++++++++++++

-  The WebUI has been extended with an Upload widget, which allows you to send a local file to your AIMMS model through the WebUI and automatically call a procedure in AIMMS to process the file.
-  On a touch device, you can now toggle between touch input and mouse input, with a newly added button.

Resolved WebUI Issues
+++++++++++++++++++++++

-  Various performance improvements have been made.



--------------

#############
AIMMS 4.15
#############

AIMMS 4.15.1.337 Release (The AIMMS 4.15.1.337 Release was released on February 9, 2016 Build 4.15.1.337)
---------------------------------------------------------------------------------------------------------

 

**Resolved AIMMS Issue**

-  Search was slow because of too frequent attempts to read the (non-existing) annotation setup files.

**Resolved WebUI Issue**

-  In the original 4.15.1 release, your WebUI would scroll all the way to the bottom of your browser, forcing you to use the scroll bar to get access to it.


   background:white">

--------------



AIMMS 4.15.1.321 Release (The AIMMS 4.15.1.321 Release was released on February 4, 2016 Build 4.15.1.321)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  A new callback procedure has been added which can be called by a solver with a specified time interval (in elapsed seconds). This callback procedure can be installed using either the mathematical programming suffix ``.CallbackTime`` or the procedure :any:`GMP::Instance::SetCallbackTime`. This callback procedure is supported by all linear solvers (CPLEX, Gurobi, CBC and XA).
-  Two new functions have been added to AIMMS: LoadDatabaseStructure and SaveDatabaseStructure. They can be used to Load/Save all currently available table structure information for the currently open database connections to a file. Using these functions, you can speed up the initialization process when accessing database tables for the first time during an AIMMS session.

WebUI Improvements
++++++++++++++++++++

-  It is now possible to hide specific widgets for specific users in your WebUI.
-  The table widget now offers basic sorting in a column or a row.
-  In the miscellaneous tab of the widgets, it is now possible to not only pick literal values, but also to specify AIMMS identifiers. This will lead the current value of the AIMMS identifier define the option value. Furthermore, a search functionality is provided in this options editor.
-  The selection widgets (Legend, Multiselect and Selectionbox) no longer have the Filter settings in the Option Editor available, since this is not supported (yet) for these widgets and using it could lead to unexpected behavior. 



--------------

#############
AIMMS 4.14
#############

AIMMS 4.14.2.311 Release
----------------------------------

The AIMMS 4.14.2.311 Release was released on February 3, 2016.

**Resolved AIMMS Issue**

-  Because of a change in signing policy at Microsoft, downloading AIMMS using Internet Explorer led to a message stating that the file was not safe. We updated our signing to adhere to the new standard in order to resolve this.


   background:white">

--------------



AIMMS 4.14.2.310 Release
----------------------------------

The AIMMS 4.14.2.310 Release was released on January 28, 2016. 

Resolved AIMMS Issues
+++++++++++++++++++++++

-  Slider object got background color from outer page instead of the containing indexed page, or tabbed page.
-  The property `Store Position in` of a resize line was not correctly restored in combination with a template page.
-  The scroll bar behavior of the Gantt chart object has been simplified when rows do not all have the same height.
-  A value assigned to an option in the solve statement was incorrectly handled if an expression was used.

Resolved WebUI Issues
+++++++++++++++++++++++

-  The CPU load of displaying certain WebUI pages could be quite high. Especially on lower-end machines, this could lead to (sometimes complete) unresponsiveness of the browser.



--------------



AIMMS 4.14.1 Release (January 25, 2016 Build 4.14.1.302)
---------------------------------------------------------------------------------------------------------

 

AIMMS Improvements
++++++++++++++++++++

-  The main model now has the procedures MainInitialization, PostMainInitialization, PreMainTermination and MainTermination, and each library has the procedures LibraryInitialization, PostLibraryInitialization, PreLibraryTermination, LibraryTermination to give you more fine-grained control over initialization/termination sequences in your model.
-  The default values of the CPLEX options `Parallel mode` and `Global thread limit` have been changed for CPLEX 12.6 and higher. By default, CPLEX will now use the deterministic mode and all available threads for solving MIP problems, and LP problems if the barrier algorithm is used.
-  A new version of CPLEX is available: CPLEX 12.6.3.
-  A new version of CP Optimizer is available: CP Optimizer 12.6.3.
-  Knitro 10.0 was upgraded to version 10.0.1.
-  The function WeightedMovingAverage was added to the AIMMSForecasting system library. More information can be found in the Function Reference.

WebUI Improvements
++++++++++++++++++++

-  If you create a new button widget, the name that you provide for the widget will be put on the button by default. Previously, this was the name of the AIMMS procedure, which usually is less human-readable.
-  The widget formerly known as `Textwidget` is now called `Text`, which is more consistent with the naming of the other widgets. As a consequence, you cannot run WebUI apps developed with AIMMS 4.14 or higher using AIMMS versions 4.13 or lower.
-  In the multiselect widget, you can now use shift-click to select/unselect multiple items at once.
-  Any PRO user that is a member of the group `WebUI_Cannot_Change_UI` will be prevented from changing widget options (see documentation).

Resolved AIMMS Issues
+++++++++++++++++++++++

-  A database table mapping with library prefixes could not be parsed by the database table wizard, leading to nothing being displayed in this wizard when opening it.
-  The option Ignored Aggregators of a Pivot Table identifier did not work correctly when values of multiple identifiers were aggregated of which some had the ignore option set.
-  Pages with non-ASCII characters in their name could not be opened from an exported ``.aimmspack`` file.
-  When a Pivot Table displays calendar values, the alphabetical sort is no longer used. Instead, the date/time value is taken into account, as you would expect.
-  Values in a page object were not always updated when the parameterized unit of an identifier was changed.
-  In rare cases, AIMMS could generate very large negative coefficients or constants for a math program that used a parameter to which the special value of `zero` was assigned.

Resolved WebUI Issues
+++++++++++++++++++++++

-  In the linechart widget of the WebUI, the maximum value of the Y-value displayed was never lower than 10, possibly leading to lots of whitespace at the top of such a chart when only very small values were involved.
-  The colors in the Legend widget did not always correspond well to the colors in the Line chart and Bar chart widgets.
-  Parameters present in AllPublicIdentifiers were not visible in the Scalar widget, when some of the parameters in the widget were not present in that set.
-  Some drag-and-drop problems in the contents editor of a widget have been addressed.
-  In some situations, widgets would not display any model data. We improved on this.
-  When using a selectionbox widget to filter some other widget, selected items were added instead of replaced (resulting in the filtered widget showing the data for multiple items).
-  Selection widgets displayed an incorrect error message when AllPublicIdentifiers had more than 1000 elements.
-  Until now, tables displayed a maximum of 10.000 rows. This limit has been increased to 50.0000.



--------------

#############
AIMMS 4.13
#############

AIMMS 4.13.4 Release (January 11, 2015 Build 4.13.4.280)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  The expression "MyParam in ElementRange(1,10)" did not compile correctly and could cause a crash.
-  The AIMMS WebUI is now started before the state files of AIMMS are read in. This will prevent situations where (sometimes) huge state files can take a while to load, leading to a timeout in the WebUI project under PRO.



--------------



AIMMS 4.13.3 Release (December 23, 2015 Build 4.13.3.254)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  The function CaseFileURLtoElement now has an optional argument to check whether the URL actually exists on the underlying file system.

Resolved issues
+++++++++++++++++++


-  Sometimes, when evaluating a parameter definition, AIMMS could raise a severe internal error.
-  The attribute `Activating Condition` of a constraint is now only used when the property `Indicator Constraint` is set as well.
-  When some menus in a ``menubar`` were hidden, enabling other menus in the same ``menubar`` did not work correctly.
-  Running an Excel macro with multiple string valued arguments did not work correctly.
-  In the WebUI, images in Text widgets are now also displayed properly when running under PRO.



--------------



AIMMS 4.13.2 Release (December 9, 2015 Build 4.13.2.233)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  The functions :any:`GMP::SolverSession::GetTimeUsed` and :any:`GMP::Solution::GetTimeUsed` replace the deprecated functions ``GMP::SolverSession::GetCPUSecondsUsed`` and ``GMP::Solution::GetCPUSecondsUsed``.

Resolved issues
+++++++++++++++++++


-  In the 64-bit version of AIMMS, some calculations involving the first or last element of the predefined set `Integers` could be very slow.
-  When using long lines in the AIMMS editor (close to the maximum of 255 characters), could influence the context menus which were displayed when hovering over identifier names around the end of the lines. In certain cases, AIMMS could crash as well.
-  When automatically casting a number to a string, there is no longer a unit consistency warning.
-  On Linux, the solutions times reported by AIMMS were measured in CPU seconds instead of elapsed time.
-  Printing the presolve status information (with CPLEX) for a model with semi-continuous variables could result in a severe internal error.
-  The default of the BARON option `Relative termination tolerance` was incorrect. It should have been 1e-4 instead of 1e-9.
-  The `messages.log` file is now flushed directly after a solve which makes it possible to view solver logging information in a PRO application by opening the log file in the request manager. (Note that to write solver logging the option `Solver Window Messages` should be set together with solver specific options.)



--------------



AIMMS 4.13.1 Release (November 27, 2015 Build 4.13.1.204)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  The current position of adjustable resize lines in a page can now be stored in a model parameter. Doing so prevents the positions of the resize lines on a page from being reset upon re-opening the page.
-  Gurobi 6.5 has been added. Gurobi 6.5 comes with significant performance improvements across MIP, LP, SOCP, MIQP and MIQCP problem types. Gurobi 6.5 supports variable hints: if you have a guess at a high quality solution for a MIP model (for example, from solving a related model), the new variable hint feature allows you to pass that guess to Gurobi to help guide the search for a new solution.
-  A new version of Knitro is available. Knitro 10.0 offers several new options to control termination of the optimization process.

Resolved issues
+++++++++++++++++++


-  There could be a problem with the handling of domain conditions in the left hand side of an expression.
-  In some cases, the EMPTY statement could perform badly if performed on already empty identifiers.
-  GMP-AOA could return an incorrect solution if columns were added before (using the function :any:`GMP::Column::Add`).
-  Directly referencing the data of parameters with the property "uncertain" by using the suffix .level could not be properly handled by the compiler leading to superfluous error messages.
-  Robust counterparts were generated incorrectly if the set of uncertain parameters was changed in between successive calls to the function :any:`GMP::Instance::GenerateRobustCounterpart`.
-  AIMMS now properly communicates date values (i.e. elements of Calendar identifiers) to Excel and vice versa. Previously, the local Windows date format could lead to an incorrect interpretation of date values by Excel, leading to the wrong dates in your workbooks.



--------------

#############
AIMMS 4.12
#############

AIMMS 4.12.1.194 Release (November 23, 2015 Build 4.12.1.194)
-----------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  A data base read that extended a subset, did not extend the super set elements as well.
-  Loading a case from the Request manager within PRO didn't work correctly.



--------------



AIMMS 4.12.1 Release (November 17, 2015 Build 4.12.1.186)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  The check on a compatible project file was done even when the project file didn't exist.
-  If a pivot table gets focus again, any reverse links to element parameters are now properly updated again.
-  The sorting of rows or columns in a Pivot Table was not correct if indices were moved from the outer area to the row area.



--------------

#############
AIMMS 4.11
#############

AIMMS 4.11.1 Release (November 3, 2015 Build 4.11.1.166)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  The calculation of the width of unit strings in large Pivot Tables has been improved.
-  An incorrect solution could be passed to the AIMMS identifiers after a postsolve, for a solve with multiple threads.
-  Reading a double value from a .xml page file could go wrong if the option `Number decimal separator` was not on its default value.
-  The Composite Table now responds correctly to data changes in the selection identifier if the property `Multiple Row Selection` has not been set.



--------------

#############
AIMMS 4.10
#############

AIMMS 4.10.2 Release (October 14, 2015 Build 4.10.2.130)
---------------------------------------------------------------------------------------------------------

 

**End of ``.aim``/``.amb`` (AIMMS 3 Project Files) Support** 
From AIMMS 4.10 onwards, we have stopped the support for ``.aim``/``.amb`` files in our AIMMS versions. In practice, this means that if you have projects that contain files in either of these formats (typically projects that started its development in AIMMS 3 or older), you will need an AIMMS 4 version that is released before AIMMS 4.10 (i.e. 4.0   4.9) to convert the project for you into .ams files. After that, you can continue working with your project in AIMMS 4.10 and higher. If you have any questions or concerns about this upgrade, please do not hesitate to contact us via `support@aimms.com <mailto:support@aimms.com>`__.

Improvements
+++++++++++++++++++


-  BARON 15 has been upgraded to version 15.9.
-  The behavior of the setting `Automatic` of the BARON 15 option `NLP Solver` has changed. BARON will now use combinations of the available NLP solvers.
-  To speed up reading multiple Excel files, the Excel interface functions will open new workbooks in an already existing Excel process, instead of spawning a new Excel process for each new workbook. When closing the last open workbook, the Excel process will exit. As a consequence, the function ``spreadsheet::SetVisible`` will now make all open workbooks visible.

Resolved issues
+++++++++++++++++++


-  The domain on an expression was not respected when the evaluation resulted in a 0. For identifiers with a non-zero default, this resulted in the situation that values were written outside the domain.
-  In the model editing function me::create, a space in a section name was not handled correctly.
-  Switching colors too often in a network object resulted in undefined coloring behavior.
-  The GMP-AOA algorithm was leaking memory.
-  Macro's used in unit parameters triggered an error during project startup.
-  Hiding/showing rectangle objects with a line width > 1 did not work entirely correctly.



--------------



AIMMS 4.10.1 Release (October 2, 2015 Build 4.10.1.102)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  From within a runtime library, it is now allowed to create and edit other runtime libraries.
-  The new Acrobat Reader (version DC) is now supported.

Resolved issues
+++++++++++++++++++


-  Using the mouse wheel for scrolling a page sometimes did not work as expected.
-  In the 2D chart object, the minimum and maximum values of the main Y-axis were not calculated correctly if the second Y-axis was set to hidden.
-  Aggregator values in a Pivot Table object now use the number of decimals as specified in the `Default format` property.
-  Previously, WebUI user flags of identifiers that were declared in a library did not work.



--------------

#############
AIMMS 4.9
#############

AIMMS 4.9.4 Release (September 16, 2015 Build 4.9.4.68)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  BARON 15 could be inefficient if CONOPT was used as the NLP solver.
-  The performance of the functions :any:`GMP::Column::Unfreeze` and :any:`GMP::Column::UnfreezeMulti` has been improved.
-  The Parametric Curve object did not update the X-axis label upon an element parameter change.



--------------



AIMMS 4.9.3 Release (September 9, 2015 Build 4.9.3.54)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  Several BARON 15 options have been removed because they were no longer supported.
-  Clicking somewhere in the `derived units` area of the conversion wizard of the quantity identifier type, could crash AIMMS.
-  Indexed pages did not work correctly if element parameters required a namespace prefix.
-  AIMMS could generate superfluous error messages on subsets that were not saved in the loaded case.
-  Non-print pages were not included in a report when printed in between calls to PrintStartReport and PrintEndReport.
-  Empty composite tables were not printed when first occurring on a page other than the first page.
-  The Gurobi logging messages were never printed in the Messages window, even if the option `Solver Window Messages` was set to `All`.
-  When importing a section that contains the declaration of an index, as well as a parameter that uses it, AIMMS would generate an incorrect error like `The undeclared "(name)" is not an index`.
-  Starting AIMMS 4.9 could fail if AIMMS could not find ``atl100.dll`` on your system.



--------------



AIMMS 4.9.2 Release (September 2, 2015 Build 4.9.2.31)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  The rather unclear error `Semantic error in an encrypted file` has been adapted, such that the line number where the error occurs is now displayed in the message.
-  BARON 15 has been upgraded to version 15.8.

Resolved issues
+++++++++++++++++++


-  Automatic Benders' Decomposition failed for models with SOS constraints.
-  The multiple case view had a problem with filtering when the multi-dimensional identifier in an inactive case only contained one single data value.
-  AIMMS could crash using Gurobi if the property RightHandSideRange or ShadowPriceRange was set for a constraint (or variable).
-  A superfluous error message could be issued when using the :any:`StringToMoment` function.
-  If the `procedure upon selection` took relatively long, the network object did not handle the mouse messages correctly, possibly resulting in a crash of AIMMS.



--------------



AIMMS 4.9.1 Release (August 21, 2015 Build 4.9.1.9)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  It is no longer needed to make a copy of the GMP if you want to execute multiple solver sessions (asynchronously) for the same GMP.
-  Two optional arguments have been added to the function :any:`GMP::Solver::GetAsynchronousSessionsLimit`.

Resolved issues
+++++++++++++++++++


-  In rare cases, the GMP version of AOA could stop due to evaluation errors while evaluating inline variables.
-  The function :any:`GMP::Solution::SendToModel` did not set the objective value to NA if the model status was infeasible.
-  When an index is duplicated in the index attribute of a set, AIMMS now issues an error instead of a warning and provides better internal memory management.
-  If your model had nested source files in sections or modules and were moved around in the model tree, having relative paths in the source file attribute of the sections or modules didn't lead to the actual files being copied. As a result, upon reopening your model, these files could not be found anymore (because the relative paths were not correct anymore). Now, if you try to move such sections or modules, you are asked whether you want to move the actual files, or to adapt the relative paths.
-  The ElementCast function did not work correctly on calendars with a non-fixed format.
-  The last focus position was not retained in a Pivot Table object if the table did not have focus at the time its data changed.


--------------

#############
AIMMS 4.8
#############

AIMMS 4.8.3 Release (August 11, 2015 Build 4.8.3.322)
---------------------------------------------------------------------------------------------------------

 A high level overview can be found at the `AIMMS New Features Page <https://www.aimms.com/support/new-features/>`__.

Improvements
+++++++++++++++++++


-  WebUI: the options editor for the Map widget has been improved.

Resolved issues
+++++++++++++++++++


-  WebUI: we fixed some compatibility issues with the latest version of Google Chrome in combination with the Table widget.



--------------



AIMMS 4.8.2 Release (July 23, 2015 Build 4.8.2.313)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  The function Delay() accepted negative values as argument, making AIMMS hang.
-  Multiple case objects had difficulty with `index in Set` notation inside an identifier reference.
-  If the domain of a composite table cannot be read from the xml (source) file, AIMMS crashed when reading any of the following explicit identifiers.
-  In the previous AIMMS release, the order in which identifiers in a webui widget were displayed, matched the order in which they were specified in the Contents option. Unfortunately, it turned out that in combination with a filter, changing the order could lead to disappearing identifiers. Therefore, in the current release, we disabled the feature to ensure that the display order matches the specified order. We expect to resolve this issue soon in one of our upcoming releases.



--------------



AIMMS 4.8.1 Release (July 9, 2015 Build 4.8.1.299)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  In the WebUI, you can now drive table cell formatting from your AIMMS model. This provides you with very flexible conditional formatting so that you can make your table very easy to interpret for the app users.
-  The data management in the WebUI has been improved. It is now more like the way you were used to in AIMMS itself.

Resolved issues
+++++++++++++++++++


-  Solving an LP problem with CPLEX 12.6.1 failed if the option `LP Method` was set to `Barrier - Primal crossover` or `Barrier - Dual crossover`.
-  An error was incorrectly issued when importing a new identifier under a namespace with the same name as an existing identifier.
-  Selecting a range on a calendar object on a tabbed page, and switching back and forth between the tabbed pages, incorrectly cleared your selected date range when it laid in the past.
-  Keyboard shortcuts for menu items on dockable pages didn't work correctly.
-  AIMMS didn't launch at all from the command line if one of its command line arguments was too long.
-  AIMMS could crash if you tried to use index names that were over 32 characters long.
-  Reading an element parameter with a compound set as its range from a text file, led to spurious error messages.



--------------

#############
AIMMS 4.7
#############

AIMMS 4.7.3 Release (June 24, 2015 Build 4.7.3.284)
---------------------------------------------------------------------------------------------------------

  By the way: if you are missing 4.7.1 and 4.7.2, then you are right:). Due to some internal technical reasons, we start the 4.7 series with 4.7.3.

Improvements
+++++++++++++++++++


-  Tooltips for page objects can now have any length. Previously, they were cut off at 255 characters.
-  Namechange files (``.nch``) files are now always sorted consistently. This has the benefit that they don't show as much `changes` when you compare them with older versions if your project is under a source control system.
-  There is a new version of CPLEX, namely CPLEX 12.6.2. The settings `Barrier - Primal crossover` and `Barrier - Dual crossover` of the option `LP method` have been removed. Crossover is now controlled by the new option `Solution type`.

Resolved issues
+++++++++++++++++++


-  Variables with a strictly positive lower bound and present in violation penalties could erroneously be assigned a non-zero value when violated.
-  Sometimes, a crash occurred during a search (CTRL+F) operation in the model tree.
-  A memory leak sometimes occurred during case management.



--------------

#############
AIMMS 4.6
#############

AIMMS 4.6.4 Release (June 9, 2015 Build 4.6.4.277)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  PUT statements in AIMMS didn't always perform fast enough.
-  Sometimes, identifiers were not updated properly after loading a case and subsequent changes in data.
-  When deleting a procedure from your model after a certain sequence of steps, AIMMS could crash.



--------------



AIMMS 4.6.3 Release (May 22, 2015 Build 4.6.3.270)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  Gurobi version 6.0 has been upgraded to Gurobi version 6.0.4.

Resolved issues
+++++++++++++++++++


-  Sometimes, when writing very long lines to csv files, AIMMS would stop working.
-  In some situations, element parameters were not always updated correctly internally. This could lead to the displaying of outdated data.



--------------



AIMMS 4.6.2 Release (May 13, 2015 Build 4.6.2.265)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  Models with SOS constraints were not resolved correctly in the Math Program Inspector in the rare case that the model contained variables only appearing in the objective.
-  Using the case dot notation within an element parameter in AllCases could give unit commensurate warnings when using indexed unit parameters.



--------------



AIMMS 4.6.1 Release (May 1, 2015 Build 4.6.1.259)
---------------------------------------------------------------------------------------------------------

 

Improvements
+++++++++++++++++++


-  This release is the first release to use AIMMS' new styling and logo.
-  Progress Window updates are now, by default, based on elapsed time instead of the number of iterations. The new option `Progress Time Interval` controls the progress frequency based on time. The default of the option `Progress Solution` has been changed to 0 (deactivated). The CPLEX and Gurobi option `Progress Awareness` has been removed, as well as the KNITRO option `Progress Interval`. The default of the SNOPT, MINOS and PATH option `Solution_progress` has been changed to 0 (deactivated). The default of the CPLEX and Gurobi option `Barrier Progress Solution` has also been changed to 0 (deactivated). Finally, the default of the Gurobi option `Output File Display Interval` has been changed to 1.
-  There is a new version of CBC, namely CBC 2.9 (subversion 4).
-  Selections made with the WebUI multi-select widget are passed on to the model and vice versa. This enables app developers to add more interaction between user and calculations. (This same functionality will soon also be available for the other two selection widgets.)
-  The column width for the WebUI widget grid has been halved to 120 pixels, offering the app developer a more finely grained layout control.
-  As a first step to make model selections in the WebUI available to the end-user, the multi-select widget now also accepts a one-dimensional parameter (with a default value other than 0 or 1) as its contents. The selected items in the multi-select widget will be kept in sync with the value of the parameter in your model.
-  A new `tutorial <https://www.aimms.com/english/developers/product-info/aimms-web-ui/>`__ in the WebUI developer series has been published. This tutorial explains how to create your own widget that displays multi-dimensional data from AIMMS.

Resolved issues
+++++++++++++++++++


-  CPLEX would generate an error if a MIQCP was solved and one of the CPLEX options `MIP method`, `MIP start algorithm` or `Solution target` was set to a non-default value. Now these options are automatically reset to the default value, and a remark is generated.
-  AIMMS generated CPLEX errors if a quadratic model was solved and the CPLEX option `check solution` was switched on.
-  The AIMMS presolver did not handle models with SOS constraints correctly.
-  Not all lazy constraints generated in a lazy constraint callback were passed to the solver.
-  Using OptionSetString for the option `Postsolve continuous variables` could result in an error.
-  The solver information in the Progress Window was not cleared if the solver was not called during the next solve.
-  Converting an AIMMS 3 project with multiple libraries in the same folder on disk to the AIMMS 4 format, fails. However, the error message didn't point you to this specific cause, which it now does properly.
-  When a procedure was changed to have more (optional) arguments, and a call to that procedure already existed in the model, AIMMS crashed.
-  While writing to a non-empty database table in merge mode, a wrong duplicate error could be issued when one of the primary key fields was a date column.
-  The update message on the AIMMS Startup Page showed that an update was available, even when you were running the latest version of AIMMS.
-  The unit conversion was incorrect for the objective for solutions in the solution pool of CPLEX.
-  The `direction` option in the map widget (that was meant to turn the arcs into arrows) was removed from the WebUI.
-  The appearance of the WebUI on an iPad mini was improved



--------------

#############
AIMMS 4.5
#############

AIMMS 4.5.3 Release (April 24, 2015 Build 4.5.3.253)
---------------------------------------------------------------------------------------------------------

 

Resolved issues
+++++++++++++++++++


-  The combination of a compound index and a domain condition could lead to an incorrect error.
-  The single select and multi select filters in the Pivot Table object did not work correctly if the selected elements only existed in the (inactive) cases of the multiple case view.
-  The transparent background color property of the Slider object didn't work properly anymore.
-  Adding a new library sometimes generated a prefix that was a reserved keyword in AIMMS.
-  The function StringToElement can no longer be used to try and add a new element to a Calendar.
-  Just before recompiling, all errors are now cleared.
-  The Gantt chart object lost its non-default color scheme after changing the contents property.
-  Switching between a bitmap button and a non-bitmap button (if the bitmap file was not found, or empty) was not handled correctly.
-  A focus change to the Error Window, during the sliding of Slider object, could lead to a crash when executing a procedure associated with the slider object.
-  If your license does not match the range of licenses of an encrypted ``.aimmspack`` file, you now get a more detailed error message.
-  The intrinsic function TimezoneOffset now (optionally) takes daylight saving time into account.
-  Numbers in the listing file were displayed incorrectly if the option `Listing number precision` is set to 0.
-  There was a problem with always displaying tooltips at the correct moment. This has been improved.



--------------



AIMMS 4.5.2 Release (April 16, 2015 Build 4.5.2.250)
---------------------------------------------------------------------------------------------------------



Resolved issues
+++++++++++++++++++


-  When importing a .ams file into a non-empty section in an AIMMS model, AIMMS could display incorrect error messages about identifiers already being defined.
-  Not all lazy constraints generated in a lazy constraint callback were passed to the solver.
-  Using OptionSetString for the option `Postsolve continuous variables` could result in an unjust error.
-  The level values for constraints in a model containing a pool of lazy constraints could be incorrect, if CPLEX was used.
-  The progress window could show 1e+100 for the best solution when solving a MIP with Gurobi.
-  Expressions that checked whether decimal parameter values, e.g. 0.3, were part of the set Integers ("if p in Integers then...") erroneously evaluated to true.
-  When using the function me::Compile, the special value UNDF was returned when the procedure being compiled contained errors. Now this returns 0, as the manual states.
-  Writing to a PostgreSQL database, sometimes yielded an incorrect error message regarding mismatching row counts.
-  For identifiers with a unit defined by an indexed unit parameter, the units were not correctly transferred when the identifier was part of a case expression (using the case dot notation).



--------------



AIMMS 4.5.1 Release (April 1, 2015 Build 4.5.1.229)
---------------------------------------------------------------------------------------------------------



**Improvements**

-  The Web-based UI has been extended with `sticky widgets`. 
-  Web-based UI has been extended with a basic Gantt Chart widget.



--------------

#############
AIMMS 4.4
#############

AIMMS 4.4.2 Release (March 25, 2015 Build 4.4.2.4)
---------------------------------------------------------------------------------------------------------



WebUI Backward Compatibility Issue
+++++++++++++++++++++++++++++++++++++++

-  If you have saved cases in your WebUI project using AIMMS 4.3, and loading these cases with the AIMMS desktop version 4.4, you will encounter errors like `The element "local-case-1? is not an integer`. Re-saving these cases using AIMMS 4.4 will solve this backward compatibility problem.

Improvements
+++++++++++++++++++


-  The WebUI now supports a Tree-Map widget to visualize your data.
-  The WebUI now supports cell coloring based on value.
-  The WebUI was extended with basic case comparison functionality.
-  Various new operators have been adapted to operate in parallel mode. These add to our ongoing effort of parallelizing the AIMMS engine for improving the overall performance.
-  There is a new version of KNITRO, i.e. KNITRO 9.1, which introduces a new Sequential Quadratic Programming (SQP) algorithm for continuous problems. This new SQP algorithm is primarily designed for small problems, where the computational cost is dominated by function/derivative evaluations.
-  There is a new version of BARON, i.e. BARON 15, which can use parallel threads for solving problems with integer variables. Also the COIN-OR solver FilterSD can now be selected as the NLP solver.
-  The suffix ``.BestBound`` of a math program now contains the lower bound, as shown in the progress window, for a minimization problem solved with BARON. The suffix .Objective already contained the upper bound for a minimization problem. Note that both suffices are only updated after the solve as BARON does not support callback procedures.
-  It is now possible to specify option settings for each of the concurrent MIP runs using Gurobi 6.0. To do so you have to switch on the option `Read parameter file` and specify a Gurobi parameter file for each of the concurrent MIP instances. See the help of the Gurobi options `Concurrent MIP` and `Read parameter file` for more information.
-  Wizard buttons have been added for the `Property` attribute of sections, modules, libraries and named declaration sections.
-  It is now possible to use a range of an element parameter as a filtering set. So, if EP is an Element Parameter mapped to a column of a database db, with set R as range, "read from db filtering R" will now select only the values that already exist in R.

Resolved issues
+++++++++++++++++++


-  In an End User project created in AIMMS 4, the developer state file of a library was not read in.
-  When you add a new sheet to an Excel or OpenOffice-workbook with the function SpreadSheet::AddNewSheet, but the sheet name used already exists, the function didn't set this sheet as the active sheet if the user specified so.
-  Consider a library ``myLib`` with prefix ``ml`` and interface ``myPublicSection``, where ``myPublicSection`` is a section in the library. When adding a procedure ``myProc`` or identifier ``myId`` to the section ``myPublicSection``, ``ml::myProc`` and ``ml::myId`` were not immediately added to the identifiers that are accessible from outside the library ``myLib``.
-  The option `API accesses all identifiers`, with range { `on`, `off` } (default value `off`) has been added to the option category `Backward compatibility`. When this option is switched on, the AIMMS API function AimmsIdentifierHandleCreate has access to all identifiers in a library, instead of just those mentioned in the interface.
-  A number of operators was added to the set of operators that can be executed in parallel: the ``if-else-endif`` expressions and a number of mathematical unary operators (like ``Factorial``, ``Sin``, ``Cos``, ``Log``, etc.).
-  The AIMMS Launcher now creates an icon on your desktop to start it with.
-  If the CPLEX option `Check solution` was switched on then AIMMS would attempt to check the solution even if no solution existed, for example, if the model was infeasible. This could result in CPLEX errors being printed in the log files.
-  At the end of a successful conversion from an old-style data management file to separate files on disk, an error dialog appeared which has now changed into a normal message dialog.
-  PRO projects (opened via the command line) are no longer listed in the recent project list. This made the recent project list look a bit chaotic, because of the use of long GUID's instead of the actual names of the projects.
-  Data page names containing a `::` (a library separator) were not converted correctly from AIMMS 3 to AIMMS 4.
-  When reading back a Gantt chart the `Use Alternating Colors` check mark was set unexpectedly in its properties, even when it was not set to `checked`.
-  If the source file attribute of a module contained a %NAME%, the dialogs of the wizard started in a random file location.
-  A runtime Mathematical Program referencing only variables and constraints in the main model could not be deleted and recreated.
-  When using scalar objects with the `Single Line Edit Field` checkbox checked, setting focus to the object using the tab key on your keyboard, did not make the value editable at once. You first has to manually select it before being able to edit it.
-  The Case Load and Save dialog boxes now also show the hidden folders.
-  On pages with more than one transparent button on it, sometimes clicking on one of them not only triggered the dotted rectangle box around that button, but also on another (random) button.
-  Putting a ``.cmdargs`` file next to the location of the project file only worked for a project with the ``.prj`` extension. Now it also works for ``.aimms`` and ``.aimmspack`` extensions.
-  The definitions of sets to filter or check read/write statements are now updated before the statement is executed.
-  Opened attribute windows of runtime identifiers that were already deleted could cause an endless loop in AIMMS.
-  The data of X.violation was not emptied after an Empty X; statement.
-  Changes in the domain sets of an identifier were not always picked up correctly in the AIMMS GUI.
-  In the calculation of the `dirty` state of a case (i.e. whether the case was changed after the last save), AIMMS no longer takes defined symbols into consideration (although they are saved in the case).
-  ActiveX objects on a dialog page no longer cause the system to freeze when pressing the Tab key.
-  Changing a value from default to non-default was not correctly handled in a Pivot Table object. The row and column trees were not correctly re-generated.
-  If an identifier in a Pivot Table object is defined over set A, while it was originally declared over set B, a multiple case view will now show the elements of set A as they are present in the underlying case.
-  A change in the ElementText attached to an index in the column headers of a Pivot Table object now triggers a resizing of the header.
-  In the Math Program Inspector, negative values (very) close to an integer value could be rounded incorrectly.



--------------

#############
AIMMS 4.3
#############

AIMMS 4.3.2 Release (The **AIMMS 4.3.2 Release** was released on January 21, 2015 Build 4.3.2.3)
---------------------------------------------------------------------------------------------------------



Improvements
+++++++++++++++++++


-  The performance of reading from a table in Oracle databases has improved considerably in some cases.

Resolved issues
+++++++++++++++++++


-  Projects which contain a System Library and were opened by using the AIMMS launcher (i.e. not by first opening AIMMS and then choose `open project` from the menu), displayed a superfluous error message before actually opening AIMMS.
-  In some cases, using a model with multiple nested modules, reorganizing your model by deleting and renaming identifiers could lead to a crash.



--------------



AIMMS 4.3.1 Release (The **AIMMS 4.3.1 Release** was released on January 14, 2015 Build 4.3.1.2)
---------------------------------------------------------------------------------------------------------



Improvements
+++++++++++++++++++


The latest version of AIMMS (4.3.1, Installation-free as well as PRO Package) and the latest version of PRO (2.0.2.46) support the AIMMS WebUI by default. The desktop version AIMMS will be equipped with a `Tools   Start WebUI` menu command. In some rare cases, this menu command is not present in the latest version of AIMMS. This is most probably related to some existing previous installation of the AimmsWebUI beta. It can be resolved by uninstalling the AimmsWebUI package and rebooting your machine.Additional requirement to work with the WebUI is that you include the PRO libraries in your Project (PRO libraries can be downloaded from the PRO server, or the `WebUI examples repository <https://github.com/aimms/WebUI-Examples>`__).We also feel it is necessary to mention that WebUI does not support clustering w.r.t. the data sessions (only w.r.t. solve sessions (as this is taken care of by AIMMS PRO)). Currently, all WebUI client sessions that are launched from PRO are running on a single machine.
The postsolve step for linear models has been moved from the solver interface of CPLEX, Gurobi and CBC to AIMMS. The postsolve options of CPLEX, Gurobi and CBC have been replaced by general solvers options with similar names. Two new additional options have been added, namely `Postsolve` and `Warning Unreliable Solution`. The main advantage of this move is that the code will be easier to maintain by the AIMMS developers. The new implementation resolves several issues:

-  Doing a postsolve after an interrupt is now also possible with Gurobi, as controlled by the general solvers option `Do Postsolve after Interrupt`.
-  The solve of a MIP problem by CPLEX or Gurobi, using GMP functionality, can now be continued after interrupting it and doing a postsolve on the interrupted problem. Before, the solver would start from scratch after the postsolve step.
-  The postsolve step with Gurobi did not work correctly for models with SOS constraints containing continuous variables.
-  The variable and constraint values were not passed to the Math Program Inspector for models solved with Gurobi, if the postsolve was infeasible.
-  A crash could occur with CBC if the option `Postsolve continuous variables` was set to `Round to nearest bound and resolve LP`.
-  Using Gurobi or CBC, variables were never rounded if no problem was solved during the postsolve step.

There is a new version of CPLEX, i.e., CPLEX 12.6.1.
We have started working on the parallelization of the AIMMS runtime. By parallelizing calculations in AIMMS models, computation times can be significantly reduced. In this AIMMS 4.3 version there is only support for a very limited collection of parallelized expression types, and the performance improvements to be expected for most models will be very limited. With each new AIMMS release, the collection of parallelized expressions will be extended, and over time models will see increased performance until the entire engine is parallelized.
The option `save_new_data_pages` was introduced, to control when changed data pages will be saved into your AIMMS 4 model source. The possible values are `never` and `upon confirmation`.

Resolved issues
+++++++++++++++++++


-  AIMMS could generate superfluous error messages when compiling a local indexed table, with global indices in the index domain for the second time.
-  When the option `attribute_to_string_encrypted` is turned on, it will now issue an error message upon request of the encrypted model text by using the AttributeToString function.
-  Sometimes, when adding an existing AIMMS 3 library to your project, you didn't get the dialog which offers you to convert it to AIMMS 4 format.
-  When using parameters to specify the Nth Label and/or First Label in the 2D chart object X-axis annotation section, this could lead to labels disappearing in the chart displayed.
-  A data page for a symbol in a module or library was not restored correctly. AIMMS did not find the saved version of the data page.
-  AIMMS could crash when retrieving the solution of a math program with indicator constraints.

A high level overview can be found at the `AIMMS New Features Page <https://www.aimms.com/support/new-features/>`__.



--------------

#############
AIMMS 4.2
#############

AIMMS 4.2.1 Release (The **AIMMS 4.2.1.18 Release** was released on December 17, 2014 Build 4.2.1.18)
---------------------------------------------------------------------------------------------------------



Resolved issues
+++++++++++++++++++


-  Selecting a master set in the Subset Of-wizard led to an immediate crash of AIMMS.
-  AIMMS would crash when using a pool of lazy constraints in a MIP problem solved with Gurobi 6.0.
-  The shadow prices and the reduced costs were not passed to the Math Program Inspector for MIP problems solved with Gurobi.

The **AIMMS 4.2.1.4 Release** was released on December 3, 2014 Build 4.2.1.4).

Improvements
+++++++++++++++++++


-  There is a new version of the Gurobi solver: Gurobi 6.0. This version offers improved performance.
-  AIMMS is now able to handle (far) more than 32.000 identifiers in a single model.
-  The option to put an expiry date on an exported ``.aimmspack`` file has been re-introduced, including a warning period option.
-  A technique to make small data changes faster can now be disabled. This option is introduced since in some cases it turned out to decrease performance significantly. Setting the tuning option: "small data updates strategy" to "off" might increase performance of the statements following this option switch.

Resolved issues
+++++++++++++++++++


-  Setting the NoSave property of an identifier prohibited it from reading from case files where it used to be saved.
-  The root set AllStochasticScenarios is now only added to a case during a save operation when there is a stochastic identifier, or when a subset of that set is also saved.
-  There was a performance problem with inline variables that had a complicated index domain expanded in high dimensional variables. This could lead to an unnecessary re-evaluation of the index domain while generating the high dimensional constraint.
-  Empty index sets could cause the DisAggregate function with a locus set to interpolation to allocate an infinite amount of memory.
-  The CaseFileSection  functions are no longer deprecated.
-  A severe internal error could be caused by compiling a unit attribute referencing a deleted identifier.
-  The option to disable toolbar items didn't always work correctly.
-  Programmatically trying to open a page that was already open could cause an error message about opening the page file.
-  Editing the name of an identifier that was present on a page could lead to the page being marked with an exclamation mark and, as a result, to showing the browse/skip/cancel dialog for that identifier when opening that particular page.
-  The performance of the function :any:`GMP::Instance::GenerateStochasticProgram` has been improved.

A high level overview can be found at the `AIMMS 4.2 New Features Page <https://www.aimms.com/support/new-features/>`__.



--------------

#############
AIMMS 4.1
#############

AIMMS 4.1.2 Release (The **AIMMS 4.1.2 Release** was released on November 17, 2014 Build 4.1.2.9)
---------------------------------------------------------------------------------------------------------



Improvements
+++++++++++++++++++


-  BARON 14 has been upgraded to version 14.2.5.
-  The maximum value of the listing page width option has been increased from 32.767 to 256.000.

Resolved issues
+++++++++++++++++++


-  In case the .xml file of a page or a template was missing (because of an incomplete merge operation in your version control system, for example), AIMMS could not open the page, but also didn't give a clear error message as to what was wrong.
-  Unfortunately, Yahoo has stopped offering their Yahoo Maps service. For the GIS Network object in AIMMS, this means that you cannot select maps from Yahoo Maps anymore.
-  The layout of the selection object could display the object in multiple columns, sometimes making part of the columns unreadable.
-  Dialog pages with `Save last position` set to true did not work correctly when they had a template page.
-  The possibility to change the application name during a conversion from an AIMMS 3 project to an AIMMS 4 project has been removed.
-  The progress window was not updated during a solve if BARON was used.
-  When creating a ``.aimmspack`` file of your project, and opening the resulting ``.aimmspack`` file, the saved page layout could sometimes not be respected.
-  Constraints with empty quadratic data were considered quadratic instead of linear, resulting in an incorrect automatically determined model type (e.g., MIQP instead of MIP).
-  A severe internal error could be caused by compiling a unit attribute referencing a deleted identifier.
-  When trying to read empty strings from MySQL, or strings just containing newline characters (`n`), this didn't work correctly.
-  When opening the table name wizard of the Database Table identifier, you got an error if the underlying database didn't support schema's while you still specified one, resulting in the table name wizard not to open. Now this schema is silently ignored and the wizard is opened as expected.



--------------



AIMMS 4.1.1 Release (The **AIMMS 4.1.1 Release** was released on October 16, 2014 Build 4.1.1.4)
---------------------------------------------------------------------------------------------------------



Improvements
+++++++++++++++++++


-  The performance of the function :any:`GMP::Stochastic::CreateBendersRootproblem` has been improved.
-  In the Case dialog, a shortcut to the My Documents folder has been added.

Resolved issues
+++++++++++++++++++


-  Committing a local numeric parameter with a non-atomic unit could result in an erroneous scaling of the initial value after initial compilation.
-  Semi-continuous variables were incorrectly handled when doing a GMP solve on a model without integer variables.
-  There was a performance glitch with inline variables with a complicated index domain expanded in high dimensional variables. This could lead to an unnecessary re-evaluation of the index domain while generating the high dimensional constraint.
-  Empty index sets could lead DisAggregate with a locus set to interpolation into an infinite amount of memory allocated.
-  Getting the Text Representation of a declaration node resulted in a crash if the section was unnamed. Otherwise, it did not show the identifiers.
-  The best bound, accessible through the math program suffix ``.BestBound`` or by using GMP functions like :any:`GMP::Solution::GetBestBound`, was not updated for MIQP and MIQCP problems.
-  The option `Warning no transactions supported` was not taken into account. Instead, this warning was always given if the connected datasource did not offer transaction support.



--------------



AIMMS 4.1.0 Release (The **AIMMS 4.1.0 Release** was released on September 26, 2014 Build 4.1.0.26)
---------------------------------------------------------------------------------------------------------



Improvements
+++++++++++++++++++


-  Installing AIMMS 4.1 on your machine will *replace* previously installed AIMMS 4.0.x versions.
-  AIMMS will now, by default, determine the mathematical program type after the mathematical program has been generated. That way the type of the mathematical program is determined by the variables and constraints that have have actually been generated and therefore it is more accurate. Older versions of AIMMS would determine the mathematical program type at compile time and based on symbolic variables and constraints that were sometimes not generated. The new option `mathematical program type check` controls when the mathematical program type is determined.
-  Progress updates for KNITRO are now controlled by the new option `Progress interval`. The KNITRO options `Barrier progress solution` and `MIP progress solution` have been removed. This change improves the progress window updating.
-  The infeasibility analysis by the AIMMS presolver has been improved as now the infeasible set of constraints will be smaller.
-  There is a small improvement on the displaying of disabled buttons that have a non-default colour.
-  The property `NoSave` can now be added to nodes in the model tree, such as declaration sections, sections, modules, libraries and runtime libraries. When this property is set, none of the parameters declared inside such a node will be saved in a case. It can not be added as a property to the main model though.
-  Element parameters declared within a set, for which the set has the property `NoSave`, will now be treated as if they also have the property `NoSave`.
-  There is a new version of BARON, namely version 14. BARON 14 can be used to calculate an irreducibly inconsistent system (IIS) for an infeasible nonlinear problem.

Resolved issues
+++++++++++++++++++


-  In some cases, you could see a dialog from ComponentOne (the 3rd party supplier of the ActiveX charts in AIMMS) popping up unexpectedly during startup of AIMMS.
-  If two different pages had the same user defined ``menubar``, but a different toolbar, the keyboard shortcuts in the ``menubar`` would disappear.
-  The text in the dialog to convert a Data Manager file (menu command File-Open-Data File) has been simplified.
-  In a multiple case view of a page object, the names of the displayed cases are now equal to only the base name of the underlying .data file. In other words: the folder path and the extension ".data" are removed. This only applies to data management style "Using disk files and folders".
-  The Pivot Table object could not set a reverse link to an identifier in a library, because of its prefix.
-  AIMMS sometimes produced a severe internal error after the error "The limit of 32700 identifiers is exceeded" was issued.
-  A statement like: ``Write anIndexedSet to file filtering i in someSubSet;`` would ignore the filtering.
-  Committing a local numeric parameter with non-atomic unit after initial compilation could result in a erroneous scaling of the initial value.
-  When two or more defined parameters and sets were referencing each other, AIMMS could go into an infinite loop trying to determine whether or not these definitions were constant.
-  Name changes were not picked up by the Pivot Table and ActiveX objects, and some properties of the Network object.
-  We recommend not to use the Linux ODBC driver for SQL Server. It doesn't work well in combination with AIMMS, because some functions that AIMMS requires are not supported by this particular driver.
-  In encrypted creating end-user ``.aimmspack`` files, the convention attribute was inadvertently not accepted by the compiler.

A high level overview can be found at the `AIMMS 4.1 New Features Page <https://www.aimms.com/support/new-features/>`__.



--------------

#############
AIMMS 4.0
#############

AIMMS 4.0.4 Release (September 5, 2014)
---------------------------------------

Build 4.0.4.9

Resolved issues
+++++++++++++++++++


-  Committing a local numeric parameter with a non-atomic unit after initial compilation could result in an erroneous scaling of the initial value.
-  AIMMS could produce a severe internal error after the error "The limit of 32700 identifiers is exceeded." is issued.
-  When two or more defined parameters and sets are referencing each other, AIMMS could go into a infinite loop determining whether or not these definitions are constant.
-  Name changes were not picked up by the Pivot Table, the ActiveX objects and some properties of the Network object.



--------------



AIMMS 4.0.3 Release (August 20, 2014)
-------------------------------------

Build 4.0.3.40

Resolved issues
+++++++++++++++++++


-  DirectoryCopy and DirectoryMove did not accept a trailing slash in the source folder name.
-  If the license server exited unexpectedly, AIMMS only tried to reconnect to the same license server and not to any other license server(s) in the configuration.
-  The conversion of old data management files skipped cases/datasets and folders that had invalid characters in the name (like `/`).
-  The case acronym in new data management now only uses the base name (without the folder part).
-  The Pivot table object could not set a reverse link to an identifier in a library because of the prefix.
-  The display of disabled buttons that have a non default color has been slightly improved.
-  The Spreadsheet::AssignValue function did not write value according to specified unit. Please note that this change can make your existing project behave a bit differently. If your model needs the old behavior, then please first assign the value to an intermediate parameter that is declared using the base unit.
-  The text of the data manager file conversion dialog has been simplified.
-  The write statement ignored the filtering when writing an indexed set.
-  If the CPLEX option `Deterministic time limit` was set and CPLEX hit this time limit, the program and solver status passed to AIMMS was incorrect.
-  The New Project dialog and the conversion dialog did not allow for names containing a dot.
-  Compiling AIMMS 3.x models took longer in Unicode-only AIMMS versions 3.14 and 4.0.
-  Flatfile reader was considerably slower in Unicode-only AIMMS versions 3.14 and 4.0.
-  Compiling converted AIMMS 3.x models in AIMMS 4.0 took considerably longer than compiling the original AIMMS 3.x model.
-  Menu shortcuts could temporarily disappear under special circumstances in AIMMS 3.13+.
-  AIMMS could freeze when importing an encrypted ``.amb`` file.
-  The AIMMS memory manager failed when allocating >4GB memory blocks in a single request.
-  When compiling an AIMMS 4.0 model, model files with non-standard characters in the absolute file path would not be read under special circumstances.



--------------



AIMMS 4.0.2 Release (August 6, 2014)
------------------------------------

Build 4.0.2.22

Improvements
+++++++++++++++++++


-  CPLEX 12.6 and CP Optimizer 12.6 have both been upgraded to version 12.6.0.1.

Resolved issues
+++++++++++++++++++


-  Changing a procedure name to a procedure with a different number of arguments could crash the syntax highlighting component.
-  Opening an AIMMS 4 project with missing AIMMS 3 libraries could crash the system instead of producing an appropriate warning.
-  The installation free AIMMS 4 executable exited immediately after spawning an AIMMS 4 child process, causing the Execute method called for the installation free AIMMS 4 executable to return immediately, even though the Wait argument had been appropriately specified.
-  The encryption scheme employed in AIMMS 4 has been adapted to break forward compatibility with older AIMMS 4 versions.
-  The Paste command would not work properly in situations where the Edit menu was copied into a custom menu bar, rather than duplicated.
-  Generating mathematical programs with more than 72 million individual variables would cause a buffer overflow.
-  An expression like FormatString("5.0n",1.5) would result in an unnecessary rounding warning.
-  The XML writer in AIMMS could produce XML files with empty elements when child elements were bound in a nested sequence.
-  When converting AIMMS 3 projects to AIMMS 4, standard number formats were not correctly converted.
-  When converting AIMMS 3 projects to AIMMS 4, errors in color symbols (e.g. unknown element names) were not handled correctly.
-  After converting an AIMMS 3 project to AIMMS 4, user bitmaps in the menu  Builder were not correctly read from Menu Builder.xml.
-  The procedure SpreadSheet::RetrieveTable might not work properly when its arguments involved local sets.
-  Exporting project options in AIMMS 4 did not use the correct extension in the suggested file name.
-  Scalar object with multiline edit field would show default pop-up menu if a user pop-up menu is defined.



--------------



AIMMS 4.0.1 Release (July 15, 2014)
-----------------------------------

Build 4.0.1.1

Resolved issues
+++++++++++++++++++

-  We fixed an issue related to encrypted libraries.



--------------



AIMMS 4.0.0 Release (July 7, 2014)
----------------------------------

(From the AIMMS 4.0 release on, we only publish specific AIMMS version update information on this page (as opposed to in the PDF files that are contained in the AIMMS releases themselves).

Improvements
++++++++++++

-  CP Optimizer 12.8 has been added. It comes with performance improvements for constraint programming problems. CP Optimizer now maintains bounds on the objective (a lower bound for minimization problems and an upper bound for maximization problems). CP Optimizer 12.8 is available in the Windows 64-bit (VS2017) and the Linux 64-bit versions of AIMMS.

 


.. spelling:word-list::

  presolved
  iODBC
  linux
  indexedA
  indexedB
  keypress
  keypresses
  unassigning
  unclickable
  nonlocal
  storable
  updatability
  awf
  misrenderings
  parameterized
  dockable
  unary
  parallelization
  unixODBC
  gridlines
  unicode
  uninstalling
  namechanges
  stylesheet
  whitespace
  unitless
	dom
	myMP
	myModel
	ProgramStatus
	myParameter
	somesubsetindex
	cp
	tmp
	doubletons
	elemPar
	elemPar2
	TestSuite
	aimmsunit
	valueType
	nch
	mailto
	barlinechart
	headerless
	stylesheets
	dropdowns
	IsWebUIDialogOpen
	IdentifierElementText
	ubuntu
	pivotings
	openClose
	themeability
	ManagedSessionOutputCaseContainsDefinedIdentifiers
	upX
	classList
	conf
	sparsify
  aimms
  .aimms
	RefreshAllWidgets
  ganttchart
  IdentifierAnnotation
  anOption
  webserver
  startWaitTime
  LaunchService
  localCurrency
  exchangeRate
  utf8
  utf
  StringToTimeslot
  subsetof
  parametric
  myFactor
  DerivedUnit
  BaseUnit
  myFactor
  MyLib
  MySet
  nonvar
  nonzeros
  coredump
  DialogGetNumber
  subSet
  inlined
  stdin
  callstack
  dumpfile
  dumpfiles
  endpoints
  loopback
  https
  myProcedure
  initialData
  mathprog
  nonanticipativity
  gmp
  orderBy
  gcc
  toolset
  libgfortran
  gfortran
  GetServiceAccess
  InvestmentConstantPeriodicPayment
  URI
