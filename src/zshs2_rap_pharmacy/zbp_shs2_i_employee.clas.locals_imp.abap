CLASS lsc_zshs2_i_employee DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zshs2_i_employee IMPLEMENTATION.

  METHOD adjust_numbers.
    SELECT SINGLE FROM zshs2_a_employee
    FIELDS MAX( e_id ) AS EmployeeID
    INTO @DATA(max_e_id).

    LOOP AT mapped-employee REFERENCE INTO DATA(lr_employee).
      max_e_id += 1.
      lr_employee->EmployeeID = max_e_id.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZSHS2_I_EMPLOYEE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR employee RESULT result.

    METHODS validatePersonalNumber FOR VALIDATE ON SAVE
      IMPORTING keys FOR employee~validatePersonalNumber.

    METHODS validateBirthDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Employee~validateBirthDate.

    METHODS validateDiscount FOR VALIDATE ON SAVE
      IMPORTING keys FOR Employee~validateDiscount.

    METHODS validateNames FOR VALIDATE ON SAVE
      IMPORTING keys FOR Employee~validateNames.

    METHODS calculateCorpEmail FOR DETERMINE ON SAVE
      IMPORTING keys FOR Employee~calculateCorpEmail.

ENDCLASS.

CLASS lhc_ZSHS2_I_EMPLOYEE IMPLEMENTATION.

*  METHOD get_instance_features.
*  ENDMETHOD.

  METHOD validatePersonalNumber.
    READ ENTITIES OF zshs2_i_employee IN LOCAL MODE
      ENTITY Employee
        FIELDS ( EmployeePersonalNumber ) WITH CORRESPONDING #( keys )
      RESULT DATA(employees).

    DATA employee_pers_numbers TYPE SORTED TABLE OF zshs2_a_employee WITH UNIQUE KEY e_pers_number.

    employee_pers_numbers = CORRESPONDING #( employees DISCARDING DUPLICATES MAPPING e_pers_number = EmployeePersonalNumber EXCEPT * ).
    DELETE employee_pers_numbers WHERE e_pers_number IS INITIAL.

    IF employees IS NOT INITIAL.
      SELECT FROM zshs2_a_employee FIELDS e_pers_number
        FOR ALL ENTRIES IN @employee_pers_numbers
        WHERE e_pers_number = @employee_pers_numbers-e_pers_number
        INTO TABLE @DATA(pers_numbers_db).
    ENDIF.

    LOOP AT employees INTO DATA(employee).
      APPEND VALUE #(  %tky               = employee-%tky
                       %state_area        = 'VALIDATE_PERSONAL_NUMBER' )
        TO reported-employee.

      IF employee-EmployeePersonalNumber IS INITIAL OR line_exists( pers_numbers_db[ e_pers_number = employee-EmployeePersonalNumber ] ).
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_PERSONAL_NUMBER'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>pers_number_duplicated
                                          personalnumber = employee-EmployeePersonalNumber )
                        %element-EmployeePersonalNumber = if_abap_behv=>mk-on )
          TO reported-employee.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateBirthDate.
    CONSTANTS
      min_age TYPE int1 VALUE 16.

    READ ENTITIES OF zshs2_i_employee IN LOCAL MODE
      ENTITY Employee
        FIELDS ( EmployeeBirthDate ) WITH CORRESPONDING #( keys )
      RESULT DATA(employees).

    LOOP AT employees INTO DATA(employee).
      APPEND VALUE #(  %tky               = employee-%tky
                       %state_area        = 'VALIDATE_EMPLOYEE_BIRTH_DATE' )
        TO reported-employee.

      IF sy-datum+0(4) - employee-EmployeeBirthDate+0(4) + ( sy-datum+4(2) - employee-EmployeeBirthDate+4(2) ) / 100  + ( sy-datum+6(2) - employee-EmployeeBirthDate+6(2) ) / 10000 <  min_age.
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_BIRTH_DATE'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>birth_date
                                          birthdate = employee-EmployeeBirthDate )
                        %element-EmployeeBirthDate = if_abap_behv=>mk-on )
          TO reported-employee.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateDiscount.
    CONSTANTS
      max_discount TYPE int1 VALUE 30.

    READ ENTITIES OF zshs2_i_employee IN LOCAL MODE
      ENTITY Employee
        FIELDS ( EmployeeDiscount ) WITH CORRESPONDING #( keys )
      RESULT DATA(employees).

    LOOP AT employees INTO DATA(employee).
      APPEND VALUE #(  %tky               = employee-%tky
                       %state_area        = 'VALIDATE_EMPLOYEE_DISCOUNT' )
        TO reported-employee.

      IF employee-EmployeeDiscount >= max_discount.
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_DISCOUNT'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>employee_discount_exceeded
                                          employeediscount = employee-EmployeeDiscount )
                        %element-EmployeeDiscount = if_abap_behv=>mk-on )
          TO reported-employee.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateNames.
    READ ENTITIES OF zshs2_i_employee IN LOCAL MODE
      ENTITY Employee
        FIELDS ( EmployeeLastName EmployeeFirstName EmployeeMiddleName ) WITH CORRESPONDING #( keys )
      RESULT DATA(employees).

    LOOP AT employees INTO DATA(employee).
      APPEND VALUE #(  %tky               = employee-%tky
                       %state_area        = 'VALIDATE_EMPLOYEE_NAME' )
        TO reported-employee.

      IF strlen( employee-EmployeeLastName ) = 0.
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_NAME'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>employee_last_name_empty
                                          employeename = employee-EmployeeLastName )
                        %element-EmployeeLastName = if_abap_behv=>mk-on )
          TO reported-employee.
      ELSEIF substring( val = employee-EmployeeLastName len = 1 ) NE to_upper( substring( val = employee-EmployeeLastName len = 1 ) ).
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_NAME'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>employee_name_not_capital
                                          employeename = employee-EmployeeLastName )
                        %element-EmployeeLastName = if_abap_behv=>mk-on )
          TO reported-employee.
      ENDIF.

      IF strlen( employee-EmployeeFirstName ) = 0.
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_NAME'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>employee_first_name_empty
                                          employeename = employee-EmployeeFirstName )
                        %element-EmployeeFirstName = if_abap_behv=>mk-on )
          TO reported-employee.
      ELSEIF substring( val = employee-EmployeeFirstName len = 1 ) NE to_upper( substring( val = employee-EmployeeFirstName len = 1 ) ).
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_NAME'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>employee_name_not_capital
                                          employeename = employee-EmployeeFirstName )
                        %element-EmployeeFirstName = if_abap_behv=>mk-on )
          TO reported-employee.
      ENDIF.

      IF strlen( employee-EmployeeMiddleName ) > 0 AND ( substring( val = employee-EmployeeMiddleName len = 1 ) NE to_upper( substring( val = employee-EmployeeMiddleName len = 1 ) ) ).
        APPEND VALUE #( %tky = employee-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = employee-%tky
                        %state_area = 'VALIDATE_EMPLOYEE_NAME'
                        %msg        = NEW zcm_shs2_rap(
                                          severity = if_abap_behv_message=>severity-error
                                          textid   = zcm_shs2_rap=>employee_name_not_capital
                                          employeename = employee-EmployeeMiddleName )
                        %element-EmployeeMiddleName = if_abap_behv=>mk-on )
          TO reported-employee.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD calculateCorpEmail.
    READ ENTITIES OF zshs2_i_employee IN LOCAL MODE
      ENTITY Employee
        FIELDS ( EmployeeLastName EmployeeFirstName EmployeeMiddleName EmployeeCorpEmail ) WITH CORRESPONDING #( keys )
      RESULT DATA(employees).

    DELETE employees WHERE EmployeeCorpEmail IS NOT INITIAL.

    TRY.
        MODIFY ENTITIES OF zshs2_i_employee IN LOCAL MODE
          ENTITY Employee
            UPDATE
              FROM VALUE #( FOR employee IN employees INDEX INTO i (
                %tky              = employee-%tky
                EmployeeCorpEmail = employee-EmployeeLastName && substring( val = employee-EmployeeFirstName len = 1 ) && substring( val = employee-EmployeeMiddleName len = 1 ) && '@apoth-corp.com'
                %control-EmployeeCorpEmail = if_abap_behv=>mk-on ) )
        REPORTED DATA(update_reported).
      CATCH cx_sy_range_out_of_bounds INTO DATA(error).
    ENDTRY.


    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

ENDCLASS.
