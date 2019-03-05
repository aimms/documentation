Read and Write
**************

When reading or writing we have to select the source and datamap. Also we have to set the ReadWriteAttribute. DataLink should take care of the rest. This include doing type conversions when needed.



Reading and writing
===================

Reading and writing have very similar functions that follow the approach described in :ref:`TheDataLinkSolution` . For reading there is:

.. js:function:: dl::DataRead(DataSource,MapName,ReadWriteAttributes)

    :param DataSource: The name of the data source (string)
    :param MapName: The name of the data map (string)
    :param ReadWriteAttributes: See :ref:`ReadWriteAttributes`


For writing there is a similar function.

.. js:function:: dl::DataWrite(DataSource,MapName,ReadWriteAttributes)

    :param DataSource: The name of the data source (string)
    :param MapName: The name of the data map (string)
    :param ReadWriteAttributes: See :ref:`ReadWriteAttributes`


The only real difference between reading and writing is that reading only makes sense if the source already exist. If it does not exist, nothing will be read. For writing when a source does not exist then it will be created. An example call to :token:`dl::DataWrite` is:

.. code-block:: aimms

   dl::DataWrite(
        "OutputFile.xlsx",      ! Choose a source (1)
        "TheDataMap",           ! Choose a data map (2)  
        ReadWriteAttributes     ! Choose a provider (3)
    );

here we assume that the :token:`ReadWriteAttributes` is properly set.

Types
=====

DataLink supports the following types:


+---------------+-------------------------------------+
| Identifier    |               Type                  |
+ Type          +------------+------------+-----------+
|               | Numeric    | String     | DateTime  | 
+===============+============+============+===========+
| **Set**       |            | Yes        |           |
+---------------+------------+------------+-----------+
| **Parameter** | Yes        | Yes        |  Yes      |
+---------------+------------+------------+-----------+



The type in AIMMS is derived from the identifier. If it is a Set then the type is always a string. For parameters the type is a string in case of a string parameter or element parameter. Numeric here means a floating point representation (called a double), but AIMMS may detect that it is an interger when displaying the value. DateTime is used for calendar type and may not be supported by the provider.


Type Conversion
---------------

Both AIMMS and the souce have to somehow represent the data and their representations may not be the same.
The provider makes sure that in whatever way the data is represented in the source, it is converted from or to one of the supported types. If the provider cannot do this then it will flag it as Error.

Then it is still possible that they have different ideas about what the actual type of the data is, so conversion is needed. The table below show what can be converted.

+------------+------------------------------------------------------------------+
|  From      |               To                                                 |
+            +-------------------------+------------+---------------------------+
|            | Numeric                 | String     | DateTime                  | 
+============+=========================+============+===========================+
| Numeric    | Okay                    | Okay       | Error                     |
+------------+-------------------------+------------+---------------------------+
| String     | Try :superscript:`1`    | Okay       | Error                     |
+------------+-------------------------+------------+---------------------------+
| DateTime   | Error                   | Error      | Okay :superscript:`2`     |       
+------------+-------------------------+------------+---------------------------+

1. It can succeed, but it may also result in an error.
2. If not supported by the provider this results in Error.


.. note::

    String

        Leading and trailing spaces are always removed from strings. 

    Integer to string

        For some providers al numerical values are stored in floating point representation. When converting this to a string it may look weird for integers. I.e. in Excel a cell value may look like 123, but the provider will see it as 123.0000 so it will become "123.00000000" when converting to string. For this reason DataLink tries to detect integers and remove the extra zeros.




Column Attributes 
-----------------

Both data maps allow to specify some extra column attributes like "Width" and "Precision". Depending on the provider (in particular the CSVProvider) they may influence the way data is written.


Width

    This is the width of the column in number of characters.


Precision

    For numerics this is the number of decimals. For strings this is the maximum number of characters.



.. _ReadWriteAttributes:

ReadWriteAttributes
===================


The :token:`ReadWriteAttributes` is a string parameter:

.. code-block:: aimms

    StringParameter ReadWriteAttributes {
        IndexDomain: dl::rwattr;
        Definition: data{'DataProvider': ..... };
    }




DataProvider
    
    This is :red:`mandatory`. The string represents that absolute path to the executable code of the provider (on windows, the dll file). Instead of having to fill this in, each provider has a parameter "DataLink" containg the right value. So we choose a provider by defining this as :token:`csvprov::DataLink` or :token:`xlsprov::DataLink`.


MissingValues 

    When reading we are at the mercy of the data source. Depending on how much we trust the source or how important correctness of the source is we can define what happens when an error occurs.

        * **Error**: Give an error and stops the procedure in AIMMS.

        * **Warning** (default): Give a error message in the message window (Ctrl-M) and continues.

        * **Ignore** : Just continues. 

ContainsHeaders 

    Currently this is always "yes" (default).

Separator

    This is used by the CSVProvider to turn each line into columns. Eventually this should be removed from the ReadWriteAttributes and become part of the provider.




