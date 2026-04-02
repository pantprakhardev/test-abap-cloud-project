# ABAP CDS View & Class Demo — BTP Trial (ABAP Cloud)

Demonstrates Core Data Services (CDS) in SAP BTP ABAP Environment — covering associations,
semantic annotations, arithmetic expressions, and ABAP class consumption.

---

## Objects

| Object | Type | Description |
|---|---|---|
| `ZCDS_BASIC_VIEW_01` | CDS View | Built over `/dmo/booking_m` with association to `/dmo/flight` |
| `ZCLASS_BASIC_VIEW_01` | ABAP Class | Consumes the CDS view; run via `F9` in Eclipse ADT |

---

## Key Concepts in the CDS View

- **Association** — Joins `/dmo/flight` to enrich booking data with seat/plane info
- **Arithmetic field** — `SeatsMax - SeatsOccupied as SeatsAvailable` (derived column)
- **Semantic annotation** — Links `FlightPrice` to `CurrencyCode`
- **CDS Parameters** *(commented)* — View accepts an input parameter `p_ccode` (country code),
  consumed in class as `FROM zcds_basic_view_01( p_ccode = 'US' )`
- **WHERE in CDS** *(commented)* — Filter can be pushed into the view definition itself
  (e.g. `WHERE country_code = $parameters.p_ccode` or hardcoded `= 'US'`),
  rather than in the consuming ABAP SELECT
---

## How to Run

1. Pull repo into your ABAP Cloud Project via **abapGit** in Eclipse ADT
2. Activate both objects
3. Open `ZCLASS_BASIC_VIEW_01` → press **`F9`**
4. View output in the **Console** tab

---

## Prerequisites

- SAP BTP ABAP Environment (Trial)
- Eclipse ADT with abapGit plugin
- `/dmo/*` demo flight data (available by default in BTP trial)

---

> ⚠️ `@AccessControl.authorizationCheck: #NOT_REQUIRED` is used here for simplicity — avoid in production.
