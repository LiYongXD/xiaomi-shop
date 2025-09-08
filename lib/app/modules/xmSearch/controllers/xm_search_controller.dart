import 'package:get/get.dart';
import 'package:xmshop/app/services/searchServers.dart';

class XmSearchController extends GetxController {

  RxString keywords = ''.obs;
  RxList historyList = [].obs;
  //TODO: Implement XmSearchController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getHisitoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() { 
    super.onClose();
  }

  static Future<T>() async{
    
  }

  getHisitoryData() async {
    var tempList = await SearchServices.getHistoryData();
    if (tempList.isNotEmpty) {
      historyList.addAll(tempList);
      update();
    }
  }

}
