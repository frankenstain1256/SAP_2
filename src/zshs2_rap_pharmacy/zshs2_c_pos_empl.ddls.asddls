@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'POS-Employee Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
//@UI.headerInfo: { typeNamePlural: 'POS-Employees Assignment', typeName: 'POS-Employees' }
define view entity ZSHS2_C_POS_EMPL
  as select from ZSHS2_I_POS_EMPL
  association [1] to ZSHS2_I_POS      as _POS       on $projection.POSID = _POS.POSID
  association to parent ZSHS2_I_EMPLOYEE as _Employees on $projection.EmployeeID = _Employees.EmployeeID
{
//      @UI.lineItem: [ { position: 10 } ]
      @UI.hidden: true
  key POSID,
//      @UI.lineItem: [ { position: 50 } ]
      @UI.hidden: true
  key EmployeeID,
      @UI.lineItem: [ { position: 70 } ]
  key POSPlacementDate,

      @UI.lineItem: [ { position: 20 } ]
      _POS.POSNumber,
      @UI.lineItem: [ { position: 30 } ]
      _POS.POSCity,
      @UI.lineItem: [ { position: 40 } ]
      _POS.POSAddress,
      @UI.lineItem: [ { position: 50 } ]
      _Employees.EmployeePersonalNumber as PersonalNumber,
      @UI.lineItem: [ { position: 60 } ]
      _Employees.EmployeeLastName as LastName,
//      concat( concat_with_space( _Employees.EmployeeLastName, left( _Employees.EmployeeFirstName, 1), 1 ), concat( concat( '. ', left( _Employees.EmployeeMiddleName, 1) ), '. ' ) ) as Name,
      _POS,
      _Employees
}
