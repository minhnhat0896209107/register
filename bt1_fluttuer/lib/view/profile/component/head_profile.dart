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
              width: Get.width * 0.38,
              height: 100,
            ),
            Text(
              "Profile",
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
            SizedBox(
              width: Get.width * 0.3,
            ),
            Container(
              child: Text(
                "Save",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            )
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(image!),
          radius: 50,
        )
      ],
    );
  }
}
