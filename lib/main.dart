import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/screens/about.dart';
import 'package:quizapp/screens/profile.dart';
import 'package:quizapp/screens/topics.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/shared/bottom_nav.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user)
      ],
      child: MaterialApp(
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
        ],
        title: 'Quiz App',
        theme: ThemeData(
            fontFamily: 'Nunito',
            bottomAppBarTheme: BottomAppBarTheme(color: Colors.black87),
            brightness: Brightness.dark,
            textTheme: TextTheme(
                body1: TextStyle(fontSize: 18),
                body2: TextStyle(fontSize: 16),
                button:
                    TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
                headline: TextStyle(fontWeight: FontWeight.bold),
                subhead: TextStyle(color: Colors.grey))),
        routes: {
          "/": (context) => HomeScreen(),
          "/topics": (context) => TopicsScreen(),
          "/profile": (context) => ProfileScreen(),
          "/about": (context) => AboutScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        bottomNavigationBar: BottomNav(),
        body: Center(
          child: Column(
            children: [Text("Hello, World!")],
          ),
        ));
  }
}
