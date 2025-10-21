
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/storage.dart';

class PassLoginController extends GetxController {
  TextEditingController telController = TextEditingController();
  TextEditingController passController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();


  final count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<MessageModel> doLogin() async {
    var respone = await httpsClient.post('api/doLogin', data: {
      'username': telController.text,
      'password': passController.text,
    });

    if (respone != null) {
      print(respone);
      if (respone.data['success']) {
        Storage.setData('userinfo', respone.data['userinfo']);
        return MessageModel(message: '登录成功', success: true);
      }
      return MessageModel(message: respone.data['message'], success: false);

    } else {
      return MessageModel(message: '网络异常', success: false);
    }
  }

}