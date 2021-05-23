import 'package:flutter/material.dart';

import 'package:flutter_number_trivia/views/login_page.dart';
import 'package:flutter_number_trivia/views/register_page.dart';

class AppRoutes{
  AppRoutes._();

  static const String authLogin='/auth-login';
  static const String authRegister='/auth-register';

  static Map<String, WidgetBuilder> define(){
  return {
    authLogin: (context) => loginPage(),
    authRegister: (context) => registerPage(),
    };
    
  }
}