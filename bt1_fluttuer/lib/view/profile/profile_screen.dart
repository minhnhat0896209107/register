import 'package:flutter/material.dart';
import 'package:hello_flutter/model/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'component/head_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Profile> profile;

  Future<Profile> getProfile() async {
    var response = await http.get(Uri.https('randomuser.me', '/api/'));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Profile.fromJson(jsonResponse);
    } else {
      throw Exception("Fail");
    }
  }

  @override
  void initState() {
    profile = getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: profile,
        builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            var rs = data!.results![0];
            return _buildBody(rs.picture!.thumbnail.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Widget _buildBody(image) {
  return Container(
    child: Column(
      children: [
        HeadProfile(
          image: image,
        ),
        
      ],
    ),
  );
}
