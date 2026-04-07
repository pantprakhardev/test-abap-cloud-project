sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"demofioriproject/test/integration/pages/ZC_BOOKING_VIEWList",
	"demofioriproject/test/integration/pages/ZC_BOOKING_VIEWObjectPage"
], function (JourneyRunner, ZC_BOOKING_VIEWList, ZC_BOOKING_VIEWObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('demofioriproject') + '/test/flp.html#app-preview',
        pages: {
			onTheZC_BOOKING_VIEWList: ZC_BOOKING_VIEWList,
			onTheZC_BOOKING_VIEWObjectPage: ZC_BOOKING_VIEWObjectPage
        },
        async: true
    });

    return runner;
});

