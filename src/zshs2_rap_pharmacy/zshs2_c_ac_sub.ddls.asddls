@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Active Substances Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
@UI.headerInfo: { typeNamePlural: 'Active Substances', typeName: 'Active Substance Information' }
define view entity ZSHS2_C_AC_SUB
  as select from ZSHS2_I_AC_SUB
{
      @UI.lineItem: [ { position: 10 } ]
      @EndUserText.label: 'ID'
  key ActiveSubstanceID,
      @UI.lineItem: [ { position: 20 } ]
      @EndUserText.label: 'Name'
      ActiveSubstanceName
}
