//@AbapCatalog.sqlViewName: 'ZSHS2IEMPLOYEE'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employees Interface View'
@Metadata.allowExtensions: true
define root view entity ZSHS2_I_EMPLOYEE
  as select from zshs2_a_employee
  composition [0..*] of ZSHS2_I_POS_EMPL as _POS_Empl //on $projection.EmployeeID = _POS_Empl.EmployeeID
{
  key e_id            as EmployeeID,
      @UI.lineItem: [ { position: 10 } ]
      e_pers_number   as EmployeePersonalNumber,
      @UI.lineItem: [ { position: 20 } ]
      e_last_name     as EmployeeLastName,
      @UI.lineItem: [ { position: 30 } ]
      e_first_name    as EmployeeFirstName,
      @UI.lineItem: [ { position: 40 } ]
      e_mid_name      as EmployeeMiddleName,
      e_birth_date    as EmployeeBirthDate,
      e_pers_phone    as EmployeePersPhoneNumber,
      e_corp_phone    as EmployeeCorpPhoneNumber,
      e_pers_email    as EmployeePersEmail,
      e_corp_email    as EmployeeCorpEmail,
      e_pers_discount as EmployeeDiscount,
      _POS_Empl
}
