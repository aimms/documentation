SAML Support
============

Starting from AIMMS PRO 2.20.0, the AIMMS PRO framework allows you to link any environment to a SAML identity provider (e.g. ADFS) so that your users may be authenticated using your own user management system.

In order to enable SAML authentication, you need to configure few things, 

* AIMMS PRO Configuration
* SAML Identity Provider (IDP) Configuration

AIMMS PRO Configuration
-----------------------

Setting up the link is straightforward: Click on the 'Link to SAML' 2nd icon on the right side of the environment box in the users tab of the AIMMS PRO Portal. This will open a dialog in which you must specify the SAML metadata URL. For example, ``https://saml.adfs/federationmetadata/2007-06/federationmetadata.xml``. Leave the URL blank to remove the association.

It is allowed to have two environments pointing to the same SAML IDP.

After enabling an environment for SAML authentication, users would be able to login to that environment either automatically or from the login screen. As a result of a successful authentication, the PRO server will create a corresponding user within the SAML enabled environment.

SAML Identity Provider (IDP) Configuration
------------------------------------------

You will need to configure your SAML identity provider to work with AIMMS PRO service provider.

* First, your AIMMS PRO Portal needs to run using HTTPS.
* Second, you need to add AIMMS PRO metadata to your IDP. You can get that metadata from ``https://your-server-name/sso/saml/metadata.xml``
* Third, you need to configure your IDP to provide claims to AIMMS PRO. Two claims are required and two are optional:

 
    * *Group* (``http://schemas.xmlsoap.org/claims/Group``) – required. -- Groups that user is a member of. E.g. LDAP Token-Groups - Unqualified Names.
    * *Name* (``http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name``) - required. -- Unique user ID. E.g. LDAP SAM-Account-Name.
    * *Given Name* (``http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname``) – optional. -- User’s full name. E.g. LDAP Display-Name.
    * *E-Mail Address* (``http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress``) – optional. -- User’s email address. E.g. LDAP E-Mail Addresses.


Single Sign-on
--------------

After enabling an environment for SAML authentication, any user navigating to the AIMMS PRO portal will be attempted to log in automatically (without seeing the login screen) with his/her SAML account. That means that the user will be automatically redirected to a SAML SSO page and may need to enter his/her credentials.

As a result of a successful authentication, the PRO server will create a corresponding user within the SAML enabled environment. To log in as a different user or on a different environment, the user should log out. When that happens (manually logout), the user will be returned to the AIMMS PRO login screen.

Please note that if you have both an AD and a SAML environments configured at your AIMMS PRO installation, your users will be attempted to automatically log in the AD environment. If you have two SAML environments, SSO won’t be attempted as it’s impossible for PRO to choose between two SAML environments for SSO.

Role-based Authentication
-------------------------

When you add groups to a SAML enabled environment of which the name or description matches the name of a group within the claims provided by SAML identity Provider,
logged on users will be dynamically added to the user groups within the environment that correspond to groups of which they are a member. When the group membership changes upon a next logon, the group membership within the AIMMS PRO environment will change accordingly. Group membership of the admin group of the environment or groups within other environments will not be affected by this dynamic group membership modification mechanism.

Please note that User Group names in AIMMS PRO are case sensitive, i.e., the name of the group from the claims and the PRO group have to match in a case sensitive manner for AIMMS PRO to recognize it correctly.

On-demand User Information Retrieval
------------------------------------

After you link an environment to a SAML IDP, the environment will not be populated with all users and security groups from that IDP. When a user logs in via an environment that is linked to SAML, AIMMS PRO will only check if any of the groups that the user is a member of, matches with a user group in AIMMS PRO. If a matching user group is found, the user is automatically added to this user group in the environment. When no matching groups can be found, the user will be denied access to the AIMMS PRO server. This means that to work with role-based authentication, you must first add a user group to the environment for each SAML group that is relevant.

Project Publishing Rights for SAML Users
----------------------------------------

For a user to be allowed to publish AIMMS projects, the user needs to be a member of the AppPublishers group in the ROOT environment. However, SAML users are only added to user groups in the environments that correspond to the SAML provided groups they are a member of, after they login for the first time. This means that before you can add a specific SAML user to the AppPublishers group, this user must first have logged at least once to the AIMMS PRO Framework. After this, you can give app publishing permissions to this user with the following steps:
 
* select the environment corresponding to the Active Directory,
* select any of the user groups this user is a member of,
* select the *ROOT* environment (this will not change the list of users, but only the list of user groups), and
* drag the user into the *AppPublishers* user group.
 

Following the same steps, but only dragging the user into the *AimmsPublishers* group will give AIMMS version publishing rights to the Active Directory user.
