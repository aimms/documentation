AIMMS Information Security
=============================

.. rubric:: ISO 27001 Certified

AIMMS is `ISO 27001 certified <https://www.iso.org/isoiec-27001-information-security.html>`_ for development, maintenance, delivery, and support of software and cloud service, in accordance with the *Statement of Applicability dated 28-10-2019*.

AIMMS Developer
------------------

We have implemented a collection of measures to make sure we deliver secure software to our customers. 

Staff training
""""""""""""""""""
AIMMS software development teams regularly, at least annually, receive training on secure software development methods. 

Development processes
""""""""""""""""""""""""
* All code is in a source code repository. Separate code branches are used to ensure only production-ready code is released.
* Artifacts are built using automated build and test pipelines and these will fail if one or more automated tests fail. 
* Access to build and test pipelines is restricted to a few administrators. 
* Teams review the information security impact of all projects taken on. 

Testing
""""""""""
* Manual testers perform the exploratory testing of any new code.
* Automated tests consist of a mixture of unit tests and functional tests, a total of 10,000+ tests. Sub-sets of these test sets are run on every code commit. The full set is run at least once on every release. 

Code scanning
"""""""""""""""""""
Static code analysis is included in the automated build process, scanning for the `CVE vulnerabilities <https://cve.mitre.org/cve/>`_.

AIMMS Cloud Platform (on AWS)
----------------------------------

Backups / Business Continuity / Disaster Recovery
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

* File storage is on AWs S3 buckets, a Multi-AZ AWS service with a durability of  *eleven nines* . The data is replicated across at least two availability zones (data centers). 
  
    **Backups** are made every 24 hours to an isolated account and are retained for at least 30 days. 

* The optional, account-specific application databases use AWS' Multi-AZ RDS service. The data is replicated across at least two availability zones (data centers). Snapshots are taken every 5 minutes and retained for at least 30 days. 

    **Backups** are made every 24 hours to an isolated account and are retained for at least 30 days. 
* You can contact our support team to restore any of those backups on your live database (or on the side). 
* **Hardware failover**: Hardware failure will hardly ever cause an outage because all software services are using redundant hardware components. 
  Failed hardware is automatically replaced by AWS, typically within minutes. 
* **Software failover**: Almost all software services are run redundantly, typically in Docker containers on a cluster of virtual machines and are automatically restarted in case of unplanned termination. 
* **Disaster recovery**: In case of complete disaster, where our all of our platform accounts are lost (this has never happened to date and can only be caused by a targeted cyber attack or the simultaneous loss of at least two data centers), the infrastructure will be restored by running our automated scripts and the data will be retrieved from the separate isolated backups. 
  
    For this scenario, the RPO is 24 hours and the RTO is around 2 business days. 
* **Uptime**: Uptime target for our cloud platform is 99.5%, measured as the total number of hours downtime, including planed downtime, per month divided over the total number of hours in a month. 

Data security
""""""""""""""""""
* All AIMMS projects and data files are encrypted and stored on AWS S3 with server-side encryption enabled. AWS generated a unique encryption key for each object, and then encrypts the object using AES-256. The encryption key is then encrypted itself using AES-256, with a master that is stored in a secure location.
* The application databases use AWS RDS' AES-256 encryption function, also for logs, backups and snapshots. 
* Application databases are single-customer and are placed in a single-customer VPC, accessible via VPN or via an AIMMS provided application. 

Password security
""""""""""""""""""""""""
* Customer passwords are protected with industry-standard encryption. 
* Customer passwords must be at least 12 characters long, must contain at least 1 letter, 1 digit and 1 special symbol. 
* After three failed login attempts, there is a 5-minute lock-out period. 
* AIMMS staff does not have access to your password, and cannot retrieve it for you. The only option if you lose it is to reset it yourself. 
* Login credentials are always transmitted securely over HTTPS. 
* Our cloud platform supports SSO via ADFS or SAML. 

User management
""""""""""""""""""
* At initial set-up, AIMMS staff will create one user account with admin privileges and pass the credentials to the customer, with an explicit request to change the password.
* With admin privileges, customer staff can create, change and remove users, groups and permissions.
* Our cloud platform supports SSO via ADFS or SAML.

Staff access
"""""""""""""""
* AIMMS staff cannot sign into customer accounts and/or access customer projects and data, unless the customer provides us with access credentials. 
* AIMMS staff does have access to all log files, which contain activity logs. 
* AIMMS staff can only access the AWS consol via a VPN connection, using MGA. In case of employing contractors, these are only given access to the development account for the duration of the assignment, with the  *least privileges* principle applied. Only AIMMS staff have access to the production environments. 

System security
"""""""""""""""""""
* All AIMMS software runs inside Docker containers using AWS ECS.
* There Docker containers use hardened, patched Linux versions. 

Physical security
"""""""""""""""""""
The AIMMS Cloud Platform is hosted on AWS, meeting the highest standards for physical security, including:

  * Restricted perimeter, physically access by authorized data center employees only.
  * Physical access control with security badges or biometric security. 
  * Security cameras monitoring the data center locations 24/7.
  * Security personnel on site 24/7.

Credit card safety
""""""""""""""""""""""""""

* AIMMS Cloud Platform is not PCI-compliant.
* AIMMS will not store credit card information, but we cannot prevent customers from building applications which store credit card information.

Communications
""""""""""""""""""
* All data communications between the AIMMS Cloud Platform and client instances are protected with 256-bit SSL encryption (HTTPS). 
* Data transfer with the application databases is protected by VPN. 

Network defense
""""""""""""""""""
* Network firewalls protect network traffic, including protection against DDoS attacks.
* AWS' Web Application Firewalls using the AWS default rule sets protect web traffic. 
* AWS' intrusion detection services, including Detective, help detect intrusions. AIMMS staff will be alerted 24/7 in case of  *high*  or *critical* alerts. 
  
Logging
""""""""""""
* AWS CloudTrail and AWS Configure are used for logging configuration changes to record all changes to infrastructure configuration.
* User logons, logon failures and other events potentially indicating security incidents are logged by AIMMS PRO. 
* No users have permissions for changing or removing logs.
* Log retention times: indefinite for audit and security logs, 6 months for our cloud operations tool, 1 month for other application logs. 

Third-party security assessments
"""""""""""""""""""""""""""""""""""
* At least annually the AIMMS Cloud Platform undergoes a third-party security assessment including penetration tests. 
* Any  *critical*  or  *high*  findings (none to date) are remedied immediately. Other findings are addressed within 12 months. 

Incident management
""""""""""""""""""""""""""
* Response to information security incidents is coordinated by our  *Information Security Incident Response* role.
* When appropriate, customers are informed of any information security incidents at the earliest possible moment. 
* Information security incidents are reported to the  *Information Security Officer*, recorded in a digital system and followed up with a root-cause analysis and, if needed, corrective actions to prevent re-occurrence. 

Personal data
"""""""""""""""""""""

* For the operation of the SaaS service, AIMMS stores username, password, email address and full name of all users. AIMMS will honor the individual's rights granted under GDPR for reviewing, modifying, or removing of their personal data.
* AIMMS has no knowledge of what personal data customers store and process in the applications that they publish on the AIMMS Cloud Platform. 
* The AIMMS Cloud Platform complies with the information security requirements for a  *Processor*  in the GDPR context. A standard processing agreement is available, on request. 

