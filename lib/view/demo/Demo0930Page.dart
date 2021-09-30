import 'package:flutter/material.dart';

class Demo0930Page extends StatelessWidget {
  Demo0930Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [Text("0930")],
      ),
    );
  }
}
