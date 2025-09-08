import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContect/controllers/product_contect_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class FirstPageView extends GetView {
  FirstPageView({super.key});

  @override
  final ProductContectController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      key: controller.gk1,
      width: ScreenAdapter.width(1080),
      child: Column(
        children: [
          AspectRatio(aspectRatio: 1/1, child: Image.network(
            'https://www.itying.com/images/flutter/p1.jpg',
            fit: BoxFit.cover,
          ),),
          Container(
            padding: EdgeInsets.only(
              top: ScreenAdapter.height(20),
            ),
            child: Text('联想Think Pad 翼480(0VCD) 英特尔酷睿i5 14英寸轻薄',style: TextStyle(
              color: Colors.black87,
              fontSize: ScreenAdapter.fontSize(46)
            ),),
          ),
          Container(
            padding: EdgeInsets.only(
              top: ScreenAdapter.height(20),
            ),
            child: Text('震撼首发，15.9毫米全金属外观，4.9毫米轻薄窄边框，指纹电源按钮，杜比音响',style: TextStyle(
              color: Colors.black87,
              fontSize: ScreenAdapter.fontSize(34)
            ),),
          ),
        ],
      ),
    );
  }
}
