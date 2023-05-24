import 'package:flutter/material.dart';
import 'DetailScreen.dart';
class ActivitiesPage extends StatelessWidget {
  ActivitiesPage({Key? key}) : super(key: key);

  final List<String> _relaxationactivities = [
    'Deep Breathing',
    'Guided Imagery',
    'Progressive Muscle Relaxation',
    'Guided Massage',
    'Mindful Walking',
    'Thought Defusion',
    'Self-Compassion',
    'Beach Visualisation',
  ];
  final List<String> _physicalactivities = [
    'Walking',
    'Climbing Stairs',
    'Running',
    'Cycling'
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Recommended Activities'),
          backgroundColor: Colors.teal,
        ),
        body:
        Center(
          child: Container(
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Build emotional strength by practicing relaxation and physical activities curated by therapists.',
                  style: TextStyle(fontSize: 15,color: Colors.black54),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Relaxation Activities:",
                  style: TextStyle(fontSize: 20, color: Colors.teal)),
                ),
                Expanded(
                    child: ListView.builder(
                    itemCount: _relaxationactivities.length,
                    itemBuilder: (BuildContext context, int index)
                    {
                      final name = _relaxationactivities[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name:name),
                          ),
                          );
                        },
                        child: ListTile(
                          title: Text(name),
                        ),
                      );
                    }
                    )
                )
              ],
            ),
          ),
        ),
      );
  }
}
