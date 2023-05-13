//@AbapCatalog.sqlViewName: 'ZSHS2IPOSEMPL'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS-Employees Interface View'
define view entity ZSHS2_I_POS_EMPL
  as select from zshs2_a_pos_empl
  association to parent ZSHS2_I_EMPLOYEE as _Employees on $projection.EmployeeID = _Employees.EmployeeID
{
      @UI.lineItem: [ { position: 10 } ]
  key pos_id         as POSID,
      @UI.lineItem: [ { position: 20 } ]
  key e_id           as EmployeeID,
      @UI.lineItem: [ { position: 30 } ]
  key pos_place_date as POSPlacementDate,
      _Employees
}
