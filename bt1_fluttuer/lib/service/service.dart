import 'package:hello_flutter/config/utils.dart';
import 'package:hello_flutter/model/new.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Service {
  Future<News> fetchApiNew(dynamic link) async {
    String url = link == null
        ? "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=201bb53c584140af889730bdfb3c9001"
        : link;
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(res.body) as Map<String, dynamic>;
      print(jsonResponse);
      print("đổ thanh công");
      return News.fromJson(jsonResponse);
    } else {
      throw Exception();
    }
  }
}
