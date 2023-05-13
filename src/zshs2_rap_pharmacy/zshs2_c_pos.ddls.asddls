@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
@UI.headerInfo: { typeNamePlural: 'POS', typeName: 'POS Information' }
@Metadata.allowExtensions: true
define view entity ZSHS2_C_POS
  as select from ZSHS2_I_POS
{
//      @UI.lineItem: [ { position: 10 } ]
//      @EndUserText.label: 'ID'
  key POSID,
      @UI.lineItem: [ { position: 20 } ]
      @EndUserText.label: 'Number'
      POSNumber,
      @UI.lineItem: [ { position: 30 } ]
      @EndUserText.label: 'City'
      POSCity,
      @UI.lineItem: [ { position: 40 } ]
      @EndUserText.label: 'Address'
      POSAddress,
      @UI.lineItem: [ { position: 50 } ]
      @EndUserText.label: 'Open Date'
      POSOpenDate,
      @UI.lineItem: [ { position: 60 } ]
      @EndUserText.label: 'Close Date'
      POSCloseDate
}
