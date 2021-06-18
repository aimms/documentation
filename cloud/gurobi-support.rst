Gurobi Support on AIMMS Cloud Platform
======================================

Running Gurobi on the AIMMS Cloud Platform requires the `Gurobi Web License Service <https://www.gurobi.com/web-license-service/>`__ offered by Gurobi Optimization which is a Gurobi licensing service for containers running on Docker (among others). 

.. note::

	To use Gurobi on the AIMMS Cloud Platform you will need **AIMMS version 4.81** (or higher) and **Gurobi version 9.1** (or higher).

To run Gurobi on the AIMMS Cloud Platform you first have to access the Gurobi Web License Manager (requires login to your Gurobi account) and download your Gurobi client license file, called ‘gurobi.lic’. This license file contains connection parameters which are used by Gurobi to connect to the WLS server and retrieve a token.

Next this information has to be made available in your AIMMS project, for which two approaches are available.

	* First, you can directly use the license file ‘gurobi.lic’ by copying it to the root directory of your AIMMS project, i.e., the directory containing the .aimms file. You then have to include this license file in the .aimmspack file which will be created if you export an end-user project. This approach can be practical for testing.


	* Second, you can specify the required connection parameters WLSACCESSID, WLSSECRET and LICENSEID using the functions ``GMP::Solver::SetEnvironmentStringParameter`` and ``GMP::Solver::SetEnvironmentIntegerParameter``. The values of these parameters can be retrieved from the license file ‘gurobi.lic’. 


An example
----------

.. code-block:: none

	if pro::DelegateToServer then
    	return 1;
	endif;

	MIPSolver := CurrentSolver('MIP');

	GMP::Solver::SetEnvironmentStringParameter( MIPSolver, "WLSACCESSID", "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" );
	GMP::Solver::SetEnvironmentStringParameter( MIPSolver, "WLSSECRET", "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" );
	GMP::Solver::SetEnvironmentIntegerParameter( MIPSolver, "LICENSEID", xxxxxx );

	solve MP;


Optionally you can set the following parameter to print more license related information:

.. code-block:: none

	GMP::Solver::SetEnvironmentIntegerParameter( MIPSolver, "CSClientLog", 3 );


The second approach is recommended for production applications.



