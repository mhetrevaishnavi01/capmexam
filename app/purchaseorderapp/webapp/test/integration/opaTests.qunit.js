sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ust/mhetre/vaishnavi/capui/purchaseorderapp/test/integration/FirstJourney',
		'ust/mhetre/vaishnavi/capui/purchaseorderapp/test/integration/pages/POList',
		'ust/mhetre/vaishnavi/capui/purchaseorderapp/test/integration/pages/POObjectPage'
    ],
    function(JourneyRunner, opaJourney, POList, POObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ust/mhetre/vaishnavi/capui/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOList: POList,
					onThePOObjectPage: POObjectPage
                }
            },
            opaJourney.run
        );
    }
);