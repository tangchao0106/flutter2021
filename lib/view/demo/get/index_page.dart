import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/util/icon_font.dart';
import 'package:untitled/view/demo/get/wanandroid/home.dart';

import '../Demo1101about.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);
  final _tabs = [
    BottomNavigationBarItem(
        label: "首页", icon: Icon(Icons.home), backgroundColor: Colors.amber),
    BottomNavigationBarItem(
        label: "公众号",
        icon: Icon(IconFont.we_chat),
        backgroundColor: Colors.red),
    BottomNavigationBarItem(
        label: "体系",
        icon: Icon(Icons.account_tree),
        backgroundColor: Colors.yellow),
    BottomNavigationBarItem(
        label: "项目", icon: Icon(Icons.apps), backgroundColor: Colors.black),
    BottomNavigationBarItem(
        label: "我的", icon: Icon(Icons.person), backgroundColor: Colors.pink),
  ];
  final List<Widget> _pages = [
    HomePage(),
    AboutPage(),
    // HomePage(),
    // HomePage(),
  ];

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late PageController _pageController;
  int _pageIndex = 0;

  ///退出App
  static Future popApp() async {
    await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }

  var logger = Logger();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    Future.delayed(Duration(seconds: 1), () async {
      bool agree = await showPrivacyDialg();
      logger.d("agree=$agree");
      if (!agree) {
        popApp();
      } else {
        Get.back();
      }
    });
  }

  Future showPrivacyDialg() async {
    bool agree = await Get.defaultDialog(
        title: "提示",
        titleStyle: TextStyle(color: Colors.blue, fontSize: 18),
        content: Container(
          height: 200,
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                  text: "请您在使用本产品之前仔细阅读",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                        text: "《用户协议》", style: TextStyle(color: Colors.blue)),
                    TextSpan(text: "与"),
                    TextSpan(
                        text: "《隐私协议》", style: TextStyle(color: Colors.blue)),
                  ]),
            ),
          ),
        ),
        confirm: TextButton(
            onPressed: () => Get.back(result: true), child: Text("同意")),
        cancel: TextButton(
            onPressed: () => Get.back(result: false), child: Text("不同意")),
        barrierDismissible: false,
        onWillPop: () async {
          return false;
        });
    return agree;
  }

  Widget creatbottomNavigationBar() {
    return BottomNavigationBar(
      items: widget._tabs,
      currentIndex: _pageIndex,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _pageIndex = index;
          _pageController.jumpToPage(_pageIndex);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: creatbottomNavigationBar(),
      body: WillPopScope(
          //WillPopScope用于处理是否离开当前页面
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: widget._pages,
            controller: _pageController,
            onPageChanged: (int index) {},
          ),
          onWillPop: () {
            return Future.value(true);
          }),
    );
  }
}
