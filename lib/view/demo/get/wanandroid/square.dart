import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SquareController.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);
  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  var _squareController = Get.put<SquareController>(SquareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX(
      builder: (squarecontroller) {
        return Text("");
      },
      init: _squareController,
      initState: (_) {
        // _squareController.initData(true);
      },
    ));
  }
}
