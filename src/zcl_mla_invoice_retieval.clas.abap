CLASS zcl_mla_invoice_retieval DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: ty_table_of_zmla_invoice_item TYPE STANDARD TABLE OF zmla_invoice_item WITH DEFAULT KEY.

"! <p class="shorttext synchronized">Read items from DB</p>
"! Method reads invoice items from database.
"! @parameter lt_result | <p class="shorttext synchronized">Table of Invoice items</p>
"!
    METHODS get_items_from_db
      RETURNING
        VALUE(lt_result) TYPE ty_table_of_zmla_invoice_item.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_mla_invoice_retieval IMPLEMENTATION.

  METHOD get_items_from_db.

    SELECT
       snwd_bpa~company_name,
       snwd_so_inv_item~gross_amount,
       snwd_so_inv_item~currency_code,
       snwd_so_inv_head~payment_status
     FROM
      snwd_so_inv_item
      JOIN snwd_so_inv_head ON snwd_so_inv_item~parent_key = snwd_so_inv_head~node_key
      JOIN snwd_bpa         ON snwd_so_inv_head~buyer_guid = snwd_bpa~node_key
     WHERE
      snwd_so_inv_item~currency_code = 'USD'
     ORDER BY snwd_bpa~company_name
     INTO TABLE @lt_result.

    LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<entry>).
      CASE <entry>-payment_status.
        WHEN 'P'.
          <entry>-payment_status = abap_true.
        WHEN OTHERS.
          <entry>-payment_status = abap_false.
      ENDCASE.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
