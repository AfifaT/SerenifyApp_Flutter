import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysicalHealthPage extends StatelessWidget {
  const PhysicalHealthPage({Key? key}) : super(key: key);

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
                    image: AssetImage('assets/images/img_21.png'),
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
                      launch('https://blogs.crossmap.com/2022/12/09/6-things-you-can-do-to-improve-physical-mental-well-being-this-year/?gclid=CjwKCAjwxr2iBhBJEiwAdXECw3X3MG4WRbANLReDAOy7UgP5-FSIGd50Ec_588AtKxWACeXxdfzh1BoCTp8QAvD_BwE');
                    },
                    child: Text('6 Things You Can Do To Improve Physical & Mental Well-being This Year'
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
                    image: AssetImage('assets/images/img_22.png'),
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
                    launch('https://www.nih.gov/health-information/physical-wellness-toolkit');
                  },
                  child: Text('Physical Wellness Toolkit',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),textAlign: TextAlign.left,),
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
                    image: AssetImage('assets/images/img_23.png'),
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
                    launch('https://stride.com.au/10-ways-to-improve-your-physical-wellness/');
                  },
                  child: Text('10 Ways to Improve Your Physical Wellness',
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
                    image: AssetImage('assets/images/img_24.png'),
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
                    launch('https://www.cdc.gov/physicalactivity/basics/pa-health/index.htm');
                  },
                  child: Text('Benefits of Physical Activity',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
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
                    launch('https://www.mayoclinic.org/healthy-lifestyle/fitness/in-depth/exercise/art-20048389');
                  },
                  child: Text('Exercise: 7 benefits of regular physical activity',
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
