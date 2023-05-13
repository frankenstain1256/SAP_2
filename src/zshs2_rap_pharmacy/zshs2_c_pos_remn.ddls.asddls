@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS Remainders Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
@UI.headerInfo: { typeNamePlural: 'POS Remainders', typeName: 'POS Remainders' }
define view entity ZSHS2_C_POS_REMN
  as select from ZSHS2_I_POS_REMN
  association [1] to ZSHS2_I_POS      as _POS      on $projection.POSID = _POS.POSID
  association [1] to ZSHS2_I_PRODUCTS as _Products on $projection.ProductID = _Products.ProductID
{
//      @UI.lineItem: [ { position: 10 } ]
  key POSID,
//      @UI.lineItem: [ { position: 50 } ]
  key ProductID,
      @UI.lineItem: [ { position: 20 } ]
      _POS.POSNumber,
      @UI.lineItem: [ { position: 30 } ]
      _POS.POSCity,
      @UI.lineItem: [ { position: 40 } ]
      _POS.POSAddress,
      @UI.lineItem: [ { position: 60 } ]
      _Products.ProductName,
      @UI.lineItem: [ { position: 70 } ]
      ProductCount,
      @UI.lineItem: [ { position: 80 } ]
      Price,
      _POS,
      _Products
}
