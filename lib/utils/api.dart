class Api {

  static const String _scheme = 'http';
  static const String _host = '192.168.1.10';
  static const String _apiFolder = 'kosantuy_api';
  static const String baseUrl = 'http://192.168.1.10/kosantuy_api';

  static Uri endpoint(
    String path, [
    Map<String,String>?
        queryParameters,
  ]) {

    return Uri(
      scheme: _scheme,
      host: _host,
      path:
          '$_apiFolder/$path',
      queryParameters:
          queryParameters,
    );
  }
}