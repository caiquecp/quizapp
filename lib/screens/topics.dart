import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Topics"),
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Text("Topics...")));
  }
}
