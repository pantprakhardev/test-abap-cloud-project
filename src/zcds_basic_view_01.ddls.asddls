@AbapCatalog.sqlViewName: 'ZBASIC_VIEW_01'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sample basic CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_BASIC_VIEW_01
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
      booking.booking_status                     as BookingStatus,
      _flight.plane_type_id                      as PlaneTypeId,
      _flight.seats_max                          as SeatsMax,
      _flight.seats_occupied                     as SeatsOccupied,
      _flight.seats_max - _flight.seats_occupied as SeatsAvailable // Custom column with arithmetic operation
}


//  with parameters
//    p_ccode : land1
//  as select from /dmo/agency
//{
//  key agency_id     as AgencyId,
//      name          as Name,
//      street        as Street,
//      postal_code   as PostalCode,
//      city          as City,
//      country_code  as CountryCode,
//      phone_number  as PhoneNumber,
//      email_address as EmailAddress,
//      web_address   as WebAddress
//}
//where
//  country_code = $parameters.p_ccode;


//where
//  country_code = 'US';
