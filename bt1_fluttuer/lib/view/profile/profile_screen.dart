import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/model/profile.dart';
import 'package:hello_flutter/view/profile/component/body_profile.dart';
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
    var response = await http.get(Uri.https('randomuser.me', 'api'));

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
    print(profile);
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
            var img = rs.picture!.thumbnail.toString();
            var fname = rs.name!.first.toString();
            var lname = rs.name!.last.toString();
            var email = rs.email.toString();
            return _buildBody(img, fname, lname, email);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Widget _buildBody(image, firstname, lastname, email) {
  return Container(
    child: Column(
      children: [
        HeadProfile(
          image: image,
        ),
        SizedBox(
          height: Get.height * 0.05,
        ),
        BodyProfile(
          firstName: firstname,
          lastName: lastname,
          email: email,
        )
      ],
    ),
  );
}
