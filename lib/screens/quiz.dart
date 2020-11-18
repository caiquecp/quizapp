import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Text("Quiz...")));
  }
}
