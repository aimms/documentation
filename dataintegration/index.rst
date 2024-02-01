Data integration with AIMMS
================================================

This page is your starting point for data integration related questions and topics. You can use the decision tree to find the ideal solution for you with the correct reference materials to help get you going.
This decision tree is solely based on data integration for AIMMS Cloud accounts. If you have an on-premise setup, :doc:`this is your starting point </pro/index>`.

Integration Helper
----------------------------------------------------

.. raw:: html

	<iframe width="100%" frameborder="0" style="border:6px solid #f5f6fa;"  seamless src="https://zingtree.com/live/540964244/embed">
	</iframe>
	<script type="text/javascript" src="https://zingtree.com/js/iframeResizerSmart.js"></script>
	<script type="text/javascript">iFrameResize();</script>

Native options for storing data on the AIMMS Cloud
----------------------------------------------------

There are three AIMMS-native ways to store data within your AIMMS Cloud (all included in the above decision tree):

#.	RECOMMENDED: Every AIMMS Cloud is by default equipped with an `Azure Data Lake Storage Gen2 (ADLS) <https://documentation.aimms.com/dataexchange/dls.html>`_ that you can use freely to store data on and exchange data with.
#.	Another option is to equip your cloud account with `a MySQL database <https://documentation.aimms.com/cloud/db-config.html>`_ for an additional fee.
#.	Your AIMMS Cloud has a so called `PRO Storage <https://documentation.aimms.com/pro/pro-data-man.html>`_ available on which (case) files can be saved.

We highly recommend utilizing the ADLS. 

Further reading
----------------------------------------------------

#.	Read all about `our Data Exchange Library <https://documentation.aimms.com/cloud/db-config.html>`_ here. It includes a section about the `the Azure Data Lake Storage <https://documentation.aimms.com/dataexchange/dls.html>`_.
#.	On our `AIMMS Cloud Database + VPN page <https://documentation.aimms.com/cloud/db-config.html>`_ you will find all the details on this integration method. 
#.	`Our how-to platform <https://how-to.aimms.com/C_Developer/Sub_Connectivity/index.html>`_ provides a wide range of articles with examples on data integration.

Questions and help
---------------------------------------------------- 

If you have questions regarding AIMMS data integration or you're stuck implementing one of the methods, feel free to contact us via support@aimms.com. We are here to help.

.. spelling:word-list::

    dex
    mappingfile
    mappingfiles
    mappingname
	ADLS
	azure
	mysql
	aimms
	how-to
	
	