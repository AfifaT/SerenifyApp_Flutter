import 'dart:async';
import 'package:final_project/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    });
  }
  Widget build (BuildContext){
    return Scaffold(
      body: Stack(
        children:[
          Image.asset("assets/images/splashscreen.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,),
          Container(
            color: Colors.transparent,
            child: Center(
              child: Text('Serenify',style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.teal[700],
              ),),
            ),
          ),
        ]

      ),
    );
  }
}