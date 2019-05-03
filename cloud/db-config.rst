AIMMS Cloud Database and VPN configuration
==========================================

.. note::

    This section of the Cloud Platform documentation only applies when your AIMMS Cloud Platform subscription provides you with an application database.

This section describes how to manage and administer the application database and connectivity (through VPN or otherwise) to it.

General Idea
------------
We would like to offer a secure environment to give you access to your application database. In the past we offered IP range filtering on your database, but leaving the database open to public the internet. In the current solution the database will only be accessible from within an AIMMS session.

If you however need direct access to the application database, we offer two possibilities:

 * use the database tunnel application, or
 * setup a VPN connection.

When you need occasional access to the database (e.g. to inspect some tables, alter the schema, add users, etc.) just using the database tunnel application would probably be sufficient. However if you need more permanent access, e.g. when you regularly synchronize between an on-premise resource and the application database, we recommend setting up the VPN connection.

The picture below shows the conceptual network topology:

.. image:: images/AIMMS-Cloud-VPN.png
    :align: center

Initial Database Setup
----------------------
When you have just received your administrator login credentials of AIMMS PRO Portal, the application database will not be immediately ready for use. You will first need to set it up. You can do so by pressing the **Create** link.

.. image:: images/db-config-initial-setup.png
    :align: center
    
Next it will show the following dialog:

.. image:: images/db-config-create-initial-db.png
    :align: center

where you need to fill in the username and password for the database administrator that will be accessing the to be created database. Note that password needs to be longer then 8 characters and can be any printable ASCII character except "/", """, or "@". Next to that, you can assign an IP address range for the private network that will be created to host the database in at the AIMMS Clouud side. You can also choose to automatically assign this range. The choice of this IP address range becomes important when you need/want to setup a VPN connection to this database. It will always be possible to migrate that database to a different IP range, but that will cost some downtime of the database, and thus some downtime for your applications. See the database migration and VPN section in this document for more details.

After pressing the **Create Database** button you will be navigated back to the main page, where you will see that first a network will be created to host the database in:

.. image:: images/db-config-create-initial-db-networks.png
    :align: center

Typically it will take about 20 minutes for the database to be created, when it is done the status will become '*Ready To Use*' and the Endpoint field will have been set.

.. image:: images/db-config-create-initial-finished.png
    :align: center

The Endpoint is the host name under which the database will be reachable from within an AIMMS session. 
    
Further, the network type has changed to **Production**

.. image:: images/db-config-create-initial-finished-network.png
    :align: center


Specifications and Requirements for a VPN Connection
----------------------------------------------------
Before setting up the VPN, be sure you have the following information available, typically this requires the involvement of your IT department:

 * The AIMMS Cloud db network CIDR range: this can be any /26 network range in the any of the private network ranges: 10.0.0.0/8, 172.16.0.0/12 and 192.168.0.0/16, but excluding the 10.32.0.0/12 and 172.17.0.0/16 ranges (which we use for our own services). Furthermore, it cannot have any overlap with any of our other customers PRO Cloud ranges. This range is specified as the address range of the network. When you submit this range to create a network, we will verify those range conditions.
 * The Customer network CIDR range: this can be any network range in any of the private network ranges: 10.0.0.0/8, 172.16.0.0/12 and 192.168.0.0/16, but excluding the 10.32.0.0/12 and 172.17.0.0/16 ranges (which we use for our own services). This range needs to be specified when creating the VPN (see below).
 * The Customer public IP address: this is the public IP address to reach your VPN appliance. This IP address needs to be specified when creating the VPN (see below).

After setting up the VPN connection in the AIMMS Cloud, you will be able to download a document describing the steps necessary at your side to setup the VPN, this includes two pre-shared-key (PSKs) to setup the two VPN tunnels. We recommend you to setup two tunnels to ensure availability of your connection. We will be doing unannounced maintenance on the VPN tunnels, but we will make sure it will never be those two tunnels at the same time.

Adding a VPN Connection
-----------------------
You can add new VPN connections to a network by navigating to the **View VPN Connections** on the main database configuration screen for the appropriate network. If a different CIDR is required for the network, first create a new network with the appropriate settings.

.. image:: images/db-config-new-vpn-connection.png
    :align: center

Here you will see some more details of the network. Note the Pinghost IP address, after creating the VPN and setting it up at your local side, you should be able to ping this host.

Pressing **Add New VPN Connection** will bring up the following dialog:

.. image:: images/db-config-new-vpn-connection-add.png
    :align: center

Where the Company CIDR is the IP range at your private network side, and the Company Gateway IP is the public IP address. Optionally you can add an description to identify this VPN connection, e.g. 'Seattle office'. After creating the new VPN you will be redirected to the VPN Connections/Network details page. Typically this will take about 4-5 minutes.

.. image:: images/db-config-new-vpn-connection-added.png
    :align: center

When the VPN connection has been created successfully, you can download a configuration file. 

.. image:: images/db-config-new-vpn-connection-done.png
    :align: center

We have several device specialized configurations available. If your device is not on the list, you can choose the Generic configuration file, alternatively you can contact our customer support to check if we can help you with configuring your specific device.

Setting up a New Network
------------------------
You want to setup a new network because of either two reasons:

 * The IP address range of the current network needs to change because of changed on-premise network conditions.
 * You want to migrate from the prior publicly available database to a database on the private network (potentially using VPN to access it).
In both situations you end up with a network of type **Test**. You can migrate your database to this network, after which it automatically becomes of type **Production** and the potential prior network (and its VPN connections) will be deleted. Prior to that you might want to add VPN connections to this network and test whether you have setup the VPN correctly by pinging the pinghost, see also `Adding a VPN Connection`_.

To setup a new network, you can press the **Add New Network** button on the main database configuration page. 

.. image:: images/db-config-new-network.png
    :align: center

Here you will have the option to either auto assign the network CIDR range or specify it yourself. As listed at `Specifications and Requirements for a VPN connection`_ this range can be any /26 network range in the any of the private network ranges: 10.0.0.0/8, 172.16.0.0/12 and 192.168.0.0/16, but excluding the 10.32.0.0/12 and 172.17.0.0/16 ranges (which we use for our own services). Furthermore, it cannot have any overlap with any of our other customers PRO Cloud ranges. This range is specified as the address range of the network. When you submit this range to create a network, we will verify those range conditions.

Creating a new network will take about 3 minutes:

.. image:: images/db-config-new-network-creating.png
    :align: center

Migrating the Database
----------------------
.. warning::

    Migrating the database will result in a change of the database IP address. Please make sure that all your AIMMS applications and potentially other applications accessing your cloud database use the FQDN specified at the endpoint field before migrating. The migrate mechanism will update the DNS entry to reflect the new IP address.

In order to migrate your database, you first need to setup the destination network to migrate to, see `Setting up a New Network`_ above. When there is a network of type **Test** it will have the action **Migrate Database Here** available. When you click that link you will directed to the Database Migration page. 

.. image:: images/db-config-migrate-db.png
    :align: center

Here you need to enter the date and time to schedule the migration. The migration takes a downtime of approximately 45 minutes for access to your database. During this time your AIMMS applications will not be able to access the database and thus are likely to not be functional. The time is specified in your local time zone, according to the browser your accessing the AIMMS Cloud Portal with. After submitting the date and time for migration you will be directed to the main Database Configuration page where you will see the migration has been scheduled:

.. image:: images/db-config-migration-scheduled.png
    :align: center

When looking at the Database Configuration page during the scheduled migration time, it will display both networks being in a '*Migration In Progress*' state:

.. image:: images/db-config-migration-inprogress.png
    :align: center

When the migration is finished it will display the migration status as '*Completed*' and the previous production network will have been removed:

.. image:: images/db-config-migration-completed.png
    :align: center



