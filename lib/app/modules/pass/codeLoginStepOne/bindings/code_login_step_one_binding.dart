import 'package:get/get.dart';
import 'package:xmshop/app/modules/pass/codeLoginStepOne/controllers/code_login_step_one_controller.dart';

class CodeLoginStepOneBinding extends Bindings {
  @override
  void dependencies () {
    Get.lazyPut<CodeLoginStepOneController> (
      () => CodeLoginStepOneController(),
    );
  }
}