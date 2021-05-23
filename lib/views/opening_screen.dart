import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/themes/routes.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mq= MediaQuery.of(context);
    final logo= Image.asset(
      "assets/logo.jpg", 
      height: mq.size.height/4,);
      Spacer();

      final loginButton= Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        //for round shape
        child: MaterialButton(
          minWidth: mq.size.width /1.2, // this will take up the width 1.2x
          padding: EdgeInsets.fromLTRB(10.0, 15.0,10.0,15.0),
          child: Text("Login", 
          style:  TextStyle(
            fontSize: 20.0, 
            color: Colors.black,
            fontWeight: FontWeight.bold,

            ),
            ),
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.authLogin);
            },

        ),

      );

      final registerButton= Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        //for round shape
        child: MaterialButton(
          minWidth: mq.size.width /1.2, // this will take up the width 1.2x
          padding: EdgeInsets.fromLTRB(10.0, 15.0,10.0,15.0),
          child: Text("Register", 
          style:  TextStyle(
            fontSize: 20.0, 
            color: Colors.black,
            fontWeight: FontWeight.bold,

            ),
            ),
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.authRegister);
            },
        ),
      );

      final buttons= Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children :<Widget> [
          loginButton,
          Padding(
            padding: EdgeInsets.all(12),
            ),
          registerButton,
        ],
      );


    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            logo,
            Padding(
            padding: EdgeInsets.all(110) ),
            buttons,
          ],
        )
        )
    );


  }
}