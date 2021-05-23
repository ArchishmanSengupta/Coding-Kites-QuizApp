import 'package:flutter/material.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mq= MediaQuery.of(context);
    final logo= Image.asset(
      "assets/logo.jpg",
      fit: BoxFit.contain);
      final buttons= Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children :<Widget> [
          

        ],
      );


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            logo,
            buttons,
          ],
        )
        )
    );


  }
}