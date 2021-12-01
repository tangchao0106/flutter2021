import 'package:flutter/material.dart';

class Demo3Page extends StatefulWidget {
  final String title;

  // final修饰的常量必须在声明进初始化或者在构造函数中初始化，它的值可以动态计算
  Demo3Page({Key? key, required this.title}) : super(key: key);

  @override
  _Demo3PageState createState() => _Demo3PageState();
}

class _Demo3PageState extends State<Demo3Page> {
  int _count = 0;

  void _init() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              child: Text(
                "返回带参数=",
                style: TextStyle(fontSize: 40),
              ),
              onTap: () => Navigator.pop(context, "我是参数"),
            ),
            Text(
              "text $_count",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _init,
        tooltip: 'tootip',
        child: Icon(Icons.add),
      ),
    );
  }
}
