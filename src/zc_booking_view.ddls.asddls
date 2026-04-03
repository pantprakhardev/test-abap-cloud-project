@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Booking-Flight data'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
  typeName:       'Booking',
  typeNamePlural: 'Bookings',
  title:          { value: 'BookingId' }
}

define view entity ZC_BOOKING_VIEW
  as select from ZI_BOOKING_VIEW
{
      @UI.lineItem: [{ position: 10 }]
  key TravelId,

      @UI.lineItem: [{ position: 20 }]
  key BookingId,

      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [{ position: 10 }]
      BookingDate,

      @UI.lineItem: [{ position: 40 }]
      CustomerId,

      @UI.lineItem: [{ position: 50 }]
      @UI.selectionField: [{ position: 20 }]
      CarrierId,

      @UI.lineItem: [{ position: 60 }]
      ConnectionId,

      @UI.lineItem: [{ position: 70 }]
      @UI.selectionField: [{ position: 30 }]
      FlightDate,

      @Semantics.amount.currencyCode : 'CurrencyCode'
      @UI.lineItem: [{ position: 80 }]
      FlightPrice,

      @UI.lineItem: [{ position: 90 }]
      @UI.selectionField: [{ position: 40 }]
      CurrencyCode,

      @UI.lineItem: [{ position: 100 }]
      @UI.selectionField: [{ position: 50 }]
      BookingStatus,

      @UI.lineItem: [{ position: 110 }]
      @UI.selectionField: [{ position: 60 }]
      PlaneTypeId,

      @UI.lineItem: [{ position: 120 }]
      SeatsMax,

      @UI.lineItem: [{ position: 130 }]
      SeatsOccupied,

      @UI.lineItem: [{ position: 140 }]
      SeatsAvailable
}
