import 'dart:io';

import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<loginPage> {

// Form to capture Email/Password
  final _formKey= GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    //dymanic size
    final mq= MediaQuery.of(context);
    final logo= Image.asset(
      "assets/logo.jpg", 
      height: mq.size.height/4,);
      
      //Email
      final emailField=TextFormField(
        enabled: isSubmitting, // submission is done
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white,
          ),
           decoration: InputDecoration(
            hintText: "something@email.com",
            labelText: "Email",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          )
        );
        
      //Password
      final passwordField=Column(
        children: <Widget> [
          TextFormField(
        enabled: isSubmitting, // submission is done
        controller: _passwordController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white,
          ),
           decoration: InputDecoration(
            hintText: "Password",
            labelText: "Password",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children : <Widget> [
            MaterialButton(
              child: Text("Forgot Password?",
              style: Theme.of(
                context).textTheme.caption.copyWith(color: Colors.white),
                ),
                onPressed: (){
              //TODO : create forgot password
            }
            ),
            
          ],
        ),
        ],
      );

      // Email and Password Fields
      final fields= Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children : <Widget> [
            //emailField
            //Password field


          ],
        )
      );
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children : <Widget> [
              logo, 
              emailField,
              passwordField, 
              // bottom,

            ],

          ),
        ),

        )

      
    );
  }
}