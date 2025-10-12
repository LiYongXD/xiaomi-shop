import 'package:get/get.dart';
import 'package:xmshop/app/modules/pass/codeLoginStepTwo/controllers/code_login_step_two_controller.dart';

class CodeLoginStepTwoBinding extends Bindings {
  void dependencies () {
    Get.lazyPut<CodeLoginStepTwoController>(
      ()=> CodeLoginStepTwoController(),
    );
  }
}