@AbapCatalog.sqlViewName: 'Z_ITEMS_MLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Items'
define view Z_INVOICE_ITEMS_MLA
  as select from sepm_sddl_so_invoice_item
{

  header.buyer.company_name,
  sepm_sddl_so_invoice_item.sales_order_invoice_key,
  sepm_sddl_so_invoice_item.currency_code,
  sepm_sddl_so_invoice_item.gross_amount,

  //  @EndUserText.quickInfo: 'Paid'
  //  @EndUserText.label: 'Payment Status'
  cast(
    case header.payment_status
        when 'P' then 'X'
        else ' '
        end
        as zmla_invoice_payment_status )

  as payment_status,

  //* Associations *//
  header

}

where
  currency_code = 'USD'
