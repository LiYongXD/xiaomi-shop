import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_view.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/give/views/give_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:xmshop/app/modules/user/views/user_view.dart';

class TabsController extends GetxController {
  final List<Widget> pages =  [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView(),
  ];

  PageController pageController = Get.arguments!= null ? PageController(initialPage: Get.arguments['initialPage']): PageController(initialPage: 3);

  RxInt currentIndex = 3.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null) {
      currentIndex.value = Get.arguments['initialPage'];
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }

}
