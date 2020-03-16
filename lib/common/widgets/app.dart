import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter/material.dart';

/// 透明顶部栏 无title，左侧返回按钮，右侧给使用者定义
Widget transparentAppBar({
  @required BuildContext context,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(''),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      color: AppColors.primaryText,
      onPressed: () => Navigator.pop(context),
    ),
    actions: actions,
  );
}
