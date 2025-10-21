import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class CodeLoginStepOneController extends GetxController {
  final count = 0.obs;
  TextEditingController telController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<MessageModel> sendCode() async {
    var response = await httpsClient
        .post('api/sendLoginCode', data: {'tel': telController.text});
    if (response != null) {
      print(response);
      if (response.data['success']) {
        Clipboard.setData(ClipboardData(text: response.data['code']));

        return MessageModel(message: '发送验证码成功', success: true);
      }
      return MessageModel(message: response.data['message'], success: false);
    } else {
      return MessageModel(message: '网络异常', success: false);
    }
  }
}
