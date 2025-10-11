import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/pass/codeLoginStepOne/controllers/code_login_step_one_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import 'package:xmshop/app/widget/logo.dart';
import 'package:xmshop/app/widget/passButton.dart';
import 'package:xmshop/app/widget/passTextField.dart';
import 'package:xmshop/app/widget/userAgreement.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: () {}, child: Text('帮助')),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
          PassTextField(hintText: '请输入手机号',onChanged: (value) {
            print(value);
          },),
          PassTextField(hintText: '密码',onChanged: (value) {
            print(value);
          },),
          //用户协议
          const UserAgreement(),
          PassButton(text: '获取验证码', onPressed: () {
            print('获取验证码');
          })
          
        ],
      ),
    );
  }
}