import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

import '../controllers/product_lis_controller.dart';

class ProductLisView extends GetView<ProductLisController> {
  const ProductLisView({super.key});

  Widget _subHeaderWidget() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Obx(() => Container(
              height: ScreenAdapter.height(120),
              width: ScreenAdapter.width(1080),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: ScreenAdapter.height(2),
                          color: const Color.fromRGBO(233, 233, 233, 0.9)))),
              child: Row(
                children: controller.subHeaderList.map((value) {
                  return Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0,
                                  ScreenAdapter.height(16),
                                  0,
                                  ScreenAdapter.height(16)),
                              child: Text('${value['title']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        controller.selectHeaderId == value['id']
                                            ? Colors.red
                                            : Colors.black45,
                                    fontSize: ScreenAdapter.fontSize(32),
                                  )),
                            ),
                            onTap: () {
                              controller.subHeaderChange(value['id']);
                            },
                          ),
                          _showIcon(value['id']),
                        ],
                      ));
                }).toList(),
              ),
            )));
  }

  // 自定义箭头组件
  Widget _showIcon(id) {
    print('----');
    print(id);
    if (id == 2 || id == 3 || controller.subHeaderListSort.value == 1 || controller.subHeaderListSort.value == -1) {
      print(controller.subHeaderList[id - 1]['sort']);
      if (controller.subHeaderList[id - 1]['sort'] == 1) {
        print('下箭头');
        return const Icon(Icons.arrow_drop_down, color: Colors.black45);
        
      } else {
        print('上箭头');
        return const Icon(Icons.arrow_drop_up, color: Colors.black45);
      }
    } else {
      return const Text('');
    }
  }

  Widget _productListWidget() {
    return  ListView.builder(
            controller: controller.scrollController,
            padding: EdgeInsets.fromLTRB(ScreenAdapter.width(26),
                ScreenAdapter.width(140), ScreenAdapter.width(26), 10),
            itemCount: controller.bestPlist.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(60)),
                        width: ScreenAdapter.width(400),
                        height: ScreenAdapter.height(460),
                        child: Image.network(
                          HttpsClient.replaceUri(
                              controller.bestPlist[index].pic),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(26)),
                                  child: Text(
                                    "${controller.bestPlist[index].title}",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(50),
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(20)),
                                  child: Row(children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          'CPU',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(34),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Helio G25',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(34)),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '高清拍摄',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(34),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '1300万像素',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(34)),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '超大屏',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(34),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '6.53英寸',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(34)),
                                        )
                                      ],
                                    )),
                                  ])),
                              Text("￥${controller.bestPlist[index].price}起",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(38),
                                      fontWeight: FontWeight.bold))
                            ],
                          )),
                    ]),
                  ),
                  controller.bestPlist.length - 1 == index
                      ? _progressIndicator()
                      : Text('')
                ],
              );
            },
          );
  }

  Widget _progressIndicator() {
    if (controller.hasData.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text('没有数据了哦，我是有底线的'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
        key: controller.scaffoldGlobalKey,
        endDrawer: const Drawer(
          child: DrawerHeader(child: Text('右侧筛选')),
        ),
        appBar: AppBar(
          title: Container(
            // leading: controller.flag.value
            //     ? Text('')
            //     : Icon(HabibiFonts.xiaomi, color: Colors.white),
            // leadingWidth: controller.flag.value
            //     ? ScreenAdapter.width(40)
            //     : ScreenAdapter.width(140),
            child: AnimatedContainer(
              width: ScreenAdapter.width(900),
              height: ScreenAdapter.height(96),
              decoration: BoxDecoration(
                color: const Color.fromARGB(230, 252, 243, 236),
                borderRadius: BorderRadius.circular(30),
              ),
              duration: Duration(milliseconds: 600),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(34),
                      0,
                      ScreenAdapter.width(10),
                      0,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '手机',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  ),
                ],
              ),
            ),
          ), 
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: const [Text('')],
        ),
        body: Obx(() => controller.bestPlist.isNotEmpty ? Stack(
          children: [
            _productListWidget(),
            _subHeaderWidget(),
          ],
        ): _progressIndicator(),));
  }
}
