
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_news_app/common/values/values.dart';

class CacheObject {
  CacheObject(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;
}

class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {
    if (CACHE_ENABLE) return options;

    // refresh标记下是否“下拉刷新”
    bool refresh = options.extra['refresh'] == true;

    // 如果是下拉刷新，先删除相关缓存
    // if (refresh) {
    //   if (options.extra['list'] == true) {

    //   }
    // }
  }
}