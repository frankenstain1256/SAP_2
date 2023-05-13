//@AbapCatalog.sqlViewName: 'ZSHS2ISALESDT'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Detailed Sales Interface View'
@Metadata.allowExtensions: true
define view entity ZSHS2_I_SALES_DT
  as select from zshs2_a_sales_dt
  association [1]    to ZSHS2_I_PRODUCTS     as _Products on $projection.ProductID = _Products.ProductID
  association [0..1] to ZSHS2_I_AC_SUB       as _AC_SUB   on $projection.ActiveSubstanceID = _AC_SUB.ActiveSubstanceID
  association        to parent ZSHS2_I_SALES as _Sales    on $projection.ReceiptNumber = _Sales.ReceiptNumber
  association [0..*] to ZSHS2_C_POS_REMN     as _POS_Remn on $projection.ProductID = _POS_Remn.ProductID
{
      //    @UI.lineItem: [{ position: 10 }]
  key s_receipt_number               as ReceiptNumber,
      @UI.lineItem: [{ position: 20 }]
  key s_p_id                         as ProductID,
      _Sales.POSID                   as POSID,
      @UI.lineItem: [{ position: 30 }]
      _Products.ProductName          as ProductName,
      //    @UI.lineItem: [{ position: 40 }]
      _Products.ActiveSubstanceID    as ActiveSubstanceID,
      _Products.ActiveSubstanceName  as ActiveSubstanceName,
      @UI.lineItem: [{ position: 50 }]
      s_p_base_price                 as ProductBasePrice,
      @UI.lineItem: [{ position: 60 }]
      s_p_discount                   as ProductDiscount,
      @UI.lineItem: [{ position: 70 }]
      s_p_count                      as ProductCount,
      @UI.lineItem: [{ position: 80 }]
      s_p_total_cost                 as ProductTotalCost,
      //    @UI.lineItem: [{ position: 90 }]
      _Products.IsMedicinePrescribed as IsMedicinePrescribed,
      _AC_SUB,
      _Products,
      _Sales,
      _POS_Remn
}
