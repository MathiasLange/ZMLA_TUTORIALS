*&---------------------------------------------------------------------*
*& Report zmla_invoice_items_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmla_use_cds_view.

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

    cl_salv_gui_table_ida=>create_for_cds_view( 'Z_INVOICE_ITEMS_MLA' )->fullscreen( )->display( ).

  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  lcl_main=>create(  )->run(  ).
