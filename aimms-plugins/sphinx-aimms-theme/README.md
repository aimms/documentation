# sphinx-aimms-theme 
 
This [Sphinx](https://www.sphinx-doc.org/en/master/) theme was designed to provide a great reader experience for documentation users on both desktop and mobile devices for AIMMS projects and libraries.

**This theme also includes:** 
- an **[AIMMS pygment lexer](docs/AIMMS Lexer.md)** to highlight your AIMMS [code blocks in sphinx](http://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-code-block) 
- an **[AIMMS Domain](docs/AIMMS Domain.md)** to document your own AIMMS code, and to [**crosslink** with other AIMMS documentation websites ](docs/AIMMS%20Domain.md#coupling-the-domain-with-intersphinx)
- an **[AIMMS spelling wordlist](docs/AIMMS spelling wordlist.md)** to use as a spelling wordlist exception file for the [sphinx spelling checker extension](https://sphinxcontrib-spelling.readthedocs.io/en/latest/)

Please find the documentation of those elements following the links above.

This theme is inherited from the great [Read the Docs](https://github.com/readthedocs/sphinx_rtd_theme) but can work with any Sphinx project. 

You can find a working demo of the theme on AIMMS documentation websites:
- [AIMMS Function reference](https://documentation.aimms.com/functionreference)
- [AIMMS How-to](https://how-to.aimms.com)
- [AIMMS Documentation](https://documentation.aimms.com)

**To generate your docs out of this theme** from an AIMMS model, please take a look at the following repo: https://gitlab.com/ArthurdHerbemont/conversion-aimms-ams2rst

Installation
===============

This theme is distributed on [PyPI](https://pypi.org/project/sphinx-aimms-theme/) and can be installed with pip. 

Because it's inheriting some features from [Read the Docs theme](https://github.com/readthedocs/sphinx_rtd_theme), you will need to install it as well. 
You may run the following 2 commands to install it:

`pip install sphinx-rtd-theme`

`pip install sphinx-aimms-theme`

To use the theme in your Sphinx project, you will need to add the following to your conf.py file:

``` python
extensions = [
    ...
    "sphinx_aimms_theme",
]

html_theme = "sphinx_aimms_theme"
```


Configuration
================

Theme options
----------------

The following options can be defined in your project’s conf.py file, using the html_theme_options configuration option.

For example:

``` python
html_theme_options = {
    'doc_title': 'Title of my docs',
    'home_page_description': 'my meta description',
}
```

*(if not specified, the option is a string)*

* **doc_title** 

    Title you will see on the top left corner of your docs

* **home_page_title** 

    HTML Title that will appear in the html meta title of your home page 

* **home_page_description** 

    Description that will appear in the html meta description of your home page
    
* **display_community_help_link** 

    Boolean - Displays a link at the bottom of every article redirecting to the [AIMMS community](https://community.aimms.com/) search page filled with the title of the current page.
    
* **display_community_embeddable** 

    Boolean - Displays an embbedable from the AIMMS Community, showing topics filtered with the title of the current page 
    
    > Send an email to support@aimms.com if you would like to activate the community embeddable on your docs.

* **display_local_toc** 

    Boolean - Displays a dynamic local table of content for each file, except top index files.

* **generate_google_analytics**
    
    Boolean - generates a google analytics HTML code as follows on every page:
    
    ``` html
        
        <script async src="https://www.googletagmanager.com/gtag/js?id={{ google_analytics_id }}"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
        
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());
        
            gtag('config', '{{ google_analytics_id }}');
        </script>
        
    ```
    Where ``google_analytics_id`` is the following option

* **google_analytics_id**

    Change the Google Analytics ID that is included on every page

* **generate_google_tag_manager**
    
    Boolean - generates the google tag manager container snippet on every page, based on the following ``google_tag_manager_id``

* **google_tag_manager_id**

    Change the google tag manager ID that is included on every page

* **display_algolia_search**
    
    Replace the current default search box with an Algolia extension. 
    You must have registered your docs website on https://community.algolia.com/docsearch/#join-docsearch-program, and thus obtain from Algolia the following 3 options:

* **algolia_appid**
* **algolia_appkey**
* **algolia_indexname**

* **algolia_hitsperpage**

    Set the number of items shown in algolia's search result dropdown

* **display_help_and_feedback**

    Boolean - Displays a "Help & feedback" footer block at the end of every page content. This Block is linking to many useful resources for AIMMS users, and crosslinks to the open source repository.
    Default - False
    
* **is_github**

    Boolean - Is your code hosted on Github ? 
    Default - False
    
* **is_gitlab**

    Boolean - Is your code hosted on Gitlab ? 
    Default - False
    
* **repo_url**

    String - The URL link to your open source repository hosting your documentation docs. This is used to build crosslinks on a page to its open source conterpart, to ease potential peer contribution.
    Default is "https://gitlab.com/ArthurdHerbemont/testdocs"


Theme source code
-------------------

The theme source code can be found in your Python installation folder, at ``PythonXX\Lib\site-packages\sphinx_aimms_theme``.

You may customize (overwrite) locally parts of it via "templating", as described [here](https://www.sphinx-doc.org/en/master/templating.html)

Home Page
----------

Some CSS code is shipped together with the theme to customize your home page "boxes", as you can see on [AIMMS How-to](https://how-to.aimms.com) or [AIMMS Documentation](https://documentation.aimms.com).

You may (or not) use it to show your own topics. To help you customize it, please see the [RST](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html) source code of the How-to Home page below:

``` html

.. image:: Images/rocket-32.png
   :scale: 0

.. image:: Images/school-supplies-32.png
   :scale: 0

.. image:: Images/time-machine-32.png
   :scale: 0

.. image:: Images/global-chain-32.png
   :scale: 0

.. image:: Images/web-design-32.png
   :scale: 0

.. image:: Images/network-care-32.png
   :scale: 0

.. raw:: html
    
    <h1 class="home_header">WELCOME TO HOW-TO</h1>
    
.. raw:: html
    
    <div id="content_home_page">

        <p>AIMMS How-To is a knowledge base for everyone involved in projects that use AIMMS, including developers, network administrators, application end-users, and business process stakeholders.</p>
        <p>You'll find tutorials, best practices, and practical guidance for using AIMMS software, including help topics in mathematical modeling, solvers, AIMMS language, and building applications in optimization and prescriptive analytics. You'll also find support for troubleshooting errors and handling deprecations.</p>

        <div class="boxes">
            <a class="box_home_page" href="C_Getting_Started/index.html">
                <img alt="getting started" src="_images/rocket-32.png">
                <h1>Getting Started</h1>
                <div>Installing AIMMS, settings options, licensing help</div>
            </a>
            <a class="box_home_page" href="C_Developer/index.html">
                <img alt="developer" src="_images/school-supplies-32.png">
                <h1>AIMMS Developer</h1>
                <div>Data connection, modeling, solvers, programming, error handling</div>
            </a>
            <a class="box_home_page" href="C_UI/index.html">
                <img alt="applications" src="_images/web-design-32.png">
                <h1>Application UI</h1>
                <div>Creating and customizing a user interface for your apps</div>
            </a>
            <a class="box_home_page" href="C_Deployment/index.html">
                <img alt="deployment" src="_images/network-care-32.png">
                <h1>Deployment</h1>
                <div>Distributing your apps with AIMMS PRO (on-premise or cloud-hosted)</div>
            </a>
            <a class="box_home_page" href="C_Evolution/index.html">
                <img alt="evolution" src="_images/time-machine-32.png">
                <h1>Software Evolution</h1>
                <div>Implementing new AIMMS features, planning for deprecation</div>
            </a>
            <a class="box_home_page" href="https://scnavigator-manual.aimms.com/">
                <img alt="navigator" src="_images/global-chain-32.png">
                <h1>SC Navigator</h1>
                <div>Help and documentation for the SC Navigator suite of apps</div>
            </a>
        </div>
    </div>
    
-----------------------------------------------------------

.. toctree::
   :maxdepth: 1
   :titlesonly:
   :hidden:

   C_Getting_Started/index
   C_Developer/index
   C_UI/index
   C_Deployment/index
   C_Evolution/index
   Recently_added
   

```
    
Use, contribute, fix, improve the theme
===================================

Run the theme locally
----------------------

If you would like to modify the theme, or correct something, you may use the theme locally on your computer.

There are at least 2 ways to do that. 

1. Copy paste [the theme folder](sphinx_aimms_theme) in your sphinx project folder, and configure the [html_theme_path](https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-html_theme_path) in your [conf.py](https://www.sphinx-doc.org/en/master/usage/configuration.html) file to point to that theme folder as follows:
   ``` python
   html_theme_path=['sphinx_aimms_theme']
   ```

2. Otherwise, you may want to change your python local package setup temporarily. To do so, download the theme repo on your computer, and run in the repo location:

`python setup.py develop`

> First, you may want to uninstall the theme installed, by running `python -m pip uninstall sphinx-aimms-theme`

Contribution and support
------------------------------

If you would like to propose a change, or if something's not clear, just send an e-mail to support@aimms.com

Note
---------

**All readthedocs options are available as well !**

https://sphinx-rtd-theme.readthedocs.io/en/latest/configuring.html

This theme is highly customizable on both the page level and on a global level. See https://sphinx-rtd-theme.readthedocs.io/en/latest/configuring.html 

If you are reviewing the wordlist, this site is helpful to order and remove duplicates: https://sortmylist.com/

