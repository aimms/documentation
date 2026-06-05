AIMMS Cloud and Data Management
================================

Where to Locate Data
--------------------

You can read data from files contained in the same directory as the published model, or in any of its subdirectories, if those files are exported as part of the ``.aimmspack`` file. You should never write persistent data to such files, as a next session may run from a different location or on a different server node. For persistent data, use one of the options described below.

Cloud Data Considerations
--------------------------

The AIMMS Cloud Platform runs in a managed cloud environment. Keep the following in mind when designing your data architecture:

* **Cloud storage (PRO Central Storage):** The PRO Central Storage area on the Cloud backend is the recommended location for persistent files shared across sessions. Use ``pro::SaveFileToCentralStorage`` and ``pro::RetrieveFileFromCentralStorage`` to transfer files between local and cloud storage.

* **Database connections:** If your app connects to an external database that is not directly reachable from the Cloud, use tunneling to proxy the connection securely. See :doc:`tunneling` for details.

* **VPN / private databases:** For Cloud-hosted databases (e.g. a database provisioned alongside your Cloud environment), WebUI sessions running on the Cloud server can connect directly without a tunnel. WinUI sessions and AIMMS IDE sessions running on end-user desktops require a tunnel.

* **Network shares:** On-premises network shares are generally not accessible from Cloud sessions. Prefer PRO Central Storage or a cloud-hosted database.

PRO Central Storage
-------------------

PRO Central Storage is a central file storage area on the Cloud backend. Each folder and file can have read, write, and execute access rights assigned to specific users and groups. The AIMMS Case Manager filters out all files and folders to which you have no access.

PRO User Cases
--------------

The *PRO User Cases* area in the AIMMS Case Manager is a private, application-specific storage location on the Cloud backend. The storage location is the same for all published versions of the same application, so data from previous versions remains available when you upgrade. Only you (and members of the admin group) can access this location.

PRO Shared Cases
----------------

The *PRO Shared Cases* area is an application-specific storage location accessible to all users who have permission to run the application. The storage location is shared across all published versions of the same application.

Central Case URLs
-----------------

You can programmatically load or save cases in PRO Central Storage through AIMMS data management functions such as ``CaseFileLoad`` and ``CaseFileSave``. Use the prefix ``PRO:`` to indicate that the path refers to PRO Central Storage:

.. code::

    spCasename := FormatString("PRO:/UserData/%s/%s/Cases/%s/CentralFile.data",
                               spEnvironment, spUserN, spModel);
    CaseFileSave(spCasename, AllIdentifiers);

Checking Files and Folders in PRO Storage
-----------------------------------------

* ``pro::storage::ExistsBucket(path, bucketExists)`` — checks whether a folder exists.
* ``pro::storage::ExistsObject(path, objectExists)`` — checks whether a file exists.

Do not include the ``PRO:`` prefix in the path argument for these functions. Use ``pro::NormalizeStoragePath`` to strip the prefix if needed. These functions are available from AIMMS PRO 2.33.1 and AIMMS 4.69.1 onwards.

Transferring Files
------------------

To manually transfer files between a local disk and PRO Central Storage:

* ``pro::SaveFileToCentralStorage``
* ``pro::RetrieveFileFromCentralStorage``

Both functions require a local path and a path in PRO Central Storage.

Manipulating PRO Files and Folders
----------------------------------

To create or delete files and folders in PRO Central Storage:

* ``pro::CreateStorageFolder``
* ``pro::DeleteStorageFolder``
* ``pro::DeleteStorageFile``

Access Rights
-------------

``pro::SaveFileToCentralStorage`` and ``pro::CreateCentralStorageFolder`` accept an optional permissions string argument. When you do not specify access rights, PRO will automatically restrict access to the currently logged-on user. To select which users and groups should have which access rights, call ``progui::EditAuthorization`` from the PRO GUI library to open the Authorization Manager dialog.

Using a Database
----------------

You can also use a common database to communicate data between client and server sessions, or between multiple server sessions. Ensure the required ODBC drivers are installed on both the server and client sides. For Cloud sessions connecting to an external or VPN-protected database, see :doc:`tunneling`.
