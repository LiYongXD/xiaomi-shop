import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/searchServers.dart';
import 'package:xmshop/app/services/sreeenAdapter.dart';
import '../controllers/xm_search_controller.dart';

class XmSearchView extends GetView<XmSearchController> {
  const XmSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            child: AnimatedContainer(
                width: ScreenAdapter.width(840),
                height: ScreenAdapter.height(96),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 252, 243, 236),
                  borderRadius: BorderRadius.circular(30),
                ),
                duration: Duration(milliseconds: 600),
                child: InkWell(
                  child: TextField(
                    autofocus: true,
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        )),
                    onChanged: (value) {
                      controller.keywords.value = value;
                    },
                    onSubmitted: (value) {
                      SearchServices.setHistoryData(controller.keywords.value);
                      Get.offAndToNamed('/product-lis',
                          arguments: {'keywords': value});
                    },
                  ),
                )),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  SearchServices.setHistoryData(controller.keywords.value);
                  Get.offAndToNamed('/product-lis',
                      arguments: {'keywords': controller.keywords.value});
                },
                child: Text(
                  '搜索',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(36)),
                ))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.height(20)),
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: ScreenAdapter.height(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '搜索历史',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42)),
                  ),
                  IconButton(onPressed: () {
                    Get.bottomSheet(Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(20)),
                      color: Colors.white,
                      width: ScreenAdapter.width(1000),
                      height: ScreenAdapter.height(360),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('请确定要清空历史记录吗？',style: TextStyle(fontSize: 26),)
                            ],
                          ),
                          SizedBox(height: ScreenAdapter.height(40),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(31, 190, 186, 186)),
                                  foregroundColor: WidgetStateProperty.all(Colors.white)
                                ),
                                onPressed: () {
                                Get.back();
                              }, child: Text('取消')),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(31, 190, 186, 186)),
                                  foregroundColor: WidgetStateProperty.all(Colors.white)
                                )
                                ,onPressed: () {

                              }, child: Text('确定'))
                            ],
                          )
                        ],
                      ),
                    ));
                  }, icon: Icon(Icons.delete_forever_outlined))
                   ,
                ],
              ),
            ),
            Obx(
              () => Wrap(
                  children: controller.historyList
                      .map(
                        (value) => Container(
                          padding: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(32),
                              ScreenAdapter.width(16),
                              ScreenAdapter.width(32),
                              ScreenAdapter.width(16)),
                          margin: EdgeInsets.all(ScreenAdapter.height(16)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(value),
                        ),
                      )
                      .toList()),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: ScreenAdapter.height(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '猜你想搜',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42)),
                  ),
                  const Icon(Icons.delete_forever_outlined),
                ],
              ),
            ),
            // SizedBox(height: 20,),
            Wrap(
              // padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('手机'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('电脑'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('路由器'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('爱俏俏'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('手机'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('电脑'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('路由器'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('爱俏俏'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('手机'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('电脑'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('路由器'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('爱俏俏'),
                ),
              ],
            ),
            SizedBox(
              height: ScreenAdapter.height(20),
            ),

            //热销商品
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenAdapter.height(138),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/hot_search.png'))),
                  ),
                  Container(
                    // height: ScreenAdapter.height(600),
                    child: GridView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: ScreenAdapter.width(40),
                            mainAxisSpacing: ScreenAdapter.height(20),
                            childAspectRatio: 3 / 1),
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: ScreenAdapter.width(120),
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(10)),
                                child: Image.network(
                                    'https://www.itying.com/images/shouji.png'),
                              ),
                              Expanded(
                                  child: Container(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(10)),
                                alignment: Alignment.topLeft,
                                child: Text('小米净化器 热水器 小米净化器'),
                              ))
                            ],
                          );
                        })),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
