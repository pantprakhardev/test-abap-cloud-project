sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheZC_BOOKING_VIEWList.iSeeThisPage();
            Then.onTheZC_BOOKING_VIEWList.onFilterBar().iCheckFilterField("Booking Date");
            Then.onTheZC_BOOKING_VIEWList.onFilterBar().iCheckFilterField("Airline ID");
            Then.onTheZC_BOOKING_VIEWList.onFilterBar().iCheckFilterField("Flight Date");
            Then.onTheZC_BOOKING_VIEWList.onFilterBar().iCheckFilterField("Currency Code");
            Then.onTheZC_BOOKING_VIEWList.onFilterBar().iCheckFilterField("BookingStatus");
            Then.onTheZC_BOOKING_VIEWList.onFilterBar().iCheckFilterField("Plane Type");
            Then.onTheZC_BOOKING_VIEWList.onTable().iCheckColumns(13, {"TravelId":{"header":"Travel ID"},"BookingId":{"header":"Booking Number"},"BookingDate":{"header":"Booking Date"},"CustomerId":{"header":"Customer ID"},"CarrierId":{"header":"Airline ID"},"ConnectionId":{"header":"Flight Number"},"FlightDate":{"header":"Flight Date"},"FlightPrice":{"header":"Flight Price"},"BookingStatus":{"header":"BookingStatus"},"PlaneTypeId":{"header":"Plane Type"},"SeatsMax":{"header":"Maximum Capacity"},"SeatsOccupied":{"header":"Occupied Seats"},"SeatsAvailable":{"header":"SeatsAvailable"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheZC_BOOKING_VIEWList.onFilterBar().iExecuteSearch();
            
            Then.onTheZC_BOOKING_VIEWList.onTable().iCheckRows();

            When.onTheZC_BOOKING_VIEWList.onTable().iPressRow(0);
            Then.onTheZC_BOOKING_VIEWObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});