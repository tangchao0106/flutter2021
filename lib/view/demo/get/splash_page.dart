import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/util/permission_util.dart';
import 'package:untitled/view/demo/Messages.dart';
import 'package:untitled/view/demo/get/CountGetPage.dart';
import 'package:untitled/view/demo/get/route_pages.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future _requestPermissions() async {
    // PermissionUtil.requestPermission(Permission.storage, denied: () {},
    //     permanentlyDenied: () {},
    //     granted: () {});
  }
  var logger=Logger();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.d("message1");
    Future.delayed(Duration(seconds: 2), () => Get.to(CountGetPage()));
    logger.d("message2");

  }

  @override
  Widget build(BuildContext context) {
    logger.d("message3");

    return Scaffold(
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
