import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/pcontent_model.dart';
import 'package:xmshop/app/services/cartServices.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class ProductContectController extends GetxController {
  //TODO: Implement ProductContectController
  final ScrollController scrollController = ScrollController();

  RxDouble opcity = 0.0.obs;

  RxBool flag = true.obs;

  final count = 0.obs;

  RxBool showTabs = false.obs;

  double gk2Position = 0;
  double gk3Position = 0;

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  RxBool showSubHeaderTabs = false.obs;

    //购买的数量
  RxInt buyNum = 1.obs;

  List subTabsList = [
    {
      'id': 1,
      'title': '商品介绍',
    },
    {
      'id': 2,
      'title': '规格参数'
    }
  ];

  HttpsClient httpsClient = HttpsClient();

  var pcontent = PContentItemModel().obs;

  RxList<PContentAttrModel> pcontentAttr = <PContentAttrModel>[].obs;

  RxInt selectedSubTabsIndex = 1.obs;

    //保存筛选属性值
  RxString selectedAttr = "".obs;

  //增加数量
  incBuyNum() {
    buyNum.value++;
    update();
  }

  //减少数量
  decBuyNum() {
    if (buyNum.value > 1) {
      buyNum.value--;
      update();
    }
  }

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
      print('scrollController.position.pixels--- ${scrollController.position.pixels} gk2Position--- ${gk2Position}00000 scrollController.position.pixels--- ${scrollController.position.pixels} gk3Position--- ${gk3Position}');
      
      if(gk2Position == 0 && gk3Position == 0) {
        print(scrollController.position.pixels);
        print('第一次get');
        getContainerPosition(scrollController.position.pixels);
      }
      // 获取渲染后的元素位置
      if(scrollController.position.pixels >= 0 && scrollController.position.pixels < gk2Position) {

        if (showSubHeaderTabs.value == true ) {
          showSubHeaderTabs.value = false;
                  selectedTabsIndex.value = 1;
          update();
        }
      }else if(scrollController.position.pixels >= gk2Position && scrollController.position.pixels < gk3Position){

        if( showSubHeaderTabs.value == false ) {
          showSubHeaderTabs.value = true;
        }
        selectedTabsIndex.value = 2;
        update();
      } else if(scrollController.position.pixels >= gk3Position){
        if (showSubHeaderTabs.value == true ) {
          // showSubHeaderTabs.value = false;
        }
        selectedTabsIndex.value = 3;
        update();
      }
      
      if (scrollController.position.pixels <= 100) {
        opcity.value = scrollController.position.pixels / 100;
        print(opcity.value);
        if (opcity.value > 0.9) {
          opcity.value = 1;
        }
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

    //获取attr属性
  setSelectedAttr() {
    // 创建一个临时表
    List tempList = [];
    //遍历内容属性列表，先遍历所有商品，在遍历商品下的attr列表
    for (var i = 0; i < pcontentAttr.length; i++) {
      // 
      for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          // 如果商品的数据列表中商品属性是选中的（添加到购物车列表中，肯定是有被选中的）
        if (pcontentAttr[i].attrList![j]["checked"]) { 
          // 临时表添加商品被选中的属性名字
          tempList.add(pcontentAttr[i].attrList![j]["title"]);
        }
      }
    }
    //selectedAttr = 拼接所有商品的Attr属性，逗号隔开
    selectedAttr.value = tempList.join(",");
    update();
  }

  changeSelectedSubTabsIndex(index) {
    selectedSubTabsIndex.value = index;
    if(selectedSubTabsIndex.value == 2) {
      scrollController.jumpTo(gk2Position) ;
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

  getContainerPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2Position = box2.localToGlobal(Offset.zero).dy+ pixels - (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3Position = box3.localToGlobal(Offset.zero).dy+ pixels - (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));

    print(box2.localToGlobal(Offset.zero).dy);
    print(pixels);
    print((ScreenAdapter.getScreenHeight()));
    print(( ScreenAdapter.height(120)));
    
    print('gk2---- $gk2Position');

    print('gk3---- $gk3Position');
    
  }

  void addCart() {
    setSelectedAttr();
    CartServices.addCart(pcontent.value, selectedAttr.value, buyNum.value);
    print("加入购物车");
    Get.back();
    Get.snackbar('提示', '加入购物车成功！');
  }

  void buy() {
    setSelectedAttr();
    print("立即购买");
    Get.back();
  }

  void increment() => count.value++;
}
