@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Actual Remainders on POS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZSHS2_C_ACT_REMN
  as select from ZSHS2_C_POS_REMN as _POS_Remn
    join         ZSHS2_I_POS      as _POS      on _POS_Remn.POSID = _POS.POSID
    join         ZSHS2_I_PRODUCTS as _Products on _POS_Remn.ProductID = _Products.ProductID
{
      //      @UI.lineItem: [ { position: 10 } ]
  key _POS_Remn.POSID,
      //      @UI.lineItem: [ { position: 50 } ]
  key _POS_Remn.ProductID,
      @UI.lineItem: [ { position: 20 } ]
      _POS.POSNumber,
      @UI.lineItem: [ { position: 30 } ]
      _POS.POSCity,
      @UI.lineItem: [ { position: 40 } ]
      _POS.POSAddress,
      @UI.lineItem: [ { position: 60 } ]
      _Products.ProductName,
      @UI.lineItem: [ { position: 70 } ]
      _POS_Remn.ProductCount,
      @UI.lineItem: [ { position: 80 } ]
      _POS_Remn.Price
}
