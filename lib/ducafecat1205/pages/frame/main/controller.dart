import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/ducafecat1205/common/api/news.dart';
import 'package:untitled/ducafecat1205/pages/frame/main/state.dart';

class MainController extends GetxController {
  final state = MainState();
   var logger = Logger();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    asyncLoadAllData();
  }

  asyncLoadAllData() async {
    logger.d("message");
    state.categories = await NewsAPI.newPageList(cacheDisk: true);
  }
}
