@AbapCatalog.sqlViewName: 'ZSHS2CSALES2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Consumption View'
@Search.searchable: true
@Metadata.allowExtensions: true
define view ZSHS2_C_SALES2
  as select from ZSHS2_I_SALES
  association [1] to ZSHS2_I_EMPLOYEES as _Employees on $projection.EmployeeID = _Employees.EmployeeID
  association [1] to ZSHS2_I_POS       as _POS       on $projection.POSID = _POS.POSID
{
      @UI.lineItem: [ { position: 10 } ]
  key ReceiptNumber,
      POSID,
      @UI.lineItem: [ { position: 20 } ]
      @UI.selectionField: [{ position: 20 }]
      _POS.POSNumber,
      @UI.lineItem: [ { position: 30 } ]
      @UI.selectionField: [{ position: 30 }]
      _POS.POSCity,
      EmployeeID,
//      @UI.lineItem: [ { position: 40 } ]
//      @UI.selectionField: [{ position: 40 }]
//      @Search.defaultSearchElement: true
//      _Employees.Name,
      @UI.lineItem: [ { position: 50 } ]
      @UI.selectionField: [{ position: 50 }]
      SaleDate,
      @UI.lineItem: [ { position: 60 } ]
      SaleTime,
      @UI.lineItem: [ { position: 70 } ]
      @UI.selectionField: [{ position: 70 }]
      SaleIsCash,
      _Employees, // Make association public
      _POS
}
