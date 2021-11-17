import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/config/utils.dart';
import 'package:hello_flutter/model/new.dart';
import 'package:hello_flutter/service/service.dart';
import 'package:hello_flutter/service/service_new.dart';
import 'package:hello_flutter/view/news/detail_screen.dart';

class ApiWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NewScreen());
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  var arrService = [
    Service().getWebApi(tesla),
    Service().getWebApi(domains),
    Service().getWebApi(apple),
  ];

  int count = 0;
  int x = 0;
  var arrName = ['Tesla', 'Domain', 'Apple'];
  var arrImage = [imageTesla, imagedomain, imageapple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _build()),
    );
  }

  Widget _build() {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        _content(),
        _listContent()
      ],
    ));
  }

  Widget _content() {
    return Container(
      height: Get.height * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: arrService.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7, left: 7),
                  width: Get.width * 0.45,
                  height: Get.height * 0.135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(arrImage[index])),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.blue,
                  ),
                ),
                Text(arrName[index],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19))
              ],
            ),
            onTap: () {
              setState(() {
                x = index;
              });
            },
          );
        },
      ),
    );
  }

  Widget _listContent() {
    return Container(
      padding: EdgeInsets.all(10),
      height: Get.height * 0.84,
      child: FutureBuilder(
          future: arrService[x], //undefider đó
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              News t = snapshot.data;
              return _listArticles(t.articles);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _listArticles(List<Article> ls) {
    return ListView.builder(
      itemCount: ls.length,
      itemBuilder: (BuildContext context, int index) {
        Article p = ls[index];
        return GestureDetector(
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(p.urlToImage == null || p.urlToImage == ''
                          ? imagenull
                          : p.urlToImage),
                      Text(
                        p.title,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        p.content,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Detail(image: p.urlToImage, content: p.content)));
          },
        );
      },
    );
  }
}
