import 'dart:math';

import 'package:flutter/material.dart';

/**
 *   ValueKey 在同一级去查询
    //ObjectKey比较的是内存。不是数值
    // UniqueKey 每次赋值新值，好处丢掉之前旧的
 */
class Demo1013 extends StatelessWidget {
  Demo1013({Key? key, required this.title}) : super(key: key);
  int? iii = null;
  final String title;

  // var ada = iii ?? 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          // color: Colors.amberAccent,

          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: [
                    Text("password"),
                    TextField(
                      //ObjectKey比较的是内存。不是数值
                      // key: ObjectKey("value"),
                      // key: ValueKey("password"),
                      key: UniqueKey(),
                    ),
                    Text("name"),
                    TextField(
                      key: ValueKey("name"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _Box(),
                    SizedBox(
                      height: 10,
                    ),
                    _Box(),
                  ],
                )
              : Row(
                  children: [
                    Text("password"),
                    TextField(
                      //ObjectKey比较的是内存。不是数值
                      // key: ObjectKey("value"),
                      // key: ValueKey("password"),
                      key: UniqueKey(),
                    ),
                    Text("name"),
                    TextField(
                      key: ValueKey("name"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _Box(),
                    SizedBox(
                      height: 10,
                    ),
                    _Box(),
                  ],
                ),
        ),
      ),
    );
  }
}

class _Box extends StatefulWidget {
  const _Box({Key? key}) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<_Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      width: 100,
      height: 100,
    );
  }
}
