sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'demofioriproject',
            componentId: 'ZC_BOOKING_VIEWObjectPage',
            contextPath: '/ZC_BOOKING_VIEW'
        },
        CustomPageDefinitions
    );
});