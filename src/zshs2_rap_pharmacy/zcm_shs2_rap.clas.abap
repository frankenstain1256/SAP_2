CLASS zcm_shs2_rap DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF pers_number_duplicated,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'PERSONALNUMBER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF pers_number_duplicated.
    CONSTANTS:
      BEGIN OF birth_date,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'BIRTHDATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF birth_date.
    CONSTANTS:
      BEGIN OF employee_name_not_capital,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'EMPLOYEENAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF employee_name_not_capital.
    CONSTANTS:
      BEGIN OF employee_discount_exceeded,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'EMPLOYEEDISCOUNT',
        attr2 TYPE scx_attrname VALUE 'MAXDISCOUNT',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF employee_discount_exceeded.
    CONSTANTS:
      BEGIN OF pos_number_duplicated,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'POSNUMBER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF pos_number_duplicated.
    CONSTANTS:
      BEGIN OF placement_date_wrong,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE 'PLACEMENTDATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF placement_date_wrong.
    CONSTANTS:
      BEGIN OF sale_discount_exceeded,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE 'SALEDISCOUNT',
        attr2 TYPE scx_attrname VALUE 'EMPLOYEEDISCOUNT',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF sale_discount_exceeded.
    CONSTANTS:
      BEGIN OF employee_unknown,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE 'EMPLOYEEID',
        attr2 TYPE scx_attrname VALUE 'PERSONALNUMBER',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF employee_unknown.
    CONSTANTS:
      BEGIN OF pos_unknown,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE 'POSNUMBER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF pos_unknown.
    CONSTANTS:
      BEGIN OF product_unknown,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE 'PRODUCTID',
        attr2 TYPE scx_attrname VALUE 'PRODUCTNAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF product_unknown.
    CONSTANTS:
      BEGIN OF act_subst_unknown,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '011',
        attr1 TYPE scx_attrname VALUE 'ACTIVESUBSTANCEID',
        attr2 TYPE scx_attrname VALUE 'ACTIVESUBSTANCENAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF act_subst_unknown.
    CONSTANTS:
      BEGIN OF employee_last_name_empty,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '012',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF employee_last_name_empty.
    CONSTANTS:
      BEGIN OF employee_first_name_empty,
        msgid TYPE symsgid VALUE 'ZCM_SHS2_MSG',
        msgno TYPE symsgno VALUE '013',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF employee_first_name_empty.

    METHODS constructor
      IMPORTING
        severity            TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid              LIKE if_t100_message=>t100key OPTIONAL
        personalnumber      TYPE zshs2_pers_number OPTIONAL
        birthdate           TYPE zshs2_date OPTIONAL
        employeename        TYPE zshs2_pers_last_name OPTIONAL
        employeediscount    TYPE zshs2_pers_discount OPTIONAL
        maxdiscount         TYPE zshs2_pers_discount OPTIONAL
        posnumber           TYPE zshs2_pos_number OPTIONAL
        placementdate       TYPE zshs2_date OPTIONAL
        salediscount        TYPE zshs2_product_discount OPTIONAL
        employeeid          TYPE zshs2_pers_id OPTIONAL
        productid           TYPE zshs2_product_id OPTIONAL
        productname         TYPE zshs2_product_name OPTIONAL
        activesubstanceid   TYPE zshs2_act_subst_id OPTIONAL
        activesubstancename TYPE zshs2_act_subst_name OPTIONAL
      .

    DATA personalnumber      TYPE zshs2_pers_number READ-ONLY.
    DATA birthdate           TYPE zshs2_date READ-ONLY.
    DATA employeename        TYPE zshs2_pers_last_name READ-ONLY.
    DATA employeediscount    TYPE zshs2_pers_discount READ-ONLY.
    DATA maxdiscount         TYPE zshs2_pers_discount READ-ONLY.
    DATA posnumber           TYPE zshs2_pos_number READ-ONLY.
    DATA placementdate       TYPE zshs2_date READ-ONLY.
    DATA salediscount        TYPE zshs2_product_discount READ-ONLY.
    DATA employeeid          TYPE zshs2_pers_id READ-ONLY.
    DATA productid           TYPE zshs2_product_id READ-ONLY.
    DATA productname         TYPE zshs2_product_name READ-ONLY.
    DATA activesubstanceid   TYPE zshs2_act_subst_id READ-ONLY.
    DATA activesubstancename TYPE zshs2_act_subst_name READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCM_SHS2_RAP IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.

    me->birthdate = birthdate.
    me->placementdate = placementdate.
    me->personalnumber = |{ personalnumber ALPHA = OUT }|.
    me->posnumber = |{ posnumber ALPHA = OUT }|.
    me->employeeid = |{ employeeid ALPHA = OUT }|.
    me->productid = |{ productid ALPHA = OUT }|.
    me->activesubstanceid = |{ activesubstanceid ALPHA = OUT }|.
    me->employeename = employeename.
    me->employeediscount = employeediscount.
    me->salediscount = salediscount.
    me->productname = productname.
    me->activesubstancename = activesubstancename.
  ENDMETHOD.
ENDCLASS.
