import 'package:get/get.dart';
import 'package:xmshop/app/modules/pass/RegisterStepTwo/controllers/register_step_two_controller.dart';

class RegisterStepTwoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterStepTwoController> (
      () => RegisterStepTwoController(),
    );
  }
}