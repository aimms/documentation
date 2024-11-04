AIMMSXL Documentation
======================

.. aimms:module:: axll

.. aimms:librarymodule:: Library_AimmsXLLibrary

    :attribute Prefix: ``axll``

    :attribute Interface: ``PublicSection``

    This library allows you to read from and write to .xlsx or .xls (Excel) files.
    
    The library does not need Excel to be installed on the machine and works both in Windows and Linux.
    
    The library can only read and write the file formats .xlsx and .xls, but is not capable of 
    evaluating any formula or macro that is contained in it. For that you need Excel itself.
    
    The functions in this library do not use a return value to indicate success or failure.
    Instead, the functions are created to be used in combination with the error handling mechanisms in AIMMS.
    That is why it is highly recommended to place all function calls within a :any:`block-onerror-endblock <block>` context,
    so that you can easily handle the warnings and errors that might occur during the usage of these
    functions.
    
    A typical usage looks like:
    
    .. code-block:: aimms
        :linenos:
    
        block

            axll::OpenWorkbook("mybook.xlsx");

            ! .. read or write the sheets in the workbook ..

        onerror err do

            ! .. handle the error or warning ..

            errh::MarkAsHandled(err);

        endblock;

        axll::CloseAllWorkbooks;  ! save and close any open workbook


Public Section
----------------

.. aimms:parameter:: CalendarElementsAsStrings

    :attribute Default: 0

    :attribute Property: NoSave


    Allowed values: 0 (=default) or 1.
    
    By default, when writing elements of a calendar set to a sheet, the written cells will be formatted as a Date (which always includes at least a year, a month and a day).
    If the format of the calendar does not included all these parts, it might be more convenient to write the elements as simple strings according to the calendar format.
    For example a calendar with elements { 2016, 2017, 2018 } will then be written as "2016", "2017", "2018" instead of 2016/1/1, 2017/1/1, 2018/1/1
    
    Similarly when reading calendar elements, by default the library expects cells formatted as Date, but when this option is set to 1 it expects strings according to the 
    date format of the calendar.

.. aimms:parameter:: WriteInfValueAsString

    :attribute Default: 0

    :attribute Property: NoSave


    Allowed values: 0 (=default) or 1.
    
    By default, when writing numerical data that contains the value `INF` or `-INF`, 
    these values are written to a cell as the number 1E+150 and -1E+150 respectively.
    If you set this option to 1, these values will be written not a as numbers but as strings ("INF" and "-INF").
    This might be convenient to visually inspect the values in Excel, but please be aware that Excel formulas that 
    operates on a range with both numerical and string values present, might not work as expected.

.. aimms:parameter:: KeepExistingCellFormats

    :attribute Default: 0

    :attribute Property: NoSave


    Allowed values: 0 (=default) or 1.
    
    By default, when writing data into a cell, AIMMS checks whether the specified format of that cell matches the value that is written.
    If it does not match (for example if a string value is written into a cell that is formatted as Number) then it changes the format 
    of the cell such that the value can be correctly written.
    If you set this option to 1, the format will *not* be checked and values are just copied to the cell, leaving the format as is.
    
    Setting this option to 1 is especially useful when your sheet contains cells with a custom format for which it unclear what 
    type of values can be written into it.

.. aimms:parameter:: TrimLeadingAndTrailingSpaces

    :attribute Default: 0

    :attribute Property: NoSave


    Allowed values: 0 (=default) or 1.
    
    By default, when reading string valued cells, any leading or trailing spaces in a cell are interpreted by AIMMS as part of string (or element name).
    If you set this option to 1 prior to reading any data these leading and/pr trailing spaces will be removed.
    In other words: a cell with value "  my cell value " will be passed to AIMMS as "my cell value".
    
    This option does not have an effect on strings or elements that are written to the spreadsheet.


Workbook Management
---------------------------
   
.. aimms:externalprocedure:: OpenWorkBook(WorkbookFilename)

    This function loads an excel file so it can be manipulated with the functions of this library.
    It will make it the active workbook, and it's first sheet the active sheet.
    
    .. note::
    
        An error is issued when the workbook is already opened.
    
    When done with the workbook, you must call :any:`CloseWorkBook` to save and close.

    .. aimms:stringparameter:: WorkbookFilename
    
        :attribute Property: Input
    
        The path to an existing .xlsx or .xls file
    
.. aimms:externalprocedure:: CreateNewWorkBook(WorkbookFilename,FirstSheetName)

    This function creates a new excel file and opens it such that it can be manipulated with the functions of this library.
    If a file with the given name already exists, this file will be overwritten.
    
    When all modifications are made, you must call :any:`CloseWorkBook()` to save and close.

    .. aimms:stringparameter:: WorkbookFilename
    
        :attribute Property: Input
    
        The path to the .xlsx or .xls file that you want to create.
    
    .. aimms:stringparameter:: FirstSheetName
    
        :attribute Property: Optional
    
        (Optional) The name of the single sheet in the newly created workbook.
        If you leave this empty the sheet will be named "Sheet1".
    
.. aimms:externalprocedure:: CloseWorkBook(WorkbookFilename)

    This function closes the internal in-memory representation of the workbook that corresponds
    to the given file name.
    If any modifications have been made to this workbook, these will be saved back to the given file name.
    
    After this call, there is no active workbook and thus no active sheet.
    
    .. note::
    
        An error is issued when the workbook is not open.

    .. aimms:stringparameter:: WorkbookFilename
    
        :attribute Property: Input
    
        The name of an .xlsx or .xls file that was previously opened via a call to :any:`OpenWorkBook` or :any:`CreateNewWorkBook`.
    
.. aimms:externalprocedure:: SelectSheet(SheetName)

    This function will make the given sheet the active sheet.
    Most of the other functions in this library operate on the active sheet.

    .. aimms:stringparameter:: SheetName
    
        :attribute Property: Input
    
        The name of an existing sheet in the active workbook.
    
.. aimms:externalprocedure:: IsExistingSheet(SheetName)

    :attribute ReturnType: integer

    With this function you can check whether a sheet with the given name exists in the workbook.
    The function returns 1 if the sheet exists, 0 otherwise.

    .. aimms:stringparameter:: SheetName
    
        :attribute Property: Input
    
        The name of an existing sheet in the active workbook.
    
.. aimms:externalprocedure:: DeleteSheet(SheetName)

    This function will delete the specified sheet in the current workbook.
    If it is the currently selected sheet, you must select another sheet after this call before using any of 
    the functions that operate on the currently active sheet.

    .. aimms:stringparameter:: SheetName
    
        :attribute Property: Input
    
        The name of an existing sheet in the active workbook.
    
.. aimms:externalprocedure:: CreateSheet(SheetName,InsertBeforeThisSheet)

    This function will create a new sheet in the current workbook.

    .. aimms:stringparameter:: SheetName
    
        :attribute Property: Input
    
        The name of the new to be created sheet. If the sheet already exists an error is triggered.
    
    .. aimms:stringparameter:: InsertBeforeThisSheet
    
        :attribute Property: Optional
    
        (Optional) The new sheet will be inserted just to the left of this existing sheet. 
        If you leave this empty, the new sheet will be appended as last sheet.
    
.. aimms:externalprocedure:: CopySheet(SourceSheetName,NewSheetName,InsertBeforeThisSheet)

    This function will create a new sheet in the current workbook that is a 
    copy of an existing sheet.

    .. aimms:stringparameter:: InsertBeforeThisSheet
    
        :attribute Property: Optional
    
        (Optional) The new sheet will be inserted just to the left of this existing sheet. 
        If you leave this empty, the new sheet will be appended as last sheet.
    
    .. aimms:stringparameter:: SourceSheetName
    
        :attribute Property: Input
    
        The name of an existing sheet in the active workbook.
        The contents of this sheet will be copied to the newly created sheet.
    
    .. aimms:stringparameter:: NewSheetName
    
        :attribute Property: Input
    
        The name of the new to be created sheet. If the sheet already exists an error is triggered.
    
.. aimms:externalprocedure:: SelectWorkBook(WorkbookFilename)

    This function makes a previously loaded excel file the active workbook.
    It also makes it's last used sheet the active sheet.

    .. aimms:stringparameter:: WorkbookFilename
    
        :attribute Property: Input
    
        The name of an .xlsx or .xls file that was previously opened via a call to :any:`OpenWorkBook` or :any:`CreateNewWorkBook`.
    
.. aimms:externalprocedure:: CloseAllWorkBooks

    This function closes all workbooks that have been opened by calls to :any:`OpenWorkBook` or :any:`CreateNewWorkBook`.
    Calling this function is the same as calling :any:`CloseWorkBook` explicitly for every open workbook.

.. aimms:externalprocedure:: WorkBookIsOpen(WorkbookFilename)

    :attribute ReturnType: integer

    This function checks whether the given .xlsx or .xls file has previously been opened (and not yet closed) via
    a call to :any:`OpenWorkBook` or :any:`CreateNewWorkBook`.
    The function returns 1 if the workbook is open, or 0 otherwise.

    .. aimms:stringparameter:: WorkbookFilename
    
        :attribute Property: Input
    
        The path name of an .xlsx or .xls file.
    

Scalar Read Write
--------------------

   
.. aimms:externalprocedure:: ReadSingleValue(ScalarReference,Cell)

    This function reads a cell from the active excel sheet into the given identifier.
    
    The type of the identifier (numerical, string, element) should match with the content of the cell.

    .. aimms:handle:: ScalarReference
    
        :attribute Property: Output
    
    
        (output) The scalar identifier to be changed. This can also be a multi dimensional 
        identifier where all indices are fixed, such that the resulting slice is a scalar.
    
    .. aimms:stringparameter:: Cell
    
        :attribute Property: Input
    
    
        The cell in the active sheet to read from.
        Examples: "A1", "G4" 
    
.. aimms:externalprocedure:: WriteSingleValue(ScalarReference,Cell)

    This function writes a scalar to the active excel sheet 
    
    The type of the identifier (numerical, string, element) determines whether
    the cell will be formatted as a number or as text.

    .. aimms:handle:: ScalarReference
    
        :attribute Property: Input
    
    
        The scalar identifier to be written. This can also be a multi dimensional 
        identifier where all indices are fixed, such that the resulting slice is a scalar.
    
    .. aimms:stringparameter:: Cell
    
        :attribute Property: Input
    
    
        The cell in the active sheet to write to.
        Examples: "A1", "G4\
    
.. aimms:externalprocedure:: WriteFormula(FormulaString,Cell)

    This function creates a formula in the active sheet.
    
    The given string should be a valid formula representation in Excel. It is copied as is.
    
    Please note that the AimmsXLLibrary is not capable of evaluating any formula. 
    It can only read and write .xls or .xlsx files and does not have access to the full
    calculation engine of Excel.
    To evaluate a formula you must open the sheet in Excel. Excel does store the result
    of a formula in the cell and these calculated results of a formula can be
    read back using the AimmsXLLibrary.
    
    **Examples:**
    
    .. code-block:: none

        WriteFormula("=SUM(B2:B6)","B7");

        WriteFormula("=HYPERLINK(\\"#B7\\",\\"Goto Sum\\")", "A8");

    .. aimms:stringparameter:: FormulaString
    
        :attribute Property: Input
    
        A string containing a valid Excel formula.
    
    .. aimms:stringparameter:: Cell
    
        :attribute Property: Input
    
        The cell in the active sheet to write to.

Sets Read Write
-----------------------
   
.. aimms:externalprocedure:: WriteSet(SetReference,SetRange,AllowRangeOverflow)

    This function writes the elements of a set to the active Excel sheet.
    
    .. note::
    
      - An error occurs if the range is too small, except when :any:`AllowRangeOverflow` is set to 1.
    
      - Remaining cells are emptied if the there are more cells than set elements.
    
      - When writing a calendar set, the cells will be formatted as Date/Time unless the option :any:`CalendarElementsAsStrings` is set to 1.

    .. aimms:set:: SetReference
    
        :attribute Property: Input
    
        The (simple) set to be written to excel.
    
    .. aimms:stringparameter:: SetRange
    
        :attribute Property: Input
    
        The 1 dimensional excel range where the data should be written, either horizontal or vertical.
        
        **Examples:** "A1:A10" or "B2:M2" 
    
    .. aimms:parameter:: AllowRangeOverflow
    
        :attribute Range: :aimms:set:`[0, 1]`
    
        :attribute Property: Optional
    
        (optional) Default is 0. If set to 1 and the cardinality of the set is greater than the size of the range,
        then the write operation is allowed to extend the range to the needed size.
    
.. aimms:externalprocedure:: ReadSet(SetReference,SetRange,ExtendSuperSets,MergeWithExistingElements,SkipEmptyCells)

    This function reads the cells of a range from the active excel sheet and converts them to
    elements in the given set reference.

    .. aimms:set:: SetReference
    
        :attribute Property: InOut
    
        The (simple) set to which the elements should be added. 
        If the argument :any:`MergeWithExistingElements` is set to 0, the set will first be emptied.
    
    .. aimms:stringparameter:: SetRange
    
        :attribute Property: Input

        The 1 dimensional excel range where the data resides, either horizontal or vertical.
        
        **Examples:** "A1:A10" or "B2:M2" 
    
    .. aimms:parameter:: ExtendSuperSets
    
        :attribute Range: :aimms:set:`[0, 2]`
    
        :attribute Property: Input
    
        This determines what should happen with elements that are not present in the super set of the given set.
        
        Values:
        
        - 0 : elements not in the parent set result in an error
        
        - 1 : elements not in the parent set are added recursively
        
        - 2 : elements not in the parent set are skipped
        
        If :any:`SetReference` does not refer to a set that has the ``Subset of`` attribute specified, then this argument is ignored.
    
    .. aimms:parameter:: MergeWithExistingElements
    
        :attribute Property: Optional
    
        (optional) Default is 0.  
        If this option is set to 1 then the elements from the range are added to the current content of the set.
        If set to 0, the set is first emptied and then the elements are added.
    
    .. aimms:parameter:: SkipEmptyCells
    
        :attribute Property: Optional
    
        (optional) Default is 0.
        
        - If set to 0, reading of the range stops as soon as an empty cell is encountered and a warning is raised.
        - If set to 1, an empty cell in the range is simply skipped.


Utilities
-----------------
   
.. aimms:externalprocedure:: ConstructRange(startCell,width,height,ResultingRange)

    This support function creates a range string given a starting cell and sizes.
    
    **Examples:**

    .. code-block:: aimms
        :linenos:
    
        ConstructRange("C2",2,10,myString) 
    
    sets ``myString`` to "C2:D11" 

    .. aimms:stringparameter:: StartCell
    
        :attribute Property: Input
    
        A string representing the top left cell of the range. 
        **Examples:** "A1" or "D15".
    
    .. aimms:parameter:: Width
    
        :attribute Property: Input, Integer
    
        The number of columns of the range. It should be an integer value >= 1.
    
    .. aimms:parameter:: Height
    
        :attribute Property: Input, Integer
    
        The number of rows of the range. It should be an integer value >= 1.
    
    .. aimms:stringparameter:: ResultingRange
    
        :attribute Property: Output
    
        (Output) The constructed range representation. 
        **Examples:** "C2:D11" 
    
.. aimms:externalprocedure:: GetAllSheetNames(SheetNames)

    This function reads all existing sheet names of the active workbook and adds them as elements to the give set.

    .. aimms:set:: SheetNames
    
        :attribute Property: Output
    
        (Output) This argument should refer to an (empty) root set. On return the set will contain elements 
        that are named according to all sheets in the workbook.
    
    
.. aimms:externalprocedure:: GetNamedRanges(RangeNames,SheetName)

    This function reads all the named ranges for the given sheet (both local and global scope).
    The names of the ranges will be added as elements to the given set.

    .. aimms:set:: RangeNames
    
        :attribute Property: Output
    
        (Output) This argument should refer to an (empty) root set. On return the set will contain elements 
        that are named according to the named ranges.
    
    
    .. aimms:stringparameter:: SheetName
    
        :attribute Property: Optional
    
        (optional) The name of an existing sheet in the active workbook.
        If not specified the active sheet will be used.
    
.. aimms:externalprocedure:: ClearActiveSheet

    This function clears the entire content of the currently active sheet.

.. aimms:externalprocedure:: ClearRange(RangeToClear)

    This function clears all cells in the given range in the currently active sheet.

    .. aimms:stringparameter:: RangeToClear
    
        :attribute Property: Input
    
        The (named) range to be cleared.
        Examples: "A3:G10", "MyNamedRange\
    
.. aimms:externalprocedure:: ColumnNumber(colName)

    :attribute ReturnType: integer

    This utility function will return the sequence number of the column passed in.
    
    **Examples:**
    
    - ColumnNumber("A") will return 1

    - ColumnNumber("B") will return 2

    - ColumnNumber("AB") will return 28
    
    The name passed in can only contain characters in the range 'A' to 'Z' (or 'a' to 'z').
    
    Please note that there are limits on the number of columns in Excel:
    The maximum column name for an .xlsx file is "XFD" (16,384) and for an .xls file it is "IV" (256).

    .. aimms:stringparameter:: colName
    
        :attribute Property: Input
    
        The name of a column.
        Examples: "A", "AB\
    
.. aimms:externalprocedure:: ColumnName(colNumber,colName)

    This utility function gives you the name that corresponds to the n-th column
    
    **Examples:**
    
    - ColumnName(1,name) will set name to "A"

    - ColumnName(2,name) will set name to "B"

    - ColumnName(28,name) will set name to "AB"
    
    The column number should be an integer greater or equal to 1.
    
    Please note that there are limits on the number of columns in Excel:
    The maximum number of columns an .xlsx file is 16,384 ("XFD") and for an .xls file it is 256 ("IV").

    .. aimms:parameter:: colNumber
    
        :attribute Property: Input
    
        The column number (should be >= 1)
    
    .. aimms:stringparameter:: colName
    
        :attribute Property: Output
    
        (output) The name of the column.
    
.. aimms:externalprocedure:: CopyRange(DestinationRange,SourceRange,SourceSheet,AllowRangeOverflow)

    This function will copy all cells in a range to another range within the same workbook. All cell formatting is copied as well.
    
    If copying within the same sheet, it is not allowed to specify ranges that (partly) overlap.
    
    **Examples:**
    
    .. code-block:: aimms
        :linenos:
        
        CopyRange("B2", "A1:D10", SourceSheet:"OtherSheet", AllowRangeOverflow:1)
    
    This copies all the cells in the range A1:D10 of sheet OtherSheet to the range B2:E11 in the active sheet.

    .. aimms:stringparameter:: DestinationRange
    
        :attribute Property: Input
    
    
    .. aimms:stringparameter:: SourceRange
    
        :attribute Property: Input
    
    
    .. aimms:stringparameter:: SourceSheet
    
        :attribute Property: Optional
    
    
    .. aimms:parameter:: AllowRangeOverflow
    
        :attribute Default: 1
    
        :attribute Property: Optional
    
    
.. aimms:externalprocedure:: FirstUsedRowNumber

    :attribute ReturnType: integer

    This function returns the first row in the current sheet that contains a cell with data.

.. aimms:externalprocedure:: LastUsedRowNumber

    :attribute ReturnType: integer

    This function returns the last row in the current sheet that contains a cell with data.

.. aimms:externalprocedure:: FirstUsedColumnNumber

    :attribute ReturnType: integer

    This function returns the number of the first column in the current sheet that contains a cell with data.
    If you need the corresponding column name you can use the function :any:`ColumnName`.

.. aimms:externalprocedure:: LastUsedColumnNumber

    :attribute ReturnType: integer

    This function returns the number of the last column in the current sheet that contains a cell with data.
    If you need the corresponding column name you can use the function :any:`ColumnName`.

.. aimms:externalprocedure:: SetRangeBackgroundColor(RangeToColor,red,green,blue)

    With this function you can specify a background color for the given cell range.

    .. aimms:stringparameter:: RangeToColor
    
        :attribute Property: Input
    
        The (named) range for which you want to specify the background color.
        Examples: "A3:G10", "C1", "MyNamedRange" 
    
    .. aimms:parameter:: red
    
        :attribute Property: Input
    
        The 'red' value of an RGB color value [0 .. 255]
    
    .. aimms:parameter:: green
    
        :attribute Property: Input
    
        The 'green' value of an RGB color value [0 .. 255]
    
    .. aimms:parameter:: blue
    
        :attribute Property: Input
    
        The 'blue' value of an RGB color value [0 .. 255]
    
Multi Dimensional Data
------------------------------
   
.. aimms:externalprocedure:: ReadTable

    This function reads a table from the active excel sheet into an identifier reference.
    
    The number of columns in the :any:`RowHeaderRange` plus the number of rows in the :any:`ColumnHeaderRange` 
    determines the expected dimension of the identifier that will be written.
    
    **Examples:**
    
    - 2-dimensional with one index in rows and one index in columns: 
    
    .. code-block:: aimms
        :linenos:
    
        ReadTable( P2(i,j), "A2:A12", "B1:H2", "B2:H12" )
    
    - 1-dimensional with the single index as rows: 
    
    .. code-block:: aimms
        :linenos:
    
        ReadTable( P1(i), "A1:A10", "", "B1:B10" )
    
    - 1-dimensional with the single index as columns: 
    
    .. code-block:: aimms
        :linenos:
    
        ReadTable( P1(i), "", "A1:H1", "A2:H2" )
    
    - 5-dimensional with first 3 indices as row tuples and the last 2 indices as column tuples:
    
    .. code-block:: aimms
        :linenos:
        
        ReadTable( P5(i,j,k,l,m), "A3:C10", "D1:M2", "D3:M10" )

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: InOut
    
    
        The (non scalar) identifier to which the data from the sheet will be written.
        
        You can fix a domain index of the identifier to a specific element, such that only a specific slice of the 
        identifier will be written.
    
    .. aimms:stringparameter:: RowHeaderRange
    
        :attribute Property: Input
    
    
        The excel range where the starting indices reside.
        
        It may be left empty (""), which means that all indices are in the :any:`ColumnHeaderRange`.
        
        **Examples:**
        
        - "B1:B10" (covering only one domain index), or
        - "B1:C10" (representing tuples of size 2, and thus covering two domain indices).
    
    .. aimms:stringparameter:: ColumnHeaderRange
    
        :attribute Property: Input
    
    
        The excel range where the ending indices reside. 
        
        It may be left empty (""), which means that all indices are in the :any:`RowHeaderRange`.
        
        **Examples:** 
        
        - "A1:H1" (covering only one domain index), or
        - "A1:H2" (representing tuples of size 2, and thus covering two domain indices).
    
    .. aimms:stringparameter:: DataRange
    
        :attribute Property: Optional
    
    
        (optional) Representing the range where the data of the table is.
        This range should match with the number of rows in the :any:`RowHeaderRange` and the number of columns in the :any:`ColumnHeaderRange`.
        
        If not specified, the range is automatically determined using the locations of the :any:`RowHeaderRange` and the :any:`ColumnHeaderRange`.
    
    .. aimms:parameter:: ModeForUnknownElements
    
        :attribute Property: Optional
    
    
        (optional) Default = 0.
        This argument specified what to do with elements in the rows or columns that do not exist in the corresponding domain set.
        
        Valid values are:
        
        - 0 : unknown elements are treated as an error, and reading stops.
        
        - 1 : unknown elements are added to the corresponding set, and an error is given if this fails.
        
        - 2 : rows and columns with unknown elements are just silently skipped.
        
        - 3 : rows and columns with unknown elements are skipped, but do raise a warning.
    
    .. aimms:parameter:: MergeWithExistingData
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        
        If set to 0, the identifier(slice) to write to is first emptied before reading any values.
        If set to 1, then only the non-blank values in the table will be written to the identifier(slice), and
        any other existing data in the identifier will remain unmodified.
    
.. aimms:externalprocedure:: WriteTable


    This function writes an identifier in table format to the active excel sheet.
    
    Other than the function :any:`FillTable` this function overwrites all cells in the given ranges, including
    the :any:`RowHeaderRange` and :any:`ColumnHeaderRange`.
    
    .. note::
    
      If you do not need full control over where each part of the table is written, you can also use the function :any:`WriteTableQuick`.
    
    **Examples:**
    
    - 2-dimensional with one index in rows and one index in columns: 
    
    .. code-block:: aimms
        :linenos:
    
        WriteTable( P2(i,j), "A2:A12", "B1:H2", "B2:H12" )
    
    - 1-dimensional with the single index as rows: 
    
    .. code-block:: aimms
        :linenos:
    
        WriteTable( P1(i), "A1:A10", "", "B1:B10" )
    
    - 1-dimensional with the single index as columns: 
    
    .. code-block:: aimms
        :linenos:
    
        WriteTable( P1(i), "", "A1:H1", "A2:H2" )
    
    - 5-dimensional with first 3 indices as row tuples and the last 2 indices as column tuples:
    
    .. code-block:: aimms
        :linenos:
    
        WriteTable( P5(i,j,k,l,m), "A3:C10", "D1:M2", "D3:M10" )

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: Input
    
    
        The (non scalar) identifier of which the data will be written to the table in the active sheet.
        
        You can fix a domain index of the identifier to a specific element, such that only a specific slice of the 
        identifier will be written. 
        A specification like A(i,'fixed-j',k) can in this way be written in a 2-dimensional table.
    
    .. aimms:stringparameter:: RowHeaderRange
    
        :attribute Property: Input
    
    
        The excel range where the starting indices should be written.
        
        It may be left empty (""), which means that all indices will be in the :any:`ColumnHeaderRange`.
        
        **Examples:** 
        
        - "B1:B10" (covering only one domain index), or
        - "B1:C10" (representing tuples of size 2, and thus covering two domain indices).
    
    .. aimms:stringparameter:: ColumnHeaderRange
    
        :attribute Property: Input
    
    
        The excel range where the ending indices are written. 
        
        It may be left empty (""), which means that all indices will be in the :any:`RowHeaderRange`.
        
        **Examples:** 
        
        - "A1:H1" (covering only one domain index), or
        - "A1:H2" (representing tuples of size 2, and thus covering two domain indices).
    
    .. aimms:stringparameter:: DataRange
    
        :attribute Property: Optional
    
    
        (optional) Representing the range where the data of the table is written.
        This range should match with the number of rows in the :any:`RowHeaderRange` and the number of columns in the :any:`ColumnHeaderRange`.
        
        If not specified, the range is automatically determined using the locations of the :any:`RowHeaderRange` and the :any:`ColumnHeaderRange`.
    
    .. aimms:parameter:: WriteZeros
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        If set to 0 a value of 0.0 will appear as an empty cell, otherwise it will be written as an explicit 0.
    
    .. aimms:parameter:: AllowRangeOverflow
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        If set to 1 and there are more rows and/or columns
        in the data than can be contained in the specified row header and/or column header ranges, then 
        these ranges are automatically extended.
    
    .. aimms:parameter:: IncludeEmptyRowsColumns
    
        :attribute Property: Optional
    
    
    
        (optional) Deprecated. Use the arguments :any:`IncludeEmptyRows` and/or :any:`IncludeEmptyColumns` instead.
    
    .. aimms:parameter:: IncludeEmptyRows
    
        :attribute Property: Optional
    
    
        (optional) Default is 0, only applicable if the row range is over a single index
        
        If set to 1, a row in which each values equals 0 will be included.
        If set to 0, such a row will not be written at all.
    
    .. aimms:parameter:: IncludeEmptyColumns
    
        :attribute Property: Optional
    
    
        (optional) Default is 0, only applicable if the column range is over a single index
        
        If set to 1, a column in which each values equals 0 will be included.
        If set to 0, such a column will not be written at all.
    
.. aimms:externalprocedure:: FillTable(IdentifierReference,RowHeaderRange,ColumnHeaderRange,DataRange,writeZeros,clearExistingContent)

    This function writes an identifier to a table in an excel sheet where the row and columns are already present.
    So it reads the existing row and column ranges from the sheet and then writes the proper values to the cells
    of the :any:`DataRange`. This means that the content of the :any:`RowHeaderRange` and :any:`ColumnHeaderRange` remains unchanged and
    only the cells in the :any:`DataRange` will be written.
    
    .. note::
    
      If you need to fill a table where there is only a row header or only a column header, use the function 
      :any:`FillList` instead.

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: Input
    
    
        The (non scalar) identifier of which the data will be written to the table in the active sheet.
        
        You can fix a domain index of the identifier to a specific element, such that only a specific slice of the 
        identifier will be written. 
        A specification like A(i,'fixed-j',k) can in this way be written in a 2-dimensional table.
    
    .. aimms:stringparameter:: RowHeaderRange
    
        :attribute Property: Input
    
    
        The excel range where the starting indices reside.
        
        **Examples:** 
        
        - "B1:B10" (covering only one domain index), or
        - "B1:C10" (representing tuples of size 2, and thus covering two domain indices).
    
    .. aimms:stringparameter:: ColumnHeaderRange
    
        :attribute Property: Input
    
    
        The excel range where the ending indices reside. 
        
        **Examples:**
        
        - "A1:H1" (covering only one domain index), or
        - "A1:H2" (representing tuples of size 2, and thus covering two domain indices).
    
    .. aimms:stringparameter:: DataRange
    
        :attribute Property: Optional
    
    
        (optional) Representing the range where the data of the table is written.
        This range should match with the number of rows in the :any:`RowHeaderRange` and the number of columns in the :any:`ColumnHeaderRange`.
        
        If not specified, the range is automatically determined using the locations of the :any:`RowHeaderRange` and the :any:`ColumnHeaderRange`.
    
    .. aimms:parameter:: WriteZeros
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        If set to 0 a value of 0.0 will appear as an empty cell, otherwise it will be written as an explicit 0.
    
    .. aimms:parameter:: clearExistingContent
    
        :attribute Default: 1
    
        :attribute Property: Optional
    
    
        (optional) Default is 1.
        If set to 0 any existing cell content will not be overwritten by an empty value if the corresponding data
        in the identifier does not exist (or is 0.0)
    
.. aimms:externalprocedure:: FillList(IdentifierReference,RowHeaderRange,DataRange,writeZeros,clearExistingContent)



    This function writes an identifier to a list format in an excel sheet where the row headers are already present.
    So it reads the existing row range from the sheet and then writes the proper values to the cells
    of the :any:`DataRange`. 
    
    The :any:`DataRange` should have either a width of 1 (vertical oriented), or it should have a height
    of 1 (horizontally oriented).
    
    If the :any:`DataRange` is a horizontally oriented, the :any:`RowHeaderRange` should also
    be oriented horizontally and the number of columns in the :any:`RowHeaderRange` should match the number of
    columns in the :any:`DataRange`. In other words, the :any:`RowHeaderRange` is than treated as a column header.
    
    **Examples:**
    
    - 1-dimensional, vertically oriented: 
    
    .. code-block:: aimms
        :linenos:
    
        FillList( P1(i), "A1:A10", "B1:B10" )
    
    - 1-dimensional, horizontally oriented: 
                        
    .. code-block:: aimms
        :linenos:
    
        FillList( P1(i), "A1:J1", "A2:J2" )
    
    - 2-dimensional, vertically oriented: 
                        
    .. code-block:: aimms
        :linenos:

        FillList( P2(i,j), "A1:B20", "C1:C20" )
    
    - 2-dimensional, horizontally oriented: 
                        
    .. code-block:: aimms
        :linenos:
    
        FillList( P2(i,j), "A1:Z2", "A3:Z3" )

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: Input
    
        The (non scalar) identifier of which the data will be written as a list in the active sheet.
    
    .. aimms:stringparameter:: RowHeaderRange
    
        :attribute Property: Input
    
    
    
        The excel range where the indices reside (either horizontally or vertically oriented)
    
    .. aimms:stringparameter:: DataRange
    
        :attribute Property: Input
    
    
    
        The excel range where the data should be written.
    
    .. aimms:parameter:: WriteZeros
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        If set to 0 a value of 0.0 will appear as an empty cell, otherwise it will be written as an explicit 0.
    
    .. aimms:parameter:: clearExistingContent
    
        :attribute Default: 1
    
        :attribute Property: Optional
    
    
        (optional) Default is 1.
        If set to 0 any existing cell content will not be overwritten by an empty value if the corresponding data
        in the identifier does not exist (or is 0.0)
    
.. aimms:externalprocedure:: WriteTableQuick(IdentifierReference,TopLeftCell,RowDimension,writeZeros,IncludeEmptyRows, IncludeEmptyColumns,IncludeEmptyRowsColumns)



    This function writes an identifier in table (or list) format to the active excel sheet.
    It only needs the top-left cell where the table to start and the number of indices that should
    be used as row indices.
    
    The resulting table in the sheet will have a 'natural' layout without any
    empty rows or columns to separate the headers from the actual data.
    
    This is a utility function that is easier to use than :any:`WriteTable`. If you need more control over where row and column headers should appear,
    you should use the :any:`WriteTable` function instead.
    
    **Examples:**
    
    .. code-block:: aimms
        :linenos:
    
        WriteTableQuick(P(i,j,k), "A1", 2) 
    
        ! produces the same result as
    
        WriteTable(P(i,j,k), "A2:B10", "C1:D1", AllowRangeOverflow:1)
    
        !or 
    
        WriteTableQuick(P(i,j,k), "A1", 1)
    
        ! produces the same result as
    
        WriteTable(P(i,j,k), "A3:A10", "B1:H2", AllowRangeOverflow:1)
    
    
    .. code-block:: aimms
        :linenos:
    
        WriteTable( P(i,j,k,'l1'), "A1", 2 )
        
    - writes the tuples (i,j) to the range "A2:B[n]" (where n depends on the amount of data written)
    - writes the tuples (k) to the range "C1:[N]1"  (where N depends on the amount of data written)
    - writes the value to the range with the left top corner in C2

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: Input
    
    
        The (non scalar) identifier of which the data will be written to the table in the active sheet.
        
        You can fix a domain index of the identifier to a specific element, such that only a specific slice of the 
        identifier will be written. 
        A specification like A(i,'fixed-j',k) can in this way be written in a 2-dimensional table.
    
    .. aimms:stringparameter:: TopLeftCell
    
        :attribute Property: Input
    
    
    
        The top-left excel cell where the table should start.
    
    .. aimms:parameter:: RowDimension
    
        :attribute Property: Input
    
    
        The number of indices in the domain of the identifier that should be written as rows of the table. 
        The remaining indices will appear as columns.
        The value should be in the range [0 .. dimension of identifier].
    
    .. aimms:parameter:: WriteZeros
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        If set to 0 a value of 0.0 will appear as an empty cell, otherwise it will be written as an explicit 0.
    
    .. aimms:parameter:: IncludeEmptyRowsColumns
    
        :attribute Property: Optional
    
    
    
        (optional) Deprecated. Use the arguments :any:`IncludeEmptyRows` and/or :any:`IncludeEmptyColumns` instead.
    
    .. aimms:parameter:: IncludeEmptyRows
    
        :attribute Property: Optional
    
    
        (optional) Default is 0, only applicable if :any:`RowDimension` is 1.
        
        - If set to 1, a row in which each values equals 0 will be included.
        - If set to 0, such a row will not be written at all.
    
    .. aimms:parameter:: IncludeEmptyColumns
    
        :attribute Property: Optional
    
    
        (optional) Default is 0, only applicable if (dimension-of-identifier - :any:`RowDimension`) equals 1.
        
        - If set to 1, a column in which each values equals 0 will be included.
        - If set to 0, such a column will not be written at all.
    
.. aimms:externalprocedure:: WriteCompositeTable(IdentifierReference,TopLeftCell,WriteZeros,WriteIndexNames)



    This function writes multiple identifiers to a composite table format in the active excel sheet
    
    **Example:** 
    
    Assume identifiers ``P(i,j)`` and ``Q(i,j)``, and set ``Contents = { P, Q }``, then
    
    .. code-block:: aimms
        :linenos:
      
        WriteCompositeTable( Contents, "A1", 1 )
             
    - writes all tuples (i,j) for which either P or Q has a non default value to the range "A2:B<n>"
    - writes the string "P" in the cell "C1" (the title of that column) 
    - writes the corresponding P values to the range "C2:C<n>"
    - writes the string "Q" in the cell "D1" (the title of that column) 
    - writes the corresponding Q values to the range "D2:D<n>" (where <n> depends on the amount of data)
         
    Values equal to 0.0 are written as explicit 0 values.

    
    
    
    
.. aimms:externalprocedure:: ReadList(IdentifierReference,RowHeaderRange,DataRange,ModeForUnknownElements,MergeWithExistingData)



    This function reads a list of data from the active excel sheet into an identifier reference.
    
    The function is similar to :any:`ReadTable` where either the :any:`ReadTable::ColumnHeaderRange` or the :any:`ReadTable::RowHeaderRange` is left empty.

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: InOut
    
    
        The (non scalar) identifier to which the data from the sheet will be written.
        
        You can fix a domain index of the identifier to a specific element, such that only a specific slice of the 
        identifier will be written.
    
    .. aimms:stringparameter:: RowHeaderRange
    
        :attribute Property: Input
    
    
    
        The excel range where the indices reside (either horizontally or vertically oriented)
    
    .. aimms:stringparameter:: DataRange
    
        :attribute Property: Input
    
    
        Representing the range from which to read the data.
        This range should be either one row high, or one column wide.
    
    .. aimms:parameter:: ModeForUnknownElements
    
        :attribute Property: Optional
    
    
        (optional) Default = 0.
        This argument specified what to do with elements in the rows or columns that do not exist in the corresponding domain set.
        
        Valid values are:
        
        - 0 : unknown elements are treated as an error, and reading stops.
        
        - 1 : unknown elements are added to the corresponding set, and an error is given if this fails.
        
        - 2 : rows and columns with unknown elements are just silently skipped.
        
        - 3 : rows and columns with unknown elements are skipped, but do raise a warning.
    
    .. aimms:parameter:: MergeWithExistingData
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        
        - If set to 0, the identifier(slice) to write to is first emptied before reading any values.
        - If set to 1, then only the non-blank values in the table will be written to the identifier(slice), and any other existing data in the identifier will remain unmodified.
    
.. aimms:externalprocedure:: ReadRawValues(IdentifierReference,DataRange,MergeWithExistingData)



    This function reads a block of values from the active excel sheet into an identifier reference without an explicit matching on element names.
    Rows (and columns) in the range are mapped to element in the domain sets based on the ordinal position.
    
    Please note that the result is unpredictable if the domain sets of the identifier do not have an explicit or implicit ordering.
    
    **Examples:** 
    
    If i references an (ordered) set with elements { i1 .. i10 },
    and j references an (ordered) set with elements { j1 .. j10 }, then
    
    .. code-block:: aimms
        :linenos:
    
        ReadRawValues( P(i,j), "E2:G5" )
      
    assigns E3 to P('i2','j1') and F5 to P('i4','j2')
    here E3 stands for the content of cell E3 in the excel sheet (etc.)

    .. aimms:handle:: IdentifierReference
    
        :attribute Property: InOut
    
    
        A one or two dimensional identifier to write to.
        
        You can fix a domain index of the identifier to a specific element, such that only a specific slice of the 
        identifier will be written.
    
    .. aimms:stringparameter:: DataRange
    
        :attribute Property: Optional
    
    
        Representing the range from which to read the data.
        If the identifier is one-dimensional, this range should be either one row high, or one column wide.
    
    .. aimms:parameter:: MergeWithExistingData
    
        :attribute Property: Optional
    
    
        (optional) Default is 0.
        
        If set to 0, the identifier(slice) to write to is first emptied before reading any values.
        If set to 1, then only the non-blank values in the table will be written to the identifier(slice), and
        any other existing data in the identifier will remain unmodified.


.. spelling:word-list::
    
    th