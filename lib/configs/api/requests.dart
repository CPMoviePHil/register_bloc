import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RequestsManager {

  static final RequestsManager _manager = RequestsManager.internal();

  factory RequestsManager (){
    return _manager;
  }

  RequestsManager.internal();

  static Map<String, String> getHeaders() {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }

  static Future<dynamic> post({
    Uri uri,
    Map<String, dynamic> params,
  }) async {
    try {
      final data = await http.post(
        uri,
        headers: getHeaders(),
        body: jsonEncode(params),
      );
      if (data.statusCode == 200) {
        if (json.decode(data.body)['result']) {
          return json.decode(data.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}