import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter/material.dart';

Widget inputTextEditor({
  @required TextEditingController controller,
  TextInputType keyboardType =
      TextInputType.text, // input类型（number、phone、datetime、email...）
  String placeholder = '',
  double marginTop = 15,
  bool isPassword = false,
}) {
  return Container(
    height: ukHeight(44),
    margin: EdgeInsets.only(top: ukHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radit.radius6px,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: ukFontSize(18),
        fontWeight: FontWeight.w400,
        fontFamily: 'Avenir',
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 密码框时 隐藏输入内容
    ),
  );
}
