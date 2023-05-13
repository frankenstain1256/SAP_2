CLASS lhc_ZSHS2_I_SALES DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS acceptReceipt FOR MODIFY
*      IMPORTING keys FOR ACTION Sales~acceptReceipt.
*
*    METHODS rejectReceipt FOR MODIFY
*      IMPORTING keys FOR ACTION Sales~rejectReceipt.
*
    METHODS calculateReceiptNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Sales~calculateReceiptNumber.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Sales RESULT result.
*
*    METHODS validateCashStatus FOR VALIDATE ON SAVE
*      IMPORTING keys FOR Sales~validateCashStatus.

*    METHODS cba_sale FOR NUMBERING
*      IMPORTING entities FOR CREATE Sales.

*    METHODS cba_sale_dt FOR NUMBERING
*      IMPORTING entities FOR CREATE Sales\_Sales_DT.

ENDCLASS.

CLASS lhc_ZSHS2_I_SALES IMPLEMENTATION.

*  METHOD acceptReceipt.
*  ENDMETHOD.
*
*  METHOD rejectReceipt.
*  ENDMETHOD.

  METHOD calculateReceiptNumber.
    READ ENTITIES OF zshs2_i_sales IN LOCAL MODE
      ENTITY Sales
        FIELDS ( ReceiptNumber posid ) WITH CORRESPONDING #( keys )
      RESULT DATA(sales).

    LOOP AT sales INTO DATA(sale).
      SELECT SINGLE FROM zshs2_a_pos
      FIELDS pos_number
      WHERE pos_id = @sale-posid
      INTO @DATA(pos_number).
    ENDLOOP.

    MODIFY ENTITIES OF zshs2_i_sales IN LOCAL MODE
      ENTITY Sales
        UPDATE
          FROM VALUE #( FOR sale_ IN sales INDEX INTO i (
            %tky              = sale_-%tky
            ReceiptNumber = pos_number * 10000000000
            %control-ReceiptNumber = if_abap_behv=>mk-on ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

*  METHOD validateCashStatus.
*  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF zshs2_i_sales IN LOCAL MODE
      ENTITY Sales
         FIELDS ( ReceiptNumber )
         WITH CORRESPONDING #( keys )
      RESULT DATA(sales)
      FAILED failed.

    result = VALUE #( FOR sale IN sales ( %tky = sale-%tky ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZSHS2_I_SALES DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

*    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZSHS2_I_SALES IMPLEMENTATION.

  METHOD adjust_numbers.
    SELECT SINGLE FROM zshs2_a_sales
    FIELDS MAX( mod( CAST( s_receipt_number AS INT8 ), 10000000000 ) ) AS max_num
    INTO @DATA(max_num).

    LOOP AT mapped-sales REFERENCE INTO DATA(lr_sales).
      IF lr_sales->ReceiptNumber IS INITIAL.
        lr_sales->ReceiptNumber += max_num + 1.
      ENDIF.
      max_num = lr_sales->ReceiptNumber.
    ENDLOOP.

    LOOP AT mapped-sales_dt REFERENCE INTO DATA(lr_sales_dt).
      IF lr_sales_dt->ReceiptNumber IS INITIAL.
        lr_sales_dt->ReceiptNumber = max_num.
      ENDIF.
      IF lr_sales_dt->ProductID IS INITIAL.
        lr_sales_dt->ProductID = lr_sales_dt->%tmp-ProductID.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

*  METHOD cleanup_finalize.
*  ENDMETHOD.

ENDCLASS.
