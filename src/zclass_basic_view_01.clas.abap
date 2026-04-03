CLASS zclass_basic_view_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclass_basic_view_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Consuming basic CDS view
*    SELECT *
*    FROM zcds_basic_view_01
*    INTO TABLE @DATA(lt_itab).
*
*    out->write( lt_basic ).
*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Consuming basic CDS view with parameters
*    SELECT *
*    FROM zcds_basic_view_01( p_ccode = 'US' )
*    INTO TABLE @DATA(lt_params).
*
*    out->write( lt_params ).
*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Consuming basic CDS view with association
**    SELECT BookingId, BookingDate, FlightDate, FlightPrice
*        SELECT BookingId, BookingDate, BookingStatus, FlightDate, CurrencyCode, FlightPrice, SeatsMax, SeatsOccupied, SeatsAvailable
*        FROM zcds_basic_view_01
**    WHERE BookingDate GT @sy-datum " sy-datum is old variant - outdated in ABAP Cloud
*        WHERE BookingDate GT @( cl_abap_context_info=>get_system_date( ) )
*        AND CurrencyCode = 'INR'
*        ORDER BY BookingDate
*        INTO TABLE @DATA(lt_asso).
*
*        IF lt_asso IS NOT INITIAL.
*          out->write( lt_asso ).
*        ELSE.
*          out->write( 'No Records Found!' ).
*        ENDIF.
*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Consuming root CDS view with association & parameters
        SELECT BookingId, BookingDate, BookingStatus, FlightDate, CurrencyCode, FlightPrice, SeatsMax, SeatsOccupied, SeatsAvailable
        FROM zi_booking_view( p_currcode = 'JPY' )
        INTO TABLE @DATA(lt_root_view).
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      CATCH cx_sy_open_sql_error INTO DATA(lo_sql_error).
        out->write( lo_sql_error->get_text(  ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
