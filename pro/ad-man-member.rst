Link to Active Directory for AD Member Servers
----------------------------------------------

.. note::

    This section of the AIMMS PRO documentation does *not* apply to the `AIMMS Cloud Platform <../cloud/index.html>`_. AD integration into the AIMMS Cloud Platform always need to follow the `Active Directory integration for non-AD member servers <ad-man-non-member.html>`_.

If your PRO server is a member server of your Active Directory domain, setting up the link is straightforward: push the link icon on the right side of the environment box in the users tab of the AIMMS PRO Portal. This will open a dialog in which you must specify the Netbios name of the Active Directory (For example MYDOMAIN, not a dns name like mydomain.somewhere.com). 

Browser configuration
+++++++++++++++++++++

Below, you can find the configuration that needs to be done to the browsers of the AIMMS PRO users. You will need to go through these steps for HTTP as well as for HTTPS.

* IE: Add example.com to the "Local intranet" zone. For this, click the Settings Gear in IE->Internet Options->Security->Local intranet->Sites->Advanced. Then add the url of the AIMMS PRO Portal (example: "http://example.com").
* Google Chrome uses the IE configuration steps above.
* Firefox: go to ``about:config``, "say you'll be careful", change the value for `network.negotiate-auth.trusted-uris` into ``https://,http://example.com`` and the value for `network.negotiate-auth.delegation-uris` into ``http://example.com``


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

When you add groups to an Active Directory enabled environment of which the name or description  matches the name of a security group within the Active Directory domain,
logged on users will be dynamically added to the user groups within the environment that correspond to security groups of which they are a member. When the group membership changes upon a next logon, the group membership within the AIMMS PRO environment will change accordingly. Group membership of the *admin* group of the environment or groups within other environments will not be affected by this dynamic group membership modification mechanism.

Please note that User Group names in AIMMS PRO are case sensitive, i.e., the name of the Active Directory security group and the PRO group have to match in a case sensitive manner for AIMMS PRO to recognize it correctly.

On-demand User Information Retrieval
++++++++++++++++++++++++++++++++++++

After you link an environment to an Active Directory, the environment will not be populated with all users and security groups from the Active Directory. When a user logs in via an environment that is linked to an Active Directory, AIMMS PRO will only check if any of the Active Directory security groups that the user is a member of, matches with a user group in AIMMS PRO. If a matching user group is found, the user is automatically added to this user group in the environment. When no matching groups can be found, the user will be denied access to the AIMMS PRO server. This means that in order to work with role-based authentication, you must first add a user group to the environment for each Active Directory security group that is relevant.

Time before user changes are propagated to the PRO server
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

AIMMS PRO uses the SPNEGO protocol to obtain a Kerberos ticket for an AD user on behalf of the PRO server.  The PRO server retrieves the  user info, and the Active Directory groups of which the user is a member from this Kerberos ticket. The ticket is requested by, *and cached at*, the client computer from which the user connects to the PRO server, and passed on to the PRO server without reconnecting to the Active Directory KDC to obtain a refreshed Kerberos ticket *until the lifetime of the Kerberos ticket has expired*. Hence, the speed by which the PRO server will be updated with modified group membership is determined by the Kerberos ticket lifetime that is specified within your Active Directory domain. 

Project Publishing Rights for Active Directory Users
++++++++++++++++++++++++++++++++++++++++++++++++++++

In order for a user to be allowed to publish AIMMS projects, the user needs to be a member of the *AppPublishers* group in the *ROOT* environment. However, Active Directory users are only added to user groups in the environments that correspond to the Active Directory security groups they are a member of, after they login for the first time. This means that before you can add a specific Active Directory user to the *AppPublishers* group, this user must first have logged in once to the AIMMS PRO Framework. After this, you can give app publishing permissions to this user with the following steps:

* select the environment corresponding to the Active Directory,
* select any of the user groups this user is a member of,
* select the *ROOT* environment (this will not change the list of users, but only the list of user groups), and
* drag the user into the *AppPublishers* user group.


Following the same steps, but only dragging the user into the *AimmsPublishers* group will give AIMMS version publishing rights to the Active Directory user.
