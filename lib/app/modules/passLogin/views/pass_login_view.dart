
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/passLogin/controllers/pass_login_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import 'package:xmshop/app/widget/logo.dart';
import 'package:xmshop/app/widget/passButton.dart';
import 'package:xmshop/app/widget/passTextField.dart';
import 'package:xmshop/app/widget/userAgreement.dart';

class PassLoginView extends GetView<PassLoginController> {
  const PassLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: () {

          }, child: Text('帮助')),
        ],
      
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
          PassTextField(hintText: '请输入手机号',onChanged: (value) {
            print(value);
          },),
          PassTextField(hintText: '请输入密码', onChanged: (value) {
            print(value);
          },),
          const UserAgreement(),
          PassButton(text: '获取验证码', onPressed: () {
            print('获取验证码');
            Get.toNamed('/code-login-step-two');
          }),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () {

            }, child: Text('忘记密码')),
            TextButton(onPressed: () {}, 
            child: Text('验证码登录'))
          ],
          )
        ],
      ),
    );
  }
}