import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class StressPage extends StatelessWidget {
  const StressPage({Key? key}) : super(key: key);

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
                    image: AssetImage('assets/images/stress1.png'),
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
                      launch('https://www.healthline.com/nutrition/16-ways-relieve-stress-anxiety');
                    },
                    child: Text('15 Simple Ways to Relieve Stress'
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
                    image: AssetImage('assets/images/img.png'),
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
                    launch('https://health.clevelandclinic.org/how-to-relieve-stress/');
                  },
                  child: Text('10 Ways You Can Relieve Stress Right Now',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),textAlign: TextAlign.left,),
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
                    image: AssetImage('assets/images/img_1.png'),
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
                    launch('https://www.helpguide.org/articles/stress/quick-stress-relief.htm');
                  },
                  child: Text('Quick Stress Relief',
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
                    image: AssetImage('assets/images/img_2.png'),
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
                    launch('https://www.nhs.uk/mental-health/self-help/guides-tools-and-activities/tips-to-reduce-stress/');
                  },
                  child: Text('10 stress busters',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
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
                    image: AssetImage('assets/images/img_3.png'),
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
                    launch('https://www.hopkinsmedicine.org/health/wellness-and-prevention/how-to-relieve-stress-a-6-step-plan-to-feeling-good');
                  },
                  child: Text('How to Relieve Stress: A 6-Step Plan to Feeling Good',
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
                    image: AssetImage('assets/images/img_4.png'),
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
                    launch('https://www.mayoclinichealthsystem.org/hometown-health/speaking-of-health/the-4-as-of-stress-relief');
                  },
                  child: Text("The 4 A's of stress relief",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),
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
