import 'storage.dart';
import '../models/pcontent_model.dart';

class CartServices {
  //增加商品到购物车
  static addCart(
      PContentItemModel pcontent, String selectedAttr, int buyNum) async {
    /*
        1、获取本地存储的cartList数据
        2、判断cartList是否有数据
              有数据：
                  1、判断购物车有没有当前数据：
                          有当前数据：
                              1、让购物车中的当前数据数量 等于以前的 数量+现在的数量
                              2、重新写入本地存储
                          没有当前数据：
                              1、把购物车cartList的数据和当前数据拼接，拼接后重新写入本地存储。
              没有数据：
                  1、把当前商品数据以及属性数据放在数组中然后写入本地存储

                
                List list=[
                  {"_id": "1", 
                    "title": "磨砂牛皮男休闲鞋-有属性", 
                    "price": 688, 
                    "selectedAttr": "牛皮 ,系带,黄色", 
                    "count": 4, 
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  },  
                    {"_id": "2", 
                    "title": "磨xxxxxxxxxxxxx", 
                    "price": 688, 
                    "selectedAttr": "牛皮 ,系带,黄色", 
                    "count": 2, 
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  }             
                  
                ]; 
      
      */

    List? cartListData = await Storage.getData("cartList");// 获取购物车的数据
    if (cartListData != null) { //如果购物车数据为空
      var hasData = cartListData.any((v) { // 如果购物车列表中满足其中条件的一项， 入参是v
      // 拿传入的V参数来对比属性判断,返回true，就是满足其中一项，返回false就是不满足
        return v["_id"] == pcontent.sId && v["selectedAttr"] == selectedAttr;
        // 如果购物车中的每一项中的商品ID=内容ID 并且 选中的属性也是第一致的商品，返回true。 证明这个数组中是有
        //满足条件的购物车商品的。
      });
      if (hasData) {// 如果购物车中有满足传入参数相同的商品。
        for (var i = 0; i < cartListData.length; i++) {
          // 遍历cartListData购物车所有商品数据
          if (cartListData[i]["_id"] == pcontent.sId &&
              cartListData[i]["selectedAttr"] == selectedAttr) {
                // 如果购物车数据中的id是传入的商品ID 并且是 传入商品的属性一致
            cartListData[i]["count"] += buyNum;
            // 在已有商品数据中更新购物此商品的数据，增加此次增加的购买数量。
          }
        }
        // 调用本地化静态类，保存购物车数据到本地
        await Storage.setData("cartList", cartListData);
      } else {
        // 到达此处说明，当前购物车没有这个商品，把新增到购物车的属性新增到购物车列表中
        cartListData.add({
          "_id": pcontent.sId,
          "title": pcontent.title,
          "price": pcontent.price,
          "selectedAttr": selectedAttr,
          "count": buyNum,
          "pic": pcontent.pic,
          "checked": true
        });
        await Storage.setData("cartList", cartListData);
        //调用本地化存储，更新购物车数据
      }
    } else {
      //如果用户还没有购物车数据，新建一个数组，以便保存购物车数据
      List tempList = [];
      //增加新的商品数据到购物车中
      tempList.add({
        "_id": pcontent.sId,
        "title": pcontent.title,
        "price": pcontent.price,
        "selectedAttr": selectedAttr,
        "count": buyNum,
        "pic": pcontent.pic,
        "checked": true
      });
      await Storage.setData("cartList", tempList);
    }
  }

  //获取购物车中的商品数据
  static Future<List> getCartList() async {
    List? cartListData = await Storage.getData("cartList"); //返回购物车的数据
    if (cartListData != null) {
      return cartListData;
    } else {
      return [];
    }
  }

  // 获取选中的CartList数据
  static getCheckedCartData() async {
    List tempList = [];
    List? cartListData = await Storage.getData("cartList");
    if (cartListData != null) {
      for (var i = 0; i < cartListData.length; i++) {
        if (cartListData[i]["checked"] == true) { //如果被选中了，那就添加到临时表中，返回。
          tempList.add(cartListData[i]);
        }
      }
      return cartListData;
    } else {
      return [];
    }
  }

  // 重新设置购物车
  static void setCartList(cartListData) async {
    await Storage.setData("cartList", cartListData);
  }

  //清空购物车
  static clearCartData() async {
    await Storage.clear('cartList');
  }
}
