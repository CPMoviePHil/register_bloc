import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RequestsManager {

  static final RequestsManager _manager = RequestsManager.internal();

  factory RequestsManager (){
    return _manager;
  }

  RequestsManager.internal();

  static Future<dynamic> post({
    Uri uri,
    Map<String, String> params,
  }) async {
    try {
      final data = await http.post(
        uri,
        body: params,
      );
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}