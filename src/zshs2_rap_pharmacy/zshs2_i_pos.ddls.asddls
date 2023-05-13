@AbapCatalog.sqlViewName: 'ZSHS2IPOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS Interface View'
define view ZSHS2_I_POS
  as select from zshs2_a_pos
{
  key pos_id         as POSID,
      pos_number     as POSNumber,
      pos_city       as POSCity,
      pos_address    as POSAddress,
      pos_open_date  as POSOpenDate,
      pos_close_date as POSCloseDate
}
