class ApiConstants {

  static const String baseUrl = 'https://smartpgxservices.azurewebsites.net/api/smartpgx/';
  static const String loginUrl = '${baseUrl}Account/Physician/GetTokenByCredentials';
  static const String getApiUrl = '${baseUrl}Providers/{providerId}/AssociatedPatients/{pageNumber}/{pageSize}';
  static const String searchApiUrl = '${baseUrl}v1.1/Providers/{providerId}/AssociatedPatients/{term}/{pageNumber}/{pageSize}';

}
