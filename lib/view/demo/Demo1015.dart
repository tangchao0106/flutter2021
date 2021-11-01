import 'package:flutter/material.dart';

class Demo1015 extends StatefulWidget {
  final String title;

  const Demo1015({Key? key, required this.title}) : super(key: key);

  @override
  State<Demo1015> createState() => _Demo1015State();
}

class _Demo1015State extends State<Demo1015> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.sync(() => print("Future.sync"));
    Future.value("Future.value");

    Future.delayed(Duration(seconds: 5), () => {print("Future.delayed")});
  }

  int count = 0;
  final boxs = <Widget>[
    Container(
      width: 100,
      height: 100,
      color: Colors.yellow[100],
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.yellow[200],
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.yellow[300],
    ),
  ];

  void _init() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            color: Colors.amberAccent,
            alignment: Alignment.center,
            child: ListView(

              children: [
                Text("$count"),
                Visibility(
                  child: Text("$count"),
                  visible: true,
                ),
                Text("$count"),
              ],
            ),
          ),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: _init, child: Icon(Icons.refresh)),
      ),
    );
  }
}
