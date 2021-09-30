import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/view/home/Home.dart';
import 'package:untitled/view/home/Mine.dart';
import '';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "豆瓣APP",
        theme: ThemeData(
            primaryColor: Colors.red, highlightColor: Colors.transparent),
        home: MyPageState());
  }
}

class MyPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPageState> {
  var _currentindx = 0;
  final pages = [Home(), Mine()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("豆瓣"),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindx,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类")
          ],
          onTap: (int currentIndex) {
            _changePage(currentIndex);
          },
        ),
        body: pages[_currentindx]);
  }

  void _changePage(int index) {
    if (index != _currentindx) {
      setState(() {
        _currentindx = index;
      });
    }
  }
}
