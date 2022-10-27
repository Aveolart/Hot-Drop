import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<dynamic> getRequest(String url) async {
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        return "Failed";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
