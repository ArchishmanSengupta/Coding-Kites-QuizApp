import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/themes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_number_trivia/views/opening_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding Kites Quiz',
      routes: AppRoutes.define(),
      
      home: OpeningPage(
        
      ),
    );
  }
}
