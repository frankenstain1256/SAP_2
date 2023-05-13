@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employees Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define root view entity ZSHS2_I_EMPLOYEES
  as select from ZSHS2_I_EMPLOYEE as Employee
  composition [0..1] of ZSHS2_I_EMPL_T_EN as _Employee_Names_En
  composition [0..1] of ZSHS2_I_EMPL_T_RU as _Employee_Names_Ru
{
  key Employee.EmployeeID,
      Employee.EmployeePersonalNumber,
      Employee.EmployeeBirthDate,
      Employee.EmployeePersPhoneNumber,
      Employee.EmployeeCorpPhoneNumber,
      Employee.EmployeePersEmail,
      Employee.EmployeeCorpEmail,
      Employee.EmployeeDiscount,
      /* Associations */
     //      _Employee_Names.EmployeeLastName,
      //      _Employee_Names.EmployeeFirstName,
      //      _Employee_Names.EmployeeMiddleName,
      //      _Employee_Names[1: Language=$session.system_language].EmployeeMiddleName,
      _Employee_Names_En,
      _Employee_Names_Ru
}
