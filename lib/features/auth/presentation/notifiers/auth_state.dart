import 'package:appwriteapp/core/res/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;

  AuthState() {
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId)
        .selfSigned;
    account = Account(client);
  }

  login(String email, String password) async {
    try {
      var result = await account.create(email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
