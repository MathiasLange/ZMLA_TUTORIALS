@AbapCatalog.sqlViewName: 'ZDDL_I_SOI16'                                //DDIC SQI View
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basis Sales Order Item CDS'

@Search.searchable: true

//BOPF
@ObjectModel: {
    writeActivePersistence: 'ZPROTO_SOI_A',                             //Item DB Table
    semanticKey: ['SalesOrderID', 'SalesOrderItemID'],                  //Item Table Key
    representativeKey: 'SalesOrderItemID',                              //For BOPF instance identification
    createEnabled: true,                                                //CRUD enabled for BOPF
    updateEnabled: true,                                                //CRUD enabled for BOPF
    deleteEnabled: true                                                 //CRUD enabled for BOPF
}



define view ZDEMO_I_SALESORDER_ITEM                                     //Sales Order Item CDS
  as select from zproto_soi_a as Item

  //Association to Header
  association [1..1] to zdemo_i_salesorder as _SalesOrder on $projection.SalesOrderID = _SalesOrder.SalesOrderID

{
      //Sales Order
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
  key Item.salesorderid     as SalesOrderID,


      //Sales Order Item
      @Search.defaultSearchElement: true
  key Item.salesorderitemid as SalesOrderItemID,

      //Product
      @Search.defaultSearchElement: true
      Item.productid        as ProductID,

      //Measure fields
      Item.currencycode     as CurrencyCode,
      Item.grossamount      as GrossAmount,
      Item.netamount        as NetAmount,
      Item.taxamount        as TaxAmount,

      //BOPF Association to Sales Order Header
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]

      _SalesOrder // Make association public, declare header association
}
