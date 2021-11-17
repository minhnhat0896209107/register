// import 'dart:convert';

// import 'package:hello_flutter/config/utils.dart';
// import 'package:hello_flutter/model/new.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class NewService {
//   Future<News> fetchNewsApple(apikey) async {
//     String url = "${BASE_API_APPLE}apiKey=${apikey}";

//     var reponse = await http.get(Uri.parse(url));
//     if (reponse.statusCode == 200) {
//       var jsonData = json.decode(reponse.body);
//       print(jsonData);

//       return newsFromJson(jsonData);
//     } else {
//       return throw Exception('fail');
//     }
//   }

//   Future<News> fetchNewsCountry(apikey) async {
//     String url = "${BASE_API_TECHCRUNH}apiKey=${apikey}";
//     var reponse = await http.get(Uri.parse(url));
//     if (reponse.statusCode == 200) {
//       var jsonData = json.decode(reponse.body);
//       print(jsonData);

//       return newsFromJson(jsonData);
//     } else {
//       return throw Exception('fail');
//     }
//   }

//   Future<News> fetchNewsTesla(apikey) async {
//     String url = "${BASE_API_TESLA}apiKey=${apikey}";
//     var reponse = await http.get(Uri.parse(url));
//     if (reponse.statusCode == 200) {
//       var jsonData = json.decode(reponse.body);
//       print(jsonData);

//       return newsFromJson(reponse.body);
//     } else {
//       return throw Exception('fail');
//     }
//   }

//   Future<News> fetchNewsDomain(apikey) async {
//     String url = "${BASE_API_DOMAIN}apiKey=${apikey}";
//     var reponse = await http.get(Uri.parse(url));
//     if (reponse.statusCode == 200) {
//       var jsonData = json.decode(reponse.body);
//       print(jsonData);

//       return newsFromJson(reponse.body);
//     } else {
//       return throw Exception('fail');
//     }
//   }
// }
