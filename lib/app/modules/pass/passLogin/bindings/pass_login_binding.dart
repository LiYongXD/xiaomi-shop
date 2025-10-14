
import 'package:get/get.dart';
import 'package:xmshop/app/modules/pass/passLogin/controllers/pass_login_controller.dart';

class PassLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassLoginController>(
      ()=> PassLoginController()
    );
  }
}