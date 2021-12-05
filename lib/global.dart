import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:untitled/ducafecat1205/common/utils/http.dart';
import 'package:untitled/ducafecat1205/common/utils/storage.dart';

import 'ducafecat1205/common/entity/user.dart';
import 'ducafecat1205/common/values/storage.dart';

class Global {
  /// 用户配置
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    accessToken: null,
  );

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
    // Flutter App的启动过程总结：
    // ensureInitialized 通过7个 mixin 类 按顺序完成相关初始化工作
    // scheduleAttachRootWidget 绑定app 应用启动的 Widget 到 render tree 的根节点RenderView上并生成widget tree 的根节点 RenderObjectToWidgetAdapter，RenderView又关联了widget tree 的根节点和 element tree 的根节点
    // scheduleWarmUpFrame 完成热身帧绘制
    //
    // 作者：Joker_Wan
    // 链接：https://www.jianshu.com/p/6994f65be6f9
    // 来源：简书
    // 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

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
HttpUtil();
    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }
    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }
    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // setSystemUi();
  }

  // 持久化 用户信息
  static Future<bool> saveProfile(UserLoginResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtil()
        .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
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
