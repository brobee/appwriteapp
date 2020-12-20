import 'package:appwriteapp/core/presentation/routes.dart';
import 'package:appwriteapp/features/auth/presentation/notifiers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Appwrite'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              textColor: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 22.0),
              ),
              onPressed: () {
                AuthState state =
                    Provider.of<AuthState>(context, listen: false);
                state.login(_email.text, _password.text);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              child: Text('Create account'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
            ),
          ],
        ),
      ),
    );
  }
}
