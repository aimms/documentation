Read and Write
**************


Types
=====



+------------+-------------------------------------+
|  From      |               To                    |
+            +------------+------------+-----------+
|            | Numeric    | String     | DateTime  | 
+============+============+============+===========+
| Numeric    | Okay       | Okay       | Error     |
+------------+------------+------------+-----------+
| String     | Try        | Okay       | Error     |
+------------+------------+------------+-----------+
| DateTime   | Error      | Error      | Okay      |       
+------------+------------+------------+-----------+








Reading
=======

.. js:function:: dl::DataRead(DataSource,MapName,ReadAttributes)

    :param DataSource: String representing the name of the data source
    :param MapName: bla bla
    :param ReadAttributes: blabla




Writing
=======


.. js:function:: dl::DataWrite(DataSource,MapName,ReadAttributes)

    :param DataSource: String representing the name of the data source
    :param MapName: bla bla
    :param ReadAttributes: blabla
