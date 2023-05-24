import 'package:final_project/assessment_screen/assessment_one.dart';
import 'package:flutter/material.dart';

import 'assessment_screen/assess_splash_screen1.dart';
import 'assessment_screen/assessment_two.dart';
class AssessmentPage extends StatelessWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessments'),
        backgroundColor: Colors.teal,
      ),
      body:
      Container(
        color: Colors.teal[100],
        child: Center(
          child: Column(
                children: [
                 SizedBox(
                   height: 80,
                   width: 50,
                 ),
                  SizedBox(
                   height: 400,
                   width: 300,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage('assets/images/assess_image.jpg'),
                           fit: BoxFit.cover
                         )
                       ),
                     ),
                   ),

                 ),
                 Container(height: 15),
                 ElevatedButton(
                   onPressed:() {
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context) => const AssessSplashScreen()),);
                 },
                 child: Text('BEGIN'),
                   style: ElevatedButton.styleFrom(fixedSize: const Size(240,50),backgroundColor: Colors.teal)
               ),



               ],
        ),
            ),
      ),
    );
  }
}
