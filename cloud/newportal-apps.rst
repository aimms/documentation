AIMMS Application Management
============================

The Apps page is the central hub for accessing/managing all available applications in your AIMMS Cloud environment. It allows Admins and App Publishers to interact with and manage app deployments efficiently. And end users can access the apps available to them from this page.

.. image:: images/newportal-apps-1.png
    :align: center


Key Features
------------

*For All Users*

* View Available Applications: Browse all deployed applications organized by name or category.
* Search Bar: Use the search bar to find a specific app among the list of available applications.
* Launch App: Click on any app tile to launch it directly (based on your access permissions).
* Stats: View usage statistics and performance data for any available application.
* Publishing Details: View AIMMS version and architecture details of the application.

*For Admin or App Publishers*

By clicking the three-dot menu on any app tile:

* Admins have access to management options for all published apps.
* App Publishers can manage the apps they have published. 

Available options include:

* Stats: View usage statistics and performance data for the selected application.
* Publishing details: View AIMMS Version and architecture info.
* Update: Upload a new version of the existing application.
* Edit:	Change the name, icon, or description of the app.
* App access: Manage which groups have access to the application.
* Set as latest version: Set the 'latest' tag to the application so users always access the most up-to-date version. 
* Select for deletion: Select an App to delete multiple Apps.
* Delete: Delete the current app.

.. note::

	*Stats* and *Publishing details* are avilable to all users.
	
.. image:: images/newportal-apps-2.png
    :align: center
	
Create and Organize Apps
------------------------

* New App Button: Click this to initiate the process of publishing a new app to the portal.
* New Category Button: Group apps under custom categories for easier organization.

.. image:: images/newportal-apps-3.png
    :align: center

App Categories
--------------

You can categorized your AIMMS PRO applications. Admin users can add categories using New category button and edit/delete category by hovering on category name on the apps page. There is always one default category 'other'. Once you have added some categories to your portal, category field is available while publishing, updating or editing the application. If you do not assign any category to your application then by default it has 'other' category. Also on the apps page apps are shown in the alphabetic order of categories, applications with the 'other' category comes last on the page. 

.. image:: images/newportal-apps-4.png
    :align: center

Publish New App
---------------

Any PRO-enabled AIMMS project can be published onto an AIMMS PRO Portal. PRO-enabled projects must be made available in the form of a ``.aimmspack`` file (In AIMMS developer using menu **File** then **Export End User Project...** ), and can be published through the **Apps** area of the portal. Any user with 'Admin' or 'App Publisher' role will have a **New app** button available in the **Apps** area, through which they can publish PRO-enabled ``.aimmspack`` files.  You have to provide these information about the application:
 
* App aimmspack: .aimmspack file of an AIMMS project. 
* App name: the name by which the application will be identified.
* App version: the application version. The combination of the name and version should be unique.
* App description: a descriptive text to be displayed in the portal.
* App category: using this you can categorized your AIMMS PRO applications. This field is available only if you have added categories on your Portal.
* App icon: icon of an app to be displayed on Apps, when not selected it will use the default app icon.
* AIMMS version: Available AIMMS version used to deploy the AIMMS application. 

.. image:: images/newportal-apps-5.png
    :align: center

App Access
----------

After an app is published, **Admins** or **App Publishers** can manage its accessibility by assigning it to specific **Groups**. This determines which users can access the app.

**Groups Tab**

The **Groups** tab displays the list of groups that currently have access to the app. From here, you can:

* View assigned groups
* Add groups
* Remove a group from App Access by clicking the three-dot menu next to the selected group

**Users Tab**

The **Users** tab shows a list of users who have access to the app through their membership in the assigned groups. This view is automatically populated based on group membership.

.. image:: images/newportal-apps-6.png
    :align: center

Set as latest Version
---------------------

You can tag application as 'latest' from the App options menu. The idea behind this is, an Admins or AppPublishers can assign the 'latest' tag to the application when they publish a newer version of the same application so that end users can always have the newer(latest) version of the app available through direct app launch. 

* It's a unique tag, meaning only 1 version of the same app can be tagged as 'latest'. When you assign the 'latest' tag to other version of the app then it removes the tag from previous one.
* When you update the 'latest' App and use option 'Update and hide old version' then 'latest' tag will be assigned to new App.
* End users can always launch the latest version of the application using direct App link i.e. *https://aimmsproserver/launch/AppName/tag/latest* 
* To launch a specific page of latest App, you can append  *?page=Main%20Project/pagename*  to above link. For example, if you want to open 'Production Planning' page of latest 'Meals Test' App then link will be *https://aimmsproserver/launch/Meals%20test/tag/latest?page=Main%20Project/Production%20Planning* 

.. note::

	This URL is case sensitive. i.e. MainProject(folder name), ``pagename`` specified in the link should match in case sensitive manner with the folder name, ``pagename`` inside your App for AIMMS PRO to recognize it correctly. 


Update App
----------

Allows you to upload a new version of the existing application. When updating an application, after uploading a new ``.aimmspack`` file, the AIMMS PRO will already copy all the settings and app access of the application version you wish to upgrade, allowing you to change only those values that really need to be changed. You have the option to keep or to hide the previous version of the application. If you hide it, it will become invisible to all users, except those with global administrative privileges, but existing queued jobs will still be able to access it. If you delete an application, queued jobs may fail altogether. You are therefore strongly advised to select the option to hide the previous version, and only delete it after all queued requests have been completed successfully.

.. image:: images/newportal-apps-7.png
    :align: center

Direct App Launch
-----------------

It is possible to directly launch an application (desktop/WebUI) without first going to Portal's apps page after login. Any AIMMS application on your AIMMS PRO Portal is accessible by direct launch link i.e. *https://aimmsproserver/launch/AppName/AppVersion*

By default it will open default start page of an App. It is also possible to open a specific page by adding  */Main%20Project/Pagename*  to this link. i.e.  *https://aimmsproserver/launch/AppName/AppVersion/Main%20Project/Pagename*. 

.. note::

	This URL is case sensitive. i.e. MainProject(folder name), ``pagename`` specified in the link should match in case sensitive manner with the folder name, ``pagename`` inside your App for AIMMS PRO to recognize it correctly.

 Once you have bookmarked this link or created a desktop shortcut then you can directly open an app. This means AD/SAML users can start an AIMMS application in a single click (as login would be automatic for them) and other users will be first redirected to login page and after successful login it will directly load that particular app. 


