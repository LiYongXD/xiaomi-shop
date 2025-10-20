
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/storage.dart';

class RegisterStepThreeController extends GetxController{
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String tel = Get.arguments['tel'];
  String code = Get.arguments['code'];


  Future<MessageModel> doRegister() async {
    var response = await httpsClient.post('api/register', data: {
      'tel': tel,
      'password': passController.text,
      'code': code
    });
    if(response != null) {
      if(response.data['success']) {
        Storage.setData('userinfo', response.data['userinfo']);
        return MessageModel(message: '注册成功', success: true);
      }
      return MessageModel(message: response.data['message'], success: false);
    } else {
      return MessageModel(message: '网络异常', success: false);
    }
  }
}