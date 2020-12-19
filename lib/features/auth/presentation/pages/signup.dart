import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              decoration: InputDecoration(hintText: "Name"),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
