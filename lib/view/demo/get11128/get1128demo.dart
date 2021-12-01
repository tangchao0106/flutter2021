import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/demo/get/route_pages.dart';

import 'TestOnePage.dart';

class chlid1Page extends StatelessWidget {
  const chlid1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RouteAuthMiddLeware implements GetMiddleware {
  @override
  int? priority;

  RouteAuthMiddLeware({this.priority});

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    //页面的绑定初始化之前被调用
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    //页面构建之前被调用
    // TODO: implement onPageBuildStart
    throw UnimplementedError();
  }

  @override
  Widget onPageBuilt(Widget page) {
    //页面构建完成之后
    // TODO: implement onPageBuilt
    throw UnimplementedError();
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    //目标页被调用时候后触发
    print("onPageCalled===${page?.name}");
    return page;
  }

  @override
  void onPageDispose() {
    //页面被释放，跳出页面
    // TODO: implement onPageDispose
  }

  @override
  RouteSettings? redirect(String? route) {
    //根据条件判断，是否需要执行跳转
    var islogin = false;
    return islogin || route == RouteConfig.login
        ? null
        : RouteSettings(name: RouteConfig.login);
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
    // TODO: implement redirectDelegate
    throw UnimplementedError();
  }
}

class TestOneLogic extends GetxController {
  var ss = '20211128'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var arguments = Get.arguments;
  }
}
