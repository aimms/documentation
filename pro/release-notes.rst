AIMMS PRO On-Premise Release Notes
==================================

This page lists everything released on the AIMMS PRO on-premise build pipeline going forward. For Cloud Platform releases (Portal, PRO Cloud builds, and REST API), see :doc:`AIMMS Cloud Platform Release Notes </cloud/release-notes>`. For everything released before the Cloud and on-premise pipelines diverged, see the :doc:`AIMMS PRO Release Notes Archive </pro-release-notes>`.

PRO 26.6
########

AIMMS PRO 26.6.11 Release
--------------------------

On October 5, 2026 we released AIMMS PRO 26.6.11(*On-prem build*: 26.6.11.1)

**Security Fixes**

   -  Upgraded the bundled OpenSSL library from 3.5.7 to 3.5.9, staying on the 3.5 long-term support line, resolving multiple vulnerabilities, including a critical integrity-check validation issue (**CVE-2026-75803**) and an out-of-bounds read (**CVE-2026-84782**).
   -  Upgraded the bundled Expat XML parser from 2.8.2 to 2.8.5, resolving four vulnerabilities, including an out-of-bounds read (**CVE-2026-76641**) and a use-after-free (**CVE-2026-76957**).
   -  Upgraded Netty to 4.1.137.Final, resolving a critical TLS server-name routing bypass caused by fragmented handshake messages.
   -  Upgraded Jackson to 2.18.11, resolving several denial-of-service vulnerabilities in Jackson Core and Jackson Databind (including **CVE-2026-68497**).
   -  Upgraded FreeMarker in the Configurator to 2.3.35, resolving **CVE-2026-84939**.
   -  Upgraded BouncyCastle (``bcpkix-jdk18on`` and ``bcutil-jdk18on``) to 1.85, replacing older versions that were still pulled in transitively.
   -  Upgraded the ``c3p0`` connection pool library to 0.14.2, resolving a known vulnerability.

AIMMS PRO 26.6.10 Release
--------------------------

On August 26, 2026 we released AIMMS PRO 26.6.10(*On-prem build*: 26.6.10.1)

**Security Fixes**

   -  Upgraded the bundled ``net4cxx`` networking library to 2.2.1-44 (``net4cxx-dev`` 2.1.1-35), which now disables TLS 1.0 and TLS 1.1 by default, reducing exposure to legacy, insecure TLS protocol handshakes.

AIMMS PRO 26.6.9 Release
-------------------------

On August 25, 2026 we released AIMMS PRO 26.6.9(*On-prem build*: 26.6.9.1)

**Security Fixes**

   -  Upgraded mchange-commons-java to 0.6.1, resolving a JNDI injection / deserialization gadget vulnerability. The prior c3p0 upgrade only brought in mchange-commons-java 0.4.0 transitively, which remained vulnerable.

**Resolved Issues**

   -  Fixed nightly Configurator backups failing with ``STATUS_DLL_NOT_FOUND``, caused by a missing ``libiconv-2.dll`` in the bundled PostgreSQL EDB 16.14-2 build; the bundled PostgreSQL was bumped to EDB 16.15-1, which restores the missing DLL.

AIMMS PRO 26.6.8 Release
-------------------------

On August 14, 2026 we released AIMMS PRO 26.6.8(*On-prem build*: 26.6.8.1)

**Security Fixes**

   -  Upgraded Jetty from 12.0.33 to 12.0.36, resolving a digest-authentication bypass (**CVE-2026-10050**).
   -  Upgraded Netty to 4.1.136.Final, resolving **CVE-2026-59901**.
   -  Upgraded the Spring Framework (spring-expression / spring-webmvc) to 6.2.19, resolving a known vulnerability.
   -  Upgraded the PostgreSQL JDBC driver to 42.7.12, resolving a known vulnerability.
   -  Upgraded Apache ActiveMQ (activemq-broker) to 6.2.6, resolving three code-injection vulnerabilities.
   -  Upgraded BouncyCastle (bcprov-jdk18on) to 1.85, resolving two vulnerabilities, including a GOST 28147 CTR-mode keystream-reuse issue.
   -  Upgraded Apache Mina (mina-core) to 2.2.8, resolving a critical deserialization allow-list bypass vulnerability.
   -  Upgraded HttpCore5 (including httpcore5-h2) to 5.4.3, resolving an uncontrolled resource consumption vulnerability in the HTTP/1.1 and HPACK message parsers.
   -  Upgraded Jackson Databind to 2.18.9, resolving a known vulnerability.
   -  Pinned org.json to a current release, resolving a denial-of-service vulnerability present in a severely outdated transitive version.
   -  Upgraded the c3p0 connection pool library to 0.14.0, resolving a known vulnerability.
   -  Upgraded Mozilla Rhino to 1.7.15, resolving a known vulnerability.

**Improvements**

   -  Client builds compiled with the newer msvc194 toolchain no longer collide with the older msvc193 (legacy ``vc143``) runtime during ARMI compatibility negotiation; both runtimes are now shipped and identified separately.
   -  Updated the bundled OpenSSL library from 3.3.2 to 3.5.7 (LTS).

**Resolved Issues**

   -  Fixed PostgreSQL checkpoint failures after a fresh install, failing it to start properly, caused by missing ``pg_logical/snapshots`` and ``pg_logical/mappings`` directories.

AIMMS PRO 26.6.7 Release
-------------------------

On July 13, 2026 we released AIMMS PRO 26.6.7(*On-prem build*: 26.6.7.7)

**Improvements**

   -  Internal build process improvements for on-premise. No functional or behavioral changes in this release.
