import 'package:final_project/MoodTracker/MoodTracker.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Activities/Activities.dart';
import 'Assessment.dart';
import 'Resources/ResourcesPage.dart';
import 'connectPage/connectMainPage.dart';
import 'doctors nearby/nearbydoctors.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/chang-duong-Sj0iMtq_Z4w-unsplash.jpg'},
    {"id": 2, "image_path": 'assets/images/dan-meyers-hluOJZjLVXc-unsplash.jpg'},
    {"id": 3, "image_path": 'assets/images/jon-tyson-ZA9PHAnVP5g-unsplash.jpg'},
    {"id": 4, "image_path": 'assets/images/tim-mossholder-SR8ByN6xY3k-unsplash.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[100],
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: (){},
                  child: CarouselSlider(
                    items: imageList
                        .map(
                        (item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                    )
                        .toList(),
                    carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason){
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      // print(entry);
                      // print(entry.key);
                      return GestureDetector(
                        onTap: () => carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17:7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,

                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                               ? Colors.red : Colors.teal
                          ),

                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                child:
                GridView.count(crossAxisCount: 2,
                  children: [
                    Card(
                      margin: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyConnectApp()));
                        },
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Image.asset("assets/images/network.png",width:80,)),
                              SizedBox(height: 4.0),
                              Center(
                                child: Text("Share your thoughts",textAlign: TextAlign.center,style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResourcesPage(), ));

                        },
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/article.png",width:80,),
                              SizedBox(height: 4.0),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Resources",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ActivitiesPage(), ));
                        },
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/daily-tasks.png",width:80,),
                              SizedBox(height: 4.0),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Activities",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AssessmentPage(), ));

                        },
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/assessment.png",width:80,),
                              SizedBox(height: 4.0),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Assessment",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NearbyDoctorsPage(), ));
                        },
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/psychiatrist.png",width:80,),
                              SizedBox(height: 4.0),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Doctors near me",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MoodTrackerScreen(), ));

                        },
                        splashColor: Colors.green,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/mood.png",width:80,),
                              SizedBox(height: 4.0),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Mood Tracker",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
