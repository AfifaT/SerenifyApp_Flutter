import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      margin: const EdgeInsets.only(bottom: 9),
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 32, 121, 194),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),

    );
  }
}