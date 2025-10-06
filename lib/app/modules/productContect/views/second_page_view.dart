import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContect/controllers/product_contect_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class SecondPageView extends GetView {
  @override
  final ProductContectController controller = Get.find();
  final Function subHeader;

  SecondPageView(this.subHeader, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        key: controller.gk2,
        alignment: Alignment.center,
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(2000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            subHeader()
          ],
        ));
  }
}
