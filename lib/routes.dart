import 'package:flutter_news_app/pages/application/application.dart';
import 'package:flutter_news_app/pages/sign_in/sign_in.dart';
import 'package:flutter_news_app/pages/sign_up/sign_up.dart';

/// 静态路由
var staticRoutes = {
  '/sign_in': (context) => SignInPage(),
  '/sign_up': (context) => SignUpPage(),
  '/app': (context) => ApplicationPage(),
};
