import 'package:http/http.dart' as http;

import '../../constanse/constanse.dart';

class HttpService {
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  static Future<http.Response> getData(String url) {
    return http.get(Uri.parse(url), headers: _headers);
  }
}
