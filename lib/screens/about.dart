import 'package:flutter/material.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/shared/bottom_nav.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService().googleSignIn();

    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Text("About...")));
  }
}
