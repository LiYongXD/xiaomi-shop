import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContect/views/first_page_view.dart';
import 'package:xmshop/app/modules/productContect/views/second_page_view.dart';
import 'package:xmshop/app/modules/productContect/views/thrid_page_view.dart';
import 'package:xmshop/app/modules/productLis/controllers/product_lis_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

import '../controllers/product_contect_controller.dart';

class ProductContectView extends GetView<ProductContectController> {
  const ProductContectView({super.key});

  Widget _subHeader() {
    return Obx(() => Container(
        // key: controller.gk2,
        alignment: Alignment.center,
        color: Colors.white,
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(80),
        child: Row(
            children: controller.subTabsList.map((e) {
          return Expanded(
              child: InkWell(
            onTap: () {
              controller.changeSelectedSubTabsIndex(e['id']);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '${e['title']}',
                style: TextStyle(
                    color: controller.selectedSubTabsIndex == e['id']
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ));
        }).toList())));
  }

  // showBottomAttr
  void showBottomAttr() {
    Get.bottomSheet(GetBuilder<ProductContectController>(
      init: controller,
      builder: (controller) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: ScreenAdapter.height(1200),
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child: ListView(
            children: [
              Wrap(
                  children: controller.pcontent.value.attr!.map((value) {
                return Wrap(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      width: ScreenAdapter.width(1040),
                      child: Text(
                        '${value.cate}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: ScreenAdapter.height(20),
                          left: ScreenAdapter.width(20)),
                      width: ScreenAdapter.width(1040),
                      child: Wrap(
                        children: value.attrList!.map((v) {
                          return InkWell(
                            onTap: () {
                              controller.changeAttr(value.cate, v['title']);
                            },
                            child: Container(
                              margin: EdgeInsets.all(ScreenAdapter.width(40)),
                              child: Chip(
                                  padding: EdgeInsets.only(
                                      left: ScreenAdapter.width(20),
                                      right: ScreenAdapter.width(20)),
                                  backgroundColor:
                                      Color.fromARGB(31, 223, 213, 213),
                                  label: Text(
                                    v['title'],
                                    style: TextStyle(
                                        color: v['checked']
                                            ? Colors.red
                                            : Colors.black),
                                  )),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }).toList())
            ],
          ),
        );
      },
    ));
  }

  Widget _appBar(context) {
    return Obx(() => AppBar(
          title: SizedBox(
            width: ScreenAdapter.width(400),
            height: ScreenAdapter.height(96),
            child: controller.showTabs.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.tabsList.map((v) {
                      return InkWell(
                        onTap: () {
                          controller.changeSelectedIndex(v['id']);
                          if (v['id'] == 1) {
                            Scrollable.ensureVisible(
                                controller.gk1.currentContext as BuildContext,duration: const Duration(milliseconds: 100));
                          } else if (v['id'] == 2) {
                            Scrollable.ensureVisible( 
                                controller.gk2.currentContext as BuildContext,duration: const Duration(milliseconds: 100));
                                Timer.periodic(const Duration(milliseconds: 101), (timer) {
                                controller.scrollController.jumpTo(controller.scrollController.position.pixels - ScreenAdapter.height(120));
                                  timer.cancel();
                                });
                          } else {
                            Scrollable.ensureVisible(
                                controller.gk3.currentContext as BuildContext,duration: const Duration(milliseconds: 100));
                                Timer.periodic(const Duration(milliseconds: 101), (timer) {
                                controller.scrollController.jumpTo(controller.scrollController.position.pixels - ScreenAdapter.height(120));
                                  timer.cancel();
                                });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(v['title'],
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(36))),
                              v['id'] == controller.selectedTabsIndex.value
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenAdapter.height(15)),
                                      width: ScreenAdapter.width(100),
                                      height: ScreenAdapter.height(2),
                                      color: Colors.red,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : Text(''),
          ),
          leading: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.width(88),
              child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                      alignment: Alignment.center,
                      backgroundColor: WidgetStateProperty.all(Colors.black12),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(const CircleBorder())),
                  child: Icon(Icons.arrow_back_ios_outlined)),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(
              (controller.opcity.value / 1).clamp(0.0, 1.0)), // touming
          elevation: 0, // touming
          actions: [
            Container(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.width(88),
              margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                      alignment: Alignment.center,
                      backgroundColor: WidgetStateProperty.all(Colors.black12),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(const CircleBorder())),
                  child: const Icon(Icons.file_upload_outlined)),
            ),
            Container(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.width(88),
              margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
              child: ElevatedButton(
                  onPressed: () {
                    showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            ScreenAdapter.width(200),
                            ScreenAdapter.height(180),
                            ScreenAdapter.width(20),
                            0),
                        color: Colors.black87.withOpacity(0.7),
                        items: [
                          PopupMenuItem(
                              child: Row(
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              Text(
                                '首页',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: const [
                              Icon(Icons.message, color: Colors.white),
                              Text(
                                '消息',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: const [
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              Text(
                                '收藏',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                        ]);
                  },
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                      alignment: Alignment.center,
                      backgroundColor: WidgetStateProperty.all(Colors.black12),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(const CircleBorder())),
                  child: const Icon(Icons.more_horiz_rounded)),
            ),
          ],
        ));
  }

  Widget _body() {
    return SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(children: [
          FirstPageView(showBottomAttr),
          SecondPageView(_subHeader),
          ThridPageView()
        ]));
  }

  Widget _bottom() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: ScreenAdapter.height(180),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: ScreenAdapter.width(2), color: Colors.black12))),
          child: Row(
            children: [
              Container(
                width: ScreenAdapter.width(200),
                height: ScreenAdapter.height(160),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    Text(
                      '购物车',
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromRGBO(255, 165, 0, 0.9)),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white),
                            shape: WidgetStateProperty.all(
                                // CircleBorder(),
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          showBottomAttr();
                        },
                        child: Text(
                          '加入购物车',
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                        )),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromRGBO(253, 1, 0, 0.9)),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.white),
                            shape: WidgetStateProperty.all(
                                // CircleBorder(),
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          showBottomAttr();
                        },
                        child: Text('立即购买')),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // touming
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
            child: _appBar(context)),
        body: Stack(
          children: [
            _body(),
            _bottom(),
            Obx(() => controller.showSubHeaderTabs.value
                ? Positioned(
                    top: ScreenAdapter.getStatusBarHeight() +
                        ScreenAdapter.height(118),
                    left: 0,
                    right: 0,
                    child: _subHeader())
                : Text('')),
          ],
        ));
  }
}
