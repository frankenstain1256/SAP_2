@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employees Consumption View'
@UI.headerInfo.typeName: 'Employee Information'
@Metadata.allowExtensions: true
define root view entity ZSHS2_C_EMPLOYEES
  provider contract transactional_query
  as projection on ZSHS2_I_EMPLOYEE
    association [1..*] to ZSHS2_C_POS_EMPL as _POS_Empl on $projection.ID = _POS_Empl.EmployeeID
{
      @UI.lineItem: [ { position: 10 } ]
      @EndUserText.label: 'ID'
  key EmployeeID as ID,
      @UI.lineItem: [ { position: 20 } ]
      @EndUserText.label: 'Personal Number'
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_I_EMPLOYEE',
        element: 'EmployeePersonalNumber'
        } }]
      EmployeePersonalNumber as PersonalNumber,
      @UI.lineItem: [ { position: 30 } ]
      @Semantics.text: true
//      concat( concat_with_space( _Employee_Names[1: Language=$session.system_language].LastName, left( _Employee_Names[1: Language=$session.system_language].MiddleName, 1), 1 ),
//      concat( concat( '. ', left( _Employee_Names[1: Language=$session.system_language].FirstName, 1) ), '. ' ) ) as Name,4
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_I_EMPLOYEE',
        element: 'EmployeeLastName'
        } }]
      @EndUserText.label: 'Last Name'
      EmployeeLastName as LastName,
      @UI.lineItem: [ { position: 31 } ]
      @Semantics.text: true
      @EndUserText.label: 'First Name'
      EmployeeFirstName as FirstName,
      @UI.lineItem: [ { position: 32 } ]
      @Semantics.text: true
      @EndUserText.label: 'Middle Name'
      EmployeeMiddleName as MiddleName,
      @UI.lineItem: [ { position: 60 } ]
      @EndUserText.label: 'Birth Date'
      EmployeeBirthDate as BirthDate,
      @UI.lineItem: [ { position: 70 } ]
      @EndUserText.label: 'Personal Phone'
      EmployeePersPhoneNumber as PersPhoneNum,
      @UI.lineItem: [ { position: 80 } ]
      @EndUserText.label: 'Corporate Phone'
      EmployeeCorpPhoneNumber as CorpPhoneNum,
      @UI.lineItem: [ { position: 90 } ]
      @EndUserText.label: 'Personal Email'
      EmployeePersEmail as PersEmail,
      @UI.lineItem: [ { position: 100 } ]
      @EndUserText.label: 'Corporate Email'
      EmployeeCorpEmail as CorpEmail,
      @UI.lineItem: [ { position: 110 } ]
      @EndUserText.label: 'Personal Discount'
      EmployeeDiscount as Discount,
      _POS_Empl
}
