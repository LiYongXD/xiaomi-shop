import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/modules/pass/RegisterStepThree/controllers/register_step_three_controller.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import 'package:xmshop/app/widget/logo.dart';
import 'package:xmshop/app/widget/passButton.dart';
import 'package:xmshop/app/widget/passTextField.dart';

class RegisterStepThreeView extends GetView<RegisterStepThreeController> {
  const RegisterStepThreeView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('手机号快速注册'),
        actions: [TextButton(onPressed: () {}, child: Text('帮助'))],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
          PassTextField(
            controller: controller.passController,
            hintText: '请输入密码',
            isPassWord: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print(value);
            },
          ),
          PassTextField(
            controller: controller.confirmPassController,
            hintText: '请确认输入密码',
            isPassWord: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(
            height: ScreenAdapter.height(20),
          ),
          PassButton(
              text: '完成注册',
              onPressed: ()  async {
                if(controller.passController.text != controller.confirmPassController.text) {
                  Get.snackbar('提示信息!', '密码和确认密码不一致');
                }
                else if(controller.passController.text.length < 6) {
                  print(controller.passController.text);
                  print(controller.passController.text.length);
                  Get.snackbar('提示信息!', '密码长度不能小于6位');
                }
                 else {
                  MessageModel result = await controller.doRegister();
                  print('result = ${result}');
                  if( result.success) {
                    Get.offAllNamed('/tabs',arguments: {
                      'initialPage': 4
                    });
                  } else {
                    Get.snackbar('提示信息!', result.message);
                  }
                }
              })
        ],
      ),
    );
  }
}
