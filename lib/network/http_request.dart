import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: baseURL,
    connectTimeout: timeout,
  );
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(
    String url, {
    String method = "get",
    Map<String, dynamic>? params,
    dynamic data,
  }) async {
    // 1.单独相关的设置
    Options options = Options();
    options.method = method;
    // dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志

    // 2.发送网络请求
    try {
      Response response =
          await dio.request<T>(url, options: options, queryParameters: params,data:data);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }
}
