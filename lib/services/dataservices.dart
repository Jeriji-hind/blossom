import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/models/datamodel.dart';

class DataServices {
  String baseUrl = "https://florist-backend.adaptable.app/api";
  Future<List<Datamodel>> getInfo() async {
    var apiUrl = '/flowers';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => Datamodel.fromJson(e)).toList();
      } else {
        return <Datamodel>[];
      }
    } catch (e) {
      print(e);
      return <Datamodel>[];
    }
  }

  postData(data, apiUrl) async {
    return await http.post(Uri.parse(baseUrl + apiUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
