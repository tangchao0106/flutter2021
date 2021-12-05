import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view/demo/CustomMulti.dart';
import 'package:untitled/view/demo/DrawerList.dart';
import 'package:untitled/view/demo/Messages.dart';
import 'package:untitled/view/demo/Provider1106.dart';
import 'package:untitled/view/demo/SearchPage.dart';
import 'package:untitled/view/demo/UnknowPage.dart';
import 'package:untitled/view/demo/get/route_pages.dart';
import 'package:untitled/view/demo/get/splash_page.dart';
import 'package:untitled/view/demo/loginPage.dart';
import 'package:untitled/view/demo/loginviewmodel.dart';
import 'package:untitled/view/demo/registviewmodel.dart';
import 'package:untitled/view/demo/routes.dart';
import 'package:untitled/view/demo/viewModel1114.dart';
import 'package:untitled/view/home/Home.dart';
import 'package:untitled/view/home/Mine.dart';
import '';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegistViewModel()),
      ],
      child: Myapp(),
    ));
// void main()=>runApp(MyAPP());
//
// class MyAPP extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: RouteConfig.SPLASH,
//       getPages: RouteConfig.getPages,
//       // translations: Messages(),
//       // locale: Locale('zh', 'CN'),
//       // fallbackLocale: Locale('en', 'US'),
//     );
//   }
// }

final GlobalKey<NavigatorState> navigatorkey = new GlobalKey();
var logger = Logger();

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logger.d("navigatorkey ${navigatorkey.currentContext}");

    context.read<LoginViewModel>().getIslogin;
    context.watch<LoginViewModel>().getIslogin;

    return MaterialApp(
      title: "豆瓣APP",
      debugShowCheckedModeBanner: false,
      routes: routes,
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknowPage()),
      onGenerateRoute: (RouteSettings setting) {
        if (setting.name == "/") {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
        if (setting.name == "/provider") {
          // return MaterialPageRoute(builder: (context) => Provider());
        }
        // setting.name.
        var uri = Uri.parse(setting.name!);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == "provider") {
          var id = uri.pathSegments[1];
          // return MaterialPageRoute(
          //     builder: (context) => Provider(
          //           id: id,
          //         ));
        }
      },
      theme: ThemeData(
          primaryColor: Colors.red, highlightColor: Colors.transparent),
      home: MyPageState(),
      navigatorKey: navigatorkey,
    );
  }
}

class MyPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPageState> {
  var _currentindx = 0;
  final pages = [
    Mine(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("豆瓣"),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindx,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "分类",
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页",
              backgroundColor: Colors.amber),
        ],
        type: BottomNavigationBarType.shifting,
        onTap: (int currentIndex) {
          _changePage(currentIndex);
        },
      ),
      body: pages[_currentindx],
      drawer: DrawerList(),
      floatingActionButton: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FloatingActionButton(
            onPressed: () => {
              //这里的context。需要使用builder构建一个，
              //无，context-就是element，寻找上级context无。会报错
              Scaffold.of(context).openDrawer(),
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }

  void _changePage(int index) {
    if (index != _currentindx) {
      setState(() {
        _currentindx = index;
      });
    }
  }
}
