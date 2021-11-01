import 'package:flutter/material.dart';

class Demo1020 extends StatefulWidget {
  const Demo1020({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Demo1020> createState() => _Demo1020State();
}

class _Demo1020State extends State<Demo1020>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 3.0,
        upperBound: 5.0);
    _controller.addListener(() {
      print("${_controller.value}");
    });
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    var ss = widget.title;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
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
            RotationTransition(
              turns: _controller,
              child: Container(
                width: 200,
                height: 100,
                color: Colors.lightBlue,
                child: Text("AAAAAAAAAAAAAAAAAAAAAAAA"),
              ),
            ),
            Demosta()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _isloading = !_isloading;
          if (_isloading) {
            _controller.repeat();
          } else {
            _controller.reset();
          }
        },
        child: Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

class Demosta extends StatefulWidget {
  const Demosta({Key? key}) : super(key: key);

  @override
  _DemostaState createState() => _DemostaState();
}

class _DemostaState extends State<Demosta> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: ListView(
        children: [
          SlideTransition(
            position: Tween(begin: Offset(0, 0), end: Offset(1, 1))
                .animate(_controller),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.amber,
            ),
          ),
          ScaleTransition(
            scale: _controller.drive(Tween(begin: 0.5, end: 1.0)),
            child: Container(
              width: 100,
              height: 20,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
