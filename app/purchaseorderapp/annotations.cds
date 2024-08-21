using CatalogService as service from '../../srv/CatalogService';
annotate service.PO with @(
    UI.SelectionFields:[
     PO_ID,
     GROSS_AMOUNT,
     OVERALL_STATUS,
     ],
    UI.LineItem:[
        {
        $Type:'UI.DataField', 
        Value:PO_ID
        } ,
        {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.EMAIL_ADDRESS
        },
        {
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        }
        ],

         UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'General Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Order Details',
                    Target : '@UI.Identification'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Configuration Details',
                    Target : '@UI.FieldGroup#Spiderman'
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'PO Items',
            Target : 'Items/@UI.LineItem',
        },
    ],
     UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
        },
        {
             $Type : 'UI.DataField',
            Value : LIFECYCLE_STATUS,
        }
    ],
    UI.FieldGroup #Spiderman: {
        Label : 'PO pricing',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    }
);

annotate service.items with @(
 
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.CATEGORY,
        },
 
 
    ],
    UI.HeaderInfo:{
        TypeName : 'PO Item',
        TypeNamePlural: 'PO Items',
        Title : {Value: PO_ITEM_POS},
        Description: {Value: PRODUCT_GUID.DESCRIPTION}
    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'More Info',
            Target : '@UI.Identification',
        },
       
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        }
    ]
 
);
 
annotate service.PO with {
    PARTNER_GUID@(
        Common : {
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    );
    OVERALL_STATUS @(
        readonly,
    )
};
 
annotate service.items with {
    PRODUCT_GUID@(
        Common : {
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};
 
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);
 
@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);
 
 
