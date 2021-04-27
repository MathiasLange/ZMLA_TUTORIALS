@AbapCatalog.sqlViewName: 'zddl_c_soi16'                                             //DDIC SQL View
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item - Consumption View'

@Search.searchable: true
@UI.headerInfo.typeName: 'Sales Order Item'
@UI.headerInfo.title.value: 'SalesOrderItemID'

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.semanticKey: ['SalesOrderID', 'SalesOrderItemID']                      //Item table Keys
@ObjectModel.representativeKey: 'SalesOrderItemID'                                  //BO Instance key identification
@ObjectModel.createEnabled: true                                                    //CRUD enabled for BOPF
@ObjectModel.updateEnabled: true                                                    //CRUD enabled for BOPF
@ObjectModel.deleteEnabled: true                                                    //CRUD enabled for BOPF




define view ZDEMO_C_SALESORDER_ITEM
  as select from ZDEMO_I_SALESORDER_ITEM                                            // Item Basic View

  //Association to Sales Order Header
  association [1..1] to ZDEMO_C_SALESORDER as _SalesOrder on $projection.SalesOrderID = _SalesOrder.SalesOrderID //Item to Header Association

{

      //Sales Order
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: [{position: 10, importance: #HIGH }]
      @UI.lineItem: [{position: 10, importance: #HIGH }]
  key ZDEMO_I_SALESORDER_ITEM.SalesOrderID,

      //Sales Order Item
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: [{position: 20, importance: #HIGH }]
      @UI.lineItem: [{position: 20, importance: #HIGH }]
  key ZDEMO_I_SALESORDER_ITEM.SalesOrderItemID,

      //Currency Code
      @UI.identification: [{position: 70, importance: #HIGH }]
      @UI.lineItem: [{position: 70, importance: #HIGH }]
      ZDEMO_I_SALESORDER_ITEM.CurrencyCode,

      //Gross Amount
      @UI.identification: [{position: 80, importance: #HIGH }]
      @UI.lineItem: [{position: 80, importance: #HIGH }]
      ZDEMO_I_SALESORDER_ITEM.GrossAmount,

      //Net Amount
      @UI.identification: [{position: 90, importance: #HIGH }]
      @UI.lineItem: [{position: 90, importance: #HIGH }]
      ZDEMO_I_SALESORDER_ITEM.NetAmount,

      //Tax Amount
      @UI.identification: [{position: 100, importance: #HIGH }]
      @UI.lineItem: [{position: 100, importance: #HIGH }]
      ZDEMO_I_SALESORDER_ITEM.TaxAmount,

      //BOPF Association
      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]

      _SalesOrder // Make association public, Item to Header Association

}
