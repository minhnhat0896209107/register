import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/view/tictactoe/tictac.dart';

import 'tictac_2.dart';

class ChooseTicTac extends StatelessWidget {
  const ChooseTicTac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTac(),
    );
  }
}

class TicTac extends StatefulWidget {
  const TicTac({Key? key}) : super(key: key);

  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TicTacScreen()));
                },
                child: Container(
                    height: 50,
                    width: Get.width,
                    child: Center(
                      child: Text("Chơi Với Máy",
                          style: TextStyle(
                              fontSize: Get.height * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TicTac2Screen()));
                },
                child: Container(
                    height: 50,
                    width: Get.width,
                    child: Center(
                      child: Text("2 Người chơi",
                          style: TextStyle(
                              fontSize: Get.height * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
