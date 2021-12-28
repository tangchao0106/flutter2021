// https://wanandroid.com/wxarticle/chapters/json
import 'package:logger/logger.dart';
import 'package:untitled/ducafecat1205/common/utils/http.dart';
import 'package:untitled/ducafecat1205/common/utils/http2.dart';

class GongZhongHao {
  static var logger = Logger();

  static Futurechapters({
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    logger.d("Futurechapters");
    var response = await HttpUtil2().get("/wxarticle/chapters/json",
        // queryParameters: params?.toJson(),
        refresh: refresh,
        cacheDisk: cacheDisk);
    logger.d(response);

    return response;
  }
}
