@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Detailed Sales Consumption View'
@Metadata.allowExtensions: true
define view entity ZSHS2_C_SALES_DT
  as projection on ZSHS2_I_SALES_DT
{
  key ReceiptNumber,
  key ProductID,
      POSID,
      ProductName,
      ActiveSubstanceID,
      ActiveSubstanceName,
      ProductBasePrice,
      ProductDiscount,
      ProductCount,
      ProductTotalCost,
      IsMedicinePrescribed,
      /* Associations */
      _AC_SUB,
      _POS_Remn,
      _Products,
      _Sales : redirected to parent ZSHS2_C_SALES
}
