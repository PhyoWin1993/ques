import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.grey[800],
          textTheme: TextTheme(
              headline: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              body1: TextStyle(
                fontSize: 34,
              ))),
      home: QuizApp(),
    ));
