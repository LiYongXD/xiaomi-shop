import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:xmshop/app/services/KeepAliveWrapper.dart';
import 'package:xmshop/app/services/habibiFonts.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {   
  const HomeView({super.key});

  Widget _appBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(
        () => AppBar(
          leading: controller.flag.value
              ? Text('')
              : Icon(HabibiFonts.xiaomi, color: Colors.white),
          leadingWidth: controller.flag.value
              ? ScreenAdapter.width(40)
              : ScreenAdapter.width(140),
          title: InkWell(
            child: AnimatedContainer(
            width: controller.flag.value
                ? ScreenAdapter.width(800)
                : ScreenAdapter.width(620),
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
                  child: Icon(Icons.search,color: Colors.black54,),
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
          onTap: () {
            Get.toNamed('/xm-search');
          },
          ), 
          centerTitle: true, 
          backgroundColor:
              controller.flag.value ? Colors.white : Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                color: controller.flag.value ? Colors.black : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: controller.flag.value ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _focus() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(
        () => Swiper(
          itemCount: controller.swiperList.length,
          itemBuilder: (context, index) {
            return Image.network(
              HttpsClient.replaceUri(controller.swiperList[index].pic),
              fit: BoxFit.fill,
            );
          },
          pagination: const SwiperPagination(
            builder: SwiperPagination.rect,
          ),
          // control: const SwiperControl(),
          autoplay: true,
          loop: true,
        ),
      ),
    );
  }

  Widget _bestGoods() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.width(20),
            ScreenAdapter.height(30),
            ScreenAdapter.height(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('省心优惠',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenAdapter.fontSize(48))),
              Text('全部优惠 >',
                  style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
            ]),
      ),
      Obx(()=>Container(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: ScreenAdapter.width(26),
          crossAxisSpacing: ScreenAdapter.width(16),
          itemCount: controller.bestPlist.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell( 
              onTap: () {
                print('12312---${controller.bestPlist[index].sId}');
                Get.toNamed('/product-contect',arguments: {
                  'id': controller.bestPlist[index].sId
                });
              },
              child: Container(
                padding: EdgeInsets.all(ScreenAdapter.width(10)),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(10)),
                    child: Image.network(
                      HttpsClient.replaceUri(controller.bestPlist[index].sPic),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(10)),
                    width: double.infinity,
                    child: Text(
                      '${controller.bestPlist[index].title}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    '${controller.bestPlist[index].subTitle}',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                  ),
                  Text(
                    '￥${controller.bestPlist[index].price}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(36),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ),
            );
          },
        ),
      ))
    ]);
  }

  //banner
  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.width(92),
      child: Image.asset(
        'assets/images/xiaomiBanner.png',
        fit: BoxFit.cover,
      ),
    );
  }

  //顶部滑动分类模型
  Widget _category() {
    return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.width(470),
        // color: Colors.red,
        child: Obx(
          () => Swiper(
            itemCount: controller.categoryList.length ~/ 10,
            itemBuilder: (context, index) {
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: ScreenAdapter.width(20),
                    mainAxisSpacing: ScreenAdapter.height(20),
                  ),
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        SizedBox(
                            width: ScreenAdapter.width(136),
                            height: ScreenAdapter.width(136),
                            child: Image.network(HttpsClient.replaceUri(controller.categoryList[index * 10 + i].pic),
                                fit: BoxFit.cover)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(10), 0, 0),
                          child: Text(
                            '${controller.categoryList[index * 10 + i].title}',
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                          ),
                        ),
                      ],
                    );
                  });
            },
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints.expand(height: ScreenAdapter.height(20)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              activeColor: Colors.black54,
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
          ),
        ));
  }

  Widget _banner2() {
    return Padding(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
            ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage('assets/images/xiaomiBanner2.png'),
              fit: BoxFit.cover,
            ),
          ),
          height: ScreenAdapter.height(420),
        ));
  }

  Widget _bestSelling() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.width(20),
            ScreenAdapter.height(30),
            ScreenAdapter.height(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('热销甄选',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenAdapter.fontSize(48))),
              Text('更多手机 >',
                  style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
            ]),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), 0,
            ScreenAdapter.height(30), ScreenAdapter.height(20)),
        child: Row(
          children: [
            //左侧甄选轮播区域
            Expanded(
                child: SizedBox(
              height: ScreenAdapter.height(738),
              child: Obx(
                () => Swiper(
                  itemBuilder: (context, index) {
                    return Image.network(
                      HttpsClient.replaceUri(controller.bestSellingSwiperList[index].pic),
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: controller.bestSellingSwiperList.length,
                  pagination:
                      const SwiperPagination(builder: SwiperPagination.rect),
                  autoplay: true,
                  loop: true,
                ),
              ),
            )),
            SizedBox(
              width: ScreenAdapter.width(20),
            ),
            //右侧
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  height: ScreenAdapter.height(738),
                  child: Obx(() => Column(
                          children: controller.sellingPlist
                              .asMap()
                              .entries
                              .map((entrie) {
                        var value = entrie.value;
                        return Expanded(
                            flex: 1,
                            child: Container(
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              margin: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  entrie.key == 2
                                      ? 0
                                      : ScreenAdapter.height(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: ScreenAdapter.height(20)),
                                        Text("${value.title}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(38),
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                            height: ScreenAdapter.height(20)),
                                        Text("${value.subTitle}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(
                                                        28))),
                                        SizedBox(
                                            height: ScreenAdapter.height(20)),
                                        Text("￥${value.price}元",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(34)))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          ScreenAdapter.height(8)),
                                      child: Image.network(
                                          HttpsClient.replaceUri(value.pic),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenAdapter.height(20),
                                  ),
                                ],
                              ),
                            ));
                      }).toList())),
                ))
          ],
        ),
      )
    ]);
  }

  Widget _homePage() {
    return Positioned(
      top: -40,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          _focus(),
          _banner(),
          _category(),
          _banner2(),
          _bestSelling(),
          SizedBox(
            height: 10,
          ),
          _bestGoods(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(children: [
          _homePage(),
          _appBar(),
        ]),
      ),
    );
  }
}
