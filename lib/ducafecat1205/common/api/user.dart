import 'package:untitled/ducafecat1205/common/entity/user.dart';
import 'package:untitled/ducafecat1205/common/utils/http.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login(
      {UserLoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      "/user/login",
      queryParameters: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
