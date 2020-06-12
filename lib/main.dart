import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\' is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Blue', 'score': 2},
        {'text': 'Green', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Raven', 'score': 1},
        {'text': 'Pig', 'score': 1},
        {'text': 'Snake', 'score': 7},
        {'text': 'Turtle', 'score': 9}
      ]
    },
    {
      'questionText': 'What is your favorite food?',
      'answers': [
        {'text': 'Pizza', 'score': 3},
        {'text': 'Spaghetti', 'score': 7},
        {'text': 'Pork', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your name?',
      'answers': [
        {'text': 'No', 'score': 3},
        {'text': 'Nope', 'score': 7},
        {'text': 'Fuck you', 'score': 9}
      ]
    },
  ];

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('WE have more questions!');
    }  else {
      print('Quiz complete, intialize reset');
    }
  }

  void quizReset() {
    setState(() {
      _questionIndex = 0;
    });

    print('quiz reset');
  }

  @override
  Widget build(BuildContext context) {
    // questions = [{'questionText': 'What is in a name', 'answers': ['Jim', 'Jab', 'Job', 'Jimbo']},];

    // var dummy = ['Hello'];
    // dummy.add('MAx');
    // print(dummy);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Progress 0.07b'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
