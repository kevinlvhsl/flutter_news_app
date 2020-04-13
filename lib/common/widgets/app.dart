import 'package:flutter/material.dart';

/// 透明顶部栏 无title，左侧返回按钮，右侧给使用者定义
Widget transparentAppBar({
  @required BuildContext context,
  Widget leading,
  Widget title,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}
