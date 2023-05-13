@AbapCatalog.sqlViewName: 'ZSHS2CACSUBT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Active Substances Consumption View'
define view ZSHS2_C_AC_SUB_T
  as select from ZSHS2_I_AC_SUB_T
{
      @UI.lineItem: [ { position: 10 } ]
  key Language,
      @UI.lineItem: [ { position: 20 } ]
  key ActiveSubstanceID,
      @UI.lineItem: [ { position: 30 } ]
      ActiveSubstanceName
}
