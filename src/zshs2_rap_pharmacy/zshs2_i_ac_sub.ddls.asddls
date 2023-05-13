@AbapCatalog.sqlViewName: 'ZSHS2IACSUB'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Active Substances Interface View'
define view ZSHS2_I_AC_SUB
  as select from zshs2_a_ac_sub
{
  key a_s_id   as ActiveSubstanceID,
      a_s_name as ActiveSubstanceName
}
