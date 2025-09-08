import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductLisController extends GetxController {
  //TODO: Implement ProductLisController

  final count = 0.obs;
  RxList<PlistItemModel> bestPlist = RxList<PlistItemModel>();
  HttpsClient httpsClient = HttpsClient();
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  RxBool hasData = true.obs;

  
  String? keywords = Get.arguments['keywords'];
  String? cid = Get.arguments['cid'];
  String apiUrl = '';
  
  // 主要解决排序箭头无法更新
  RxInt subHeaderListSort = 0.obs;
  List subHeaderList = [
    {
      'id': 1,
      'title': '综合',
      'fileds': 'all',
      'sort': -1,
    },
    {'id': 2, 'title': '销量', 'fileds': 'salecount', 'sort': -1},
    {'id': 3, 'title': '价格', 'fileds': 'price', 'sort': -1},
    {'id': 4, 'title': '筛选'},
  ];
  // scaffoldGlobalKey.currentState.
  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;

  bool flag = true;
  int page = 1;
  int pageSize = 8;
  String sort = '';


  @override
  void onInit() {
    print(Get.arguments);
    super.onInit();
    getPlistData();
    initScrollController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //二级导航改变的时候触发的方法
  void subHeaderChange(id) {
    if (id == 4) {
      selectHeaderId.value = id;
      scaffoldGlobalKey.currentState!.openEndDrawer();
    } else {
      selectHeaderId.value = id;
      sort = "${subHeaderList[id-1]['fileds']}_${subHeaderList[id-1]['sort']}";
    }

    subHeaderList[id - 1]['sort'] = subHeaderList[id-1]['sort'] * -1;
    subHeaderListSort.value = subHeaderList[id-1]['sort'];
    page=1;
    bestPlist.value = [];
    //
    hasData.value = true;
    //重置滚动条，回到顶部
    scrollController.jumpTo(0);
    //重新请求接口
    getPlistData();
  }

  void initScrollController() {
    scrollController.addListener(() {
      // scrollController.position.pixels;
      // scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent - 20)) {
        getPlistData();
      }

      //
    });
  }
 

  void getPlistData() async {
    if (flag && hasData.value) {
      flag = false;
      if(cid!=null) {
        apiUrl = 
          "api/plist?cid=$cid&page=$page&pageSize=$pageSize&sort=$sort";
      }else {
        apiUrl = "api/plist?search=$keywords&page=$page&pageSize=$pageSize&sort=$sort";
      }
      print(apiUrl);
      var response = await httpsClient.get(apiUrl);
      if (response != null) {
        var plist = PlistModel.fromJson(response.data);
        // bestPlist.value = plist.result!;
        bestPlist.addAll(plist.result!);
        page++;
        update();
        if (plist.result!.length < pageSize) {
          hasData.value = false;
        } else {
          hasData.value = true;
        }
        flag = true;
      }
    }
  }

  void increment() => count.value++;
}
