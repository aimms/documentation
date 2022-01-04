Migrating cloud accounts from Amazon to Azure
================================================

On this page you will find all information we have available on the migration of our Cloud platform from Amazon to Azure. 


What will change?
--------------------

Almost everything will remain the same for you. We will transfer your published models/apps, your suers and their roles, your files in PRO storage and, if applicable, the content of your application database. Two things that will change are: 

* The URL to access the cloud. Where this is currently https://cloud-name.cloud.aimms.com, after migration this will be https://cloud-name.aimms.cloud. This might require small changes, like adjusting bookmarks. 
* The application database master password + username will also change, so keep that in mind if you have used it somewhere hardcoded or if you are using the credentials for accessing the database from an external source. We strongly recommend not using the master username and password for these purposes.


What will be the impact of the migration?
------------------------------------------
We will stay in close contact with you throughout this entire process. In preparation, and to establish a complete picture of the impact of the migration for your specific situation, we will schedule a pre-migration call with you. After this you will receive a customized migration plan for your account(s).

Depending on your technical set-up your IT-department might need to perform some actions prior to the migration to make sure the platform and account will be accessible after migration. To our knowledge, this will only the case if SSO is enabled and/or if you are using connections with external systems. We will make sure to include this in the migration plan.

Maybe good to point out that prior to transferring the data, we will setup your new account on the Azure version of the AIMMS Cloud Platform, so that we can test access and make sure that connections, if any, work. 
Also, in case you currently have a test/non-production account, we will first set that up, make sure it works and transfer the data from your test/non-production account on AWS. One or two weeks later we will then repeat this process for your production account.

During the migration there will be a few hours downtime in which the account will be unavailable. During our pre-migration call we will check with you for best possibilities for downtime and we will try to find a good timing for this as to limit any inconvenience for the users. Of course this can be done outside business hours, for example during the weekend.


Parties involved in the migration
-------------------------------------
For us it would be helpful to have one single point of contact with whom we can communicate before, during and after the migration. This person should be in touch with the following parties, who might be needed somewhere in the process (depending on technical needs):

* **IT department (or, if outsourced; external service provider)**

If there is Single Sign On (SSO) and/or VPN installed, it is important that the IT department knows that actions are required, as this needs to be set up again. We will support them directly in this.

The master account for the database access will change. If this account is used anywhere for accessing the database/data, this should be adjusted after migration.

If there is a data transfer connection between other systems and the AIMMS applications or the (MySQL) application database that is provided as part of the AIMMS Cloud Platform (possibly involving a VPN connection) the team that established that connection will have to help reconfigure it for the Azure version of the AIMMS Cloud Platform.

* **Internal AIMMS developer**

If there are any integrations inside of the AIMMS app, the developer should test these connection(s) after migration. If the admin account is used anywhere in code, it should be adjusted.

* **End user(s)**

The end users will be working with the migrated account. We highly recommend having at least one end user testing the account after migration to check if everything is still working as expected.

Probably good to know that at our end our partner Intercept, a highly-experienced Azure Cloud Solution Partner, will support us setting up VPNs. 


Communication/next steps
-----------------------------
For now, no actions are needed from your end. We will contact you, first to verify that we have the right contact details and after that for our pre-migration call.

If you have any questions in the meantime, please contact Roxanna Bindenga (project manager, `roxanna.bindenga@aimms.com <mailto:roxanna.bindenga@aimms.com>`_).

.. toctree::
   :hidden:
