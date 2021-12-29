// https://wanandroid.com/wxarticle/chapters/json
import 'package:logger/logger.dart';
import 'package:untitled/ducafecat1205/common/entity/wanandroid/gongzhonghao.dart';
import 'package:untitled/ducafecat1205/common/utils/http.dart';
import 'package:untitled/ducafecat1205/common/utils/http2.dart';

class GongZhongHaoApi {
  static var logger = Logger();

  static Future<Gongzhonghao> Futurechapters({
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil2().get("/wxarticle/chapters/json",
        // queryParameters: params?.toJson(),
        refresh: refresh,
        cacheDisk: cacheDisk);
    logger.d("公众号=$response");
    logger.d("公众号=${response.data}");

    return response.data
        .map<Gongzhonghao>((item) => Gongzhonghao.fromJson(item))
        .toList;
  }
}
