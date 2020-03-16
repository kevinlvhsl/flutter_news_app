import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 处理登录按钮
  _handleSignIn() {
    if (!ukIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请输入正确的邮箱');
      return;
    }
    if (!ukCheckLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
  }

  // 处理注册按钮
  _handleSignUp() {
    Navigator.pushNamed(context, '/sign_up');
  }

  Widget _buildLogo() {
    return Container(
      width: ukWidth(110),
      margin: EdgeInsets.only(top: ukHeight(40 + 44.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ukWidth(76),
            width: ukWidth(76),
            margin: EdgeInsets.symmetric(horizontal: ukWidth(17)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: ukWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [Shadows.primaryShadow],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ukWidth(76 * 0.5)),
                      ),
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: 13,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ukWidth(110),
            margin: EdgeInsets.only(top: ukHeight(15)),
            alignment: Alignment.center,
            child: Text(
              'SECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: ukFontSize(24),
                height: 1,
              ),
            ),
          ),
          Container(
            width: ukWidth(110),
            alignment: Alignment.center,
            child: Text(
              '新闻',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: ukFontSize(16),
                // height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: ukWidth(295),
      margin: EdgeInsets.only(top: ukHeight(49)),
      child: Column(children: [
        // 邮件
        inputTextEditor(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          placeholder: '邮箱',
          marginTop: 0,
        ),
        inputTextEditor(
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          placeholder: '密码',
          isPassword: true,
          // marginTop: 0,
        ),
        Container(
          width: ukWidth(295),
          height: ukHeight(44),
          margin: EdgeInsets.only(top: ukHeight(15)),
          child: Row(
            children: [
              flatButton(
                onPressed: _handleSignUp,
                bgColor: AppColors.thirdElement,
                title: '注 册',
              ),
              Spacer(),
              flatButton(
                onPressed: _handleSignIn,
                bgColor: AppColors.primaryElement,
                title: '登 录',
              ),
            ],
          ),
        ),
        Container(
          height: ukHeight(22),
          margin: EdgeInsets.only(top: ukHeight(20)),
          child: FlatButton(
            onPressed: () {
              toastInfo(msg: '再想一下密码吧，能想起来的');
            },
            child: Text(
              '忘记密码？',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryElementText,
                fontSize: ukFontSize(16),
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ),
      ]),
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
            '或者用社交网络登录',
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

  // 跳转注册
  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: ukHeight(20)),
      child: flatButton(
        onPressed: _handleSignUp,
        width: 294,
        height: 44,
        bgColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        title: '立即去注册',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
