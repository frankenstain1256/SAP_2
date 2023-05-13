//@AbapCatalog.sqlViewName: 'ZSHS2ISALES'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Interface View'
define root view entity ZSHS2_I_SALES
  as select from zshs2_a_sales
  composition [1..*] of ZSHS2_I_SALES_DT as _Sales_DT
  association [1]    to ZSHS2_I_EMPLOYEE    as _Employees on  $projection.EmployeeID = _Employees.EmployeeID
  association [1]    to ZSHS2_C_POS         as _POS       on  $projection.POSID = _POS.POSID
  association [0..*] to ZSHS2_C_POS_EMPL as _POS_Empl     on  $projection.EmployeeID = _POS_Empl.EmployeeID
                                                          and $projection.POSID      = _POS_Empl.POSID
  association [0..*] to ZSHS2_C_POS_REMN as _POS_Remn     on  $projection.POSID = _POS_Remn.POSID
{
  key s_receipt_number                  as ReceiptNumber,
      s_pos_id                          as POSID,
      _POS.POSNumber                    as POSNumber,
      s_e_id                            as EmployeeID,
      _Employees.EmployeePersonalNumber as PersonalNumber,
      s_date                            as SaleDate,
      s_time                            as SaleTime,
      s_is_cash                         as SaleIsCash,
      _Sales_DT,
      _Employees,
      _POS,
      _POS_Empl,
      _POS_Remn
}
