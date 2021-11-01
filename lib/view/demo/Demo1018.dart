import 'package:flutter/material.dart';

class Demo1018 extends StatefulWidget {
  final String title;

  const Demo1018({Key? key, required this.title}) : super(key: key);

  @override
  _Demo1018State createState() => _Demo1018State();
}

class _Demo1018State extends State<Demo1018> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(seconds: 2),
              height: 46,
              // color: Colors.blue[(index % 5) * 100],
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 20),
                child: Column(
                  children: [
                    Text("$index"),
                    Text("AAAAAAAA=$index"),
                  ],
                ),
              ),
              decoration: BoxDecoration(//盒子装饰
                  gradient://渐变
                      LinearGradient(colors: [Colors.orange, Colors.white])),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 5,
            );
          },
          itemCount: 20),
    );
  }
}
