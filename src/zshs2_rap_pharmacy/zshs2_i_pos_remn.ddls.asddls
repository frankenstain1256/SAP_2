@AbapCatalog.sqlViewName: 'ZSHS2IPOSREMN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS Remainders Interface View'
define view ZSHS2_I_POS_REMN
  as select from zshs2_a_pos_remn
{
  key r_pos_id       as POSID,
  key r_p_id         as ProductID,
      r_p_count      as ProductCount,
      r_p_base_price as Price
}
