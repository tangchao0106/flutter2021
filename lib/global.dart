import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:untitled/ducafecat1205/common/utils/storage.dart';

class Global {
  /// 用户配置
  // static UserLoginResponseEntity profile = UserLoginResponseEntity(
  //   accessToken: null,
  // );

  /// 发布渠道
  static String channel = "xiaomi";

  /// 是否 ios
  static bool isIOS = Platform.isIOS;

  /// android 设备信息
  static late AndroidDeviceInfo androidDeviceInfo;

  /// ios 设备信息
  static late IosDeviceInfo iosDeviceInfo;

  /// 包信息
  static late PackageInfo packageInfo;

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }
    Global.packageInfo = await PackageInfo.fromPlatform();
    print("packageInfo==$packageInfo");

    await StorageUtil().init();

    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // setSystemUi();
  }
}

void setSystemUi() {
  if (GetPlatform.isAndroid) {
    SystemUiOverlayStyle systemuioverlaystyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemuioverlaystyle);
  }
}
