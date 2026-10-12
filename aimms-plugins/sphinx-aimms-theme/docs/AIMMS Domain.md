AIMMS Domain for Sphinx
=========================

As first introduction to domains, please refer to [Sphinx Domain Docs](http://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html) to document your own AIMMS code.

This AIMMS Domain is build up from the [Javascript Domain](https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#the-javascript-domain)

Basic Usage
============

```
.. aimms:parameter:: P_demand(l)

   Numerical demand of a certain location l.
```

This describes an AIMMS parameter called P_demand indexed over the l index.

The domains also provide roles that link back to these object descriptions. For example, to link to the parameter described in the example above, you could say

```
The parameter :aimms:parameter:`P_demand` gives similar data.
```

As you can see, both directive and role names contain the domain name and the directive name. 

Example
=========

The AIMMS Domain is used extensively in the [AIMMS Function Reference](https://documentation.aimms.com/functionreference/index.html).

The AIMMS Domain
===================

The AIMMS domain (name ``aimms``) provides the following directives:

```
.. aimms:module:: name
```

This directive sets the module name for object declarations that follow after. The module name is used in the global module index and in cross references. This directive does not create an object heading like py:class would, for example.

By default, this directive will create a linkable entity and will cause an entry in the global module index, unless the noindex option is specified. If this option is specified, the directive will only update the current module name.

```
.. aimms:function:: name(signature)
```

Describes an AIMMS function. If you want to describe arguments as optional use square brackets as documented for Python signatures.

You can use fields to give more details about arguments and their expected types, errors which may be thrown by the function, and the value being returned:

```
.. aimms:function:: MyFunction(href, callback[, errback])

   :attribute string href: An URI to the location of the resource.
   :attribute callback: Gets called with the object.
   :attribute errback:
       Gets called in case the request fails. And a lot of other
       text so we need multiple lines.
   :throws SomeError: For whatever reason in that case.
   :returns: Something.
```

List of supported types, following the same rules as ``aimms:function::`` :


| Supported Types             |
|-----------------------------|
| aimms:function::            |
| aimms:procedure::           |
| aimms:externalprocedure::   |
| aimms:parameter::           |
| aimms:elementparameter::    |
| aimms:stringparameter::     |
| aimms:unitparameter::       |
| aimms:set::                 |
| aimms:calendar::            |
| aimms:variable::            |
| aimms:constraint::          |
| aimms:mathematicalprogram:: |
| aimms:databasetable::       |
| aimms:file::                |
| aimms:handle::              |


List of supported types, following the same rules as ``aimms:module::`` :

| Supported Types             |
|-----------------------------|
| aimms:module::              |
| aimms:librarymodule::       |



These roles are provided to refer to the described objects:

| Supported roles             |
|-----------------------------|
| :aimms:func:                |
| :aimms:procedure:           |
| :aimms:librarymodule:       |
| :aimms:externalprocedure:   |
| :aimms:parameter:           |
| :aimms:elementparameter:    |
| :aimms:stringparameter:     |
| :aimms:unitparameter:       |
| :aimms:set:                 |
| :aimms:calendar:            |
| :aimms:variable:            |
| :aimms:constraint:          |
| :aimms:mathematicalprogram: |
| :aimms:databasetable:       |
| :aimms:file:                |
| :aimms:handle:              |

Coupling the domain with intersphinx
=======================================

Cross link with other AIMMS documentation websites

[Intersphinx](https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html) extension enables you to import the global index (a list of all titles, files and declared domain objects with their URL) from another sphinx repository (website).

Basic usage
-

For example, you may refer to ``AllIdentifiers`` set from the AIMMS function reference using the following syntax:

```
:aimms:set:`AllIdentifiers`
```

This will result in an clickable hyperlink redirecting you to:

https://documentation.aimms.com/functionreference/predefined-identifiers/model-related-identifiers/allidentifiers.html


**Tip:** if you are not sure about the type (set, parameter, elementparameter, etc.), you may also use 
```
:any:`AllIdentifiers`
``` 

This will be available provided that you've included the AIMMS function reference in your intersphinx set up. You can do so by adding to the following line to the ``conf.py`` file:

``` python
intersphinx_mapping = {'functionreference': ('https://documentation.aimms.com/functionreference/',
                                  (None,'objects-functionreference.inv'))}
```

``objects-functionreference.inv`` is a potential backup that you may include in your repository if you can't connect to the internet while building your docs as described [here](https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html#confval-intersphinx_mapping)

Adding new supported types to the AIMMS domain
================================================

You may refer to https://gitlab.com/ArthurdHerbemont/sphinx-aimms-theme/-/commit/22bdafce5219ce1306463030310f4064a8a2bf1b which is a perfect example of how Calendar, Database Tables and Unit parameter types were added to the AIMMS domain.

