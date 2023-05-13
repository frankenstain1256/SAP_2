CLASS lhc_Sales_DT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calcTotal FOR MODIFY
      IMPORTING keys FOR ACTION Sales_DT~calcTotal.

    METHODS calculateBasePrice FOR DETERMINE ON SAVE
      IMPORTING keys FOR Sales_DT~calculateBasePrice.

    METHODS calculateTotalCost FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Sales_DT~calculateTotalCost.

ENDCLASS.

CLASS lhc_Sales_DT IMPLEMENTATION.

  METHOD calcTotal.
  ENDMETHOD.

  METHOD calculateBasePrice.
    READ ENTITIES OF zshs2_i_sales IN LOCAL MODE
      ENTITY Sales_DT BY \_Sales
        FIELDS ( ReceiptNumber posid ) WITH CORRESPONDING #( keys )
      RESULT DATA(sales).

    READ ENTITIES OF zshs2_i_sales IN LOCAL MODE
      ENTITY Sales_DT
        FIELDS ( ReceiptNumber ProductID ) WITH CORRESPONDING #( keys )
      RESULT DATA(sales_dt).

    LOOP AT sales INTO DATA(sale).
      LOOP AT sales_dt INTO DATA(sale_dt).
        SELECT SINGLE FROM zshs2_a_pos_remn
        FIELDS r_p_id, r_p_base_price, r_p_count
        WHERE r_pos_id = @sale-posid AND r_p_id = @sale_dt-productid
        INTO @DATA(prod_remns).
      ENDLOOP.
    ENDLOOP.

    MODIFY ENTITIES OF zshs2_i_sales IN LOCAL MODE
      ENTITY Sales_DT
        UPDATE
          FROM VALUE #( FOR sale_dt2 IN sales_dt INDEX INTO i (
            %tky                      = sale_dt2-%tky
            ProductID                 = prod_remns-r_p_id
            ProductBasePrice          = prod_remns-r_p_base_price
            %control-ProductBasePrice = if_abap_behv=>mk-on ) )
    MAPPED DATA(mapped)
    FAILED DATA(failed)
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD calculateTotalCost.
  ENDMETHOD.

ENDCLASS.
