import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/pcontent_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

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

  HttpsClient httpsClient = HttpsClient();

  var pcontent = PContentItemModel().obs;

  RxList<PContentAttrModel> pcontentAttr = <PContentAttrModel>[].obs;

  List tabsList = [
    {"id": 1, "title": '商品'},
    {"id": 2, "title": '详情'},
    {"id": 3, "title": '推荐'}
  ];
  RxInt selectedTabsIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getContentData();
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
        opcity.value = scrollController.position.pixels / 100;
        print(opcity.value);
        if (showTabs.value == true) {
          showTabs.value = false;
          update();
        }
      } else {
        if (showTabs.value == false) {
          showTabs.value = true;
          update();
        }
      }
    });
  }

  void changeSelectedIndex(selectedIndex) {
    selectedTabsIndex.value = selectedIndex;
  }

  initAttr(List<PContentAttrModel> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list!.length; j++ ) {
        if (j == 0) {
          attr[i].attrList!.add({'title': attr[i].list![j], 'checked': true});
        } else {
          attr[i].attrList!.add({'title': attr[i].list![j], 'checked': false});
        }
      }
    }
  }

  changeAttr(cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if(pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          if(pcontentAttr[i].attrList![j]['title']== title) {
            pcontentAttr[i].attrList![j]['checked'] = true;
          }else {
            pcontentAttr[i].attrList![j]['checked'] = false;
          }
        }
      }
    }
    update();
  }

  //获取详情数据
  getContentData() async {
    var response =
        await httpsClient.get('api/pcontent?id=${Get.arguments["id"]}');
    print('Get.arguments["id"] ==== ${Get.arguments["id"]}');
    print(response);
    if (response != null) {
      var tempData = PContentModel.fromJson(response.data);
      print(tempData);
      pcontent.value = tempData.result!;
      pcontentAttr.value = pcontent.value.attr!;
      initAttr(pcontentAttr);
      update();
    }
  }

  void increment() => count.value++;
}
