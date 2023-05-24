import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SleepIssuesPage extends StatelessWidget {
  const SleepIssuesPage({Key? key}) : super(key: key);

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
                    image: AssetImage('assets/images/img_14.png'),
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
                      launch('https://www.mayoclinic.org/diseases-conditions/insomnia/diagnosis-treatment/drc-20355173');
                    },
                    child: Text('Insomnia- Diagnosis and treatment'
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
                    image: AssetImage('assets/images/img_15.png'),
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
                    launch('https://www.webmd.com/women/guide/insomnia-tips');
                  },
                  child: Text('10 Tips to Beat Insomnia',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.underline, ),textAlign: TextAlign.left,),
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
                    image: AssetImage('assets/images/img_16.png'),
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
                    launch('https://www.sleepfoundation.org/insomnia/treatment/what-do-when-you-cant-sleep');
                  },
                  child: Text('What To Do When You Can’t Sleep',
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
                    launch('https://my.clevelandclinic.org/health/diseases/21543-sleep-anxiety');
                  },
                  child: Text('Sleep Anxiety',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),textAlign: TextAlign.left,),
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
