import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_view.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/give/views/give_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:xmshop/app/modules/user/views/user_view.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController
  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    UserView(),
    CartView(),
  ];

  PageController pageController = PageController(initialPage: 1);

  RxInt currentIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
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
