@AbapCatalog.sqlViewName: 'ZDDL_C_SO16'                 //DDIC SQL View
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order - Consumption View'
@Search.searchable: true

//OData
@OData.publish: true                                    //Publish OData

//BOPF
@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.semanticKey: ['SalesOrderID']              //Header table Key
@ObjectModel.representativeKey: 'SalesOrderID'          //BO Instance key identification
@ObjectModel.createEnabled: true                        //CRUD enabled for BOPF
@ObjectModel.updateEnabled: true                        //CRUD enabled for BOPF
@ObjectModel.deleteEnabled: true                        //CRUD enabled for BOPF

@UI.headerInfo.typeName: 'Sales Order'
@UI.headerInfo.title.value: 'SalesOrderID'

define view ZDEMO_C_SALESORDER                          //Sales Order Header Consumption View
  as select from ZDEMO_I_SALESORDER                     //Sales Order Basic View
  association [0..*] to ZDEMO_C_SALESORDER_ITEM as _Item on $projection.SalesOrderID = _Item.SalesOrderID // Consumption CDS _ SO Item
{

      //Sales Order
      @UI.lineItem.position: 10
      @UI.lineItem: [{type: #FOR_ACTION, position: 1, dataAction: 'BOPF:SET_LIFECYCLE_STATUS_TO_PAID', label: 'Set Lifecycle status to Paid' }]     //BOPF Action in Root node
      @Search.defaultSearchElement: true
      @UI.identification: [{position: 10, importance: #HIGH }]
      @UI.selectionField: [{position: 10 }]
  key ZDEMO_I_SALESORDER.SalesOrderID,
  
      // Business Partner ID
      @Search.defaultSearchElement: true
      @UI.identification: [{position: 20, importance: #HIGH }]
      @UI.lineItem: [{position: 20, importance: #HIGH }]
      @UI.selectionField: [{position: 20 }]
      ZDEMO_I_SALESORDER.BusinessPartnerID,
      
      //Currency
      @UI.identification: [{position: 30, importance: #HIGH }]
      @UI.lineItem: [{position: 30, importance: #HIGH }]
      ZDEMO_I_SALESORDER.CurrencyCode,

      //Gross Amount
      @UI.identification: [{position: 40, importance: #HIGH }]
      @UI.lineItem: [{position: 40, importance: #HIGH }]
      @UI.dataPoint: {title: 'GrossAmount'}
      ZDEMO_I_SALESORDER.GrossAmount,
      
      //Net Amount
      @UI.lineItem: [{position: 50, importance: #HIGH }]
      @UI.dataPoint: {title: 'NetAmount'}
      ZDEMO_I_SALESORDER.NetAmount,
      
      //Tax Amount
      @UI.lineItem: [{position: 60, importance: #HIGH }]
      @UI.dataPoint: {title: 'TaxAmount'}
      ZDEMO_I_SALESORDER.TaxAmount,
      
      //Lifecycle Status
      @UI.lineItem: [{position: 70, importance: #HIGH }]
      @UI.dataPoint: {title: 'LifecycleStatus'}
      ZDEMO_I_SALESORDER.LifecycleStatus,

      @UI.fieldGroup: [{qualifier: 'Item', groupLabel: 'Item', position: 40, importance: #HIGH }]
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Item // To Item Navigation
}
