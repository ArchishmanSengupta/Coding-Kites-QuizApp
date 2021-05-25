import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/themes/routes.dart';
import 'package:flutter_number_trivia/views/menu.dart';

import 'package:firebase_auth/firebase_auth.dart';

class registerPage extends StatefulWidget {
  
  // Form to capture Email/Password
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _formKey= GlobalKey<FormState>();

  TextEditingController _usernameController;

  TextEditingController _emailController;

  TextEditingController _passwordController;

  TextEditingController _repasswordController;

  @override
  Widget build(BuildContext context) {
    //dymanic size
    final mq= MediaQuery.of(context);
    final logo= Image.asset(
      "assets/logo.jpg", 
      height: mq.size.height/4,);

      //Username
      final usernameField=TextFormField(
        //enabled: isSubmitting, // submission is done
        controller: _usernameController,
        style: TextStyle(
          color: Colors.black,
          ),
           decoration: InputDecoration(
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintText: "Sheldon Cooper",
            labelText: "Username",
            labelStyle: TextStyle(color: Colors.black,),
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          )
        );
      
      //Email
      final emailField=TextFormField(
        //enabled: isSubmitting, // submission is done
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
          ),
           decoration: InputDecoration(
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintText: "something@email.com",
            labelText: "Email",
            labelStyle: TextStyle(color: Colors.black,),
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          )
        );
        
      //Password
      final passwordField=TextFormField(
        //enabled: isSubmitting, // submission is done
        controller: _passwordController,
        // keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
          ),
           decoration: InputDecoration(
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintText: "Password",
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.black,),
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        );

         //Preassword
      final repasswordField=TextFormField(
        //enabled: isSubmitting, // submission is done
        controller: _repasswordController,
        // keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
          ),
           decoration: InputDecoration(
             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            hintText: "rePassword",
            labelText: "rePassword",
            labelStyle: TextStyle(color: Colors.black,),
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        );


      // Email and Password Fields
      final fields= Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children : <Widget> [
            usernameField,
            emailField,
            passwordField,
            repasswordField,
          ],
        ),
      );

      final registerButton= Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xff5B75A6),
        //for round shape
        child: MaterialButton(
          minWidth: mq.size.width /1.2, // this will take up the width 1.2x
          padding: EdgeInsets.fromLTRB(10.0, 15.0,10.0,15.0),
          child: Text("Register", 
          style:  TextStyle(
            fontSize: 20.0, 
            color: Colors.white,
            fontWeight: FontWeight.bold,

            ),
            ),
            onPressed: () async{


              try{
                User user =(
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                )).user;
                if(user!=null){
                await 
                FirebaseAuth.instance.currentUser.updateProfile(
                  displayName:
                  user.displayName
                  );
                  //Navigate after sign up
                  Navigator.of(context).pushNamed(AppRoutes.menu);
                }

              }catch(e){
                print(e);
                _usernameController.text ="";
                _passwordController.text ="";
                _repasswordController.text ="";
                _emailController.text ="";
              }
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
                Text("Already have an account?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.black,
              ),
              ),
              MaterialButton(
                onPressed:(){
                  Navigator.of(context).pushNamed(AppRoutes.authLogin);
                },
                child: Text("Login",
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
              registerButton,
                bottom,
              ],
            ),
          ),
        ),
        ), 
    );
  }
}
