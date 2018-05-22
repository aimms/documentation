Monitoring
==========

Starting with PRO 2.3+, in the PRO Portal, all the members of the admin group in the ROOT and other environments have a new drop-down menu available in the top horizontal navigation bar: <strong>Administrative Tools</strong>. This menu provides more information about what is happening in the PRO environment. It is particularly relevant when running PRO in a cluster configuration.
The options that are currently available for monitoring are:

* **Cluster setup**: displays details about the nodes that make up the PRO cluster. Has a link "View Details" to 'Server Monitoring' page which displays the details about the PRO Server. Also the details of the running Solver sessions/ Data sessions and ability to Terminate running sessions. Note: Starting with AIMMS PRO 2.17.1, ability to Terminate the running data sessions is moved to the 'Active Data Sessions' page under the 'Configuration' menu.
* **Database Monitoring**: displays details about the connections made from the current node to the database.
* **Licenses Monitoring**: displays details about the currently configured PRO license profiles.
* **Job rules Monitoring**: displays details about the queue priorities and rules.
* **Seats Monitoring**: displays detailed information about the usage of the client licenses and ability to 'Delete' reserved seats for WinUI apps. Please Note that starting from AIMMS PRO 2.13.3+ and AIMMS License Server 4.0.0.50+,  Client License sessions are counted per user.device combination, instead of per session meaning that one user can now run multiple apps whilst only occupying one session. 


*Note:* Starting from AIMMS PRO 2.17.1 or higher, this menu is removed as the concept of AIMMS PRO Cluster has been changed from this version and monitoring pages are not useful anymore.