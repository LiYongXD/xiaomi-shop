import 'package:get/get.dart';
import 'package:xmshop/app/services/userServices.dart';

class UserController extends GetxController {
  //TODO: Implement UserController

  final count = 0.obs;
  RxBool isLogin = false.obs;
  RxList userList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserInfo() async {
    var tempLoginState = await UserServices.getUserLoginState();
    isLogin.value = tempLoginState;
    print('login----$isLogin');
    var tempList = await UserServices.getUserInfo();
    print('login----$tempList');
    if (tempList.isNotEmpty) {
      userList.value = tempList;
    }
  }

  loginOut () {
    UserServices.loginOut();
    isLogin.value = false;
    userList.value = [];
    update();
  }

  void increment() => count.value++;
}
