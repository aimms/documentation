DEX Troubleshooting
====================

Here you will find explanations and tips on how errors and warnings that may occour. 

Errors and Warnings
---------------------

*The maps-to attribute 'x' for node 'y' refers to an non-existing identifier*
	In this case it is helpful to check if you have written the "maps-to" element correctly, including a possible index.

*The dimension of the maps-to attribute x for node y does not coincide with the specified numbers of indices*
	In this case the most probable cause is that the element is referring to an AIMMS-identifier that should have at least one index defined but where no index can be found (like for an indexed parameter), where the index is not properly named in the mappingfile or where more indices are expected than defined (or the other way around).

*ReadFromStream: <i_subset>: ERROR: No (active) element with name <elementValue> in set (error 136)*
	In this case, check if you are trying to read data to a master set, and then for a subset of the master set. If you are, please after the read of the master set, add a ``update`` fuction to the subsets. 