Configuring the configurator
============================

The configurator runs as a web service, thus it is available via HTTP/HTTPS on a specific port (by default, HTTP port 9191). These values can be changed in the *configurator.properties* file, found in ``dataDir/config``. An empty value means disabled.

* ``http.port`` - change this if the default 9191 does not work for you
* ``https.port`` - disabled by default. Fill in a port to allow HTTPS connections
* ``https.keyStoreFile`` - the full path to the PKCS 12 file holding the server certificate that will be used by the Configurator for HTTPS connections
* ``https.keyStorePassword`` - the password for the ``keyStoreFile``

In order to apply the changes done to this file, you will need to restart the *AIMMS PRO Configurator Service* from the Windows Services management console.
