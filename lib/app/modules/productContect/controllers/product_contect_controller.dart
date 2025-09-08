import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductContectController extends GetxController {
  //TODO: Implement ProductContectController
  final ScrollController scrollController = ScrollController();

  RxDouble opcity = 0.0.obs;

  RxBool flag = true.obs;

  final count = 0.obs; 

  RxBool showTabs = false.obs; 

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();


  List tabsList = [
    {
      "id": 1,
      "title": '商品'
    },
    {
      "id":2,
      "title": '详情'
    },
    { 
      "id":3,
      "title": '推荐'
    }
  ];
  RxInt selectedTabsIndex = 1.obs;
  
  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void scrollControllerListener() {
    scrollController.addListener(() {
     if (scrollController.position.pixels <= 100) {
        opcity.value=scrollController.position.pixels/100;
        print( opcity.value);
        if(showTabs.value == true) {
          showTabs.value = false;
          update();
        }
      } else {
        if(showTabs.value == false) {
          showTabs.value = true;
          update();
        }
      }
    });
  }

  void changeSelectedIndex(selectedIndex) {
    selectedTabsIndex.value = selectedIndex;
  }

  void increment() => count.value++;
}
