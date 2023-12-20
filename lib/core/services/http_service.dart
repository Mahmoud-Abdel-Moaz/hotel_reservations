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

/*


  static Future<http.Response> getData(String url, {bool withToken = true}) {
    //print('_authorizationHeaders ${_authorizationHeaders['Authorization']}');
    return http.get(Uri.parse(url), headers: {
      //'Content-Type': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json; charset=UTF-8',
      if (withToken) 'Authorization': 'Bearer $token'
    });
  }

  static Future<http.Response> postData(String url, Map<String, dynamic> body) {
    return http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body));
  }

  static Future<http.Response> patchData(
      String url, Map<String, dynamic> body) {
    return http.patch(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body));
  }

  static Future<http.Response> deleteData(String url) {
    return http.delete(Uri.parse(url));
  }

  static Future<http.Response> updateData(
      String url, Map<String, dynamic> body) {
    return http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body));
  }

  static Future<http.StreamedResponse> uploadFile(String url, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    return request.send();
  }

*/
