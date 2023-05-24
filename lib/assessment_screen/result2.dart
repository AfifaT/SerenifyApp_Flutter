import 'package:flutter/material.dart';

class ResultTwo extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  ResultTwo(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 19) {
      resultText =
      'You are practicing very few life skills that contribute to your happiness. Try engaging in activities that you enjoy';
    }  else {
      resultText =
          'You are practicing many life skills that contribute to your happiness. Keep going';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultPhrase,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: resetHandler,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 121, 194),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}