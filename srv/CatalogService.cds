using { ust.mhetre.vaishnavi.datamodel.master, ust.mhetre.vaishnavi.datamodel.transaction } from '../db/datamodel';



service CatalogService @(path: 'CatalogService', requires: 'authenticated-user') {
 
    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity BusinessAddressSet as projection on master.address;
    entity PO @(odata.draft.enabled:true) as projection on transaction.purchaseorder;
    entity items as projection on transaction.poitems;
    }