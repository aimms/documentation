Linux Setup
============


This chapter describes how to set up the AIMMS Network License Server on a Linux machine. 

There are two binaries installed with the AIMMS Network License Server on Linux: the deamon and the manager. The daemon is the actual license server that listens for license requests from AIMMS clients. The manager is a command line tool that allows you to manage the license server. Both the daemon and the manager are installed when you install the AIMMS Network License Server.
The AIMMS Network License Server is a daemon that runs in the background and listens for license requests from AIMMS clients. The daemon is started automatically after installtion and when the machine is booted using systemd.

Setting up a license
---------------------

The easiest way to install a license is to use the nodelock activation mechanism. This requires that you have an activation code and the license number acquired from AIMMS. Next you can activate the license using the following commands:

.. code::
cd /usr/local/Aimms/Bin
./licman --nodelock-activate  <aaa.bbb.ccc.ddd> --type machine --activation-code <xxxxx-xxxxx-xxxxx-xxxxx-xxxxx> --add-license
./licman --profile-add <profilename> --license <aaa.bbb.ccc.ddd>

Ports in use by the AIMMS Network License Server
------------------------------------------------

The license server listen ports 3400 and 3401 by default. In the current version this cannot be configured


.. spelling:word-list::

  presolved
  iODBC
  linux
  keypress
  keypresses