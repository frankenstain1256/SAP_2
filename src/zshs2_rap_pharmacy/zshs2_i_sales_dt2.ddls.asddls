@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Detailed Sales View'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//  serviceQuality: #X,
//  sizeCategory: #S,
//  dataClass: #MIXED
//}
define view entity ZSHS2_I_SALES_DT2
  as select from ZSHS2_I_SALES_DT
  association to parent ZSHS2_I_SALES as _Sales on $projection.ReceiptNumber = _Sales.ReceiptNumber
  association [1]    to ZSHS2_I_PRODUCTS     as _Products on $projection.ProductID = _Products.ProductID
  association [0..1] to ZSHS2_I_AC_SUB       as _AC_SUB   on $projection.ActiveSubstanceID = _AC_SUB.ActiveSubstanceID
  association [0..*] to ZSHS2_C_POS_REMN     as _POS_Remn on $projection.ProductID = _POS_Remn.ProductID
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
      _Sales
}
