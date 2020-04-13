import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/api/apis.dart';
import 'package:flutter_news_app/common/entity/entitys.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/pages/main/ad_widget.dart';
import 'package:flutter_news_app/pages/main/categories_widget.dart';
import 'package:flutter_news_app/pages/main/channels_news.dart';
import 'package:flutter_news_app/pages/main/news_item.dart';
import 'package:flutter_news_app/pages/main/news_letter_widget.dart';
import 'package:flutter_news_app/pages/main/recommend_news.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selectedCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _newsPageList = await NewsApi.newsPageList(
      context: context,
      cacheDisk: true,
    );
    _newsRecommend = await NewsApi.newsRecommend(
      context: context,
      cacheDisk: true,
    );
    _categories = await NewsApi.categories(
      context: context,
      cacheDisk: true,
    );
    _channels = await NewsApi.channels(
      context: context,
      cacheDisk: true,
    );

    _selectedCategoryCode = _categories.first.code;
    if (mounted) {
      setState(() {});
    }
  }

  // 拉取推荐、新闻
  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    _selectedCategoryCode = categoryCode;
    _newsRecommend = await NewsApi.newsRecommend(
      context: context,
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsApi.newsPageList(
      context: context,
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selectedCategoryCode: _selectedCategoryCode,
            onTap: (CategoryResponseEntity item) {
              _loadNewsData(item.code);
            },
          );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null // 数据没到位，可以用骨架图展示
        ? Container()
        : recommendNews(490, _newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container(
            height: ukHeight(137),
            color: Colors.blueAccent,
          )
        : newsChannelsWidget(
            channels: _channels, onTap: (ChannelResponseEntity item) {});
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(height: ukHeight(161 * 5 + 100.0))
        : Column(
            children: _newsPageList.items.map((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                newsItem(item),
                Divider(height: 1),
              ];

              int index = _newsPageList.items.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  adWidget(),
                  Divider(height: 1),
                ]);
              }
              return Column(children: widgets);
            }).toList(),
          );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsLetterWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
