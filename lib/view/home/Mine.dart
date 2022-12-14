import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled/ducafecat1205/common/values/colors.dart';
import 'package:untitled/ducafecat1205/main.dart';
import 'package:untitled/view/demo/loginPage.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Widget"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Body());
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      reverse: true,
      physics: BouncingScrollPhysics(),
      child: Container(
          decoration: BoxDecoration(),
          height: 200,
          child: ListView(
            children: [
              ListTile(
                leading: Image.asset(
                  "assets/images/spide_logo.png",
                  height: 40,
                ),
                title: Text("仿新闻客户端1204"),
                trailing: Icon(Icons.arrow_right),
                selected: true,
                selectedTileColor: Colors.yellow[100],
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyAppCat()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("玩安卓"),
                leading: Image.asset("assets/images/weixin.png", height: 40),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("人脸识别"),
                leading: Image.asset("assets/images/weixin.png", height: 40),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Get.snackbar("标题", "人脸识别",
                      backgroundColor: AppColors.tabBarElement);
                },
              ),
            ],
          )),
    );
  }
}
