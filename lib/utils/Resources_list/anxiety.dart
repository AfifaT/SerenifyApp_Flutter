import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnxietyPage extends StatelessWidget {
  const AnxietyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal[100],
      body:

      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Column(
            children: [ //textContainer
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0,right: 10.0),
                width:600,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_6.png'),
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
                    launch('https://www.healthline.com/health/effective-ways-to-fight-anxiety-without-drugs');
                  },
                  child: Text('When in Doubt, Shout It Out! 8 Drug-Free Ways to Battle Anxiety',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),textAlign: TextAlign.left,),
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
                    image: AssetImage('assets/images/img_7.png'),
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
                    launch('https://www.mayoclinichealthsystem.org/hometown-health/speaking-of-health/11-tips-for-coping-with-an-anxiety-disorder');
                  },
                  child: Text('11 tips for coping with an anxiety disorder',
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
                    launch('https://www.medicalnewstoday.com/articles/how-to-overcome-anxiety');
                  },
                  child: Text('Types of anxiety and ways to overcome them',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
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
                    image: AssetImage('assets/images/img_9.png'),
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
                    launch('https://www.webmd.com/mental-health/features/ways-to-reduce-anxiety');
                  },
                  child: Text('How to Stop Feeling Anxious Right Now',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),
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
                    image: AssetImage('assets/images/img_5.png'),
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
                      launch('https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/anxiety-treatment-options');
                    },
                    child: Text('Managing and treating anxiety'
                      ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),
                      textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
