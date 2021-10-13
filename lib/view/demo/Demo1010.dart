import 'package:flutter/material.dart';

class Demo1010 extends StatelessWidget {
  const Demo1010({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 100,
        color: Colors.red[200],
        // padding: EdgeInsets.all(10),
        child: Demo2(),
      ),
    ));
  }
}

class Demo2 extends StatelessWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max, //当主轴是最大时，才会有剩余空间分配给其他布局展示间隙
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: () {}, child: Text("")),
        ElevatedButton(onPressed: () {}, child: Text("")),
        Expanded(

          child: ListView(//直接使用listview不显示出来。和测量大小有关系，先把有大小的计算出，使用expanded把剩余大小给他

            children: [for (int i = 0; i < 10; i++) Text("$i")],

          ),
        ),
        FlutterLogo(
          size: 80,
        ),
        FlutterLogo(
          size: 80,
        ),
      ],
    );
  }
}

class Demo1 extends StatelessWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        print("constraints==$constraints");
        return FlutterLogo(size: 80);
      }),
    );
  }
}
