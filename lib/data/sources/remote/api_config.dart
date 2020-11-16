import 'dart:io';

class ApiConfig {
  static const String SERVER_URL = "https://en.wikipedia.org/w/rest.php";
  static Future<Map<String, String>> buildHeaderApi() async {
    Map<String, String> _header = {
      HttpHeaders.contentTypeHeader: "application/json",
    };
    return _header;
  }
}
