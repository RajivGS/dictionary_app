// ignore_for_file: use_rethrow_when_possible, prefer_const_declarations

import 'package:http/http.dart' as http;

class HttpService {
  static final baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;

    final url = Uri.parse("$baseUrl$endPoint");

    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }
}
