
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/storage.dart';

class CodeLoginStepTwoController  extends GetxController {
  final TextEditingController editingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String tel = Get.arguments['tel'];
  RxInt seconds = 10.obs;

  @override
  void onInit() {
    super.onInit();
    countDown();
  }

  @override
  void onClose() {
    super.onClose();
  }

  countDown() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;
      if ( seconds.value == 0 ) {
        timer.cancel();
      }
      update();
    });
  }

  Future<MessageModel> sendCode() async {
    var respone = await httpsClient.post('api/sendLoginCode',data : {'tel': tel});
    if (respone != null) {
      print(respone);
      if(respone.data['success']) {
        Clipboard.setData(ClipboardData(text: respone.data['code']));
        seconds.value = 10;
        countDown();
        return MessageModel(message: '发送验证码成功', success: true);
      }
      return MessageModel(message: respone.data['message'], success: false);
    }else {
      return MessageModel(message: '网络异常', success: false);
    }
  }

  Future<MessageModel> doLogin() async {
    var respone = await httpsClient.post('api/validateLoginCode',data: {
      'tel': tel,
      'code': editingController.text
    });

    if(respone != null) {
      print(respone);
      if(respone.data['success']) {
        Storage.setData('userinfo',respone.data['userinfo']);

        return MessageModel(message: '登录成功', success: true);
      }
      return MessageModel(message: respone.data['message'], success: false);
    }
    else {
      return MessageModel(message: '网络异常', success: false);
    }
  }
}