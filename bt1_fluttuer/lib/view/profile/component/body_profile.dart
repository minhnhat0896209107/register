import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyProfile extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? email;
  BodyProfile({Key? key, this.firstName, this.lastName, this.email})
      : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: Get.height * 0.49,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText("First Name"),
            SizedBox(height: 10),
            inputForm(widget.firstName!),
            SizedBox(height: 10),
            labelText("Last Name"),
            SizedBox(height: 10),
            inputForm(widget.lastName!),
            SizedBox(height: 10),
            labelText("Company Email"),
            SizedBox(height: 10),
            inputForm(widget.email!),
          ],
        ),
      ),
    );
  }
}

Widget labelText(String name) {
  return Container(
    child: Text(
      name,
      style: TextStyle(
          fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
    ),
  );
}

Widget inputForm(String name) {
  return Container(
    height: 60,
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 18, color: Colors.grey[600], fontWeight: FontWeight.bold),
      ),
    ),
  );
}
