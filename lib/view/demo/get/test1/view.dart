import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class DefaPage extends StatefulWidget {
  @override
  State<DefaPage> createState() => _DefaPageState();
}

class _DefaPageState extends State<DefaPage> {
  List<Widget> widegts = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widegts.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DefaLogic>();
    final state = Get.find<DefaLogic>().state;
    return Scaffold(
    // 需要更新适配器并调用notifyDataSetChanged。在Flutter中，如果setState（）中更新widget列表，您会发现没有变化， 这是因为当setState被调用时，Flutter渲染引擎会遍历所有的widget以查看它们是否已经改变。 当遍历到你的ListView时，它会做一个==运算，以查看两个ListView是否相同，因为没有任何改变，因此没有更新数据
      // body: ListView(children: widegts),
      body: ListView.builder(
      // 如果您注意到onTap函数，在里面，我们不会再重新创建列表，而只是添加新元素到列表。
          itemCount: widegts.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Text("row=$i"),
      onTap: () {
        setState(() {
          widegts = List.from(widegts);
          widegts.add(getRow(widegts.length + 1));
        });
      },
    );
  }
}
