import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContect/controllers/product_contect_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class SecondPageView extends GetView {
  @override
  final ProductContectController controller = Get.find();
   SecondPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
            key: controller.gk2,
            alignment: Alignment.center,
            width: ScreenAdapter.width(1080),
            // height: ScreenAdapter.height(1500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    // alignment: Alignment.center,
                  child: Text('商品介绍',
                  style: TextStyle(color: Colors.red),),
                )
                ),
                Expanded(
                  child: Container(
                  // alignment: Alignment.center,
                  child: Text('规格参数'),
                ))
              ],
            )
          );
  }
}
