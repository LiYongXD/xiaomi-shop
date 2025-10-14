
import 'package:get/get.dart';
import 'package:xmshop/app/modules/pass/RegisterStepThree/controllers/register_step_three_controller.dart';

class RegisterStepThreeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterStepThreeController>(
      ()=> RegisterStepThreeController(),
    );
  }
}