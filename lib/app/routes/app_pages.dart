import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/category/views/category_view.dart';
import '../modules/give/views/give_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/productContect/bindings/product_contect_binding.dart';
import '../modules/productContect/views/product_contect_view.dart';
import '../modules/productLis/bindings/product_lis_binding.dart';
import '../modules/productLis/views/product_lis_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/xmSearch/bindings/xm_search_binding.dart';
import '../modules/xmSearch/views/xm_search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIS,
      page: () => const ProductLisView(),
      binding: ProductLisBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
      name: _Paths.XM_SEARCH,
      page: () => const XmSearchView(),
      binding: XmSearchBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CONTECT,
      page: () => const ProductContectView(),
      binding: ProductContectBinding(),
    ),
  ];
}
