import 'package:get/get.dart';
import 'package:untitled/view/demo/get11128/TestOnePage.dart';
import 'package:untitled/view/demo/get11128/get1128demo.dart';

import 'CountGetPage.dart';
import 'getx/getview.dart';
import 'getx/view.dart';

abstract class RouteConfig {
  static const SPLASH = "/";
  static const MAIN = "/main";
  static const String testOne = '';
  static const String testTwo = '';
  static const String chlid1 = '';
  static const String chlid2 = '';
  static const String login = '';
  static final List<GetPage> getPages = [
    //需要登录，中间件
    GetPage(name: RouteConfig.login, page: () => TestOnePage(),
        //一个页面使用了中间件，则他所有的子路由也会自动用到父路由中声明的中间件

        middlewares: [
          // 在一个流程当中，需要执行的若干小的步骤，先后顺序，proority越小越先执行
          RouteAuthMiddLeware(priority: 1)
        ], children: [
      GetPage(name: RouteConfig.chlid1, page: () => chlid1Page()),
      GetPage(name: RouteConfig.chlid2, page: () => chlid1Page()),
    ]),
    GetPage(
        name: testOne,
        page: () => TestOnePage(),
        binding: BindingsBuilder(() {
          return Get.lazyPut(() => TestOneLogic());
        })),

    GetPage(name: RouteConfig.SPLASH, page: () => Page117()),
    GetPage(name: "/Page117", page: () => Page117()),
    GetPage(name: "/GetxPage", page: () => GetxPage()),
    GetPage(name: "/GetViewDemo", page: () => GetViewDemo()),
    GetPage(name: "/GetWidgetDemo", page: () => GetWidgetDemo()),
  ];
}
