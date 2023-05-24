import 'package:final_project/screens/home.dart';
import 'package:final_project/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widgets.dart';
import '../utils/colors_util.dart';
class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        hexStringToColor("F4C2DF"),
        hexStringToColor("F8A3A8"),
        hexStringToColor("BFB2F3"),

    ], begin: Alignment.topCenter, end: Alignment.bottomCenter
    )),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20 ,0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/login.png"),
              SizedBox(
                height: 30,
              ),
              textField("Enter Email Id",Icons.person_2_outlined,false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              textField(
                "Enter Password", Icons.lock_outline, true, _passwordTextController),
              SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }).onError((error, stackTrace) {
                  setState(() {
                    _errorMessage = _getErrorMessage(error);
                  });
                });
              }),
              signUpOption(),
              if (_errorMessage.isNotEmpty) // Show the error message if it's not empty
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    ),
    );
  }
Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account? ",
        style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),
          ),
        )
      ],
    );
}
  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'firebase_auth/invalid-email':
          return 'Invalid email address.';
        case 'firebase_auth/wrong-password':
          return 'Invalid password.';
        case 'firebase_auth/user-not-found':
          return 'User not found.';
        default:
          return error.message ?? 'An error occurred.';
      }
    }
    return 'An error occurred.';
  }
}
