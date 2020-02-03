Developing Custom Widgets
*************************

Building apps with WebUI does not require any programming skills and the growing built-in widget collection will increasingly cover all your possible requirements for building wonderful apps. However, we do offer the option to add your own widget types, for example adding company-specific data visualizations. The following paragraph describes how to get started.

Open-sourcing WebUI
===================

The AIMMS Widget Framework (AWF) is intended to be a user-extendable framework on which the AIMMS WebUI is based. This allows you to add or modify AWF functionality to meet the requirements of your specific AIMMS WebUI-based application.

We have decided to open source AWF in order to encourage the exchange of innovations made by members of the AIMMS WebUI user community. By open sourcing AWF we invite our clients to contribute to enhance or extend AWF to the benefit of the entire community.

If you want to contribute we require that you enter into a contributor agreement with us. This will allow us to also license your AWF contributions under the commercial AIMMS license. While AWF is open-sourced under the GPLv3 license, which would require that any derived application would also need to be licensed under GPLv3, the commercial AIMMS license will allow you to distribute your AIMMS WebUI-based applications under a closed-source license of your choice respecting the AIMMS License Agreement conditions.

* :download:`Contributor Agreement Individual <../PDF/AIMMS-Widget-Framework-Individual.pdf>`
* :download:`Contributor Agreement Entity <../PDF/AIMMS-Widget-Framework-Entity.pdf>`

Header included in each open-sourced file:

.. code-block:: none

    AIMMS Widget Framework Copyright (C) 2013-{CURRENT-YEAR}, AIMMS B.V., All Rights Reserved. This part of 
    the software is released under ONE of the following licenses: GPLv3, OR AIMMS's license for commercial use.

    GPL license. This program is free software: you can redistribute it and/or modify it under the terms of the 
    GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or 
    (at your option) any later version.   This program is distributed in the hope that it will be useful, but 
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
    See the GNU General Public License for more details.   You should have received a copy of the GNU General Public 
    License along with this program.  If not, see http://www.gnu.org/licenses/.

    A commercial use license is available from AIMMS B.V. as part of the AIMMS PRO offering.
 
Creating custom widgets
=======================
 
AWF allows you to create custom widgets. However, creating your own widgets requires (advanced) knowledge of the AIMMS Widget Framework (AWF), HTML5/JavaScript/CSS and the Cube Server data interface. 

If you want to explore developing your own widgets, please take a closer look at the code for a sample simple-table-widget.

Widget development tutorial
===========================

To get you up-and-running with minimal effort, in the first few tutorials will try to minimize background information and only explain the essentials. Later tutorials will then provide means of explaining the underlying design decisions.

It is important that you have done some of the End-user and App-dev tutorials prior to starting these tutorials. Or, that you have otherwise familiarized yourself with the AIMMS WebUI. You are also required to have some experience in HTML5 (i.e. JavaScript, CSS, HTML, ...).

.. toctree::

    dev-tut-1
    dev-tut-2
    dev-tut-3
    dev-tut-4
    dev-tut-5
    

