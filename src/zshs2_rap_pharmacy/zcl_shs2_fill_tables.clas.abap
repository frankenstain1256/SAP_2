CLASS zcl_shs2_fill_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS fill_employee_table.
    METHODS csv_file_import.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SHS2_FILL_TABLES IMPLEMENTATION.


  METHOD csv_file_import.

*    TYPES: lty_string_table TYPE STANDARD TABLE OF string.
*
*    DATA: lt_import_table TYPE STANDARD TABLE OF string,
*          lt_string_table TYPE lty_string_table,
*          lv_struct_name  TYPE string,
*          inputbox_file   TYPE string VALUE '',
*          lv_sep_count    TYPE i,
*          lv_idx          TYPE i,
*          lt_file_table   LIKE STANDARD TABLE OF lt_string_table,
*          lv_error_log    TYPE string,
*          listbox_table   TYPE string,
*          sep_table       TYPE REF TO data,
*          sep_line        TYPE REF TO data,
*          comp_count      TYPE i,
*          t               TYPE c.
*
*    FIELD-SYMBOLS: <ls_import_table> TYPE string,
*                   <sep_table>       TYPE ANY TABLE,
*                   <sep_line>        TYPE any.
*
*    " Import text file into internal table of string type
*    CLEAR lt_import_table.
*    CALL METHOD cl_gui_frontend_services=>gui_upload
*      EXPORTING
*        filename            = inputbox_file
*        filetype            = 'ASC' "Read file as ASCII
*        has_field_separator = abap_true
*        read_by_line        = abap_true
*        codepage            = '1504' "Cyrillic Windows-1251
*      CHANGING
*        data_tab            = lt_import_table.
*    " ----------
*
*    " Split strings of text file with separator into segments and load them into internal table of proper structure type
*    " 1. Creating table and structure of proper type and assigning FS
*    CREATE DATA sep_table TYPE STANDARD TABLE OF (lv_struct_name).
*    ASSIGN sep_table->* TO <sep_table>.
*    CREATE DATA sep_line TYPE (lv_struct_name).
*    ASSIGN sep_line->* TO <sep_line>.
*    " 2. Get structure' components count
*    DESCRIBE FIELD <sep_line> TYPE t COMPONENTS comp_count.
*    CLEAR lt_file_table.
*    lv_idx = 0.
*    lv_error_log = `Error log of reading file ` && inputbox_file && |\r\n|.
*
*    " 3. Looping at import table
*    LOOP AT lt_import_table ASSIGNING <ls_import_table>.
*      CALL FUNCTION 'ZSHS2_READ_SEP_STRING'
*        EXPORTING
*          input_string = <ls_import_table>
*          separator    = ';' " Separator
*        IMPORTING
*          string_table = lt_string_table
*          count        = lv_sep_count.
*
*      IF lv_sep_count < comp_count.
*        lv_error_log = lv_error_log && `Line #` && condense( CONV string( lv_idx ) ) && ` (` && <ls_import_table> && `) has less items than the structure. Ignoring line.` && |\n|.
*      ELSE.
*        " 4. Looping at structure
*        DO comp_count TIMES.
*          FIELD-SYMBOLS: <rc> TYPE any.
*          ASSIGN COMPONENT sy-index OF STRUCTURE <sep_line> TO <rc>.
*          <rc> = CONV #( lt_string_table[ sy-index ] ).
*        ENDDO.
*      ENDIF.
*      INSERT <sep_line> INTO TABLE <sep_table>.
*      lv_idx += 1.
*    ENDLOOP.
*
*    " 5. Displaying error log
*    IF sy-subrc <> 0.
*      MESSAGE `Unknown file import error` TYPE 'E'.
*    ELSE.
*      IF count( val = lv_error_log sub = |\n| ) > 1.
*        cl_demo_output=>display( lv_error_log ).
*      ELSE.
*        MESSAGE 'Reading file completed successfully!' TYPE 'I'.
*      ENDIF.
*    ENDIF.
*
*    " for testing purposes - display results of creating internal table of proper structure type
*    "cl_demo_output=>display( <sep_table> ).
*    " ----------
*
*    " 6. Modify DB table
*    MODIFY (listbox_table) FROM TABLE @<sep_table>.
*    IF sy-subrc <> 0.
*      MESSAGE `Unknown table MODIFY error` TYPE 'E'.
*    ELSE.
*      MESSAGE `DB table ` && listbox_table && ` modified successfully! ` && condense( CONV string( sy-dbcnt ) ) && ` rows processed.` TYPE 'I'.
*    ENDIF.
*
*    " 7. Clearing variables
*    CLEAR lt_import_table.
*    CLEAR lv_error_log.
*    CLEAR lt_string_table.
*    " ----------
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    CALL METHOD me->fill_employee_table.
  ENDMETHOD.


  METHOD fill_employee_table.
*    DATA zshs2_s_employee TYPE zshs2_d_employee.
*
*    zshs2_s_employee-e_id = '000002'.
*    zshs2_s_employee-e_birth_date = '19911101'.
*    zshs2_s_employee-e_pers_discount = 22.
*
*    INSERT zshs2_d_employee FROM @zshs2_s_employee.

*    DELETE FROM zshs2_d_employee.
*    DELETE FROM zshs2_d_ac_sub_t.
*    DELETE FROM zshs2_d_sales_dt.

*    TYPES zshs2_s_pos_empl TYPE zshs2_d_pos_empl.
*    DATA zshs2_t_pos_empl TYPE TABLE OF zshs2_a_pos_empl.

**
*    SELECT *
*    FROM zshs2_d_pos_empl
*    INTO TABLE @DATA(zshs2_t_pos_empl).
*
*    INSERT zshs2_a_pos_empl FROM TABLE @zshs2_t_pos_empl.

*
    SELECT *
    FROM zshs2_d_sales_dt
    INTO TABLE @DATA(zshs2_t_sales_dt).

    INSERT zshs2_a_sales_dt FROM TABLE @zshs2_t_sales_dt.
  ENDMETHOD.
ENDCLASS.
