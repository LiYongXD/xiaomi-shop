
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class RegisterStepOneController extends GetxController {
  TextEditingController editingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();

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

  

  Future<bool> sendCode() async {
    var response = await httpsClient.post('api/sendCode',data: {
      'tel': editingController.text
    });
    if (response != null) {
      print(response);
      if(response.data['success']) {
        Clipboard.setData(ClipboardData(text: response.data['code']));
        return true;
      }
      return false;
    }else {
      return false;
    }
  }

}