import 'package:get/get.dart';
import 'package:untitled/ducafecat1205/common/entity/news.dart';

class ViewState {
  ViewState() {
    ///Initialize variables
  }

  //新闻翻页
  RxList<NewsItem> newsList = <NewsItem>[].obs;
}
