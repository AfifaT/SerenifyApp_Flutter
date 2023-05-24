import 'dart:async';

import 'package:final_project/assessment_screen/assessment_one.dart';
import 'package:flutter/material.dart';

import 'assessment_two.dart';
class AssessSplashScreen2 extends StatefulWidget {
  const AssessSplashScreen2({Key? key}) : super(key: key);

  @override
  State<AssessSplashScreen2> createState() => _AssessSplashScreen2State();
}

class _AssessSplashScreen2State extends State<AssessSplashScreen2> {
  double _progressValue = 0.0;
  @override

  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue >= 1.0){
          timer.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AssessmentScreenTwo(),));

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
                child: Text("Happiness Assessment",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),),
              ),
              SizedBox(height: 20,),
              Text("Think over these questions and tell us how you actually feel",),
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
