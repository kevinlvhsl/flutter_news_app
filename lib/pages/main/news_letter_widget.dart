import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';

Widget newsLetterWidget() {
  return Container(
    margin: EdgeInsets.all(ukWidth(20)),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '邮件订阅',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: ukFontSize(18),
                fontWeight: FontWeight.w600,
                color: AppColors.thirdElement,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.thirdElementText,
                size: ukFontSize(20),
              ),
              onPressed: () {},
            ),
          ],
        ),
        // email
        inputEmailEdit(
          marginTop: 19,
          keyboardType: TextInputType.emailAddress,
          hintText: "邮箱",
          isPassword: false,
          controller: null,
        ),

        // 订阅按钮
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: flatButton(
            onPressed: () {},
            width: ukWidth(335),
            height: ukHeight(44),
            fontWeight: FontWeight.w600,
            title: "订阅",
          ),
        ),

        // disc
        Container(
          margin: EdgeInsets.only(top: ukHeight(29)),
          width: ukWidth(261),
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'By clicking on Subscribe button you agree to accept',
              style: new TextStyle(
                color: AppColors.thirdElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: ukFontSize(14),
              ),
            ),
            TextSpan(
              text: ' Privacy Policy',
              style: new TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: ukFontSize(14),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  toastInfo(msg: 'Privacy Policy');
                },
            ),
          ])),
        ),
      ],
    ),
  );
}
