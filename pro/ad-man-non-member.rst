Link to Active Directory for Non-AD Member Servers
--------------------------------------------------

The AIMMS PRO framework also allows setting up a link to an Active Directory domain, if the PRO server is not a member of the Active Directory domain. In that case, some additional steps are required:

* Your IT department needs to *set up a service account*, with rights to delegate to any service using Kerberos.
* You need to specify the credentials of this service account in the `AD settings <admin-config.html#ad-settings>`_ section under the Configuration Menu of AIMMS PRO Portal.
* You need to *associate the Service Principal Name* of your PRO server with this service account through the *setspn* command.
* The users' browsers need to be properly configured.
 

Setting up a service account
++++++++++++++++++++++++++++

As mentioned above your IT department needs to set up a service account, with rights to delegate to any service using Kerberos. This procedure won't be covered in this manual.
But let's assume that now you have such an account with username *ADUser* and password *ADPassword*. And you have a domain called *ADDomain* that will be used for your users to access AIMMS PRO. And your PRO portal is available at host *pro.myhost.com*.

Set Active directory settings under Configuration menu of PRO Portal
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

1. Navigate to `AD settings <admin-config.html#ad-settings>`_ under the Configuration menu of the AIMMS PRO Portal.
2. Enter *ADDomain* in domain field, *ADUser* in Username field, *ADPassword* in Password field.
3. Save your configuration by clicking the corresponding button.

Associate the Service Principal Name
++++++++++++++++++++++++++++++++++++

To determine the Service Principal Name (SPN) for your PRO server, you must know the DNS name by which PRO clients will reach the PRO server. This is the host name you specified in the **Web URI** field in the PRO Configurator for this node. Assuming this DNS name is *pro.myhost.com*, the Service Principal Name you need to associate with the service account will be
<p style="text-align: left">*HTTP/pro.myhost.com*</p>

(please note the capitals used). If the service account username is *ADUser* within the AD domain *ADDomain*, you can associate the SPN with it through the command

.. code::

    setspn -a HTTP/pro.myhost.com ADUser
    
If needed, you can associate multiple SPNs with a single service account. 

.. warning:: Do not run this command for PRO server instances that ARE in the AD domain. Running the command will result in breaking AD functionality (and this can be fixed by invoking setspn -d ...).

You can check which SPNs are associated with the account by entering

.. code::

    setspn -l ADUser*

After you have added the association, it may take some time before these changes are replicated throughout your AD forest.

After you have prepared the service account as above, you can associate a PRO environment with *ADDomain* by clicking the link icon on the right side of the environment box. Because your PRO server is now not a member of an AD domain, the domain field will show *noDomain*. You should replace it by *ADDomain*.

**Please see the section Group SIDs (for a Server not in the AD Domain)** below in order to understand how to create user groups for a Server not in the AD Domain.

Useful diagram explaining which AD setup you should choose. 

.. image:: images/choose-ad-setup.png
    :align: center

Browser configuration
+++++++++++++++++++++

Below, you can find the configuration that needs to be done to the browsers of the AIMMS PRO users. You will need to go through these steps for HTTP as well as for HTTPS.

* IE: Add example.com to the "Local intranet" zone. For this, click the Settings Gear in IE->Internet Options->Security->Local intranet->Sites->Advanced. Then add the url of the AIMMS PRO Portal (example: "http://example.com").
* Google-chrome uses the IE configuration steps above.
* Firefox: go to about:config, "say you'll be careful", change the value for 'network.negotiate-auth.trusted-uris' into 'https://,http://example.com' and the value for 'network.negotiate-auth.delegation-uris' into 'http://example.com'


.. note:: **Note for IT administrators**

    To reduce the hassle for your users, you could propagate this setting as a Windows Group Policy. For more information, visit the `Adding Sites to the Enhanced Security Configuration Zones <https://msdn.microsoft.com/en-us/library/ms537181%28v=vs.85%29.aspx>`_ page.

Single Sign-on
++++++++++++++

After enabling an environment for Active Directory authentication, any user navigating to the AIMMS PRO portal will be logged in automatically (without seeing the login screen) with his/her Active Directory account. As a result of a successful authentication, the PRO server will create a corresponding user within the Active Directory enabled environment. In order to log in as a different user or on a different environment, the user should log out. When that happens (manually logout), the user will be returned to the AIMMS PRO login screen.

Single Environment for Each Domain
++++++++++++++++++++++++++++++++++

Because of the way the single sign-on procedure works, you should only have a single environment linked to any particular Active Directory domain. If you try to link another environment to an Active Directory domain which already has an environment linked to it, you will see a corresponding error message and your changes will not be saved.

Role-based Authentication
+++++++++++++++++++++++++

When you add groups to an Active Directory enabled environment of which the name or description matches the name of a security group within the Active Directory domain,
logged on users will be dynamically added to the user groups within the environment that correspond to security groups of which they are a member. When the group membership changes upon a next logon, the group membership within the AIMMS PRO environment will change accordingly. Group membership of the *admin* group of the environment or groups within other environments will not be affected by this dynamic group membership modification mechanism.

Group SIDs
++++++++++

When the PRO server is not a member server of your AD domain, it will not be able to retrieve the names of the security groups of which AD users are a member, because such servers do not have, or need to have, a direct connection to your Active Directory infrastructure. In such a case, the server will have access to the *Security Identifier* (SID) of any group of which the logged-on user is a member. In such a case, you should enter the group SID of any AD security group you want to link to the PRO environment in the description field of the corresponding PRO group. This will allow the PRO server to also match PRO and AD groups on the basis of SIDs.

.. tip::

    To obtain the AD group SID, use the command psgetsid from the `Sysinternals suite <https://technet.microsoft.com/en-us/sysinternals/bb545021.aspx>`_.

On-demand User Information Retrieval
++++++++++++++++++++++++++++++++++++

After you link an environment to an Active Directory, the environment will not be populated with all users and security groups from the Active Directory. When a user logs in via an environment that is linked to an Active Directory, AIMMS PRO will only check if any of the Active Directory security groups that the user is a member of, matches with a user group in AIMMS PRO. If a matching user group is found, the user is automatically added to this user group in the environment. When no matching groups can be found, the user will be denied access to the AIMMS PRO server. This means that in order to work with role-based authentication, you must first add a user group to the environment for each Active Directory security group that is relevant.

Time before user changes are propagated to the PRO server

AIMMS PRO uses the SPNEGO protocol to obtain a Kerberos ticket for an AD user on behalf of the PRO server.  The PRO server retrieves the  user info, and the Active Directory groups of which the user is a member from this Kerberos ticket. The ticket is requested by, *and cached at*, the client computer from which the user connects to the PRO server, and passed on to the PRO server without reconnecting to the Active Directory KDC to obtain a refreshed Kerberos ticket *until the lifetime of the Kerberos ticket has expired*. Hence, the speed by which the PRO server will be updated with modified group membership is determined by the Kerberos ticket lifetime that is specified within your Active Directory domain. 

Project Publishing Rights for Active Directory Users
++++++++++++++++++++++++++++++++++++++++++++++++++++

In order for a user to be allowed to publish AIMMS projects, the user needs to be a member of the *AppPublishers* group in the *ROOT* environment. However, Active Directory users are only added to user groups in the environments that correspond to the Active Directory security groups they are a member of, after they login for the first time. This means that before you can add a specific Active Directory user to the *AppPublishers* group, this user must first have logged in once to the AIMMS PRO Framework. After this, you can give app publishing permissions to this user with the following steps:
 
* select the environment corresponding to the Active Directory,
* select any of the user groups this user is a member of,
* select the *ROOT* environment (this will not change the list of users, but only the list of user groups), and
* drag the user into the *AppPublishers* user group.


Following the same steps, but only dragging the user into the *AimmsPublishers* group will give AIMMS version publishing rights to the Active Directory user.