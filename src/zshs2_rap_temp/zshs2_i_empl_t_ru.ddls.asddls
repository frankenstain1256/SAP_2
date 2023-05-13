//@AbapCatalog.sqlViewName: 'ZSHS2IEMPLTRU'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'English Employee Names'
define view entity ZSHS2_I_EMPL_T_RU
  as select from zshs2_d_empl_t
  association to parent ZSHS2_I_EMPLOYEES as _Employees on $projection.EmployeeID = _Employees.EmployeeID
{
  key langu        as Language,
  key e_id         as EmployeeID,
      e_first_name as EmployeeFirstName_Ru,
      e_mid_name   as EmployeeMiddleName_Ru,
      e_last_name  as EmployeeLastName_Ru,
      _Employees
}
where
  langu = 'R'
