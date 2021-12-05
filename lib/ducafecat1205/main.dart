import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/routes/app_pages.dart';

import '../global.dart';
import 'common/utils/logger.dart';

class MyAppCat extends StatefulWidget {
  const MyAppCat({Key? key}) : super(key: key);

  @override
  State<MyAppCat> createState() => _MyAppCatState();
}

class _MyAppCatState extends State<MyAppCat> {
  Future initServices() async {
    await Global.init();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initServices();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // 你可以选择重定向所有来自Get的日志信息。 如果你想使用你自己喜欢的日志包，并想查看那里的日志。
        enableLog: true,
        logWriterCallback: Logger.write,
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
      ),
    );
  }
}
