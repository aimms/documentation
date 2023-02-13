Information security for AIMMS Developer (the software)
==========================================================

We have implemented a collection of measures to make sure we deliver secure software to our customers. 

Staff training
-------------------
AIMMS software development teams regularly, at least annually, receive training on secure software development methods. 

Development processes
---------------------------
* All code is in a source code repository. Separate code branches are used to ensure only production-ready code is released.
* Artifacts are built using automated build and test pipelines and these will fail if one or more automated tests fail. 
* Access to build and test pipelines is restricted to a few administrators. 
* Teams review the information security impact of all projects taken on. 

Testing
-------------
* Manual testers perform the exploratory testing of any new code.
* Automated tests consist of a mixture of unit tests and functional tests, a total of 10,000+ tests. Sub-sets of these test sets are run on every code commit. The full set is run at least once on every release. 

Code scanning
-----------------
Static code analysis is included in the automated build process, scanning for the `CVE vulnerabilities <https://cve.mitre.org/cve/>`_.

Technology stack
-----------------
* Compiler, execution engine and other parts of the 'kernel' are written in C and C++.
* Extension libraries such as Data Exchange are written in C++.
* IDE uses .net and C#.
* WebUI uses HTML5, Javascript, CSS and various frameworks such as jquery and React. It also uses 3rd party components such as Highcharts.
