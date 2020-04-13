import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';

Widget imageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: ukHeight(height),
      width: ukWidth(width),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radit.radius6px,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    // 预显示-占位
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
