@AbapCatalog.sqlViewName: 'ZSEPM_ISOE_MLA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'SalesOrders – EPM Demo Data'

define view ZSEPM_C_SALESORDER_MLA
  as select from SEPM_I_SalesOrder_E
{

      @ObjectModel.text.association: '_Text'

  key SalesOrder,

      @ObjectModel.readOnly: true

      CreationDateTime,

      @ObjectModel.readOnly: true

      LastChangedDateTime,

      @ObjectModel.readOnly: true

      IsCreatedByBusinessPartner,

      @ObjectModel.readOnly: true

      IsLastChangedByBusinessPartner,

      @ObjectModel.readOnly: true

      Customer,

      @ObjectModel.readOnly: true

      TransactionCurrency,

      @ObjectModel.readOnly: true

      GrossAmountInTransacCurrency,

      @ObjectModel.readOnly: true

      NetAmountInTransactionCurrency,

      @ObjectModel.readOnly: true

      TaxAmountInTransactionCurrency,

      @ObjectModel.readOnly: true

      SalesOrderLifeCycleStatus,

      @ObjectModel.readOnly: true

      SalesOrderBillingStatus,

      @ObjectModel.readOnly: true

      SalesOrderDeliveryStatus,

      @ObjectModel.readOnly: true

      SalesOrderOverallStatus,

      @ObjectModel.readOnly: true

      Opportunity,

      /* Associations */

      _Customer,

      _Item,

      _Text

}
