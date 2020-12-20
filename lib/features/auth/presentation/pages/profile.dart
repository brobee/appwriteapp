import 'package:appwriteapp/features/auth/presentation/notifiers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Consumer<AuthState>(builder: (context, state, child) {
        if (!state.isLoggedIn) {
          return Container();
        }
        return ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Center(
              child: Text(
                state.user.name ?? '',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(state.user.email),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: RaisedButton(
                child: Text('Logout'),
                onPressed: () async {
                  await state.logout();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
