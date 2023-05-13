@AbapCatalog.sqlViewName: 'ZSHS2CEMPLT'
@Search.searchable: true
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Names Consumption View'
define view ZSHS2_C_EMPL_T
  as select from ZSHS2_I_EMPL_T
  association [1] to zshs2_d_t002 as _Language on $projection.Language = _Language.spras
{
  key Language,
      @UI.lineItem: [ { position: 10 } ]
  key EmployeeID         as ID,
      @UI.lineItem: [ { position: 20 } ]
      _Language.laiso as Lang,
      @UI.lineItem: [ { position: 30 } ]
      EmployeeFirstName  as FirstName,
      @UI.lineItem: [ { position: 40 } ]
      EmployeeMiddleName as MiddleName,
      @UI.lineItem: [ { position: 50 } ]
      EmployeeLastName   as LastName,
      @Search.defaultSearchElement: true
      _Language // Make association public
}
