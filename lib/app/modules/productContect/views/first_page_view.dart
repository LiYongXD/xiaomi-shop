import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContect/controllers/product_contect_controller.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';

class FirstPageView extends GetView {
  FirstPageView({super.key});

  @override
  final ProductContectController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      key: controller.gk1,
      width:double.infinity,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              'https://www.itying.com/images/flutter/p1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: ScreenAdapter.height(20),
            ),
            child: Text(
              '联想Think Pad 翼480(0VCD) 英特尔酷睿i5 14英寸轻薄',
              style: TextStyle(
                  color: Colors.black87, fontSize: ScreenAdapter.fontSize(46)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: ScreenAdapter.height(20),
            ),
            child: Text(
              '震撼首发，15.9毫米全金属外观，4.9毫米轻薄窄边框，指纹电源按钮，杜比音响',
              style: TextStyle(
                  color: Colors.black87, fontSize: ScreenAdapter.fontSize(34)),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text(
                        '价格',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ￥128',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenAdapter.fontSize(56),
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    Row(
                      children: [
                        const Text(
                          '原价',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '￥158',
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize: ScreenAdapter.fontSize(46),
                              decoration: TextDecoration.lineThrough),
                        )
                      ],
                    )
                  ])),
          Container(
            height: ScreenAdapter.height(100),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(1200),
                  padding: ScreenAdapter.width(20),
                  child: ListView(
                    children: [
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                            width: ScreenAdapter.width(1040),
                            child: Text('版本',style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                    ],
                  ),
                ));
              },
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '已选',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                      child: Text(
                        '115, 黑色, XL, 1件',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 14,
                )
              ],
            ),
            )
          ),
          Container(
            height: ScreenAdapter.height(140),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: ScreenAdapter.height(1200),
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(248, 255, 252, 252),
                        ),
                        margin: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.height(32)),
                              child: Text("小米之家万达营业点",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(52))),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "方塔路万达2012铺小米之家",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "距离1.04km",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "营业时间 9:00-23:00",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(248, 255, 252, 252),
                        ),
                        margin: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.height(32)),
                              child: Text("小米之家万达营业点",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(52))),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "方塔路万达2012铺小米之家",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "距离1.04km",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "营业时间 9:00-23:00",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(248, 255, 252, 252),
                        ),
                        margin: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.height(32)),
                              child: Text("小米之家万达营业点",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(52))),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "方塔路万达2012铺小米之家",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "距离1.04km",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "营业时间 9:00-23:00",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              },
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '门店',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                      child: Text(
                        '小米之家万达专卖店',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 14,
                )
              ],
            ),
            ),
          ),
          Container(
              height: ScreenAdapter.height(140),
              padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(32)),
                    color: Colors.white,
                    height: ScreenAdapter.height(1000),
                    child: ListView(
                      children: [
                        Text('''

    小米科技有限责任公司成立于2010年3月3日，是专注于智能硬件和电子产品研发的全球化移动互联网企业，同时也是一家专注于智能手机、智能电动汽车 [385]  、互联网电视及智能家居生态链建设的创新型科技企业。 [2-3]  小米公司创造了用互联网模式开发手机操作系统、发烧友参与开发改进的模式。

    “为发烧而生”是小米的产品概念。“让每个人都能享受科技的乐趣”是小米公司的愿景。小米公司应用了互联网开发模式开发产品，用极客精神做产品，用互联网模式干掉中间环节，致力让全球每个人，都能享用来自中国的优质科技产品。

    小米已经建成了全球最大消费类IoT物联网平台，连接超过4.78亿台智能设备，进入全球100多个国家和地区。 [4]  [314]  MIUI全球月活跃用户达到5.5亿 [384]  。小米系投资的公司超500家，覆盖智能硬件、生活消费用品、教育、游戏、社交网络、文化娱乐、医疗健康、汽车交通、金融等领域。
    
    ''')
                      ],
                    ),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '服务',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset('assets/images/service.png'),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 14,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
