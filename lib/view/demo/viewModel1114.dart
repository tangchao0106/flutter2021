import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class Demo1114 extends ChangeNotifier {
  int? _count = 0;

  int? get count => _count;

  void login() {
    _count = _count! + 1;
    notifyListeners();
    // Navigator.pop(navigatorkey.currentContext!, {"user": "tc"});
    Navigator.popAndPushNamed(navigatorkey.currentContext!, "routeName");
  }
}
