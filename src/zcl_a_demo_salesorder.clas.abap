class ZCL_A_DEMO_SALESORDER definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCLASS
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_A_DEMO_SALESORDER IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    CASE is_ctx-act_key.

      "Action - Set overall status
      WHEN zif_demo_i_salesorder_c=>sc_action-zdemo_i_salesorder-set_overall_status_to_paid.
        " Get output structure of Action
        DATA(lt_sales_order) = VALUE ztdemo_i_salesorder( ).

        "Read UI clicked sale order
        io_read->retrieve(
          EXPORTING
            iv_node                 =  is_ctx-node_key   " BO Node Name
            it_key                  =  it_key            " BO Key
          IMPORTING
            et_data                 =  lt_sales_order ).   " Data Return Structure

        "Assuming single instance for a action
        READ TABLE lt_sales_order ASSIGNING FIELD-SYMBOL(<fs_sales_order>) INDEX 1.
        IF sy-subrc = 0.
          "Set the over all status to Paid ie 'P'
          IF <fs_sales_order>-lifecyclestatus IS INITIAL.
            <fs_sales_order>-lifecyclestatus  = 'P'.
          ENDIF.
        ENDIF.

        "Now update the BO instance
        io_modify->update(
          EXPORTING
            iv_node           = is_ctx-node_key    " Node
            iv_key            = <fs_sales_order>-key    " Key
            iv_root_key       = <fs_sales_order>-root_key     " NodeID
            is_data           = REF #( <fs_sales_order>-node_data )    " Data
            it_changed_fields = VALUE #(
                                ( zif_demo_i_salesorder_c=>sc_node_attribute-zdemo_i_salesorder-lifecyclestatus ) )
                        ).

        et_data = lt_sales_order.

      WHEN OTHERS.
        "Nothing

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
