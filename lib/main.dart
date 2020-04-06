import 'package:flutter_news_app/global.dart';
import 'package:flutter_news_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/pages/welcome/welcome.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
