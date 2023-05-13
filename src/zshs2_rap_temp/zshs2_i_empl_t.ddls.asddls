//@AbapCatalog.sqlViewName: 'ZSHS2IEMPLT'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Text Interface View'
define root view entity ZSHS2_I_EMPL_T
  as select from zshs2_d_empl_t
  association [1] to ZSHS2_I_EMPLOYEES as _Employees on $projection.EmployeeID = _Employees.EmployeeID
{
  key langu        as Language,
  key e_id         as EmployeeID,
      e_first_name as EmployeeFirstName,
      e_mid_name   as EmployeeMiddleName,
      e_last_name  as EmployeeLastName,
      _Employees
}
