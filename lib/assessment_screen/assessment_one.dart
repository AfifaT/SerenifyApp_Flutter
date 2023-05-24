import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({Key? key}) : super(key: key);

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final _questions = const [
    {
      'questionText': 'Little interest or pleasure in doing things?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText': 'Feeling down, depressed, or hopeless?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Trouble falling or staying asleep, or sleeping too much?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText': 'Feeling tired or having little energy?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText': 'Poor appetite or overeating?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Feeling bad about yourself - or that you are a failure or have let yourself or your family down?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Trouble concentrating on things, such as reading the newspaper or watching television?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Moving or speaking so slowly that other people could have noticed or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Thoughts that you would be better off dead, or of hurting yourself?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?',
      'answers': [
        {'text': 'NOT DIFFICULT AT ALL', 'score': 0},
        {'text': 'SOMEWHAT DIFFICULT', 'score': 1},
        {'text': 'VERY DIFFICULT', 'score': 2},
        {'text': 'EXTREMELY DIFFICULT', 'score': 3},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
      print("Total score: $_totalScore");
    } else {
      print('No more questions!');
      print("Total score: $_totalScore");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Happiness Test'),
          backgroundColor: Color.fromARGB(255, 32, 121, 194),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body:
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 80, top: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blue.jpg'),
                fit: BoxFit.cover,
            )
          ),
          child:
          _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          )
              : Result(_totalScore, _resetQuiz),
        )


      ),
    );
  }
}

