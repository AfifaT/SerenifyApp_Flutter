import 'package:final_project/reusable_widgets/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/colors_util.dart';
import 'home.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("F4C2DF"),
            hexStringToColor("F8A3A8"),
            hexStringToColor("BFB2F3"),
          ],begin: Alignment.topCenter, end: Alignment.bottomCenter
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                textField("Enter Username",Icons.person_2_outlined,false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    "Enter Email Id", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    "Enter Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, _createUser),
                if (_errorMessage.isNotEmpty)
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
  void _createUser() {
    final String email = _emailTextController.text.trim();
    final String password = _passwordTextController.text.trim();
    final String username = _userNameTextController.text.trim();

    // Validate input fields
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    // Perform sign up
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // Successfully created user
      // Perform additional actions, if needed
      value.user?.updateDisplayName(username);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).catchError((error) {
      // Handle sign up error
      setState(() {
        _errorMessage = _getErrorMessage(error);
      });
    });
  }

  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'firebase_auth/email-already-in-use':
          return 'Email address is already in use.';
        case 'firebase_auth/weak-password':
          return 'Password is too weak.';
        default:
          return error.message ?? 'An error occurred.';
      }
    }
    return 'An error occurred.';
  }

}
