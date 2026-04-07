sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'demofioriproject',
            componentId: 'ZC_BOOKING_VIEWList',
            contextPath: '/ZC_BOOKING_VIEW'
        },
        CustomPageDefinitions
    );
});