import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/entity/news.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';

Widget recommendNews(
  double height,
  NewsRecommendResponseEntity newsRecommend,
) {
  return Container(
    height: ukHeight(490),
    // color: Colors.amber,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        imageCached(
          newsRecommend.thumbnail,
          height: 290,
          width: 335,
          margin: EdgeInsets.fromLTRB(ukWidth(20), ukWidth(20), ukWidth(20), 0),
        ),
        // 作者
        Container(
          margin: EdgeInsets.fromLTRB(ukWidth(20), ukWidth(14), 0, 0),
          child: Text(
            newsRecommend.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
              fontSize: ukFontSize(14),
            ),
          ),
        ),
        // 标题
        Container(
          margin: EdgeInsets.fromLTRB(ukWidth(20), ukWidth(10), ukWidth(20), 0),
          child: Text(
            newsRecommend.title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
              fontSize: ukFontSize(24),
              height: 1,
            ),
          ),
        ),
        // Spacer
        Spacer(),
        // 一行 3 列
        Container(
          height: ukHeight(19.0 + 20), // 字高度+底部Margin
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 分类
              Container(
                margin: EdgeInsets.only(left: ukWidth(20)),
                child: Text(
                  newsRecommend.category,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: ukFontSize(14),
                    height: 1,
                  ),
                ),
              ),
              // 添加时间
              Container(
                margin: EdgeInsets.only(left: ukWidth(15)),
                child: Text(
                  '•   ${ukTimeLineFormat(newsRecommend.addtime)}',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: ukFontSize(14),
                    height: 1,
                  ),
                ),
              ),
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
