import 'dart:async';

import 'package:final_project/assessment_screen/assessment_one.dart';
import 'package:flutter/material.dart';
class AssessSplashScreen extends StatefulWidget {
  const AssessSplashScreen({Key? key}) : super(key: key);

  @override
  State<AssessSplashScreen> createState() => _AssessSplashScreenState();
}

class _AssessSplashScreenState extends State<AssessSplashScreen> {
  double _progressValue = 0.0;
  @override

  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue >= 1.0){
          timer.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AssessmentScreen(),));

        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 90,
                  child: Image(image: AssetImage("assets/images/Heartbeat.jpg"),)),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Text("Depression Assessment",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),),
              ),
              SizedBox(height: 20,),
              Text("Let's check if you have any signs of depression"),
              SizedBox(height: 100,),
              Text("Take a deep Breath"),
              SizedBox(height:20),
              SizedBox(
                width: 100,
                child: LinearProgressIndicator(
                  value: _progressValue,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.grey[400],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
