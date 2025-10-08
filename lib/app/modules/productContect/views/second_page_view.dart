import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
        key: controller.gk2,
        alignment: Alignment.center,
        child: Column(
          children: [
            subHeader(),
            Obx(() => controller.selectedSubTabsIndex.value == 1
                ? Container(
                    alignment: Alignment.center,
                    child: Html(
                      data: controller.pcontent.value.content ?? '',
                      style: {
                        "body": Style(backgroundColor: Colors.white),
                        'p': Style(fontSize: FontSize.large)
                      },
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Html(
                      data: controller.pcontent.value.specs ?? '',
                      style: {
                        "body": Style(backgroundColor: Colors.white),
                        'p': Style(fontSize: FontSize.large)
                      },
                    ),
                  ))
          ],
        ));
  }
}
