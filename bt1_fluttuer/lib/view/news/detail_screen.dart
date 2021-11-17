import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            child:
                Center(child: Column(
                  children: [
                    Image.network(image),
                    Text(content, style: TextStyle(fontSize: 20)),
                  ],
                ))));
  }
}
