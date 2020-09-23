import 'package:flat/model/question.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question.name("Thi is Myanmar Flag created in 2015.", true),
    Question.name("Thi is Myanmar Flag created in 299.", false),
    Question.name("Thi is Myanmar Flag created in 44.", false),
    Question.name("Thi is Myanmar Flag created in 2015.", false),
    Question.name("I word in 2015 .", true)

    // "Us Decoration Flag created i 29923 33 ,fdjfl sdfdsa",
    //  "MM ssf Flag created i 29923 33 ,fdjfl sdfdsa"
  ];
  int _currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
        // backgroundColor: Colors.deepOrange,
      ),
      // backgroundColor: Colors.blueGrey,

      // Builder createin
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/mm.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.3),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(fontSize: 16.4, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: () => _previousQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ))
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userInput, BuildContext context) {
    if (userInput == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("This is Correct");
      final snap = SnackBar(
        backgroundColor: Colors.greenAccent.shade400,
        content: Text("This is Correct."),
      );
      Scaffold.of(context).showSnackBar(snap);
      _nextQuestion();
    } else {
      final snap = SnackBar(
        backgroundColor: Colors.redAccent.shade400,
        content: Text("This is not Correct."),
      );
      Scaffold.of(context).showSnackBar(snap);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
