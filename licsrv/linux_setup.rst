Linux Setup
============


This chapter describes how to set up the AIMMS Network License Server on a Linux machine. 

The AIMMS Network License Server on Linux consist of two binary components: the daemon (licsrv) and the manager (licman). The daemon is the actual license server that listens for license requests from AIMMS clients. The manager is a command line tool that allows you to manage the license server. Both the daemon and the manager are installed when you install the AIMMS Network License Server. The daemon is started automatically after installation and when the machine is booted using systemd.

Setting up a license
---------------------

The easiest way to install a license is to use the nodelock activation mechanism. This requires that you have an activation code and the license number acquired from AIMMS. The license files (.lic and potentially .cpx) need to be stored in the ``/usr/local/Aimms/Licenses`` folder. Next you can activate the license using the following commands:

.. code:: bash

    cd /usr/local/Aimms/Bin
    ./licman --nodelock-activate  <aaa.bbb.ccc.ddd> --type machine --activation-code <xxxxx-xxxxx-xxxxx-xxxxx-xxxxx> --add-license
    ./licman --profile-add <profilename> --license <aaa.bbb.ccc.ddd>


The first command activates the license on the machine. The second command adds the license to a profile. The profile is used to group licenses together. The profile name is used in the AIMMS client to select the license to use.

Ports in use by the AIMMS Network License Server
------------------------------------------------

The license server listen ports 3400 and 3401 by default. In the current version this cannot be configured


.. spelling:word-list::

  presolved
  iODBC
  linux
  keypress
  keypresses
  daemon
  licman
  systemd
  lic
  cpx