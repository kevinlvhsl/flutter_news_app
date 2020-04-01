
import 'package:flutter_news_app/common/entity/user.dart';
import 'package:flutter_news_app/common/utils/utils.dart';

class UserApi {
  static Future<UserLoginResponseEntity> login({ UserLoginRequestEntity params }) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserLoginResponseEntity.fromJson(response);
  }
}