import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter/material.dart';

/// 扁平圆角按钮
Widget flatButton({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color bgColor = AppColors.primaryElement,
  Color fontColor = AppColors.primaryElementText,
  String title = 'button',
  String fontName = 'Monserrat',
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: ukWidth(width),
    height: ukHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: bgColor,
      child: Text(
        title,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: ukFontSize(fontSize),
          height: 1,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: Radit.radius6px,
      ),
    ),
  );
}

Widget btnFlatButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: ukWidth(width),
    height: ukHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      child: Image.asset(
        'assets/images/icons-$iconFileName',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: Radit.radius6px,
        side: Borders.primaryBorder,
      ),
    ),
  );
}
