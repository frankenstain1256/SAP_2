@AbapCatalog.sqlViewName: 'ZSHS2IACSUBT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Active Substances Interface View'
define view ZSHS2_I_AC_SUB_T
  as select from zshs2_d_ac_sub_t
{
  key langu    as Language,
  key a_s_id   as ActiveSubstanceID,
      a_s_name as ActiveSubstanceName
}
