@AbapCatalog.sqlViewName: 'ZSHS2IPRODUCTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Products Interface View'
define view ZSHS2_I_PRODUCTS
  as select from zshs2_a_products
  association [0..1] to ZSHS2_I_AC_SUB as _AC_SUB on $projection.ActiveSubstanceID = _AC_SUB.ActiveSubstanceID
{
  key p_id                        as ProductID,
      p_name                      as ProductName,
      p_bar_code                  as ProductBarcode,
      p_max_discount              as ProductDiscount,
      p_act_subst_id              as ActiveSubstanceID,
      _AC_SUB.ActiveSubstanceName as ActiveSubstanceName,
      p_is_medc_prescr            as IsMedicinePrescribed,
      _AC_SUB
}
