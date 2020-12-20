import 'package:appwriteapp/features/auth/presentation/pages/login.dart';
import 'package:appwriteapp/features/auth/presentation/pages/profile.dart';
import 'package:appwriteapp/features/auth/presentation/pages/signup.dart';
import 'package:appwriteapp/features/general/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = "login";
  static const String signup = "signup";
  static const String profile = "profile";
  static const String home = "home";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          switch (settings.name) {
            case profile:
              return ProfilePage();
            case home:
              return HomePage();
            case signup:
              return SignupPage();
            case login:
            default:
              return LoginPage();
          }
        });
  }
}
