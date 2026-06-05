SAML Support
============

The AIMMS Cloud Platform allows you to link any environment to a SAML identity provider (e.g. ADFS) so that your users can be authenticated using your own user management system.

To enable SAML authentication, configure both:

* AIMMS Cloud Platform (via the Portal)
* SAML Identity Provider (IDP)

AIMMS Cloud Platform Configuration
------------------------------------

Setting up the link is straightforward: in the Portal, go to **User Management**, select the environment you want to configure, and click the **Link to SAML** icon on the right side of the environment row. A dialog opens in which you must specify the SAML metadata URL. For example:

``https://saml.adfs/federationmetadata/2007-06/federationmetadata.xml``

Leave the URL blank to remove the association.

.. warning:: Make sure that the server serving the SAML metadata sends its complete certificate chain along with its SSL certificate. Failure to do so may result in failed metadata retrieval and single-sign-on via SAML will not work.

It is allowed to have two environments pointing to the same SAML IDP.

After enabling an environment for SAML authentication, users can log in to that environment either automatically or from the login screen. After a successful authentication, the Cloud Platform creates a corresponding user within the SAML-enabled environment.

SAML Identity Provider (IDP) Configuration
-------------------------------------------

Configure your SAML identity provider to work with the AIMMS Cloud Platform service provider:

* Your AIMMS Cloud instance must run over HTTPS (this is always the case for Cloud).
* Add the AIMMS Cloud Platform metadata to your IDP. You can retrieve the metadata from ``https://your-cloud-instance.aimms.cloud/sso/saml/metadata.xml``.
* Configure your IDP to provide the following claims:

    * *Group* (``http://schemas.xmlsoap.org/claims/Group``) – required. Groups that the user is a member of. E.g. LDAP Token-Groups - Unqualified Names.
    * *Name* (``http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name``) – required. Unique user ID. E.g. LDAP SAM-Account-Name.
    * *Given Name* (``http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname``) – optional. User's full name. E.g. LDAP Display-Name.
    * *E-Mail Address* (``http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress``) – optional. User's email address. E.g. LDAP E-Mail Addresses.

Single Sign-on
--------------

After enabling an environment for SAML authentication, any user navigating to the Portal will be automatically redirected to the SAML SSO page for login. As a result of a successful authentication, the Cloud Platform creates a corresponding user within the SAML-enabled environment. To log in as a different user or on a different environment, the user must log out first.

If you have two SAML environments configured, SSO will not be attempted automatically, as the platform cannot determine which environment to use.

Role-based Authentication
--------------------------

When you add groups to a SAML-enabled environment whose name or description matches a group name in the claims provided by the SAML IDP, logged-on users are dynamically added to the corresponding user groups within the environment. When group membership changes on a next login, group membership within the Cloud environment is updated accordingly.

User Group names are case sensitive — the group name from the claims and the group name in the Cloud environment must match exactly.

On-demand User Information Retrieval
--------------------------------------

When a user logs in via a SAML-linked environment, the Cloud Platform does not pre-populate the environment with all users and groups from the IDP. Instead, it checks whether any of the groups the user belongs to matches a user group in the Cloud environment. If a match is found, the user is automatically added to that group. If no match is found, the user is denied access. To use role-based authentication, add a user group to the environment for each SAML group that is relevant.

Project Publishing Rights for SAML Users
-----------------------------------------

For a SAML user to publish AIMMS projects, the user must be a member of the **AppPublishers** group in the ROOT environment. Because SAML users are only added to user groups after their first login, you must wait for a user to log in at least once before assigning publishing rights. To grant publishing rights:

* In the Portal, go to **User Management**.
* Select the environment corresponding to the SAML configuration.
* Select a user group that the user is a member of.
* Switch to the *ROOT* environment (this retains the current user list).
* Add the user to the *AppPublishers* group.

Following the same steps but adding the user to the *AimmsPublishers* group will grant AIMMS version publishing rights.
