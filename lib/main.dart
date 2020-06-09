import 'package:flutter/material.dart';

import './quiz.dart';

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
  final questions = const [
    {
      'questionText': 'What\' is your favorite color?',
      'answers': ['Black', 'Red', 'Blue', 'Green']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Raven', 'Pig', 'Snake', 'Turtle']
    },
    {
      'questionText': 'What is your favorite food?',
      'answers': ['Pizza', 'Spaghetti', 'Pork']
    },
    {
      'questionText': 'What is your name?',
      'answers': ['No', 'Nope', 'Fuck you']
    },
  ];

  void _answerQuestion() {
    // var aBool = true;
    // aBool = false;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('WE have more questions!');
    }
  }

  void _quizReset() {
    setState(() {
      _questionIndex = 0;
    });

    print('quiz rest');
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
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(_answerQuestion, _questions)
            : Column(children: [
                Text('Congratulations, you finished the quiz!'),
                Answer(_quizReset, 'Click to restart quiz')
              ]),
      ),
    );
  }
}
