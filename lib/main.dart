import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {'questionText': 'What\' is your favorite color?', 'answers': ['Black', 'Red', 'Blue', 'Green']},
      {'questionText': 'What\'s your favorite animal?', 'answers': ['Raven', 'Pig', 'Snake', 'Turtle']},
      {'questionText': 'What is your favorite food?', 'answers': ['Pizza', 'Spaghetti', 'Pork']},
      {'questionText': 'What is your name?', 'answers': ['No', 'Nope', 'Fuck you']},
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questionText: questions[_questionIndex]['questionText'],
              ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
