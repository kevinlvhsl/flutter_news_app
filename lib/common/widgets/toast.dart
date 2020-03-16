import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> toastInfo({
  @required String msg,
  Color bgColor = Colors.black,
  Color textColor = Colors.white,
}) async {
  var showToast = Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT, // 宽度长短
    gravity: ToastGravity.CENTER, // 出现位置
    timeInSecForIos: 1,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: ukFontSize(16),
  );
  return await showToast;
}
