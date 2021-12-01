import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/view/bmi/caculate_screen.dart';

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMIScreen(),
    );
  }
}

enum GENDER { male, female }

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  GENDER? selectGender;
  int age = 20;
  int weight = 50;

  int _currentSliderValue = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [_head(), _body()],
        ),
      ),
    );
  }

  Widget _head() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectGender = GENDER.male;
              });
            },
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: selectGender == GENDER.male
                      ? Colors.grey.withOpacity(0.7)
                      : Colors.grey.withOpacity(0.4)),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Icon(
                    Icons.male,
                    size: 50,
                    color: Colors.white70,
                  ),
                  Text(
                    "Male",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectGender = GENDER.female;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: Get.width * 0.08),
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: selectGender == GENDER.female
                    ? Colors.grey.withOpacity(0.7)
                    : Colors.grey.withOpacity(0.4),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Icon(
                    Icons.female,
                    size: 50,
                    color: Colors.white70,
                  ),
                  Text(
                    "Female",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        _height(),
        SizedBox(
          height: 20,
        ),
        _weightandage(),
        _bottom()
      ],
    );
  }

  Widget _height() {
    return Container(
        width: Get.width * 0.9,
        height: Get.height * 0.4,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.08,
              ),
              Text(
                "Height",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              RichText(
                  text: TextSpan(
                      text: "${_currentSliderValue}",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                      children: [
                    TextSpan(
                      text: '/cm',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ])),
              Slider(
                value: _currentSliderValue.floorToDouble(),
                min: 0,
                max: 200,
                divisions: 200,
                inactiveColor: Colors.grey,
                activeColor: Colors.white,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value.round();
                  });
                },
              )
            ],
          ),
        ));
  }

  Widget _weightandage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: Get.width * 0.4,
          height: Get.height * 0.2,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey.withOpacity(0.4)),
          child: Column(
            children: [
              Text(
                "Weight",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text("${weight}", style: TextStyle(color: Colors.white, fontSize: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        weight++;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (weight < 1) {
                          weight = 0;
                        } else {
                          weight--;
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.minimize),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.4,
          height: Get.height * 0.2,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey.withOpacity(0.4)),
          child: Column(
            children: [
              Text(
                "Age",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text("${age}", style: TextStyle(color: Colors.white, fontSize: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        age++;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (age < 1) {
                          age = 0;
                        } else {
                          age--;
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.minimize),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottom() {
    double total = weight / pow(_currentSliderValue / 100, 2);
    String result = total.toStringAsFixed(2);

    String msg = "";
    String bmi = "";
    if (total < 18.5) {
      msg = "Underweight";
    } else {
      if (total >= 18.5 && total <= 24.9) {
        msg = "Normal";
        bmi = 'You have a normal body weight. Good job!';
      } else {
        if (total >= 25 && total <= 29.9) {
          msg = "Overweight";
          bmi =
              'You have a higher than normal body weight. Try to exercise more.';
        } else {
          msg = "Obesity";
          bmi =
              'You have a lower than normal body weight. You can eat a bit more.';
        }
      }
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CaculateScreen(result: result, msg: msg, bmi: bmi)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: Get.width,
        height: 50,
        color: Colors.red,
        child: Center(
          child: Text(
            "CALULATE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
