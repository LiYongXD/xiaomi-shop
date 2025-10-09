import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class CartItemNumView extends GetView {
  @override
  final CartController controller = Get.find();
  final Map cartItem;
  CartItemNumView(this.cartItem, {super.key});

  Widget _left() {
    return InkWell(
        onTap: () {
          controller.decCartNum(cartItem);
        },
        child: Container(
          alignment: Alignment.center,
          width: ScreenAdapter.width(80),
          height: ScreenAdapter.height(64),
          child: const Text('-'),
        ));
  }

  Widget _center() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
        right: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
      )),
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(64),
      child:  Text('${cartItem['count']}'),
    );
  }

  Widget _right() {
    return InkWell(
      onTap: () {
          controller.incCartNum(cartItem);
        },
        child: Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(64),
      child: const Text('+'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(60),
      decoration: BoxDecoration(
          border:
              Border.all(width: ScreenAdapter.width(2), color: Colors.black12)),
      child: Row(
        children: [_left(), _center(), _right()],
      ),
    );
  }
}
