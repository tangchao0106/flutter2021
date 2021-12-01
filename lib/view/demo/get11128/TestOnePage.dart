import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get1128demo.dart';

class TestOnePage extends StatelessWidget {
  TestOnePage({Key? key}) : super(key: key);
  final logic = Get.find<TestOneLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("没有登录就会被中间件拦截=${logic.ss}"),
        ),
      ),
    );
  }
}
