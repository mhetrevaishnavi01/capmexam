sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ust.mhetre.vaishnavi.capui.purchaseorderapp',
            componentId: 'POObjectPage',
            contextPath: '/PO'
        },
        CustomPageDefinitions
    );
});