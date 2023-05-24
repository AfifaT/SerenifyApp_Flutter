import 'package:flutter/material.dart';
import './quiz.dart';
import './result2.dart';
class AssessmentScreenTwo extends StatefulWidget {
  const AssessmentScreenTwo({Key? key}) : super(key: key);

  @override
  State<AssessmentScreenTwo> createState() => _AssessmentScreenTwoState();
}

class _AssessmentScreenTwoState extends State<AssessmentScreenTwo> {
  final _questions = const [
    {
      'questionText': 'How often do you share your feelings with friends or relatives?',
      'answers': [
        {'text': 'Once or twice a month', 'score': 0},
        {'text': 'Once or twice a week', 'score': 1},
        {'text': 'Three times a week or more', 'score': 2},
        {'text': 'About once a day', 'score': 3},
      ],
    },
    {
      'questionText': 'How often do you do kind things for others?',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Once or twice a month', 'score': 1},
        {'text': 'Three times a week or more', 'score': 2},
        {'text': 'About once a day', 'score': 3},
      ],
    },
    {
      'questionText':
      'How much time do you spend on social media per day?',
      'answers': [
        {'text': 'Less than two hours', 'score': 0},
        {'text': '2 to 4 hours', 'score': 1},
        {'text': '4 to 6 hours', 'score': 2},
        {'text': '6 to 8 hours', 'score': 3},
      ],
    },
    {
      'questionText': 'How often do you do (at least 20 minutes) of physical exercise?',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Once or twice a month', 'score': 1},
        {'text': 'Three times a week or more', 'score': 2},
        {'text': 'About once a day', 'score': 3},
      ],
    },
    {
      'questionText': 'I find a deep sense of fulfilment in my life by using my strengths and skills towards a purpose greater than myself.',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Rarely', 'score': 1},
        {'text': 'Sometimes', 'score': 2},
        {'text': 'Almost always', 'score': 3},
      ],
    },
    {
      'questionText':
      'I have feelings of gratitude towards people and events from my past.',
      'answers': [
        {'text': 'I never feel this way', 'score': 0},
        {'text': 'I rarely feel this way', 'score': 1},
        {'text': 'I sometimes feel this way', 'score': 2},
        {'text': 'I feel this way most of the time', 'score': 3},
      ],
    },
    {
      'questionText':
      'I engage in activities (sports, writing, etc) that I find challenging and absorbing.',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Once or twice a week', 'score': 1},
        {'text': 'Three times a week or more', 'score': 2},
        {'text': 'Everyday', 'score': 3},
      ],
    },
    {
      'questionText':
      'I am able to focus on the present moment and do not get distracted by thoughts of the past or future.',
      'answers': [
        {'text': 'I never feel this way', 'score': 0},
        {'text': 'I rarely feel this way', 'score': 1},
        {'text': 'I often feel this way', 'score': 2},
        {'text': 'I feel this way most of the time', 'score': 3},
      ],
    },
    {
      'questionText':
      'I feel that my life is meaningful (i.e. has an important quality or purpose).',
      'answers': [
        {'text': 'I never feel this way', 'score': 0},
        {'text': 'I rarely feel this way', 'score': 1},
        {'text': 'I often feel this way', 'score': 2},
        {'text': 'I feel this way most of the time', 'score': 3},
      ],
    },
    {
      'questionText':
      'I am optimistic about the future',
      'answers': [
        {'text': 'I never feel this way', 'score': 0},
        {'text': 'I rarely feel this way', 'score': 1},
        {'text': 'I often feel this way', 'score': 2},
        {'text': 'I feel this way most of the time', 'score': 3},
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
                : ResultTwo(_totalScore, _resetQuiz),
          )


      ),
    );
  }
}

