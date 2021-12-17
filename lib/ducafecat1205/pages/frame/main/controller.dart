import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/ducafecat1205/common/api/news.dart';
import 'package:untitled/ducafecat1205/common/entity/news.dart';
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
    state.categories = await NewsAPI.categories(cacheDisk: true);
  }

  asyncLoadNewsData(
    categorycode, {
    bool refresh = false,
  }) async {
    state.selCategoryCode = categorycode;
    state.newsRecommend = await NewsAPI.newsRecommend(
      parmas: NewsRecommendRequestEntity(categoryCode: categorycode),
      refresh: refresh,
      cacheDisk: true,
    );
    state.newsPageList = await NewsAPI.newPageList(
      params: NewsPageListRequestEntity(categoryCode: categorycode),
      refresh: refresh,
      cacheDisk: true,
    );
  }
}
