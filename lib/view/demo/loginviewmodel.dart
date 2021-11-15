import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _islogin = false;

  bool get getIslogin {
    return _islogin;
  }

}