import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xmshop/app/modules/pass/RegisterStepTwo/controllers/register_step_two_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import 'package:xmshop/app/widget/logo.dart';
import 'package:xmshop/app/widget/passButton.dart';

class RegisterStepTwoView extends GetView<RegisterStepTwoController> {
  const RegisterStepTwoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('手机号快速注册'),
          centerTitle: true,
        ),
        body: ListView(
              padding: EdgeInsets.all(ScreenAdapter.width(40)),
              children: [
                const Logo(),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Text(
                        '请输入验证码',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: ScreenAdapter.height(20),
                      ),
                      Text('已发送至,${controller.tel}')
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenAdapter.height(60)),
                  padding: EdgeInsets.all(ScreenAdapter.width(40)),
                  child: PinCodeTextField(
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    dialogConfig: DialogConfig(
                        dialogTitle: '粘贴验证码',
                        dialogContent: '确定要粘贴验证码?',
                        affirmativeText: '确定',
                        negativeText: '取消'),
                    pinTheme: PinTheme(
                      activeColor: Colors.black12,
                      selectedColor: Colors.orange,
                      inactiveColor: Colors.black12,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.orange,
                      inactiveFillColor: const Color.fromRGBO(245, 245, 245, 1),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: controller.editingController,
                    onCompleted: (v) async {
                      var flag = await controller.validateCode();
                      if (flag) {
                        Get.toNamed('/register-step-three');
                      } else {
                        Get.snackbar('提示信息', '验证码输入错误');
                      }
                      print('completed');
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print('allowing to paste ${text}');
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => 
                      controller.seconds.value > 0
                          ? TextButton(
                              onPressed: null,
                              child: Text('${controller.seconds.value}秒后重新发送'))
                          : TextButton(
                              onPressed: () {
                                controller.sendCode();
                              },
                              child: const Text('重新发送验证码'))),
                      TextButton(onPressed: () {}, child: Text('帮助'))
                    ],
                  ),
                ),
                PassButton(
                    text: '下一步',
                    onPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      var flag = await controller.validateCode();
                      if (flag) {
                        Get.toNamed('/register-step-three');
                      } else {
                        Get.snackbar('提示信息!', '验证码输入错误');
                      }
                    })
              ],
            ));
  }
}
