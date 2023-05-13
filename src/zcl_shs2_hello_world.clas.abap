CLASS zcl_shs2_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SHS2_HELLO_WORLD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( |Hello, world! ({ cl_abap_context_info=>get_user_technical_name(  ) })| ).
  ENDMETHOD.
ENDCLASS.
