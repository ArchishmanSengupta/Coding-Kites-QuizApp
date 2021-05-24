import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/themes/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<loginPage> {
  TextEditingController _emailController;
// Form to capture Email/Password
  final _formKey= GlobalKey<FormState>();

  TextEditingController _passwordController;

//  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    //dymanic size
    final mq= MediaQuery.of(context);
    final logo= Image.asset(
      "assets/logo.jpg", 
      height: mq.size.height/4,);
      
      //Email
      final emailField=TextFormField(
        //enabled: isSubmitting, // submission is done
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white,
          ),
           decoration: InputDecoration(
            hintText: "something@email.com",
            labelText: "Email",
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          )
        );
        
      //Password
      final passwordField=Column(
        children: <Widget> [
          TextFormField(
        //enabled: isSubmitting, // submission is done
        controller: _passwordController,
        // keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white,
          ),
           decoration: InputDecoration(
            hintText: "Password",
            labelText: "Password",
            hintStyle: TextStyle(
              color: Colors.black38,
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
                context)
                .textTheme
                .caption
                .copyWith(color: Colors.black38),
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
            emailField,
            passwordField,
          ],
        ),
      );

      final loginButton= Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xff5B75A6),
        //for round shape
        child: MaterialButton(
          minWidth: mq.size.width /1.2, // this will take up the width 1.2x
          padding: EdgeInsets.fromLTRB(10.0, 15.0,10.0,15.0),
          child: Text("Login ➡️", 
          style:  TextStyle(
            fontSize: 20.0, 
            color: Colors.white,
            fontWeight: FontWeight.bold,

            ),
            ),
            onPressed: (){
              // TODO;
            },
        ),
      );

      final bottom=Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children : <Widget> [
          Padding(
            padding: EdgeInsets.all(8.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children : <Widget> [
                Text("Not a member?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.black,
              ),
              ),
              MaterialButton(
                onPressed:(){
                  Navigator.of(context).pushNamed(AppRoutes.authRegister);
                },
                child: Text("Sign Up",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.black,
                  decoration:TextDecoration.underline,
                  ),
                  ),
              ),
              ],
              
            )
      
        ],
      );

     




    return Scaffold(
      backgroundColor: Color(0xffE6E2D6),
      body:
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children : <Widget> [
                logo,
                Padding(
                 padding: EdgeInsets.all(50) ),
                fields,
                 Padding(
                 padding: EdgeInsets.all(60) ),
                // emailField,
                // passwordField, 
                loginButton,
                bottom,
              ],
            ),
          ),
        ),
        ), 
    );
  }
}