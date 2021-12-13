import 'package:flutter/material.dart';

class FlutterKey extends StatelessWidget {
  final _globalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("key=locackel只对比同级别的"),
        TextField(key: ValueKey(1)),
        TextField(key: ValueKey(2)),
        Text("ValueKey 对比的是值 ==eqals"),
        TextField(key: ObjectKey(1)),
        TextField(key: ObjectKey(1)),
        Text("ValueKey 对比的是引用是否相等，内存指针是否相等"),
        TextField(key: ObjectKey(Student(name: "a"))),
        TextField(key: ObjectKey(Student(name: "b"))),
        Text("UniqueKey=只和自己相等"),
        TextField(key: UniqueKey())
      ],
    ));
  }
}

class Student {
  String? name;

  Student({this.name});
}
