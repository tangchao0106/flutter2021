import 'package:logger/logger.dart';
import 'package:untitled/ducafecat1205/common/entity/categories.dart';
import 'package:untitled/ducafecat1205/common/entity/channels.dart';
import 'package:untitled/ducafecat1205/common/entity/news.dart';
import 'package:untitled/ducafecat1205/common/utils/http.dart';
import 'package:untitled/ducafecat1205/common/values/storage.dart';

class NewsAPI {
  static var logger = Logger();

  static Future<NewsPageListResponseEntity> newPageList({
    NewsPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get("./news",
        queryParameters: params?.toJson(),
        refresh: refresh,
        cacheDisk: cacheDisk,
        cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY);
    // logger.d(response);

    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/categories',
      cacheDisk: cacheDisk,
    );
    logger.d("分类=$response");

    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/channels',
      cacheDisk: cacheDisk,
    );
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  static Future<NewsItem> newsRecommend({
    NewsRecommendRequestEntity? parmas,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get("/news/recommend",
        queryParameters: parmas?.toJson(),
        refresh: refresh,
        cacheDisk: cacheDisk);
    logger.d("推荐=$response");
    return NewsItem.fromJson(response);
  }
}
