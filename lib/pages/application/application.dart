import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';
import 'package:flutter_news_app/pages/account/account.dart';
import 'package:flutter_news_app/pages/bookmark/bookmark.dart';
import 'package:flutter_news_app/pages/category/category.dart';
import 'package:flutter_news_app/pages/main/main.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;
  // tab 页标题
  final List<String> _tabTitles = ['首页', '分类', '标签', '账户'];
  // 页控制器
  PageController _pageController;

  static BottomNavigationBarItem _buildBarItem(IconData icon, String title) {
    return new BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        icon,
        color: AppColors.secondaryElementText,
      ),
      title: Text(title),
      backgroundColor: AppColors.primaryBackground,
    );
  }

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    _buildBarItem(Iconfont.home, '首页'),
    _buildBarItem(Iconfont.grid, '分类'),
    _buildBarItem(Iconfont.tag, '标签'),
    _buildBarItem(Iconfont.me, '我的'),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: this._page,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
      context: context,
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: ukFontSize(18.0),
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: AppColors.primaryText,
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: AppColors.primaryText,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarkPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
