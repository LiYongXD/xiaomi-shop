import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:dio/dio.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class CategoryController extends GetxController {
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;
  HttpsClient httpsClient = HttpsClient();


  //TODO: Implement CategoryController

  RxInt selectIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getLeftCategoryData() async {
    var response = await httpsClient.get('api/pcate');
    var category = CategoryModel.fromJson(response.data);
    leftCategoryList.value = category.result!;
    getRightCategoryData(leftCategoryList[0].sId!);
    update();
  } 

    getRightCategoryData(String pid) async {
    var response = await httpsClient.get('api/pcate?pid=${pid}');
    var category = CategoryModel.fromJson(response.data);
    rightCategoryList.value = category.result!;
    update();
  } 

  void changeIndex(index,id) {
    selectIndex.value = index;
    getRightCategoryData(id);
    update();
  }
}
