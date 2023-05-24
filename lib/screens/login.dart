import 'package:final_project/utils/colors_util.dart';
import 'package:flutter/material.dart';
import '../services/firebase_services.dart';
import 'home.dart';
import 'signin_screen.dart';

class  LoginScreen  extends StatefulWidget {
  const  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
        hexStringToColor("F4C2DF"),
        hexStringToColor("F8A3A8"),
        hexStringToColor("BFB2F3")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
          child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()async{
                    //await FirebaseServices().signInWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginSignup()));
                       },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if(states.contains(MaterialState.pressed)) {
                              return Colors.black26;
                            }
                            return Colors.white;
                          })),
                      child:Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/sign-in.jpg",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),

                                    const Text(
                                      "Login or Signup",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ]
                              )
                          )

                      )
                  ),
                  Container(height: 20),
                  ElevatedButton(
                      onPressed: () async{
                        await FirebaseServices().signInWithGoogle();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if(states.contains(MaterialState.pressed)) {
                              return Colors.black26;
                            }
                            return Colors.white;
                          })),
                      child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/googleimg.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),

                                    const Text(
                                      "Login With Gmail",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ]
                              )
                          )

                      )
                  )
                ],
              ),
      )

      ),
    ));
  }
}
