import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/view/news/new_screen.dart';

class Detail extends StatelessWidget {
  var content;
  var image;
  Detail({this.image, this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => ApiWeb()));
              },
              icon: Icon(Icons.keyboard_backspace_outlined, size: 30)),
          title: Text("Detail", style: TextStyle(fontSize: 22)),
          
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7, left: 7),
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(content,
                      style: TextStyle(fontSize: 18, color: Colors.black54)),
                ),
              ],
            ))));
  }
}
