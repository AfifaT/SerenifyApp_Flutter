import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DepressionPage extends StatelessWidget {
  const DepressionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose: "),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal[100],
      body:

      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0,right: 10.0),
                width:600,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_8.png'),
                    fit: BoxFit.cover,
                    opacity: 40,
                  ),
                  border: Border.all(color: Colors.lightBlueAccent, width: 3.0, style: BorderStyle.solid,),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: 3.0, offset: Offset(10.0, 10.0),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                child: GestureDetector(
                    onTap: () {
                      launch('https://www.healthline.com/health/depression/how-to-fight-depression');
                    },
                    child: Text('How to Navigate Depression: 22 Things to Try'
                      ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),
                      textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 20),//textContainer

              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0,right: 10.0),
                width:600,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_10.png'),
                    fit: BoxFit.cover,
                    opacity: 40,
                  ),
                  border: Border.all(color: Colors.lightBlueAccent, width: 3.0, style: BorderStyle.solid,),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: 3.0, offset: Offset(10.0, 10.0),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    launch('https://www.helpguide.org/articles/depression/coping-with-depression.htm');
                  },
                  child: Text('Coping with Depression',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),textAlign: TextAlign.left,),
                ),
              ),
              SizedBox(height: 20),//textContainer

              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0,right: 10.0),
                width:600,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_11.png'),
                    fit: BoxFit.cover,
                    opacity: 40,
                  ),
                  border: Border.all(color: Colors.lightBlueAccent, width: 3.0, style: BorderStyle.solid,),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: 3.0, offset: Offset(10.0, 10.0),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    launch('https://www.verywellmind.com/beat-depression-without-prescription-drugs-1065079');
                  },
                  child: Text('How to Fight Depression Without Medication',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),
                    textAlign: TextAlign.left,),
                ),
              ),
              SizedBox(height: 20),//textContainer

              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0,right: 10.0),
                width:600,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_12.png'),
                    fit: BoxFit.cover,
                    opacity: 40,
                  ),
                  border: Border.all(color: Colors.lightBlueAccent, width: 3.0, style: BorderStyle.solid,),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: 3.0, offset: Offset(10.0, 10.0),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    launch('https://www.nhs.uk/mental-health/self-help/tips-and-support/cope-with-depression/');
                  },
                  child: Text('How to cope with depression',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
                ),
              ),
              SizedBox(height: 20),//textContainer

              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0,right: 10.0),
                width:600,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_13.png'),
                    fit: BoxFit.cover,
                    opacity: 40,
                  ),
                  border: Border.all(color: Colors.lightBlueAccent, width: 3.0, style: BorderStyle.solid,),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: 3.0, offset: Offset(10.0, 10.0),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    launch('https://www.intrepidmentalhealth.com/blog/9-self-help-solutions-for-reducing-symptoms-of-depression');
                  },
                  child: Text('9 Self-Help Solutions for Reducing Symptoms of Depression',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),
                    textAlign: TextAlign.left,),
                ),
              ),
              SizedBox(height: 20),//textContainer
            ],
          ),
        ),
      ),
    );
  }
}
