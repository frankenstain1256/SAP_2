@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Consumption View'
@UI.headerInfo: { typeNamePlural: 'Sales', typeName: 'Sale Information' }
@Metadata.allowExtensions: true
define root view entity ZSHS2_C_SALES
  //  as select distinct from ZSHS2_I_SALES
  provider contract transactional_query
  as projection on ZSHS2_I_SALES
{
      @UI.lineItem: [ { position: 10 } ]
      @EndUserText.label: 'Receipt Number'
  key ReceiptNumber,
      @UI.lineItem: [ { position: 15 } ]
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_C_POS_EMPL',
        element: 'POSID'
        } }]
      POSID,
      @UI.lineItem: [ { position: 20 } ]
      @UI.selectionField: [{ position: 20 }]
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_C_POS_EMPL',
        element: 'POSNumber'
        } }]
      @Search.defaultSearchElement: true
      @EndUserText.label: 'POS Number'
      POSNumber,
      @UI.lineItem: [ { position: 30 } ]
      @UI.selectionField: [{ position: 30 }]
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_C_CITIES',
        element: 'POSCity'
        } }]
      @EndUserText.label: 'City'
      _POS.POSCity                  as POSCity,
      @UI.lineItem: [ { position: 40 } ]
      @EndUserText.label: 'Address'
      _POS.POSAddress               as POSAddress,
      //      @UI.lineItem: [ { position: 40 } ]
      //      @UI.selectionField: [{ position: 40 }]
      //      @Search.defaultSearchElement: true
      //      @Consumption.valueHelpDefinition: [{
      //        entity: {
      //        name: 'ZSHS2_I_Employee',
      //        element: 'EmployeeLastName'
      //        } }]
      //      concat( concat_with_space( _Employees.EmployeeLastName, left( _Employees.EmployeeFirstName, 1), 1 ), concat( concat( '. ', left( _Employees.EmployeeMiddleName, 1) ), '. ' ) ) as Name,
      @UI.lineItem: [ { position: 50 } ]
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_C_POS_EMPL',
        element: 'EmployeeID'
        } }]
      EmployeeID,
      @UI.lineItem: [ { position: 55 } ]
      @UI.selectionField: [{ position: 40 }]
      @Consumption.valueHelpDefinition: [{
        entity: {
        name: 'ZSHS2_C_POS_EMPL',
        element: 'PersonalNumber'
        } }]
      PersonalNumber,
      @UI.lineItem: [ { position: 60 } ]
      _Employees.EmployeeLastName   as LastName,
      @UI.hidden: true
      _Employees.EmployeeFirstName  as FirstName,
      @UI.hidden: true
      _Employees.EmployeeMiddleName as MiddleName,
      @UI.lineItem: [ { position: 70 } ]
      @UI.selectionField: [{ position: 50 }]
      @EndUserText.label: 'Date'
      SaleDate,
      @UI.lineItem: [ { position: 80 } ]
      @EndUserText.label: 'Time'
      SaleTime,
      @UI.lineItem: [ { position: 90 } ]
      @UI.selectionField: [{ position: 60 }]
      @EndUserText.label: 'Cash Payment'
      SaleIsCash,
      //      @UI.lineItem: [ { position: 80 } ]
      //      @EndUserText.label: 'Items Count'
      //      count( distinct _Sales_DT.ProductID )                                                                                                                                          as ItemsCount,
      //      @UI.lineItem: [ { position: 90 } ]
      //      @EndUserText.label: 'Total Cost'
      //      sum( _Sales_DT.ProductTotalCost )                                                                                                                                              as TotalCost,
      _Sales_DT, // : redirected to composition child ZSHS2_C_SALES_DT,
      _Employees, // Make association public
      _POS,
      _POS_Empl
}
//group by
//  ReceiptNumber,
//  _POS.POSNumber,
//  POSID,
//  _POS.POSCity,
//  _Employees.EmployeeLastName,
//  _Employees.EmployeeFirstName,
//  _Employees.EmployeeMiddleName,
//  EmployeeID,
//  SaleDate,
//  SaleTime,
//  SaleIsCash
