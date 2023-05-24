import 'dart:async';
import 'package:flutter/material.dart';
import 'button_widget.dart';
class DetailScreen extends StatefulWidget {
  final String name;

  DetailScreen({required this.name});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{
  late final String _text;
  late Duration _duration;
  late int maxSeconds;
  late int maxMinutes;
  final Map<String, Map<String, dynamic>> _textByNames = {
    'Deep Breathing': {
      'text':'Being in control of your breathing can help you feel better. Taking deep breaths can relax your body and mind, allowing you to feel calmer and happier.',
      'duration': Duration(minutes:8,seconds: 40),
    },
    'Guided Imagery': {
      'text':'Guided Imagery helps you relax and control any negative thoughts that might be making you feel unhappy. Practising this technique on a regular basis can uplift your mood.',
      'duration': Duration(minutes:10,seconds: 04),
    },
    'Progressive Muscle Relaxation': {
      'text':' Progressive Muscle Relaxation is a technique that can give you a sense of control over your body, helping you feel calmer. It can also help you sleep better, contributing to great overall happiness.',
      'duration': Duration(minutes:11, seconds: 41),
    },
    'Guided Massage': {
      'text':"Massage therapy can help you tackle sadness by increasing levels of endorphins, your body's feel good chemicals. This can enhance your sense of well-being and make you happier.",
      'duration': Duration(minutes:10, seconds: 49),
    },
    'Mindful Walking': {
      'text':'This exercise is an easy way to incorporate mindfulness in your daily life. It will help you club relaxation with a simple physical activity-which can energise you and boost positive feelings.',
      'duration': Duration(minutes:9,seconds: 31),
    },
    'Thought Defusion': {
      'text':'In difficult situations, you might get negative thoughts that play on your mind. Using thought defusion, you can become aware of these thoughts. You can then let go of them or change them into positive ones.',
      'duration': Duration(minutes:5,seconds: 40),
    },
    'Self-Compassion': {
      'text':'You might find it more difficult to be kind to yourself as compared to others around you. Through self-compassion, you can feel more positive and even cope better in difficult situations.',
      'duration': Duration(minutes:5,seconds: 6),
    },
    'Beach Visualisation': {
      'text':'This exercise will guide you to imagine a peaceful place, so you can take a mental vacation. It can bring you a sense of calm and peace, and can help you counter feelings of sadness, worry and even stress.',
      'duration': Duration(minutes:4,seconds: 50),
    },
  };



  //static const maxSeconds = 10;
  //int seconds = maxSeconds;
  Timer? timer;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    final data = _textByNames[widget.name] ?? {'text': '', 'duration': Duration.zero};
    _text = data['text'];
    _duration = data['duration'];
    maxMinutes = (_duration.inMinutes);
    maxSeconds = (_duration.inSeconds % 60);
    seconds = maxSeconds;
    minutes = maxMinutes;

  }
  //int maxMinutes = _duration.inMinutes.toString().padLeft(2, '0') as int;

  void resetTimer() => setState(() {
    seconds = maxSeconds;
    minutes = maxMinutes;
    });
  void startTimer({bool reset = true}){
    if(reset) {
      resetTimer();
    }

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds>0 || minutes>0){
        setState(() {
          if(seconds==0 && minutes >0){
            minutes--;
            seconds=59;
          }else if(seconds > 0) {
            seconds--;
          }
        });
      } else {
        stopTimer(reset: false);
      }
    });
  }
  void stopTimer({bool reset = true}){
    if (reset) { resetTimer(); }
    setState(() => timer?.cancel());
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      color: Colors.teal[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text(widget.name, style: TextStyle(
                fontSize:20, fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 20,),
            Text(_text),
            SizedBox(height: 100,),
            buildTimer(),
            const SizedBox(height: 80),
            SizedBox(height: 10),
            buildButtons(),
          ],
        ),
      ),
    )
    );
  }

  Widget buildButtons(){
    final isRunning = timer == null? false: timer!.isActive;
    final isCompleted = seconds == maxSeconds||seconds == 0;

    return isRunning || !isCompleted
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: isRunning ? 'Pause' : 'Resume',
              onClicked: (){
                if (isRunning) {
                  stopTimer(reset: false);
                } else {
                  startTimer(reset: false);
                }
                }
            ),
            const SizedBox(width: 12),
            ButtonWidget(text: "Cancel",
                onClicked: stopTimer
            )
          ],
        )
      : ButtonWidget(
      text: 'Start Timer!',
      color: Colors.black,
      backgroundColor: Colors.white,
      onClicked: (){
        startTimer();
      },
    );
  }

  Widget buildTimer() => SizedBox(
    width: 200,
    height: 200,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          value: 1- (minutes*60 + seconds) / (_duration.inSeconds),
          strokeWidth: 12,
          backgroundColor: Colors.blueGrey,
        ),
        Center(child: buildTime()),
      ],
    ),
  );

  Widget buildTime(){
    if(seconds==0 && maxMinutes==0){
      return Icon(Icons.done, color: Colors.greenAccent,size:112);
    }
    else{
      Duration duration;
      if(timer == null){ duration = _duration; }
      else { duration = Duration(minutes: minutes, seconds: seconds); }

      String formattedTime =
          '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

      return Text(
        formattedTime,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 40,
        ),
      );

    }
  }
}

