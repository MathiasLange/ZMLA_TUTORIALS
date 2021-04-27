*&---------------------------------------------------------------------*
*& Report zmla_invoice_items_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmla_invoice_items_euro.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_main.

    METHODS run.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD create.

*   r_result = NEW #( ).
    CREATE OBJECT r_result.

  ENDMETHOD.

  METHOD run.

    DATA(invoices) = NEW zcl_mla_invoice_retieval(  ).
    DATA(invoice_items) = invoices->get_items_from_db(  ).

    TRY.
        cl_salv_table=>factory(
          IMPORTING
            r_salv_table   = DATA(alv_table)
          CHANGING
            t_table        = invoice_items
        ).
      CATCH cx_salv_msg.
        WRITE 'Fehler ALV'.
        EXIT.
    ENDTRY.

    alv_table->display( ).

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  lcl_main=>create(  )->run(  ).
