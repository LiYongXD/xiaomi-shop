
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/modules/pass/passLogin/controllers/pass_login_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import 'package:xmshop/app/widget/logo.dart';
import 'package:xmshop/app/widget/passButton.dart';
import 'package:xmshop/app/widget/passTextField.dart';
import 'package:xmshop/app/widget/userAgreement.dart';

class PassLoginView extends GetView<PassLoginController>{
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
          PassTextField(
            controller: controller.telController,
            hintText: '请输入手机号',onChanged: (value) {
            print(value);
          },),
          PassTextField(
            controller: controller.passController,
            keyboardType: TextInputType.text,
            hintText: '请输入密码',onChanged: (value) {
            print(value);
          },),
          const UserAgreement(),
          //登录按钮
          PassButton(text: '登录', onPressed: () async {
            if (!GetUtils.isPhoneNumber(controller.telController.text) || 
            controller.telController.text.length != 11) {
                  Get.snackbar("提示信息!", "手机号格式不合法");
            } else if (controller.passController.text.length < 6) {
              Get.snackbar('提示信息!', '密码长度不能小于6位');
            } else {
              MessageModel result = await controller.doLogin();
              if (result.success) {
                Get.offAllNamed('/tabs',arguments: {
                  'initialPage': 4,
                });
              } else {
                Get.snackbar('提示信息!', result.message);
              }
            }
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {
                
              }, child: Text('忘记密码')),
              TextButton(onPressed: () {

              }, child: Text('验证码登录'))
            ],
          )
        ],
      ),
    );
  }
}