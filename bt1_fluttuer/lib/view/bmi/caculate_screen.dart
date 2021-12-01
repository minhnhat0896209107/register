import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CaculateScreen extends StatelessWidget {
  String result;
  String msg;
  String bmi;
  CaculateScreen(
      {Key? key, required this.result, required this.msg, required this.bmi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Your Result",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(msg,
                    style: TextStyle(color: Colors.green, fontSize: 25)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  result,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(bmi,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))),
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: Get.width,
                  height: 50,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "RE-CALULATE",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
