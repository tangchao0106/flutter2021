import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// ● Widget:存放渲染内容、视图布局信息,widget的属性最好都是immutable(如何更新数据呢？查看后续内容)
// ● Element:存放上下文，通过Element遍历视图树，Element同时持有Widget和RenderObject
// ● RenderObject:根据Widget的布局属性进行layout，paint Widget传人的内容
//
// 更新树 为什么widget都是immutable？
//
// flutter界面开发是一种响应式编程，主张simple is fast，flutter设计的初衷希望数据变更时发送通知到对应的可变更节点（可能是一个StatefullWidget子节点,也可以是rootWidget）,由上到下重新create widget树进行刷新，这种思路比较简单，不用关心数据变更会影响到哪些节点。
//
// widget重新创建，element树和renderObject树是否也重新创建？
//
// widget只是一个配置数据结构，创建是非常轻量的，加上flutter团队对widget的创建/销毁做了优化，不用担心整个widget树重新创建所带来的性能问题，但是renderobject就不一样了，renderobject涉及到layout、paint等复杂操作，是一个真正渲染的view，整个view 树重新创建开销就比较大，所以答案是否定的。


class Element1203 extends StatelessWidget {
  const Element1203({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter 渲染三棵树"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.teal[100],
        child: ListView(
          children: [
            Text(
                "widget 类似蓝图，实例化之后产生element对象,由Element树生成 Render 树，Widget:存放渲染内容、视图布局信息，element负责里面状态=存放上下文 Element同时持有Widget和RenderObject"
                "RenderObject:根据Widget的布局属性进行layout  Element 负责 Widget 的渲染逻辑"),
            Text(
                "widget 是不可变的。state里面的状态可以在运行时候改变，state改变时候重新build。会重建一个新的widget,换掉旧的"
                "因为不可变，而不是去修改。丢掉旧的weidget。但里面的state状态不能被丢掉。。"),
            Text("蓝图发生变化-1先检测 类型=widget和element 是不是对应"),
            Text(
                "蓝图发生变化-2 检验key，element去查找widget对应时有变化，会查找同一级别key,同级。如果有则把widget，替换位置，替换成和element对应的顺序"),
            Box(Colors.amber, key: ValueKey(1)),
            Box(Colors.green, key: ValueKey(2)),
            Box(Colors.red, key: ValueKey(3)),
            WebviewScaffold(
              url: "https://www.yuque.com/xytech/flutter/tge705",
            )
          ],
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color? color;

  Box(this.color, {Key? key}) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return MaterialButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text("count=$count ==${constraints}"));
        },
      ),
    );
  }
}
