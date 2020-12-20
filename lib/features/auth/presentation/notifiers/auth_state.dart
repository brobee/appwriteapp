import 'package:appwriteapp/core/res/app_constants.dart';
import 'package:appwriteapp/features/auth/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;
  bool _isLoggedIn;
  User _user;
  String _error;

  bool get isLoggedIn => _isLoggedIn;
  User get user => _user;
  String get error => _error;

  AuthState() {
    _init();
  }

  _init() {
    _isLoggedIn = false;
    _user = null;
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId)
        .setSelfSigned();
    account = Account(client);
    _checkLoggedIn();
  }

  _checkLoggedIn() async {
    try {
//      var res = await account.get();
      _user = await _getAccount();
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<User> _getAccount() async {
    try {
      Response<dynamic> res = await account.get();
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      throw (e);
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account.createSession(email: email, password: password);
      //_isLoggedIn = true;
      print(result);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  signUp(String name, String email, String password) async {
    try {
      var result =
          await account.create(name: name, email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    try {
      Response res = await account.deleteSession(sessionId: 'current');
      _isLoggedIn = false;
      _user = null;
      notifyListeners();
    } catch (e) {
      _error = e.message;
      notifyListeners();
    }
  }
}
