@AbapCatalog.sqlViewName: 'ZSHS2IEMPLT2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Names Interface View'
define view ZSHS2_I_EMPL_T2
  as select from zshs2_d_empl_t
  association to parent ZSHS2_I_EMPLOYEES as _Employees on $projection.EmployeeID = _Employees.EmployeeID
{
  key langu        as Language,
  key e_id         as EmployeeID,
      e_first_name as EmployeeFirstName,
      e_mid_name   as EmployeeMiddleName,
      e_last_name  as EmployeeLastName,
      _Employees
}
