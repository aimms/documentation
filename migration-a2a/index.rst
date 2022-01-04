Migration cloud accounts from Amazon to Azure
================================================

On this page you will find all information we have available on the migration of our Cloud platform from Amazon to Azure. 


What will change?
--------------------

Not much will change for you apart from the URL to access the cloud. Where this is currently https://cloud-name.cloud.aimms.com, after migration this will be https://cloud-name.aimms.cloud. This might require small changes, like adjusting bookmarks. The master application database password + username will also change, so keep that in mind if you have used it somewhere hardcoded or if you are using the credentials for accessing the database from an external source. We strongly suggest using a new account for these types of implementation.


What will be the impact of the migration?
------------------------------------------
We will stay in direct contact with you throughout this whole process. In preparation, and to gather a complete overview of the impact of the migration for your specific situation as best to our abilities, we will schedule a pre-migration call with you to go over the details. After this you will receive a customized migration plan for your account(s).

Before the migration, dependent on technical specifications, the IT-department might need to perform some actions to make sure the platform and account will be accessible after migration. As it is known know, this will only the case if SSO is enabled and/or a VPN or VPC is set up. We will make sure to include this in the migration plan. 

During the migration there will be a few hours downtime in which the account will be unavailable. During our pre-migration call we will check with you for best possibilities for downtime and we will try to find a good timing for this as to limit any inconvenience for the users.


Parties involved in the migration
-------------------------------------
For us it would be helpful to have one single point of contact who we can communicate with before, during and after the migration. This person should be aware that the following parties might be needed somewhere in the process (dependent on technical needs):

* **IT department (or, if outsourced; external service provider)**

If there is Single Sign On (SSO) and/or VPN installed, it is important that the IT department knows that actions are required, as this needs to be set up again. We will help doing this. 

The admin account for the database access will change. If this account is used anywhere for accessing the database/data, this should be adjusted after migration.

If there is a data transfer connection between other data sources and the AIMMS applications or the (MySQL) application database provided as part of the AIMMS cloud platform, possibly involving a VPN connection, the team that established that connection will have to help reconfigure it for the Azure version of the AIMMS Cloud Platform.

* **Internal AIMMS developer**

If there are any integrations inside of the AIMMS app, the developer should test these connection(s) after migration. If the admin account is used anywhere in code, it should be adjusted.

* **End user(s)**

The end users will be working with the migrated account. We highly recommend having at least one end user testing the account after migration to check if everything is still working as expected.


Communication/next steps
-----------------------------
For now, no actions are needed. We will contact you, first to verify if we have the right contact details in place and after that for our pre-migration call. 

If you have any questions in the meantime, please contact Roxanna Bindenga (project manager, `roxanna.bindenga@aimms.com <mailto:roxanna.bindenga@aimms.com>`_), `our support team <https://www.aimms.com/support/>`_ or the Customer Success Lead (Patrick Donders, `patrick.donders@aimms.com <mailto:patrick.donders@aimms.com>`_). 

.. toctree::
   :hidden:
