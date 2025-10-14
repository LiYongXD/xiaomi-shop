
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class RegisterStepTwoController extends GetxController{
  final TextEditingController editingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String tel = Get.arguments['tel'];
  RxInt seconds = 10.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    countDown();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  
  countDown() {
    Timer.periodic(
      const Duration(milliseconds: 1000), (timer) {
        seconds.value--;
        print('millse');
        if (seconds.value == 0) {
          timer.cancel();
        }
        update();
      }
    );
  }

  void sendCode () async {
    var response = await httpsClient.post('api/sendCode', data:  {
      'tel': tel
    });
    if (response != null) {
      print(response);
      if (!response.data['success']) {
        Get.snackbar('提示信息!', '非常请求');
      }else {
        // 测试: 
        Clipboard.setData(ClipboardData(text: response.data['code']));
        seconds.value = 10;
        countDown();
        update();
      }
    } else {
      Get.snackbar('提示信息!', '网络异常请重试');
    }
  }

  Future<bool> validateCode() async {
    var response = await httpsClient.post('api/validateCode', data: {
      'tel': tel,
      'code': editingController.text
    });
    if( response != null) {
      if(response.data['success']) {
        return true;
      }
      return false;
    }else {
      return false;
    }
  }
 }