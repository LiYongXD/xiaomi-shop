import 'package:get/get.dart';

import '../controllers/product_lis_controller.dart';

class ProductLisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductLisController>(
      () => ProductLisController(),
    );
  }
}
