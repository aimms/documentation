AIMMS Application Management
============================

Publishing Applications
-----------------------

Any PRO-enabled AIMMS project can be published onto an AIMMS PRO Server. PRO-enabled projects must be made available in the form of a .aimmspack file, and can be published through the **Apps** area of the portal. All members of the admin and the *AppPublishers* groups will have a **publish** button available in the **Apps** area, through which they can publish PRO-enabled .aimmspack files. After selecting a .aimmspack file and an (optional) application icon to be used in the portal, you have to provide some additional information about the application:
 
* Application name: the name by which the application will be identified within the AIMMS PRO Framework.
* Application version: the application version. The combination of the name and version should be unique.
* Description: a descriptive text to be displayed in the portal.
* AIMMS version: the published AIMMS version used to deploy the AIMMS application.
* License profile: the license profile to be used for server-side optimization sessions of this application.


Configuring User Access
-----------------------

After supplying the application details, you will get the possibility of setting the user access rights for this application. In the screen that follows, you will see a block for each environment, user group, and user.

Different Rights
----------------

In the blocks you will see three different rights:


* **r**: This stands for read access. If a user has read access for an application, it means that the user will see this application in his application list on his app screen.
* **w**: This stands for write access. If a user has write access for an application, it means that the user is able to modify the properties and access rights of the application. Furthermore, the user is also allowed to delete and update the application.
* **x**: This stands for execute access. If a user has execute access for an application, it means that the user is able to run the application.

For ordinary application access, you need to enable read and execute access.

Hierarchy of Rights
-------------------

Next to each of the rights indicators, you will see a color. If the circle is grey, it means that this user, or user group has the same rights as its parent (i.e. a user will inherit the rights from the user groups it is in and a user group will inherit the rights from its parent environment). For the particular case of environments, if permissions have not been defined yet (i.e. are grey), the users of that environment will not have any kind of access to that application. If the circle is green, it means that the user has this particular right, while the color red indicates that the user, user group or environment has been denied this particular access right. Deny will always take precedence over any other permissions in the Hierarchy of rights (e.g.: setting a red execute permission for an app at the environment level will prevent anyone in that environment from executing the app, even if that user or group have explicitly set green execute permission for the app; this same rule applies for users that are part of different environments, deny will always take precedence).

Changing Permissions
--------------------

After you have published the application, you can always change the access rights of the application through the **permissions** link in the info box of the application. You will only see this link if you have write access to the application.

Updating and Deleting Applications
----------------------------------

If you have write and execute access to the application, you may also update and delete the application. When updating an application, after uploading a new .aimmspack file, the AIMMS PRO server will already copy all the settings and access rights of the application version you wish to upgrade, allowing you to change only those values that really need to be changed. You have the option to keep or to hide the previous version of the application. If you hide it, it will become invisible to all users, except those with global administrative privileges, but existing queued jobs will still be able to access it. If you delete an application, queued jobs may fail altogether. You are therefore strongly advised to select the option to hide the previous version, and only delete it after all queued requests have been completed successfully.

Starting from PRO 2.16, you can delete multiple Apps together by using 'Delete selected' button. This will also delete the application from PRO storage. 

Windows 8 support
-----------------

In case your users use Windows 8 or above, only the applications published with an AIMMS version higher than 3.13.2.370 will work on their machines.
