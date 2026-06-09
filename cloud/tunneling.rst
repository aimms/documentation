Tunneling Support
=================

The AIMMS Cloud Platform allows the AIMMS PRO client to connect to the AIMMS license server and the Cloud backend via a WebSockets proxy running on the HTTPS port of the Cloud Platform. By configuring tunnels through the Portal, any port and host reachable by the Cloud backend (but not by the client) can be made available via this proxy.

General Design
--------------

The AIMMS Cloud Platform exposes a single HTTPS endpoint to the outside world. Traffic to any TCP socket behind the firewall or in the Cloud's private network can be proxied through this HTTPS port using WebSockets.

Based on the tunnel configuration, the Cloud platform maps WebSocket URIs to TCP sockets. When a WebSocket connection is opened, a security check is performed and the connection to the specified TCP socket is established. All traffic then flows through the WebSocket to and from that TCP socket.

The client application (e.g. an AIMMS model) must be modified to support tunneling through the WebSockets proxy. The required changes are described in `Changes to AIMMS model`_ below.

Tunnel Configuration
--------------------

Admin users (members of the admin group in the ROOT environment) can configure tunnels via the Portal. Navigate to **Configuration** → **Tunnels** in the Portal to manage tunnels.

The workflow for adding a new tunnel:

* Log in to the Portal and navigate to **Configuration** → **Tunnels**.
* Click **Add a new tunnel** — an input form appears.
* Enter the three required parameters (see below).
* Save the configuration. The Portal validates the input and, if correct, the tunnel is available immediately. Otherwise, validation errors are shown.

Existing tunnels can be modified or deleted from the same page.

Configuration Parameters
+++++++++++++++++++++++++

* **URI context path** — path in the WebSockets proxy URI that this tunnel is mapped to. URI context paths are case-insensitive.
* **Socket address (TCP)** — the combination of an IP address (or hostname) and port number for the proxied application. Format: ``host:port`` (e.g. ``myDatabaseHost:1433``).
* **User Groups** — semicolon-separated list of Cloud user groups authorized to use this tunnel. Do not include spaces (e.g. ``group1@ROOT;group2@Test`` is valid; ``group1@ROOT; group2@Test`` is not).

    * The default ``.*@.*`` means all Cloud users are authorized.
    * ``.*@Environment`` means any user with access to that environment can use the tunnel.
    * ``Group@.*`` means any user in that group across any environment can use the tunnel.
    * ``Group@Environment`` restricts access to a specific group in a specific environment.

Example scenario
++++++++++++++++

A Cloud administrator wants to create a tunnel to a database available on host *myDatabaseHost* at port *1433*, accessible to users in *AppPublishers@MyEnv* or *AppUsers@AnotherEnv*, and reachable via the URI context path *myDatabase*.

Steps:

* In the Portal, navigate to **Configuration** → **Tunnels**.
* Click **Add a new tunnel** and enter:

    * URI context path: ``myDatabase``
    * Socket address: ``myDatabaseHost:1433``
    * User Groups: ``AppPublishers@MyEnv;AppUsers@AnotherEnv``

* Click **Save**. After validation, the tunnel is active.

Note that you also need to modify your AIMMS model to connect via WebSockets rather than directly to *myDatabaseHost:1433*.

Validation Rules
++++++++++++++++

* URI context paths must be unique. The paths ``backend`` and ``license`` are reserved by the Cloud Platform.
* Socket address must be in the form ``ipAddress:port`` or ``host:port``.
* User groups and environments must exist in the Cloud Platform.

Security
--------

The AIMMS Cloud Platform secures tunnels as follows:

* All connections to the WebSockets proxy go via HTTPS.
* Every connection requires a valid PRO ticket, obtained by authenticating with username and password. Tickets expire and must be periodically renewed.
* Administrators can restrict tunnel usage to specific user groups and/or environments.

What ports need to be open?
++++++++++++++++++++++++++++

If your application uses tunneling, the only port that needs to be exposed is the standard HTTPS port (443) of the AIMMS Cloud Platform. All other application servers can remain behind the firewall.

Changes to AIMMS model
-----------------------

To use a WebSockets tunnel in your AIMMS model, you need to:

1. Start the tunnel — a local socket on localhost is opened and the PRO library tunnels it to the WebSocket endpoint.
2. Modify your connection code to connect to ``localhost:<portNumber>`` instead of the remote host.
3. Close the tunnel when it is no longer needed.

Important things to check when setting up a database tunnel
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

* The correct ODBC driver must be installed on the Cloud server.
* The correct driver must be specified in the connection string as available on the server.
* When running multiple SQL Server instances, only one uses the default port — others use different ports.
* Test the connection string on the server before testing from AIMMS.
* Start with a small AIMMS model that only connects, without other complex logic.

Tunnel creation
+++++++++++++++

Use the following AIMMS PRO Library procedure:

.. code::

    tunnel::TunnelStart( contextPath : string )

This connects to the Cloud WebSockets proxy and opens a local listen socket on localhost, returning the ``portNumber``. The server verifies ticket validity and may raise an error if starting the tunnel fails.

Change the target server endpoint
+++++++++++++++++++++++++++++++++

For an ODBC connection string like this:

.. code::

    DBConnectString:="Driver=SQL Server;Server=sqlserver.example.com,1433;Database=testDB;Uid=tester;Pwd=test123;"

Change it to connect to the local tunnel entry-point:

.. code::

    DBConnectString:=FormatString("Driver=SQL Server;Server=localhost,%i;Database=testDB;Uid=tester;Pwd=test123;", tunnelPortNumber);

For an Oracle connection string:

.. code::

    DBConnectString:="DRIVER=Oracle in OraDB12Home1;dbq=oracle.example.com;UID=tester;DSN=OracleTestDB;Pwd=test123;";

Change it to:

.. code::

    DBConnectString:=FormatString("DRIVER=Oracle in OraDB12Home1;dbq=localhost:%1;UID=tester;DSN=OracleTestDB;Pwd=test123;", tunnelPortNumber);

Adapt the connection string syntax to your database vendor's specifications.

WebUI vs WinUI vs IDE considerations
+++++++++++++++++++++++++++++++++++++

The need for a tunnel depends on how the AIMMS app is run:

1. **Published WebUI app** — the AIMMS session runs on the Cloud itself and can connect directly to Cloud-hosted databases. No tunnel needed.
2. **Published WinUI app** — the AIMMS session runs on the user's desktop and needs a tunnel to reach Cloud-hosted or private databases.
3. **AIMMS IDE** — the session runs locally and needs a tunnel, either via a running Tunnel App or via a ``pro_arguments.txt`` connection to the Cloud.

Sample code handling all three cases:

.. code-block:: aimms
    :linenos:

    Procedure pr_MakeConnection {
        Body: {
            pr_GetMySQLDriver( sp_DriverName );

            if projectDeveloperMode then
                if pro::GetPROEndPoint() then
                    ! Developer mode with a Cloud connection available — create tunnel directly.
                    pro::Initialize();
                    p_TunnelNo := pro::tunnel::TunnelStart( contextPath : "mysql" );
                    sp_ServerName := "localhost" ;
                else
                    ! No Cloud connection — assume Tunnel App is active on port 13306.
                    p_TunnelNo := 13306 ;
                    sp_ServerName := "localhost" ;
                endif ;
            else
                ! App is published on Cloud.
                if DirectoryExists( "MainProject/WebUI" ) then
                    ! Published WebUI app — connect directly to the Cloud database.
                    p_TunnelNo := 3306 ;
                    sp_ServerName := "aimms-sandbox.db.cloud.aimms.com" ;
                else
                    ! Published WinUI app — create a tunnel.
                    p_TunnelNo := pro::tunnel::TunnelStart( contextPath : "mysql" );
                    sp_ServerName := "localhost" ;
                endif ;
            endif ;

            sp_DatabaseConnection := SQLCreateConnectionString(
                DatabaseInterface              :  'ODBC',
                DriverName                     :  sp_DriverName,
                ServerName                     :  sp_ServerName,
                DatabaseName                   :  "demoideandpro",
                UserId                         :  sp_User,
                Password                       :  sp_Pwd,
                AdditionalConnectionParameters :  formatString("port=%i", p_TunnelNo));

            if not TestDataSource(sp_DatabaseConnection) then
                raise error "Cannot connect to database: " + CurrentErrorMessage;
            endif ;
        }
        Parameter p_TunnelNo;
        StringParameter sp_ServerName;
    }

Tunnel shutdown
+++++++++++++++

Use the following AIMMS PRO Library procedure:

.. code::

    tunnel::TunnelStop( portNumber : parameter )

Known issues
------------

The so-called *happy flow* is operational. Error handling is not yet user-friendly: if an error occurs at the PRO level (e.g. the user is not authorized to use the tunnel), no descriptive error message is given — the socket is closed and the connecting client gives a connection error. You must also always explicitly close any tunnel you open; failing to do so will cause a hang when AIMMS exits. You can use ``pro::tunnel::TunnelStopAll()`` in ``pro::LibraryTermination`` to ensure all tunnels are closed.
