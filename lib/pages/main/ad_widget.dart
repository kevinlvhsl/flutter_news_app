import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';

Widget adWidget() {
  return Container(
    alignment: Alignment.center,
    height: ukHeight(100),
    padding: EdgeInsets.all(ukWidth(20)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: ukWidth(20)),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(Borders.primaryBorder),
        borderRadius: Radit.radius6px,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tired of Ads? Get Premium - \$9.99",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: ukFontSize(18),
            ),
          ),
        ],
      ),
    ),
  );
}
