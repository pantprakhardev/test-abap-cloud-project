@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for Booking & Flight data'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_BOOKING_VIEW
  //  with parameters
  //    p_currcode : /dmo/currency_code
  as select from /dmo/booking_m as booking
  association [1..1] to /dmo/flight as _flight on  booking.carrier_id    = _flight.carrier_id
                                               and booking.connection_id = _flight.connection_id
                                               and booking.flight_date   = _flight.flight_date
{
  key booking.travel_id                          as TravelId,
  key booking.booking_id                         as BookingId,
      booking.booking_date                       as BookingDate,
      booking.customer_id                        as CustomerId,
      booking.carrier_id                         as CarrierId,
      booking.connection_id                      as ConnectionId,
      booking.flight_date                        as FlightDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      booking.flight_price                       as FlightPrice,
      booking.currency_code                      as CurrencyCode,
      case booking.booking_status
      when 'B' then 'Booked'
      when 'N' then 'Not Booked'
      else 'Unknown'
      end                                        as BookingStatus,
      _flight.plane_type_id                      as PlaneTypeId,
      _flight.seats_max                          as SeatsMax,
      _flight.seats_occupied                     as SeatsOccupied,
      _flight.seats_max - _flight.seats_occupied as SeatsAvailable // Derived Column
}
//where
//  currency_code = $parameters.p_currcode;
