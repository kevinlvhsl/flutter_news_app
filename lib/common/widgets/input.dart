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
  bool autofocus = false,
}) {
  return Container(
    height: ukHeight(44),
    margin: EdgeInsets.only(top: ukHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radit.radius6px,
    ),
    child: TextField(
      autofocus: autofocus,
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

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: ukHeight(44),
    margin: EdgeInsets.only(top: ukHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radit.radius6px,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: ukFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
