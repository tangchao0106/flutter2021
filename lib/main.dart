import 'package:flutter/material.dart';

import 'cpn/ProductItem.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "标题20210919", //后台切换时候标题
        home: Scaffold(
            //脚手架
            appBar: AppBar(
              title: Text("我是导航栏"),
            ),
            body: HomeContent2()));
  }
}

class HomeContent2 extends StatelessWidget {
  const HomeContent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(border: Border.all()),
        child: ListView(children: [
          ProductItem("标题", "dec",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          ProductItem("标题", "dec",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          ProductItem("标题", "dec",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        ]),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: true, onChanged: (value) => {print("value=$value")}),
          Text(
            "同意协议",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20),
          ),
          Image.network(
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg")
        ],
      ),
    );
  }
}
