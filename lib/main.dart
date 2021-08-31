import 'package:flutter/material.dart';
import 'algorithm.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Kuis());
}

class Kuis extends StatelessWidget {
  const Kuis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              'Created By Ruri',
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: KuisPage(),
          ),
        ),
      ),
    );
  }
}

class KuisPage extends StatefulWidget {
  @override
  _KuisPageState createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  QuestionData algo = QuestionData();
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                algo.questionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  algo.checkAnswer(true);
                  if (algo.dis) {
                    if (algo.benar > algo.salah) {
                      Alert(
                              context: context,
                              title: "You Win",
                              desc: "smart people")
                          .show();
                    } else {
                      Alert(
                              context: context,
                              title: "You Lose",
                              desc: "you are looser")
                          .show();
                    }
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  algo.checkAnswer(false);
                  if (algo.dis) {
                    if (algo.benar > algo.salah) {
                      Alert(
                              context: context,
                              title: "You Win",
                              desc: "Smart People")
                          .show();
                    } else {
                      Alert(
                              context: context,
                              title: "You Lose",
                              desc: "you are looser")
                          .show();
                    }
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: algo.scoreKeeper,
        )
      ],
    );
  }
}
