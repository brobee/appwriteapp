import 'package:appwriteapp/core/presentation/routes.dart';
import 'package:appwriteapp/features/auth/presentation/pages/signup.dart';
import 'package:appwriteapp/features/general/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/presentation/notifiers/providers.dart';
import 'features/auth/presentation/notifiers/auth_state.dart';
import 'features/auth/presentation/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          buttonTheme: ButtonThemeData(
            height: 50.0,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        home: Consumer<AuthState>(
          builder: (context, state, child) {
            return state.isLoggedIn ? HomePage() : LoginPage();
          },
        ),
        //onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
