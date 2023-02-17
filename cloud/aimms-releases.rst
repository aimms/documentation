Getting the latest AIMMS Releases on AIMMS Cloud Platform
*********************************************************

Starting with AIMMS PRO 2.47.1, we have made the change to provide you with every AIMMS major feature release automatically and will also guarantee that you will always work on the most recent hotfix on that version, with all the benefits of bugfixes. This is how it will work:

1. You will not need to activate AIMMS versions anymore. When you publish an app, you will see all AIMMS major releases available. Your list of options will decrease significantly since you will not need to check for hotfix versions or check if there is a newer version available. We take care of it! 

2. Whenever you run an app, it will select the latest hotfix of the selected AIMMS major release. This will guarantee you get bugfixes without re-publishing the apps.
For example, when you have published an app with AIMMS 4.88 and then when you run it, it will select the latest hotfix from 4.88, so in this case, it will run on 4.88.6, even if this hotfix was not available during publishing. We will never change the feature release association.

3. This change will directly impacts the speed in which our servers can scale up, since it simplifies AIMMS versions that need to be available to start the session. You may see job queues being processed faster from this.

4. This does not impact your apps. They will always continue to work with the selected feature release and already benefit from any hotfixes available. You do not need to change anything.

.. spelling:word-list::

    hotfix
	hotfixes
	bugfixes
