AIMMS PRO End-User Portal
*************************

The AIMMS PRO portal page is the entrance to all functionality of the AIMMS PRO server. For ordinary end-users, the portal displays 
 
* all applications which they are entitled to use, as well as 
* the status of any jobs they submitted for those applications and the statistics for those jobs.


The AppLauncher
===============

To be able to use applications from the portal you will first have to install the AIMMS PRO AppLauncher. If you don't have it, you will find the button for the installation on the Applications page (initially) or the Getting started page (always).

PRO Jobs
========

Jobs Overview
-------------

The **Jobs** screen of the portal will show you the list of all jobs that you have submitted to the server, together with their current status, their creation time, their queue or run-time and the server that they are running on. If you are the administrator, you will not only see the jobs sent by the yourself, but also all the jobs of all the other users.

Jobs and Requests
-----------------

Please be aware that 'requests' in the AIMMS User Request Manager in your apps are exactly the same thing as 'jobs' in the jobs overview in the portal. The terms can be used interchangeably.

Terminating Running Jobs
------------------------

You can terminate running jobs that take too long to solve, or that you are no longer interested in, either through the AIMMS PRO Request Manager within a client application, or through the **Jobs** screen of the portal. In both cases, you can select the job you want to terminate, and press the **Terminate** button to actually terminate the running job(s) on the server.

Inspecting Jobs
---------------

Any job that has run successfully, has failed, or has been terminated by the user, will remain visible in the AIMMS PRO Request Manager and the **Jobs** screen of the portal. This will allow you to load the results of any successfully completed request, or you may want to check the log files to inspect what went wrong with a request that failed to complete successfully.

Deleting Jobs
-------------

Eventually, when you have inspected the results or log files, you should delete all completed jobs from the list. This will free up all resources on the server, such as the input/output cases and log files, that are kept for every job. You can delete completed jobs either through the AIMMS PRO Requests Manager or via the **Jobs** screen in the portal, by selecting the requests you want to delete and pressing the **Delete** button.

Please know that deleting many jobs (i.e. hundreds) may be a slow process. You may have to wait a bit, or even restart your browser window in extreme cases. This is a known issue.

Completed jobs can also be automatically deleted. By default, all jobs that are older than 30 days will be deleted. You can change this setting by modifying the Job retention time value through the Retention Settings under the `Configuration menu <config-sections.html#general-settings>`_.

Application Statistics
======================

Both from the **Apps** and the **Jobs** page of the PRO portal, you can retrieve statistics about the end-user applications that you are working with. By selecting the **Stats** button on either an app on the **Apps** page, or a job on the **Jobs** page, you can get statistics about the corresponding application.

Queued and Running Jobs
-----------------------

On the statistics page of an app you get information about the number of jobs currently in the queue for that app, both for you and for all users together, as well as the current number of jobs running for that application.

Historical Runtime Data
-----------------------

In addition, the statistics page will give you an overview of the historical runtime data (all the runs of the application since it was published; the deleted jobs also count) for the application at hand for a selected time period and time resolution. Per time slot in the selected period, you will get an overview of

* the number of requests submitted,
* the average and maximum queue time, and
* the average and maximum run time.
 

How to Interpret
----------------

If the average queue times substantially exceed the average run times of your application on a regular basis, this may be an indication that the number of licenses and other resources assigned to your application is too low. You may expect that by increasing the capacity of the under-assigned resources by one, the average queue time will decrease by the average run time.