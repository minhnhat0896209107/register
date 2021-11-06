import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HeadProfile extends StatelessWidget {
  String? image;
  HeadProfile({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 30,
              width: 100,
            ),
            Text(
              "Profile",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              width: 100,
            ),
            Container(
              child: Text(
                "Save",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            )
          ],
        ),
        CircleAvatar(
          child: Image.network(
            image!,
            width: Get.width,
          ),
        )
      ],
    );
  }
}
