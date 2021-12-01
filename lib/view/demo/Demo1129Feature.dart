import 'dart:async';

import 'package:flutter/material.dart';

//enent loop 事件循环 main-microtask-event queue
class Feature11129 extends StatelessWidget {
  const Feature11129({Key? key}) : super(key: key);

  void getFeature() {
    //同步执行
    Future.value("1");
    Future.sync(() => print("11"));
    Future.delayed(Duration(seconds: 1)).then((value) => print("2"));
    Future.delayed(Duration(seconds: 1), () => {print("33")});

    scheduleMicrotask(() => {print("scheduleMicrotask立即执行")});
    Future.microtask(() => print("Future.microtask"));
  }

  Future<String> t1() {
    return Future.value("2");
  }

  void get() {
    t1().then((value) {}).catchError((onError) => {}).whenComplete(() => {});
  }

  void get2() async {
    var a = await t1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Text("Future=未来期货。以后打开，"),
            Text("scheduleMicrotask，  Future.microtask 事件循环优先执行"),
            Text("Future.value， Future.sync Future.delayed "),
            FutureBuilder(
                future:
                    Future.delayed(Duration(seconds: 2), () => throw ("throw")),
                initialData: 1100,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(" FutureBuilder==${snapshot.data}");
                  }
                  return Text("FutureBuilder===");
                })
          ],
        ),
      ),
    );
  }
}
