import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Lion', 'Tiger'],
    },
    {
      'questionText': 'Who\'s your favourite superhero?',
      'answers': ['Captain America', 'Iron Man', 'Hulk', 'Thor'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }

    @override
    Widget build (BuildContext context) {
      /*var dummy = const ['Hello'];
    dummy.add('Max');
    dummy = [];
    questions = []; //does not work if questions is a 'const'
    */

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'] as String,
              ),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          ),
        ),
      );
    }
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
