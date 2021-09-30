import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: baseURL,
    connectTimeout: timeout,
  );
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {String method = "get"}) async {
    // 1.单独相关的设置
    Options options = Options();
    options.method = method;

    // 2.发送网络请求
    try {
      Response response = await dio.request<T>(url, options: options);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }
}
