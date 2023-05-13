//@AbapCatalog.sqlViewName: 'ZSHS2CCITIES'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cities Value Help View'
define view entity ZSHS2_C_CITIES
  as select distinct from ZSHS2_I_POS
{
  key POSCity
}
