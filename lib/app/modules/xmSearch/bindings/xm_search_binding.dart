import 'package:get/get.dart';
import 'package:xmshop/app/modules/xmSearch/controllers/xm_search_controller.dart';


class XmSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<XmSearchController>(
      () => XmSearchController(),
    );
  }
}
