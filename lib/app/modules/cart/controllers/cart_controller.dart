import 'package:get/get.dart';
import 'package:xmshop/app/services/cartServices.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  RxList cartList = [].obs;
  RxBool checkedAllBox = false.obs;

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

  void checkCartItem(cartItem) {
    // 弄个临时的列表
    var tempList = [];
    //遍历
    for (var i = 0; i < cartList.length; i++) {
      // 列表的ID = 传入的ID 并且属性一致
      if (cartList[i]['_id'] == cartItem['_id'] &&
          cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        //把这个列表中对应的商品修改下，取反
        cartList[i]['checked'] = !cartList[i]['checked']; //
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList; // 替换更新后的列表数据
    CartServices.setCartList(tempList); // 持久化存储
    checkedAllBox.value = isCheckedAll();
    update();
  }
  
  //全选或者反选
  void checkedAllFunc(value) {
    checkedAllBox.value = value;
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      cartList[i]['checked'] = value;
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    CartServices.setCartList(tempList);
    update();
  }

  // 客户增加购物车商品的数量
  void incCartNum(cartItem) {
    //购物车临时列表
    var tempList = [];
    //  遍历购物车的所有商品列表
    for (var i = 0; i < cartList.length; i++) {
      //遍历找出购物车的商品,如果ID=ID 并且 选中的属性是一致的，数量减一
      //
      if (cartList[i]['_id'] == cartItem['_id'] &&
          cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        cartList[i]['count']++;
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
      if (cartList[i]['_id'] == cartItem['_id'] &&
          cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        if (cartList[i]['count'] > 1) {
          cartList[i]['count']--;
        } else {
          Get.snackbar('提示', '购物车数量已经到最小了');
        }
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    CartServices.setCartList(tempList);
    checkedAllBox.value = isCheckedAll();
    update();
  }

  //判断是否设置了全选
  bool isCheckedAll() {
    if (cartList.isNotEmpty) {
      for (var i = 0; i < cartList.length; i++) {
        if (cartList[i]['checked'] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  void increment() => count.value++;
}
