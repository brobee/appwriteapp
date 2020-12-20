import 'package:appwriteapp/features/auth/presentation/notifiers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
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
              'Sign Up',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(hintText: "Name"),
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
                AuthState state = Provider.of(context, listen: false);
                state.signUp(_name.text, _email.text, _password.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
