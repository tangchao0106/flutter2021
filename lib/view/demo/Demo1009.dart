import 'package:flutter/material.dart';

// this.direction = Axis.horizontal,   //排列方向，默认水平方向排列
// this.alignment = WrapAlignment.start,  //子控件在主轴上的对齐方式
// this.spacing = 0.0,  //主轴上子控件中间的间距
// this.runAlignment = WrapAlignment.start,  //子控件在交叉轴上的对齐方式
// this.runSpacing = 0.0,  //交叉轴上子控件之间的间距
// this.crossAxisAlignment = WrapCrossAlignment.start,   //交叉轴上子控件的对齐方式
// this.textDirection,   //textDirection水平方向上子控件的起始位置
// this.verticalDirection = VerticalDirection.down,  //垂直方向上子控件的其实位置
// List<Widget> children = const <Widget>[],   //要显示的子控件集合
// ————————————————
// 版权声明：本文为CSDN博主「XeonYu」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
// 原文链接：https://blog.csdn.net/yuzhiqiang_1993/article/details/88378021

class Demo1009 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1009"),
        leading: BackButton(),
      ),
      // body: LyWrapContent1(),
      body: FlowContent1(),
    );
  }
}

class FlowContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: MyFlowWidget(),
      children: Boxs(context),
    );
  }
}

class MyFlowWidget extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var screenw = context.size.width;
    double padding = 5;
    double offsetx = padding;
    double offsety = padding;
    for (int i = 0; i < context.childCount; i++) {


    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}

class LyWrapContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: Boxs(context),
    );
  }
}

List<Widget> Boxs(BuildContext context) => List.generate(20, (index) {
      return GestureDetector(
        child: Container(
          width: 70,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orange,
            // gradient: LinearGradient(colors: [
            //   Colors.orange,
            //   Colors.orangeAccent,
            //   Colors.deepOrange
            // ])
            //
          ),
          child: Text(
            "${index}",
            style: TextStyle(color: Colors.amber),
          ),
        ),
        onTap: () => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${index}"), backgroundColor: Colors.orangeAccent))
        },
      );
    });

class LyWrapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
        Chip(
          label: Text("A"),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("AA"),
          ),
        ),
      ],
    );
  }
}
