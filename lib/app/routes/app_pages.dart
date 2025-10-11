import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/bindings/cart_binding.dart';
import 'package:xmshop/app/modules/pass/codeLoginStepOne/bindings/code_login_step_one_binding.dart';
import 'package:xmshop/app/modules/pass/codeLoginStepOne/views/code_login_step_one_view.dart';

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
    GetPage(
      name: _Paths.Cart,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_ONE,
      page: () =>  CodeLoginStepOneView(),
      binding: CodeLoginStepOneBinding(),
    ),
    // GetPage(
    //   name: _Paths.CODE_LOGIN_STEP_TWO,
    //   page: () => const CodeLoginStepTwoView(),
    //   binding: CodeLoginStepTwoBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ON_STEP_LOGIN,
    //   page: () => const OnStepLoginView(),
    //   binding: OnStepLoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PASS_LOGIN,
    //   page: () => const PassLoginView(),
    //   binding: PassLoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.REGISTER_STEP_ONE,
    //   page: () => const RegisterStepOneView(),
    //   binding: RegisterStepOneBinding(),
    // ),
    // GetPage(
    //   name: _Paths.REGISTER_STEP_TWO,
    //   page: () => const RegisterStepTwoView(),
    //   binding: RegisterStepTwoBinding(),
    // ),
    // GetPage(
    //   name: _Paths.REGISTER_STEP_THREE,
    //   page: () => const RegisterStepThreeView(),
    //   binding: RegisterStepThreeBinding(),
    // ),
  ];
}
