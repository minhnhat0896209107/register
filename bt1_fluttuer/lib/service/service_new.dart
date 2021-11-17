import 'dart:convert';

import 'package:hello_flutter/config/utils.dart';
import 'package:hello_flutter/model/new.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NewService {
  Future<News> fetchNewsApple(nameapi, fromdate, todate, sortby, apikey) async {
    String url =
        "${BASE_API}?q=${nameapi}&from=${fromdate}&to=${todate}&sortBy=${sortby}&apiKey=${apikey}";

    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);

      return newsFromJson(jsonData);
    } else {
      return throw Exception('fail');
    }
  }

  Future<News> fetchNewsTechcrunh(apikey) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=${apikey}";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);

      return newsFromJson(jsonData);
    } else {
      return throw Exception('fail');
    }
  }

  Future<News> fetchNewsTesla(nameapi, fromdate, sortby, apikey) async {
    String url =
        "${BASE_API}?q=${nameapi}&from=${fromdate}&sortBy=${sortby}&apiKey=${apikey}";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);

      return newsFromJson(reponse.body);
    } else {
      return throw Exception('fail');
    }
  }

  Future<News> fetchNewsDomain(String name, String apikey) async {
    String url = "${BASE_API}?domains=${name}&apiKey=${apikey}";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);

      return newsFromJson(reponse.body);
    } else {
      return throw Exception('fail');
    }
  }
}
