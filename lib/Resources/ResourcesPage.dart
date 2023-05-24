import 'package:final_project/utils/Resources_list/anxiety.dart';
import 'package:final_project/utils/Resources_list/depression.dart';
import 'package:final_project/utils/Resources_list/lifestyle.dart';
import 'package:final_project/utils/Resources_list/physicalhealth.dart';
import 'package:final_project/utils/Resources_list/sleepissues.dart';
import 'package:final_project/utils/Resources_list/stress.dart';
import 'package:flutter/material.dart';
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: Colors.teal[100],
          appBar: AppBar(
            title: Text('Resources for you'),
            backgroundColor: Colors.teal,
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            height: 260,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4.0, color: Colors.brown),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0), bottomRight: Radius.circular(36.0),),
                            image: DecorationImage(
                              image: AssetImage('assets/images/ty-williams-R2glnKGBoPE-unsplash.jpg'),
                              fit: BoxFit.cover,
                          ),
                          ),
                        ),
                        GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            padding: EdgeInsets.all(30.0),
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => StressPage(), ));
                                },
                                child: const Text('Stress', style: TextStyle(fontSize: 17)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                                    shape: CircleBorder(),elevation: 10, // Add this property to add 3D effect
                                      shadowColor: Colors.teal.withOpacity(1.0)),

                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnxietyPage(), ));
                                },
                                child: const Text('Anxiety', style: TextStyle(fontSize: 17)),
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                shape: CircleBorder(),elevation: 10, // Add this property to add 3D effect
                                shadowColor: Colors.teal.withOpacity(1.0)),),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DepressionPage(), ));
                                },
                                child: const Text('Depression', style: TextStyle(fontSize: 17)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                                  shape: CircleBorder(),elevation: 10, // Add this property to add 3D effect
                                  shadowColor: Colors.teal.withOpacity(1.0)),),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SleepIssuesPage(), ));
                                },
                                child: const Text('Sleep Issues', style: TextStyle(fontSize: 17)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                                  shape: CircleBorder(),elevation: 10, // Add this property to add 3D effect
                                  shadowColor: Colors.teal.withOpacity(1.0)) ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PhysicalHealthPage(), ));
                                },
                                child: const Text('Physical Health', style: TextStyle(fontSize: 17),textAlign: TextAlign.center,),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,shape: CircleBorder(),elevation: 10, // Add this property to add 3D effect
                                     shadowColor: Colors.teal.withOpacity(1.0))
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LifestylePage(), ));
                                },
                                child: const Text('LifeStyle', style: TextStyle(fontSize: 17)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,shape: CircleBorder(),elevation: 10, // Add this property to add 3D effect
                                    shadowColor: Colors.teal.withOpacity(1.0))
                              ),
                            ],
                          ),
                      ],
                  ),
          ),
        );
  }
}
