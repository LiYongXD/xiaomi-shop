import 'package:get/get.dart';

import '../controllers/product_contect_controller.dart';

class ProductContectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductContectController>(
      () => ProductContectController(),
    );
  }
}
