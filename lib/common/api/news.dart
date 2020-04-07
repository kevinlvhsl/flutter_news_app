import 'package:flutter_news_app/common/entitys/entitys.dart';
import 'package:flutter_news_app/common/utils/utils.dart';

class NewsApi {
  /// 首页
  static Future<List<NewsIndexResponseEntity>> index() async {
    var response = await HttpUtil().get('/news/index');

    return response.map<NewsIndexResponseEntity>((item) {
      return NewsIndexResponseEntity.fromJson(item);
    }).toList();
  }
}