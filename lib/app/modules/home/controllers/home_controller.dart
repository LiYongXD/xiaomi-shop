import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class HomeController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  //TODO: Implement HomeController
  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  RxList<FocusItemModel> bestSellingSwiperList = <FocusItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<PlistItemModel> sellingPlist = <PlistItemModel>[].obs;
  RxList<PlistItemModel> bestPlist = <PlistItemModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    getFocusData();
    getCategoryData();
    super.onInit();
    scrollControllerListener();
    getSellingSwiperData();
    //获取右侧热销甄选的商品数据
    getSellingPlistData();
    //获取热门商品数据
    getBestPlistData();
  }

  scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10 &&
          scrollController.position.pixels < 30) {
        if (flag.value == false) {
          print('position.pixels > 10');
          flag.value = true;
          update();
        }
      } else if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          print('position.pixels < 10');
          flag.value = false;
          update();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getFocusData() async {
    var response = await httpsClient.get('api/focus');
    if (response != null) {
      var focus = FocusModel.fromJson(response.data);
      swiperList.value = focus.result!;
      update();
    }
  }

  //获取分类模型列表
  getCategoryData() async {
    var response =
        await httpsClient.get('api/bestCate');
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      categoryList.value = category.result!;
      update();
    }
  }

  getSellingSwiperData() async {
    var response =
        await httpsClient.get('api/focus?position=2');

    if (response != null) {
      var sellingSwiper = FocusModel.fromJson(response.data);
      bestSellingSwiperList.value = sellingSwiper.result!;
      update();
    }
  }

  getSellingPlistData() async {
    var response = await httpsClient
        .get('api/plist?is_hot=1&pageSize=3');
    if (response != null) {
      var plist = PlistModel.fromJson(response.data);
      sellingPlist.value = plist.result!;
      update();
    }
  }

  //获取热门商品数据
  getBestPlistData() async {
    var response =
        await httpsClient.get("api/plist?is_best=1");
    if (response != null) {
      var plist = PlistModel.fromJson(response.data);
      bestPlist.value = plist.result!;
      update();
    }
  }

  void increment() => count.value++;
}
