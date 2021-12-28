import 'package:flutter/material.dart';
import 'package:untitled/ducafecat1205/common/api/gzh.dart';

class WandroidHomePage extends StatefulWidget {
  const WandroidHomePage({Key? key}) : super(key: key);

  @override
  State<WandroidHomePage> createState() => _WandroidHomePageState();
}

class _WandroidHomePageState extends State<WandroidHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GongZhongHao.Futurechapters();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("玩安卓"),
    );
  }
}
