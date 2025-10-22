
import 'package:get/get.dart';
import 'package:xmshop/app/modules/checkout/controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      ()=> CheckoutController(),
    );
  }
}