import 'package:flutter/material.dart';
import 'questions.dart';

class QuestionData {
  bool dis = false;
  int _num = 0;
  List _questionBank = [
    Question(a: 'The Human can learn faster', b: true),
    Question(a: 'The Human can master in anything', b: false),
    Question(a: 'The Human Can Be Stronger', b: true),
    Question(a: 'The Human Can be Smarter', b: true),
    Question(a: 'Manusia bisa menyelam di dalam air selama 60 menit', b: false),
    Question(a: 'Semut bisa terbang', b: false),
    Question(a: 'Kapal bisa terbang', b: false),
  ];

  List<Widget> scoreKeeper = [];
  int benar = 0;
  int salah = 0;

  void next() {
    if (_num < _questionBank.length - 1) {
      _num++;
    }
  }

  String questionText() {
    return _questionBank[_num].questionText;
  }

  bool questionAnswer() {
    return _questionBank[_num].questionAnswer;
  }

  void checkAnswer(bool userAns) {
    if (_num < _questionBank.length - 1) {
      bool correctAnswer = questionAnswer();
      if (correctAnswer == userAns) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        benar++;
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        salah++;
      }
      next();
    } else {
      dis = true;
    }
  }
}
