Information security for the AIMMS Cloud Platform (on Azure)
============================================================================

Backups / Business Continuity / Disaster Recovery
----------------------------------------------------

* File storage is on Azure *Storage*, an Azure service with a durability of ‘twelve nines’. The data is replicated across 3 *Data Centers* within the Azure *Region* and an additional copy is stored in the Azure *Partner Region*. **Backups** are made every 24 hours to an isolated account and are retained for at least 30 days.
* The optional, account-specific Application Databases use Azure’s *Flexible Server* MySQL service. The data is replicated across at least two Availability Zones (group of data centers). **Backups** of the transaction logs are taken every 5 minutes and retained for at least 30 days. These permit restores at each 5-minute interval. **Backups** are made every 24 hours to an isolated account and are retained for at least 30 days. You can contact our support team to restore any of those backups on your live database (or on the side).
* **Hardware failover:** Hardware failure will hardly ever cause an outage because all software services are using redundant hardware components. Failed hardware is automatically replaced by Azure, typically within minutes.
* **Software failover:** Almost all software services are run redundantly, typically in Docker containers on a cluster of virtual machines and are automatically restarted in case of unplanned termination.
* **Disaster recovery:** Targets are an RPO of 15 minutes and an RTO of 2 business hours. In almost all cases we will stay well within these targets as almost all disaster recovery is automated. In case of complete loss/wipe-out of all of our platform accounts (this has never happened to date and can only be caused by a targeted cyber attack or the simultaneous loss of at least two data centers), the infrastructure will be restored by running our automated scripts and the data will be retrieved from the separate isolated backups. For this scenario, the RPO is 24 hours and the RTO is around 2 business days.
* **Uptime:** Uptime target for our cloud platform is 99.5%, measured as the total number of hours downtime, including planed downtime, per month divided over the total number of hours in a month.

Data security
-----------------
* All AIMMS projects and data files are encrypted and stored on Azure *Storage* with server-side encryption enabled. Azure *Storage* is encrypted and decrypted transparently using 256-bit AES encryption, one of the strongest block ciphers available, and is FIPS 140-2 compliant. Encryption keys are managed by Microsoft, including key rotation with Microsoft Azure *Managed Identity*. 
* The application databases use Azure MySQL *Flexible Server* AES-256 encryption function, also for logs, backups and snapshots.
* Application databases are single-customer and are placed in a single-customer Vnet, accessible via VPN or via an AIMMS-provided application.

Password security
-----------------------
* Customer passwords are protected with industry-standard encryption. 
* Customer passwords must be at least 12 characters long, must contain at least 1 letter, 1 digit and 1 special symbol. 
* After three failed login attempts, there is a 5-minute lock-out period. 
* AIMMS staff does not have access to your password, and cannot retrieve it for you. The only option if you lose it is to reset it yourself. 
* Login credentials are always transmitted securely over HTTPS. 
* Our cloud platform supports SSO via ADFS or SAML. 

User management
---------------------
* At initial set-up, AIMMS staff will create one user account with admin privileges and pass the credentials to the customer, with an explicit request to change the password.
* With admin privileges, customer staff can create, change and remove users, groups and permissions.
* Our cloud platform supports SSO via ADFS or SAML.

Staff access
---------------
* Background checks are performed for AIMMS staff and for staff of our managed service partner Intercept. Staff are contractually bound to confidentiality and to information security policies with an option for disciplinary action in case of non-compliance.
* AIMMS staff or staff of our managed service partner Intercept cannot sign into customer accounts and/or access customer projects and data, unless the customer provides us with access credentials.
* AIMMS staff does have access to all log files, which contain activity logs.
* Selected AIMMS staff and selected staff of our managed service partner Intercept can only access the Azure console using MFA and Azure *Active Directory*. 
* Production environment configuration changes are only made through scripts. Change access to production environments requires explicit and temporary permission elevation (using Azure *Privileged Identity Management*), only to be used in case of severe incidents. Any manual access by AIMMS or Intercept staff is logged and logs can be made available to customers. 

System security
---------------------
* All AIMMS software runs inside Docker containers using Azure *AKS*.
* These Docker containers use hardened, patched Linux versions.
* *AKS Nodes* are patched continuously.

Physical security
---------------------
The AIMMS Cloud Platform is hosted on Azure, which meets the highest standards for physical security, including:

* Restricted perimeter, physical access by authorized data center employees only.
* Physical access control with security badges or biometric security. 
* Security cameras monitoring the data center locations 24/7.
* Security personnel on site 24/7.

Credit card safety
------------------------

* AIMMS Cloud Platform is not PCI-compliant.
* AIMMS will not store credit card information, but we cannot prevent customers from building applications which store credit card information.

Communications
--------------------
* All data communications between the AIMMS Cloud Platform and client instances are protected with 256-bit SSL encryption (HTTPS). 
* Data transfer with the application databases is protected by VPN. 

Network defense
----------------------
* Network firewalls protect network traffic, including protection against DDoS attacks.
* Azure *Web Application Firewall* is configured to use the Azure default rule sets to monitor web traffic.
* The Azure *Kubernetes Cluster* and its access to all components are protected by the web application firewall within *NGINX* and are based on the OWASP-top-10 rule sets.
* Azure’s intrusion detection services, including *Microsoft Defender for Cloud*, help detect intrusions. Intercept and AIMMS staff will be alerted 24/7 in case of ‘High’ or ‘Critical’ alerts.

  
Logging
----------------
* Azure *Log Analytics* and Azure *Table Storage* are used for logging configuration changes to record all changes to infrastructure configuration.
* User logons, logon failures and other events potentially indicating security incidents are logged by AIMMS PRO.
* No users have permissions for changing or removing logs.
* Log retention times: indefinite for audit and security logs, 6 months for our cloud operations tool, 1 month for other application logs.

Third-party security assessments
-------------------------------------
* At least annually the AIMMS Cloud Platform undergoes a third-party security assessment including penetration tests. 
* Any 'critical' or 'high' findings (none to date) are remedied immediately. Other findings are addressed within 12 months. 
* Microsoft *Defender for Cloud* continuously scans and reports on the security configuration within Azure, results are represented by a *Secure Score*.

Incident management
----------------------------
* Response to information security incidents is coordinated by our *Information Security Incident Response* role.
* When appropriate, customers are informed of any information security incidents at the earliest possible moment. 
* Information security incidents are reported to the  *Information Security Officer*, recorded in a digital system and followed up with a root-cause analysis and, if needed, corrective actions to prevent re-occurrence. 

Personal data
---------------------------

* For the operation of the SaaS service, AIMMS stores username, password, email address and full name of all users. AIMMS will honor the individual's rights granted under GDPR for reviewing, modifying, or removing of their personal data.
* AIMMS has no knowledge of what personal data customers store and process in the applications that they publish on the AIMMS Cloud Platform. 
* The AIMMS Cloud Platform complies with the information security requirements for a *Processor* in the GDPR context. A standard processing agreement is available, on request. 
* Through Microsoft the AIMMS Cloud Platform on Azure offers its customers the EU Standard Contractual Clauses (SCC) (also known as EU Model Clauses) that provide specific guarantees around transfers of personal data. The EU Model Clauses are used in agreements between service providers (such as Microsoft) and their customers, in this case AIMMS, to ensure that any personal data leaving the EEA will be transferred in compliance with the GDPR. More details can be found here.
