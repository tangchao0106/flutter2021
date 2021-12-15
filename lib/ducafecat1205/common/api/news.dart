import 'package:logger/logger.dart';
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
    logger.d(response);

    return NewsPageListResponseEntity.fromJson(response);
  }
}
