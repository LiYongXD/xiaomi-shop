import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContect/controllers/product_contect_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class ThridPageView extends GetView {
  @override
  final ProductContectController controller = Get.find();
   ThridPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
            key: controller.gk3,
            alignment: Alignment.center,
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(2000),
            color: Colors.red,
            child: const Text(
              '推荐',
              style: TextStyle(fontSize: 100),
            ),
          );
  }
}
