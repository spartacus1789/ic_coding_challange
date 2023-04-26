import 'package:flutter/material.dart';
import 'package:ic_coding_challange/views/pages/HomePage.dart';
import 'package:ic_coding_challange/views/pages/LoginPage.dart';
import 'package:ic_coding_challange/views/pages/OtpPage.dart';
import 'package:ic_coding_challange/views/pages/RegisterPage.dart';

class RouteHandler {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case '/otpPage':
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
    return null;
  }
}
