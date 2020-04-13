import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/entity/entitys.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';

/// 频道导航
Widget newsChannelsWidget({
  List<ChannelResponseEntity> channels,
  Function(ChannelResponseEntity) onTap,
}) {
  return Container(
    height: ukHeight(137),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: channels.map<Widget>((item) {
          return Container(
            width: ukWidth(70),
            height: ukHeight(97),
            margin: EdgeInsets.symmetric(
              horizontal: ukWidth(10),
            ),
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // 图表
                  Container(
                    height: ukWidth(64),
                    margin: EdgeInsets.symmetric(horizontal: ukWidth(3)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: ukWidth(64),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBackground,
                              boxShadow: [
                                Shadows.primaryShadow,
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: ukWidth(10),
                          top: ukWidth(10),
                          right: ukWidth(10),
                          child: Image.asset(
                            "assets/images/channel-${item.code}.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 标题
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.thirdElementText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: ukFontSize(14),
                      height: 1,
                    ),
                  ),
                ],
              ),
              onTap: () => onTap(item),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
