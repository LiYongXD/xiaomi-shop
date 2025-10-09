import 'package:get/get.dart';
import 'package:xmshop/app/services/cartServices.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  RxList cartList = [].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCartListData() async {
    var tempList = await CartServices.getCartList();
    cartList.value = tempList;
    update();
  }
  
  // 客户增加购物车商品的数量
  void incCartNum(cartItem) {
    //购物车临时列表
    var tempList = [];
    //  遍历购物车的所有商品列表
    for ( var i = 0; i < cartList.length; i ++) {
      //遍历找出购物车的商品,如果ID=ID 并且 选中的属性是一致的，数量减一
      //
      if(cartList[i]['_id'] == cartItem['_id'] && cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        cartList[i]['count'] ++;
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    CartServices.setCartList(tempList);
    update();
  }

  //减少数量
  void decCartNum(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]['_id'] == cartItem['_id'] && cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        if(cartList[i]['count'] > 1) {
          cartList[i]['count'] --;
        }else {
          Get.snackbar('提示', '购物车数量已经到最小了');
        }
      }
      tempList.add(cartList[i]);
    }
    cartList.value= tempList;
    CartServices.setCartList(tempList);
    update();
  }





  

  void increment() => count.value++;
}
