Setting up an AIMMS PRO Cluster
===============================

Setting up a PRO cluster is a task that consists of three steps: connecting all nodes to the same database, pointing them to a shared storage directory and setting up the bundled ActiveMQ server.

.. warning::
    Be sure to follow all three steps, especially the last one, the ActiveMQ setup. Starting PRO without the cluster-configured ActiveMQ, will cause very erratic session start behavior (e.g. long queue times while enough resources/licenses), and potentially loss of communication between the Desktop session and the solver session. 

Step 1. Connecting all Nodes to the Same Database
-------------------------------------------------

All your nodes need to be connected to the same database. This can be a database on one of the nodes (AIMMS PRO comes with a bundled PostgreSQL database) or a PostgreSQL database running on a dedicated server.

Before proceeding to connect all the nodes to the database, make sure that your PostgreSQL server settings allow non-local connections. Stop your 'Aimms PRO Postgresql-x64-9.3' Windows service, modify *pg_hba.conf* (located in "*dataDir*\\pgsql\\data\\", by default that would be "C:\\ProgramData\\AimmsPRO 2.0\\pgsql\\data\\"). The comments in the file will tell you what you need to do.
For example, to enable all incoming IPv4 connections (this is a security risk), add the following line in the IPv4 local connections section:

.. code-block:: none

    host all all 127.0.0.1/0 md5

After you're done, start the 'Aimms PRO Postgresql-x64-9.3' Windows service again.

.. important::

    Make sure that the firewall on the machine where you have your database server allows incoming connections to the specified database ports.

In order to have all the AIMMS PRO nodes pointing to the same database, you need to run the AIMMS PRO Configurator on each node and change the settings in the `Connection configuration <config-sections.html#connection-configuration>`_ section. More specifically, the host field should point to the fully qualified domain name (FQDN) of the server on which the shared database resides. So, on the second node that you add to a cluster, replace the localhost part with the FQDN of the first node of the cluster.

The values in the PRO Configuration section are common for all your nodes. If you configured AIMMS PRO properly on one node, there is no need to go through this step on other nodes in your cluster, as the information is simply retrieved from the commonly accessed database. However, you may want to modify the capacity or the URI's for particular nodes as described in `Configuration specific for separate nodes <config-sections.html#configuration-specific-for-separate-nodes>`_.

Step 2: Shared storage directory
--------------------------------

In order to successfully work, the AIMMS PRO cluster needs to have access to a network shared directory (supporting `SMB/CIFS <http://en.wikipedia.org/wiki/Server_Message_Block>`_). It can be a directory on a dedicated file server or a shared directory on one of your cluster nodes. You should set the path to that directory in the *Storage Directory* parameter in the PRO configuration section of the AIMMS PRO Configurator as described above.

.. important::
    Note that AIMMS PRO 2.0 runs as a service, so the windows user that runs that service (Local system by default) needs to have full access to the directory. This may require changing the *Log On* settings for your 'Aimms PRO 2.0 Service' Windows service.

Step 3: ActiveMQ Setup
----------------------

.. note::
    If your AIMMS PRO version is before 2.17, you can skip this section, because ActiveMQ is not available in those versions

In a cluster, all AIMMS PRO nodes should be using the same ActiveMQ connection. AIMMS PRO comes with bundled ActiveMQ server. You need to configure it.

The simplest setup means that nodes are using single ActiveMQ server on one of the nodes. In AIMMS PRO Configurator change value of URL of the JMS broker from localhost to the proper hostname of a node that runs ActiveMQ server. If you want a failover configuration, use this `link <http://activemq.apache.org/failover-transport-reference.html>`_ to set it up.

Please note that you may change port and host on which ActiveMQ server runs. Modify *dataDir*\\Config\\jms-broker.properties, change *listen.uri* value there or leave it empty if you want to turn bundled ActiveMQ off and use your own JMS server or use a server on another cluster node:

.. code-block:: none

    # URI on which JMS broker is listening. By default, listen for connections from all hosts.
    # Change to tcp://localhost:61616 to listen only to local connections.
    # Leave blank if you don't want to start a JMS broker on this particular node (if you're using your own JMS broker or it runs on a different cluster node).
    listen.uri=tcp://0.0.0.0:61616


Check that the cluster was set up properly
------------------------------------------

After you have added the second node to the cluster, according to the instructions above, you should start the AIMMS PRO services on that second node. To make sure that the cluster setup was done properly, publish an application and run a couple of jobs from it. After doing so, by looking at the jobs page of the portal, you should see that jobs were executed on both nodes of the cluster.

PRO internal database connections
---------------------------------

Depending on the way you will be using AIMMS PRO, the number of connections that the bundled database server handles at a time can prevent AIMMS PRO from functioning properly. AIMMS PRO needs 16 connections per node, plus 2 connections for each job that you want to run on your cluster. The resulting number needs to be increased to be a multiple of 16 (i.e. 16, 32, 48, etc).

The formula is: 16*N + 2*S, where N is the number of nodes in the cluster, S is the maximum number of sessions your cluster allows to run in parallel. For example: if you have a cluster of 4 nodes and you intend to run 10 sessions at the same time on that cluster you will need 264 connections. So you will need to allow 272 connections (272 is the closest bigger number than 264 is a multiple of 16).

You will see a warning message in the `Start/stop services <config-sections.html#start-stop-services>`_ section of the AIMMS PRO Configurator if your database server allows less connections than the number required.

By default, the bundled PostgreSQL server that comes with your AIMMS PRO installation is configured to allow a maximum of 128 connections. If that is not enough, you will need to stop the 'Aimms PRO Postgresql-x64-9.3' Windows service, modify the *postgresql.conf* file (located in "*dataDir*\\pgsql\\data\\"; by default that would be "C:\\ProgramData\\AimmsPRO 2.0\\pgsql\\data\\") and start the Windows service again. The setting you need to modify is called *max_connections*.


Other prerequisites
-------------------

All AIMMS PRO nodes need to have a synchronized date and time. The functioning of the cluster requires that the servers that are part of it have the same date and time. This is usually achieved by using NTP.

Guidelines for using the cluster
--------------------------------

When running in a cluster, all the servers will have a fully functional AIMMS PRO installation running on them. This means that an AIMMS PRO Portal instance will be available on every server. As a best practice, we recommend not giving their addresses directly to users, but creating a general entry in the DNS and relating that to the AIMMS PRO Portal instances.

Moving from a single node configuration
---------------------------------------

A likely scenario is that you have used AIMMS PRO in a single node configuration and now you are switching to a multiple node configuration (cluster). If you have already published AIMMS versions and AIMMS applications, they have been stored on the local machine storage. Now that you have configured the Shared storage to be a network folder, you will need to manually move those files from the local storage folder to the network folder. This folder is located at *dataDir*\\Data\\Storage. By default, you can find this folder in *C:\\ProgramData\\AimmsPRO\\Data\\Storage.*

