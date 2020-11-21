@EndUserText.label: 'Travel BO Projection View'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_RAP_TRAVEL_VINEE
  as projection on ZI_RAP_Travel_vinee as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      //@Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' }}]
      //@ObjectModel.text.element: ['AgencyName']
      //Vineet: pick up agency uisng the enhanced custom CDS entity which is fetched using ODATA from ES5 system,
      // Agency Name is also not supported with custom entity
      @Consumption.valueHelpDefinition: [{ entity : {name: 'zce_rap_agency_vinee', element: 'AgencyId' } }]
      @Search.defaultSearchElement: true
      AgencyID,
      //_Agency.Name as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID' }}]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity : {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      //ZI_RAP_TRAVEL_VINEE
      _Agency,
      _Booking : redirected to composition child ZC_RAP_Booking_VINEE,
      _Currency,
      _Customer
}
