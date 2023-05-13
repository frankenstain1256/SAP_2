//@AbapCatalog.sqlViewName: 'ZSHS2CPRODUCTS'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Products Consumption View'
@Search.searchable: true
@Metadata.allowExtensions: true
@UI.headerInfo: { typeNamePlural: 'Products', typeName: 'Product Information' }
define view entity ZSHS2_C_PRODUCTS
  as select from ZSHS2_I_PRODUCTS
{
      @UI.lineItem: [ { position: 10 } ]
      @EndUserText.label: 'Product ID'
  key ProductID,
      @UI.lineItem: [ { position: 20 } ]
      @EndUserText.label: 'Product Name'
      @Search.defaultSearchElement: true
      ProductName,
      @UI.lineItem: [ { position: 30 } ]
      @EndUserText.label: 'Bar Code'
      ProductBarcode,
      @UI.lineItem: [ { position: 40 } ]
      @EndUserText.label: 'Max discount'
      ProductDiscount,
      @UI.lineItem: [ { position: 50 } ]
      @EndUserText.label: 'Active Substance Name'
      ActiveSubstanceName,
      ActiveSubstanceID,
      @UI.lineItem: [ { position: 60 } ]
      @EndUserText.label: 'Prescribed'
      IsMedicinePrescribed
}
