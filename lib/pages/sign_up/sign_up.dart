import 'dart:io';

import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 处理登录按钮
  _handleSignUp() {
    var fullname = _fullnameController.value.text;
    if (fullname == null || fullname.isEmpty) {
      toastInfo(msg: '请输入姓名');
      return;
    }
    if (!ukCheckLength(fullname, 2)) {
      toastInfo(msg: '姓名长度不能小于2位');
      return;
    }
    if (!ukIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请输入正确的邮箱');
      return;
    }
    if (!ukCheckLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    sleep(Duration(milliseconds: 2000));
    toastInfo(msg: '恭喜您输入的信息正确，欢迎使用!');
  }

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: ukHeight(50)),
      child: Text(
        '注 册',
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: ukFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: ukWidth(295),
      margin: EdgeInsets.only(top: ukHeight(49)),
      child: Column(
        children: [
          // 姓名
          inputTextEditor(
            controller: _fullnameController,
            keyboardType: TextInputType.text,
            placeholder: '请输入姓名',
            marginTop: 0,
          ),
          // 邮箱
          inputTextEditor(
            controller: _emailController,
            keyboardType: TextInputType.text,
            placeholder: '请输入邮箱',
          ),
          // 密码
          inputTextEditor(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            placeholder: '请输入密码',
            isPassword: true,
          ),
          Container(
            margin: EdgeInsets.only(top: ukHeight(20)),
            child: flatButton(
              onPressed: _handleSignUp,
              width: 294,
              height: 44,
              bgColor: AppColors.primaryElement,
              fontColor: AppColors.primaryElementText,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              title: '创建账户',
            ),
          ),
          Container(
            height: ukHeight(22),
            margin: EdgeInsets.only(top: ukHeight(30)),
            child: Text(
              '通过注册你同意我们的协议',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.secondaryElementText,
                fontSize: ukFontSize(16),
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: ukWidth(295),
      margin: EdgeInsets.only(
        bottom: ukHeight(40),
      ),
      child: Column(
        children: [
          Text(
            '或者用社交网络注册',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: ukFontSize(16),
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ukHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: 'google.png',
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: 'facebook.png',
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconFileName: 'twitter.png',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: ukHeight(20)),
      child: flatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        width: 294,
        height: 44,
        bgColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        title: '已有账号',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
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
            onPressed: () {
              toastInfo(msg: '填写信息注册属于您的账号吧!');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
