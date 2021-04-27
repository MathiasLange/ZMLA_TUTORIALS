@AbapCatalog.sqlViewName: 'zddl_i_so16'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header - Basic CDS'
@Search.searchable: true

//BOPF
@ObjectModel: {
    compositionRoot: true,                                              //BOPF root node
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZPROTO_SO_A',                              //Root Table
    semanticKey: ['SalesOrderID'],                                      //Table Key field
    representativeKey: 'SalesOrderID',                                  //Identify BOPF instance key
    createEnabled: true,                                                //CRUD enabled for BOPF
    updateEnabled: true,                                                //CRUD enabled for BOPF
    deleteEnabled: true                                                 //CRUD enabled for BOPF
}


// CDS View
define view ZDEMO_I_SALESORDER
  as select from zproto_so_a as SalesOrder //Header DB Table

  // Association between Sales Order Header and Item
  association [0..*] to ZDEMO_I_SALESORDER_ITEM as _Item //Item Table Association
  on $projection.SalesOrderID = _Item.SalesOrderID
{

      //Sales Order
      @Search.defaultSearchElement: true //to be appeared as search in app
  key SalesOrder.salesorderid      as SalesOrderID,

      //Business Partner
      @Search.defaultSearchElement: true
      SalesOrder.businesspartnerid as BusinessPartnerID,

      //Currency Code
      SalesOrder.currencycode      as CurrencyCode, //Fields to be used in consumption

      //Gross Amount
      SalesOrder.grossamount       as GrossAmount,

      //Net Amount
      SalesOrder.netamount         as NetAmount,

      //Tax Amount
      SalesOrder.taxamount         as TaxAmount,

      //Lifecycle status
      SalesOrder.lifecyclestatus   as LifecycleStatus,


      //Sales Order Item display in detail page - used for navigation
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]

      _Item // Make association public, Association/Navigation
}
