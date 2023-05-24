import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mood.dart';

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final _moodTracker = MoodTracker();

  @override
  void initState() {
    super.initState();
    _moodTracker.loadMoodHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker'),
        backgroundColor:Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _moodTracker.clearMoodHistory();
              setState(() {});
            },
          ),
        ],
      ),
      body:
      Container(
        color: Colors.teal[100],
        child: StreamBuilder<QuerySnapshot>(
          stream: _moodTracker.getStreamOfMoods(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final moodDocs = snapshot.data!.docs;
            final moods = moodDocs
                .map((doc) => Mood.values[(doc.data() as Map<String,dynamic>)['mood'] ?? 0])
                .toList();

            Widget _buildCard(Mood mood, Timestamp timestamp) {
              final dateTime = timestamp.toDate();
              return Card(
                color: _getMoodColor(mood),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Icon(
                          _getMoodIcon(mood),
                          size: 48.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(dateTime),
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        'Feeling ${_getMoodText(mood)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          final moodDoc = moodDocs[moods.indexOf(mood)];
                          await _moodTracker.deleteMoodHistory(moodDoc);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return  ListView.builder(
              itemCount: (moods.length / 2).ceil(),
              itemBuilder: (context, index) {
                // final firstMood = moods[index * 2];
                // final secondMood = (index * 2 + 1 < moods.length) ? moods[index * 2 + 1] : null;
                final firstDoc = moodDocs[index * 2];
                final secondDoc = (index * 2 + 1 < moodDocs.length) ? moodDocs[index * 2 + 1] : null;

                final firstMood = Mood.values[(firstDoc.data() as Map<String, dynamic>)['mood'] ?? 0];
                final secondMood = secondDoc != null ? Mood.values[(secondDoc.data() as Map<String, dynamic>)['mood'] ?? 0] : null;

                final firstTimestamp = (firstDoc.data() as Map<String, dynamic>)['timestamp'];
                final secondTimestamp = secondDoc != null ? (secondDoc.data() as Map<String, dynamic>)['timestamp'] : null;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard(firstMood, firstTimestamp),
                    if (secondMood != null) _buildCard(secondMood, secondTimestamp),
                  ],
                );
              },
            );

          },
        ),
      ),


      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.teal,
            child: Icon(Icons.add),
            onPressed: () async {
              final selectedMood = await showDialog<Mood>(
                context: context,
                builder: (context) => MoodSelectionDialog(),
              );
              if (selectedMood != null) {
                await _moodTracker.addMood(selectedMood);
                setState(() {});
              }
            },
          ),
          SizedBox(width: 16),

        ],
      ),
    );
  }
}
class MoodSelectionDialog extends StatelessWidget {
  final _answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select Mood',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Image.asset('assets/images/emotion.png'),
          ),
          Container(height: 20),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              children: Mood.values.map((mood) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop(mood);

                    },
                    icon: Icon(
                      _getMoodIcon(mood),
                      color: Colors.white,
                      size: 32.0,
                    ),
                    label: Text(
                      _getMoodText(mood),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(_getMoodColor(mood)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.0),
          TextButton(
            child: Text(
              'CANCEL',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

Color _getMoodColor(Mood mood) {
  switch (mood) {
    case Mood.Great:
      return Colors.green;
    case Mood.Good:
      return Colors.lightGreen;
    case Mood.Okay:
      return Colors.grey;
    case Mood.Bad:
      return Colors.orange;
    case Mood.Awful:
      return Colors.red;
    default:
      return Colors.grey;
  }
}
String _getMoodText(Mood mood) {
  switch (mood) {
    case Mood.Great:
      return 'Great';
    case Mood.Good:
      return 'Good';
    case Mood.Okay:
      return 'Okay';
    case Mood.Bad:
      return 'Bad';
    case Mood.Awful:
      return 'Awful';
    default:
      return '';
  }
}
IconData _getMoodIcon(Mood mood) {
  switch (mood) {
    case Mood.Great:
      return Icons.sentiment_very_satisfied_sharp;
    case Mood.Good:
      return Icons.sentiment_satisfied_sharp;
    case Mood.Okay:
      return Icons.sentiment_neutral_rounded;
    case Mood.Bad:
      return Icons.sentiment_dissatisfied_sharp;
    case Mood.Awful:
      return Icons.sentiment_very_dissatisfied_sharp;
    default:
      return Icons.sentiment_satisfied_sharp;
  }
}



