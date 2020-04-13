import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/api/apis.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatefulWidget {
  final title = '欢迎页 title bar';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // 标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: ukHeight(60)),
      child: Text(
        '特 性',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: ukFontSize(24),
        ),
      ),
    );
  }

  // 标题描述
  Widget _buildPageHeadDesc() {
    return Container(
      width: ukWidth(242),
      height: ukHeight(72),
      margin: EdgeInsets.only(top: ukHeight(14)),
      child: Text(
        '最好的新闻频道就在这里，为您提供可靠的消息来源和个性化的新闻',
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
          fontSize: ukFontSize(16),
          height: 1.5,
        ),
      ),
    );
  }

  // 特性说明
  Widget _buildPageFeature(String imageName, String desc, double marginTop) {
    return Container(
      width: ukWidth(295),
      height: ukHeight(80),
      margin: EdgeInsets.only(top: ukHeight(marginTop)),
      child: Row(
        children: [
          Container(
            width: ukWidth(80),
            height: ukHeight(80),
            child: Image.asset(
              'assets/images/$imageName',
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: ukWidth(195),
            child: Text(
              desc,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Avenir',
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: ukFontSize(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 底部按钮
  Widget _buildPageButton() {
    return Container(
      width: ukWidth(295),
      height: ukHeight(44),
      margin: EdgeInsets.only(bottom: ukHeight(20)),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: Text('开 启'),
        shape: RoundedRectangleBorder(
          // 矩形按钮
          borderRadius: Radit.radius6px,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/sign_in');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 高度去掉 顶部、底部 导航
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildPageHeadTitle(),
            _buildPageHeadDesc(),
            _buildPageFeature(
              'feature-1.png',
              'Compelling photography and typography provide a beautiful reading',
              86,
            ),
            _buildPageFeature(
              'feature-2.png',
              'Sector news never shares your personal data with advertisers or publishers',
              40,
            ),
            _buildPageFeature(
              'feature-3.png',
              'You can get Premium to unlock hundreds of publications',
              40,
            ),
            Spacer(),
            _buildPageButton(),
          ],
        ),
      ),
    );
  }
}
